import random, math, os, pylab
import numpy as np
import matplotlib.pyplot as plt

output_dir = "images/markov_ising"
if not os.path.exists(output_dir): os.makedirs(output_dir)


L = 100
N = L * L
nbr = {i : ((i // L) * L + (i + 1) % L, (i + L) % N,
            (i // L) * L + (i - 1) % L, (i - L) % N) \
                                    for i in range(N)}
nsteps = 4000000
list_T = [1.0 + 0.2 * i for i in range(15)] # temperatures
list_av_m = []
S = [random.choice([1, -1]) for k in range(N)] # random spines
A = [S[i*L:i*L+L] for i in range(L)]
X, Y = np.meshgrid(range(L), range(L))
X, Y = X+1, Y+1
fxy = A*(X/X)*(Y/Y)
plt.imshow(fxy,"binary")
plt.axis("off")
plt.savefig(output_dir + "/" + "snap-%06i-T1.png" % 0)
M = sum(S)
for T in list_T:
    print("T =", T)
    beta = 1.0 / T
    M_tot = 0.0
    n_measures = 0
    for step in range(nsteps):
        k = random.randint(0, N - 1)
        delta_E = 2.0 * S[k] * sum(S[nn] for nn in nbr[k])
        if random.uniform(0.0, 1.0) < math.exp(-beta * delta_E):
            S[k] *= -1
            M += 2 * S[k]
        if step % N == 0 and step > nsteps / 2:
            M_tot += abs(M)
            n_measures += 1
    list_av_m.append(abs(M_tot) / float(n_measures * N))
    A = [S[i*L:i*L+L] for i in range(L)]
    X, Y = np.meshgrid(range(L), range(L))
    X, Y = X+1, Y+1
    fxy = A*(X/X)*(Y/Y)
    plt.imshow(fxy,"binary")
    plt.title("$%i\\times%i$ | T = %.1f" % (L, L, T))
    plt.savefig(output_dir + "/" + "snap_%06i_T%.1f.png" % (nsteps,T))
plt.close()
pylab.title("$%i\\times%i$" % (L, L))
pylab.xlabel("$T$", fontsize=16)
pylab.ylabel("$<|M|>/N$", fontsize=16)
pylab.plot(list_T, list_av_m, "bo-", clip_on=False)
pylab.ylim(0.0, 1.0)
pylab.savefig(output_dir + "/" + "magnetization-L%i.png" % L)