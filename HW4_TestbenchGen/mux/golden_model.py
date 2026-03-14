def mux2to1_golden(a, b, sel):
    if sel == 0:
        y = a
    else:
        y = b
    return {'y': y}