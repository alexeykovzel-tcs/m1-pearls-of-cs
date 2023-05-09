def linear(data, value):
    """Return the index of 'value' in 'data', or -1 if it does not occur"""
    # Go through the data list from index 0 upwards
    i = 0

    # middle_point = len(data)
    # continue until value found or index outside valid range
    while i < len(data) and data[i] != value:  # Tried <= -> Produces Index out of range error
        # increase the index to go to the next data value
        # print("Checked index: " + str(i))

        if data[i] > value:
            return "does not occur"
        i = i + 1
    # test if we have found the value
    if i == len(data):
        # no, we went outside valid range; return -1
        return "does not occur"
    else:
        # yes, we found the value; return the index
        return i


def binary(data, value):
    low = 0
    high = len(data) - 1

    if value > data[high]:
        return -1

    mid = high // 2
    while high - low > 0 and data[mid] != value:
        if value < data[mid]:
            high = mid - 1
        else:
            low = mid + 1

        mid = (high + low) // 2
    if data[mid] == value:
        return mid
    else:
        return -1


#   Task 2.23
def binary_pairs(data, value):
    low = 0
    high = len(data) - 1
    mid = high // 2

    if not data[low][0] <= value <= data[high][0]:
        return -1

    while high - low > 0 and data[mid][0] != value:
        if value < data[mid][0]:
            high = mid - 1
        else:
            low = mid + 1

        mid = (high + low) // 2

    if data[mid][0] == value:
        return mid
    else:
        return -1
