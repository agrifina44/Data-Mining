set.seed(2)
m=matrix(rnorm(50*2), ncol=2)
m[1:25,1]=m[1:25,1]+3
m[1:25,2]=m[1:25,2]-4
colnames(m) <- c("x","y")

km.out=kmeans(m,2,nstart = 20)
km.out$cluster

plot(m, col=(km.out$cluster+2),
     main = "Hasil K-Means Clustering dengan K = 2",
     pch=20,
     cex=1.5)

points(km.out$centers,
       col=4:3,
       pch=10,
       cex=2)