def priority_encoder4_golden(req):
    if req == 0b0000:
        return {'code': 0b00, 'valid': 0}
    elif req & 0b1000:
        return {'code': 0b11, 'valid': 1}
    elif req & 0b0100:
        return {'code': 0b10, 'valid': 1}
    elif req & 0b0010:
        return {'code': 0b01, 'valid': 1}
    else:
        return {'code': 0b00, 'valid': 1}