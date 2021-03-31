using PyPlot, LinearAlgebra
using3D()

m, n = (31, 41)

x = range(-2, stop=2, length=m)
y = range(-3, stop=3, length=n)

xgrid = repeat(x', n, 1)'
ygrid = repeat(y, 1, m)'

z_bdd = zeros(m,n)
z_unb = zeros(m,n)

for i = 1:m
    for j = 1:n
        z_bdd[i:i,j:j] .= x[i]^2 + tanh(y[j])^2
        z_unb[i:i,j:j] .= x[i]^2 + y[j]^2
    end
end

fig = figure("Lyapunov function candidate", figsize=(10,10))
ax = fig.add_subplot(1,1,1)
cp = contour(xgrid, ygrid, z_unb, colors="black", levels=[0.1, 0.5, 1, 1.5, 2, 3, 4], linewidth=2.0)
# cp = contour(xgrid, ygrid, z_bdd, colors="black", levels=[0.1, 0.5, 0.75, 1, 1.5, 2, 3], linewidth=2.0)
ax.clabel(cp, inline=1, fontsize=15)

ax.tick_params(axis="both", labelsize=20)

xlabel(L"$x$", fontsize=20)
ylabel(L"$y$", fontsize=20)
title("Radially Unbounded", fontsize=20)
# title("Not Radially Unbounded", fontsize=20)/
tight_layout()