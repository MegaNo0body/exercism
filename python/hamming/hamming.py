def distance(a, b):
    if len(a) != len(b):
        raise ValueError()
    return len(list(filter(lambda i: a[i] != b[i], range(len(a)))))
