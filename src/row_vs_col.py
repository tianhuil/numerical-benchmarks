from contextlib import contextmanager
import datetime
import sys
import numpy as np

N = 10000


@contextmanager
def timer(out=sys.stdout):
    start = datetime.datetime.now()
    yield
    end = datetime.datetime.now()
    out.write("Seconds elapsed: {}\n".format((end - start).total_seconds()))


with timer():
    for _ in range(N):
        A = np.random.normal(size=[100, 105])
        b = np.random.normal(size=[105])
        A.dot(b)

with timer():
    for _ in range(N):
        A = np.random.normal(size=[105, 100])
        b = np.random.normal(size=[105])
        b.dot(A)

with timer():
    for _ in range(N):
        A = np.array(np.random.normal(size=[100, 105]), order="F")
        b = np.random.normal(size=[105])
        A.dot(b)
