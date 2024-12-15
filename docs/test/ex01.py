list_a = [1, 2, 3, 5, 6, 8, 9]
list_b = [3, 2, 1, 5, 6, 0]
duplicates = list(set(list_a) & set(list_b))
print("Duplicate items:", duplicates)
