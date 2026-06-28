import h5py
import matplotlib.pyplot as plt

f = h5py.File("ising.h5", "r")

data = f["/spins"][:]   # (time, L, L)

plt.imshow(data[-1], cmap="bwr", vmin=-1, vmax=1)
plt.show()
