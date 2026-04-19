import subprocess, re, os, json

def synthesize(verilog_file, top_module):
    script = f"""read_verilog {verilog_file}
hierarchy -top {top_module}
proc; opt; fsm; opt; memory; opt
techmap; opt
dfflibmap -liberty nangate45.lib
abc -liberty nangate45.lib
clean
stat -liberty nangate45.lib
"""
    result = subprocess.run(["yosys", "-p", script], capture_output=True, text=True)
    output = result.stdout + result.stderr
    return parse_stats(output)

def parse_stats(log):
    ppa = {}
    m = re.search(r"Chip area for top module '\\[^']+': ([\d.]+)", log)
    if m:
        ppa["area_um2"] = float(m.group(1))
    else:
        m = re.search(r"Chip area for module '\\[^']+': ([\d.]+)", log)
        ppa["area_um2"] = float(m.group(1)) if m else None
    m = re.search(r"=== design hierarchy ===.*?Number of cells:\s+(\d+)", log, re.DOTALL)
    if m:
        ppa["cell_count"] = int(m.group(1))
    else:
        m = re.search(r"Number of cells:\s+(\d+)", log)
        ppa["cell_count"] = int(m.group(1)) if m else None
    ppa["logic_levels"] = None
    return ppa

if __name__ == "__main__":
    import sys
    ppa = synthesize(sys.argv[1], sys.argv[2])
    print(json.dumps(ppa, indent=2))
