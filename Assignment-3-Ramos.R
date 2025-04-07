#Chapter 3, Problems: 1, 5, 8, 9, 16, 18, 23,  25, 30. 

#Chapter 5, Problems: 11, 13, 34

#---------------
#Answers: 
#Problem 1a: Valid probability mass function 
#Problem 1b: 0.625
#Problem 1c: 1/3 
#Problem 1d: 3/4

#Problem 5: 1.125
#---------------

#1a - Valid probability mass function
# (1/4) + (1/2) + (1/8) + (1/8) = 1
# All probabilities are positive and they sum to 1 so it is a valid probability mass function

#1b - 0.25
#To find p(X >= 2) you must sum all the probabilities of x >= 2 (2 and 3)

p_two <- (1/8) + (1/8)
p_two 

#1c - .3333333 or 1/3
# P(X >= 2 | X >= 1) = P(X >= 2 ∩ X >= 1) / P(X >= 1)
# Since X >= 2 implies X >= 1 P(X >= 2 ∩ X >= 1) =  P(X >= 2)
p_one <- (1/2) + (1/8) + (1/8)
p_one

p_two_if_one <- p_two / p_one
p_two_if_one

#1d - 3/4 or .75
#Since X >= 2 implies X >= 1 for (X >= 2 U X >= 1) = X >= 1
p_one 

#5 - 1.125
#To compute the mean of random variable X you multiply 
#p(x) * x and sum them together
#Stored the answer in m and printed it out

m <- ((1/4) * 0) + (.5 * 1) + ((1/8) * 2) + ((1/8) * 3)
m 

#8