import numpy as np
import matplotlib.pyplot as plt
import imageio.v2 as imageio
import glob

files = sorted(glob.glob("output/spin_*.dat"))

frames = []

for f in files:
    data = np.loadtxt(f)
    L = int(np.sqrt(len(data)))
    grid = data[:, 2].reshape((L, L))

    plt.imshow(grid, cmap="bwr", vmin=-1, vmax=1, origin="lower")
    plt.axis("off")

    plt.savefig("frame.png")
    frames.append(imageio.imread("frame.png"))

imageio.mimsave("ising.gif", frames, fps=5)
