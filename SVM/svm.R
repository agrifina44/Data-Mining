# Construct a linearly seperable dataset on 2-D plane
set.seed(100)
x=matrix(rnorm(20*2), ncol=2)
y=c(rep(-1,10),rep(1,10))
x[y==1,]=x[y==1,]+1

plot(x, col=(3-y))

dat=data.frame(x=x,y=as.factor(y))

# Load the libsvm R interface
# Use Liblinear for very large problem
library('e1071')

svmfit=svm(y ~ ., data=dat, kernel='linear', cost=10, scale=FALSE)
plot(svmfit,dat)
svmfit$index
summary(svmfit)

# Find optimal tuning parameter
set.seed (1)
tune.out=tune(svm,y ~ .,data=dat, kernel="linear", ranges = list(cost=c(0.001, 0.01, 0.1, 1,5, 10, 100)))
bestmod=tune.out$best.model
summary(bestmod)

# Construct the best data
xtest=matrix(rnorm(20*2), ncol=2)
ytest=sample(c(-1,1), 20, rep=TRUE)
xtest[ytest==1,]=xtest[ytest==1,]+1
testdat=data.frame(x=xtest, y=as.factor(ytest))

ypred=predict(bestmod, testdat)
#confusion matrix
table(predict=ypred, truth=testdat$y)
