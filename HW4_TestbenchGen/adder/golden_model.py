def adder4bit_golden(a, b):
    result = a + b
    sum = result & 0xF
    carry = 1 if result > 0xF else 0
    return {'sum': sum, 'carry': carry}