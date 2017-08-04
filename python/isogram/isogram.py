def is_isogram(text):
    clean_text = text.lower().replace(' ', '').replace('-', '')
    return len(set(clean_text)) == len(clean_text)
