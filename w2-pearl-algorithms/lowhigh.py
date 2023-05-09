def func(value):
    data = [i for i in range(200)]

    low = 0
    high = len(data) - 1

    if value > data[high]:
        return -1

    mid = (high + low) // 2
    while high - low > 0 and data[mid] != value:

        if value < data[mid]:
            high = mid - 1
        else:
            low = mid + 1

        print("Low: " + str(low))
        print("High: " + str(high) + "\n")

        mid = (high + low) // 2
    if data[mid] == value:
        return mid
    else:
        return -1
