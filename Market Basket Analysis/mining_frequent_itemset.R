# Load the libraries
library("arules")

# Load the dataset
data("Groceries")

# Mining frequent itemset of minimum length 2, maximum length 2,
# and frequency of occurence at least 1 in 1000, i.e support=.001
itemsets <- apriori(Groceries,
                    parameter = list(support=.001,
                                     minlen=2,
                                     maxlen=2,
                                     target='frequent' # to mine for itemsets
                                     ))

# Summary info of itemsets
summary(itemsets)

# Add lift as a measurement
quality(itemsets)$lift <- interestMeasure(itemsets, measure='lift', Groceries)

# Show top 10 result by lift
inspect(sort(itemsets, by ='lift', decreasing = T)[1:10])