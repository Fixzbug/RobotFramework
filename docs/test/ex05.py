def simpleCipher(encrypted, k):

    decrypted = []
    for char in encrypted:
        new_position = (ord(char) - ord('A') - k) % 26
        decrypted_char = chr(new_position + ord('A'))
        decrypted.append(decrypted_char)

    return ''.join(decrypted)


print(simpleCipher("VTAOG", 2))