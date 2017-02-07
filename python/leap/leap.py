def is_leap_year(year):
    """
    on every year that is evenly divisible by 4
      except every year that is evenly divisible by 100
        unless the year is also evenly divisible by 400
    """
    if (year % 4) == 0:
        if not (((year % 400) != 0) and ((year % 100) == 0)):
            return True
    return False

