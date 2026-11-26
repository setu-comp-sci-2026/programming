# Selection Sort: find the minimum, move it to the front

def selection_sort(lst: list) -> list:
    data = lst.copy()
    n = len(data)
    for i in range(n - 1):
        min_idx = i
        for j in range(i + 1, n):
            if data[j] < data[min_idx]:
                min_idx = j
        if min_idx != i:
            data[i], data[min_idx] = data[min_idx], data[i]
    return data


nums = [64, 25, 12, 22, 11]
print(selection_sort(nums))   # [11, 12, 22, 25, 64]
