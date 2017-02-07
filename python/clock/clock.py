import math

class Clock:
    def __init__(self, hour, minute):
        self.minutes = minute + (hour * 60) 

    def __str__(self):
        return '{:02d}:{:02d}'.format(self.hour(), self.minute())
    
    def __eq__(self, other):
        return str(self) == str(other)

    def hour(self):
        return math.floor(self.minutes / 60) % 24

    def minute(self):
        return self.minutes % 60

    def add(self, minutes):
        self.minutes += minutes
        return self

