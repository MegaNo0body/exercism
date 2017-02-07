
# Skeleton file for the Python "Hello World" exercise.
#


def hello(name=''):
    if name is None:
        return hello()
    else:
        return u"Hello, {0}!".format(name if name != '' else "World")
