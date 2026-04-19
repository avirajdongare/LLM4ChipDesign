import json, os, re, subprocess, anthropic

client = anthropic.Anthropic(api_key=os.environ["ANTHROPIC_API_KEY"])

SYSTEM_PROMPT = """You are an expert digital circuit designer.
Generate synthesizable Verilog for an 8-bit adder that minimizes area.
Module must be named adder8 with ports: output [7:0] sum, output cout, input [7:0] a, input [7:0] b.
Output ONLY valid Verilog code, no markdown, no explanation."""

def llm_generate(history):
    response = client.messages.create(
        model="claude-opus-4-5",
        max_tokens=2000,
        system=SYSTEM_PROMPT,
        messages=history
    )
    return response.content[0].text.strip()

def run_loop(baseline_verilog, top="adder8", max_iter=10, mode="balanced", out_dir="."):
    os.makedirs(out_dir, exist_ok=True)
    history = []
    best_ppa = {"cell_count": 9999, "area_um2": 9999.0}
    best_code = baseline_verilog
    results = []

    history.append({"role": "user",
                    "content": f"Baseline adder:\n{baseline_verilog}\nGenerate improved version named adder8."})

    for i in range(1, max_iter + 1):
        print(f"\n=== Iteration {i} ({mode}) ===")
        verilog = llm_generate(history)
        verilog = re.sub(r"```verilog\n?|```\n?", "", verilog).strip()

        fname = f"{out_dir}/candidate_{i}.v"
        with open(fname, "w") as f:
            f.write(verilog)

        from run_yosys import synthesize
        try:
            ppa = synthesize(fname, top)
            if ppa["cell_count"] is None:
                raise ValueError("None")
        except Exception as e:
            print(f"  Failed: {e}")
            history.append({"role": "assistant", "content": verilog})
            history.append({"role": "user", "content": "Synthesis failed. Fix and resubmit."})
            continue

        print(f"  Cells: {ppa['cell_count']}, Area: {ppa['area_um2']}")
        results.append({"iteration": i, "ppa": ppa, "file": fname})

        if ppa["cell_count"] < best_ppa["cell_count"]:
            best_ppa = ppa
            best_code = verilog
            print("  *** New best! ***")

        history.append({"role": "assistant", "content": verilog})
        history.append({"role": "user",
                        "content": f"Iteration {i}: cells={ppa['cell_count']}, area={ppa['area_um2']}. Best so far: {best_ppa['cell_count']} cells. Improve further."})

    with open(f"{out_dir}/best_adder.v", "w") as f:
        f.write(best_code)
    with open(f"{out_dir}/optimization_log.json", "w") as f:
        json.dump({"mode": mode, "best_ppa": best_ppa, "iterations": results}, f, indent=2)

    return best_code, best_ppa, results

if __name__ == "__main__":
    with open("RCA8.v") as f:
        baseline = f.read()
    run_loop(baseline, max_iter=10, mode="balanced", out_dir="rca_balanced")
