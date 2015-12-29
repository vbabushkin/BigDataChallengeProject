__author__ = 'Masdar'
import numpy as np
import scipy.stats as stats
import matplotlib.pyplot as plt
from matplotlib.pyplot import imshow


with open('num.txt') as f:
    w, h = [float(x) for x in f.readline().split()] # read first line
    pts = []
    for line in f: # read rest of lines
        pts.append([float(x) for x in line.split()])
    data=np.array(pts)
    print data[1:10]

rvs=data[1:len(data)]
print len(data)
kde = stats.kde.gaussian_kde(rvs.T)

# Regular grid to evaluate kde upon
x_flat = np.r_[rvs[:,0].min():rvs[:,0].max():128j]
y_flat = np.r_[rvs[:,1].min():rvs[:,1].max():128j]
x,y = np.meshgrid(x_flat,y_flat)
grid_coords = np.append(x.reshape(-1,1),y.reshape(-1,1),axis=1)
print grid_coords
z = kde(grid_coords.T)
z = z.reshape(128,128)
imshow(z,aspect=x_flat.ptp()/y_flat.ptp(),origin='lower',extent=(rvs[:,0].min(),rvs[:,0].max(),rvs[:,1].min(),rvs[:,1].max()))
fig = plt.figure()
imshow(z,aspect=x_flat.ptp()/y_flat.ptp(),origin='lower',extent=(rvs[:,0].min(),rvs[:,0].max(),rvs[:,1].min(),rvs[:,1].max()))
ax = fig.add_subplot(111)
ax.scatter(rvs[:,0],rvs[:,1],s=0.5,marker='o',alpha=0.15,color='white')

plt.show()

