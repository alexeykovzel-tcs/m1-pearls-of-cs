#   Task 2.19
def remove_dups(data):
    res = []

    if len(data) != 0:
        fresh = data[0]
        i = 1
        while i < len(data):
            if data[i] != fresh:
                res.append(fresh)
                fresh = data[i]
            i += 1
        res.append(fresh)
    return res
