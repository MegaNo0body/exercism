import string

def is_pangram(sentence):
    present_chars = {letter: True for letter in sentence.lower()}
    return all(
            alphabet_char in present_chars
            for alphabet_char in string.ascii_lowercase
            )
