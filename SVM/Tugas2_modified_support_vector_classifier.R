# Tugas 2
# Construct a linearly seperable dataset on 2-D plane
set.seed(100)
x=matrix(rnorm(800*2), ncol=2)
y=c(rep(-1,400),rep(1,400))
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
xtest=matrix(rnorm(200*2), ncol=2)
ytest=sample(c(-1,1), 200, rep=TRUE)
xtest[ytest==1,]=xtest[ytest==1,]+1
testdat=data.frame(x=xtest, y=as.factor(ytest))

ypred=predict(bestmod, testdat)
#confusion matrix
table(predict=ypred, truth=testdat$y)

tbl = table(predict=ypred, truth=testdat$y)

tn = as.vector(tbl[1])
tn
fn = as.vector(tbl[3])
fn
fp = as.vector(tbl[2])
fp
tp = as.vector(tbl[4])
tp

sum_all = tn + fn + fp + tp
sum_all
accuracy = (tp + tn )/sum_all
accuracy
error_rate = (fp + fn)/sum_all
error_rate
sensitivity = tp/(tp + fn)
sensitivity
specificity = tn/(fp + tn)
specificity
precision = tp/(tp + fp)
precision
recall = tp/(tp + fn)
recall
f_measure = (2*precision*recall)/(precision+recall)
f_measure