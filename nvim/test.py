def quicksort(inputlist: list) -> list:
    if len(inputlist) <= 1:
        return inputlist
    pivot = inputlist[len(inputlist) // 2]
    left = [x for x in inputlist if x < pivot]
    middle = [x for x in inputlist if x == pivot]
    right = [x for x in inputlist if x > pivot]
    return quicksort(left) + middle + quicksort(right)
