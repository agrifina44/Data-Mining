# K-Means clustering dengan K=2
set.seed(2)
m=matrix(rnorm(900*2), ncol=2)
m[1:450,1]=m[1:450,1]+5
m[1:450,2]=m[1:450,2]-6
colnames(m) <- c("x","y")

km.out=kmeans(m,2,nstart = 20)
km.out$cluster

plot(m, col=(km.out$cluster+5),
     main = "Hasil K-Means Clustering dengan K = 2",
     pch=18,
     cex=1)

points(km.out$centers,
       col=4:3,
       pch=8,
       cex=2)

# K-Means clustering dengan K=3
set.seed(3)
m=matrix(rnorm(900*2), ncol=2)
m[1:450,1]=m[1:450,1]+5
m[1:450,2]=m[1:450,2]-6
colnames(m) <- c("x","y")

km.out=kmeans(m,3,nstart = 20)
km.out$cluster

plot(m, col=(km.out$cluster+5),
     main = "Hasil K-Means Clustering dengan K = 3",
     pch=20,
     cex=1.5)

points(km.out$centers,
       col=4:3,
       pch=8,
       cex=2)


# K-Means clustering dengan K=4
set.seed(4)
m=matrix(rnorm(900*2), ncol=2)
m[1:450,1]=m[1:450,1]+5
m[1:450,2]=m[1:450,2]-6
colnames(m) <- c("x","y")

km.out=kmeans(m,4,nstart = 20)
km.out$cluster

plot(m, col=(km.out$cluster+4),
     main = "Hasil K-Means Clustering dengan K = 4",
     pch=20,
     cex=1)

points(km.out$centers,
       col=2:1,
       pch=8,
       cex=2)