# Load the libraries
library("arules")

# Load the dataset
data("Groceries")

# Mining rules with minimum support=.001, and minimum confidence=.5
rules <- apriori(Groceries,
                 parameter = list(support=.001,
                                  confidence=.5,
                                  target='rules' # to mine for rules
                 ))

# Summary info of rules
summary(rules)

# Show top 5 results by lift
inspect(sort(rules, by='lift', decreasing = T)[1:5])