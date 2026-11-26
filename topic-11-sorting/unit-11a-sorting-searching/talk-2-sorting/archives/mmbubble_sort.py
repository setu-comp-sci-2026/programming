# Bubble Sort: compare and swap adjacent pairs

def bubble_sort(lst: list) -> list:
    data = lst.copy()          # don't modify original
    n = len(data)
    for i in range(n - 1):
        for j in range(n - 1 - i):
            if data[j] > data[j + 1]:
                data[j], data[j + 1] = data[j + 1], data[j]
    return data


def bubble_sort_trace(lst: list) -> list:
    """Same algorithm, but prints every swap (matches the trace slide)."""
    data = lst.copy()
    n = len(data)
    for i in range(n - 1):
        print(f"Pass {i + 1} (i={i}): {data}")
        for j in range(n - 1 - i):
            if data[j] > data[j + 1]:
                pair = [data[j], data[j + 1]]
                data[j], data[j + 1] = data[j + 1], data[j]
                print(f"  {pair} → swap → {data}")
        print(f"  ← {data[n - 1 - i]} in place")
    return data


nums = [64, 25, 12, 22, 11]
print(bubble_sort(nums))   # [11, 12, 22, 25, 64]
print(nums)                # original unchanged: [64, 25, 12, 22, 11]

print()
bubble_sort_trace(nums)
