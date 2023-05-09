def gcd(a, b):
    r = a % b
    if r == 0:
        return b
    return gcd(b, r)


def apply_eea(a, b):
    t, x, y = a, 1, 0

    if b == 0:
        return [t, x, y]

    x1, x2, y1, y2 = 0, 1, 1, 0

    while b > 0:
        g = a // b
        r = a % b
        x = x2 - g * x1
        y = y2 - g * y1
        a, b = b, r
        x1, x2, y1, y2 = x, x1, y, y1
    t, x, y = a, x2, y2

    return [t, x, y]


def calc_mod(num, mod):
    str_num = str(num)
    res = 0

    for i in range(0, len(str_num)):
        res = (res * 10 + int(str_num[i])) % mod

    return res


def calc_exp_els(exp):
    bin_exp = str(bin(exp))[2:]
    bit_pos = len(bin_exp)
    exp_units = []

    for bit in bin_exp:
        if int(bit) == 1:
            exp_units.append(bit_pos - 1)
        bit_pos -= 1

    return exp_units


def calc_mod_of_exp(n, exp, mod):
    if exp == 0:
        return 1

    exp_els = calc_exp_els(exp)
    last_exp = exp_els[0]
    prev_r = calc_mod(n, mod)
    exp_el = 1
    r = 1

    if 0 in exp_els:
        r = prev_r

    while exp_el <= last_exp:
        prev_r = calc_mod((prev_r ** 2), mod)

        if exp_el in exp_els:
            r = calc_mod(r * prev_r, mod)
        exp_el += 1

    return r


A = 96473750728194822265724956252718102713
B = 55394086866555743142841731433115885563
C = 55607800959008333997500404160891562647
D = 103183222240832246367639689876909232721
E = 81595675594617074625241781712689179295      # encrypted key
N = 132769281008271469023864575917196559889     # p * q
W = 13278393287992650160375140898405064704      # cipher text

p = gcd(N, C)
q = N // p
fi = (p - 1) * (q - 1)
d = apply_eea(E, fi)[1]
decrypted = calc_mod_of_exp(W, d, N)

print("P: " + str(p))
print("Q: " + str(q))
print("Ф: " + str(fi))
print("E: " + str(E))
print("D: " + str(d))

print("Cipher text: " + str(W))
print("Plain text: " + str(decrypted))
