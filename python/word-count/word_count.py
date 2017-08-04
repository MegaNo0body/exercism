from collections import Counter
import re


def word_count(text):
    words = re.split('[^a-z1-9]', text.lower())
    words = filter(None, words)
    words = list(words)
    return dict(Counter(words))
