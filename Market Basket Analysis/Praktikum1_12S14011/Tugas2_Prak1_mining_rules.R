# Load the libraries
library("arules")

# Load the dataset
data("Groceries")

# Mining rules With minimum support=.001, and minimum confidence=.5
rules <- apriori(Groceries,
                 parameter = list(support=.001,
                                  confidence=.5,
                                  target='rules' # to mine for rules
                 ))

# Summary info of rules
summary(rules)

# Add rules as a measurement
quality(rules)$chiSquared <- interestMeasure(rules, measure='chiSquared', Groceries)

# Show top 5 result by rules
inspect(sort(rules, by ='chiSquared', decreasing = T)[1:5])