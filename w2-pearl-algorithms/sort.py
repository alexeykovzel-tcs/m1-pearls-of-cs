def bubble_sort(data):
    last_idx = len(data) - 1
    result = data

    while last_idx > 0:
        first_idx = 0
        i = 0
        while i < last_idx:
            if result[i] > result[i + 1]:
                result[i], result[i + 1] = result[i + 1], result[i]
                first_idx = i
            i += 1
        last_idx = first_idx
    return result


def merge_sort(data):
    if len(data) == 0 or len(data) == 1:
        return data

    mid = len(data) // 2
    fst = merge_sort(data[:mid])
    snd = merge_sort(data[mid:])
    result = []
    fi = 0
    si = 0

    while fi < len(fst) and si < len(snd):
        if fst[fi] < snd[si]:
            result.append(fst[fi])
            fi += 1
        else:
            result.append(snd[si])
            si += 1

    if fi <= len(fst) - 1:
        result.extend(fst[fi:])
    elif si <= len(snd) - 1:
        result.extend(snd[si:])

    return result


#   Task 2.22
def merge_pairs(data):
    if len(data) == 0 or len(data) == 1:
        return data
    else:
        i = len(data) // 2
        fst = merge_pairs(data[:i])
        snd = merge_pairs(data[i:])
        res = []
        fi = 0
        si = 0

        while fi < len(fst) and si < len(snd):
            if fst[fi][0] < snd[si][0] or (fst[fi][0] == snd[si][0] and fst[fi][1] < snd[si][1]):
                res.append(fst[fi])
                fi += 1
            else:
                res.append(snd[si])
                si += 1

        if fi <= len(fst) - 1:
            res.extend(fst[fi:])
        elif si <= len(snd) - 1:
            res.extend(snd[si:])

        return res
