# Binary Search: divide and conquer on a SORTED list


def binary_search(lst: list, target) -> int:
    """Return index of target in sorted lst, or -1."""
    low, high = 0, len(lst) - 1
    while low <= high:
        mid = (low + high) // 2
        if lst[mid] == target:
            return mid
        elif lst[mid] < target:
            low = mid + 1    # target is in right half
        else:
            high = mid - 1   # target is in left half
    return -1


def binary_search_trace(lst: list, target) -> int:
    """Same algorithm, but prints each step (matches the trace slide)."""
    low, high = 0, len(lst) - 1
    step = 1
    while low <= high:
        mid = (low + high) // 2
        msg = f"Step {step}: low={low}, high={high}, mid={mid} → lst[{mid}]={lst[mid]}"
        if lst[mid] == target:
            print(f"{msg} == {target} → return {mid}")
            return mid
        elif lst[mid] < target:
            low = mid + 1
            print(f"{msg} < {target} → low={low}")
        else:
            high = mid - 1
            print(f"{msg} > {target} → high={high}")
        step += 1
    print("Not found → return -1")
    return -1


# Only run the demo when this file is run directly,
# not when binary_search is imported by another file
if __name__ == "__main__":
    sorted_nums = [2, 5, 8, 12, 16, 23, 38, 56, 72, 91]
    print(binary_search(sorted_nums, 23))   # 5
    print(binary_search(sorted_nums, 10))   # -1

    print()
    binary_search_trace(sorted_nums, 23)
