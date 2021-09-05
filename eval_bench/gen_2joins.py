from random import randrange
import numpy as np
import sys

num_regions = 10
num_clients = int(sys.argv[1]) 
alpha = 1

def Zipf(a, low, hi, size=None):
    """
    Generate Zipf-like random variables,
    but in inclusive [min...max] interval
    """
    if low == 0:
        raise ZeroDivisionError("")

    v = np.arange(low, hi+1) # values to sample
    p = 1.0 / np.power(v, a)  # probabilities
    p /= np.sum(p)            # normalized

    return np.random.choice(v, size=size, replace=True, p=p)

print("CREATE TABLE clients(id INT, gnum INT, zipf INT, present INT);")


for i, j in enumerate(Zipf(alpha, 1, num_clients, size=num_clients)):
    print("INSERT INTO clients VALUES({},{},{},{});".format(i, 0, j, randrange(0, 2)))

for i, j in enumerate(Zipf(alpha, 1, num_clients, size=num_clients)):
    print("INSERT INTO clients VALUES({},{},{},{});".format(i + num_clients, 1, j, randrange(0, 2)))

for i, j in enumerate(Zipf(alpha, 1, num_clients, size=num_clients)):
    print("INSERT INTO clients VALUES({},{},{},{});".format(i + num_clients, 2, j, randrange(0, 2)))

