#Chapter 3, Problems: 1, 5, 8, 9, 16, 18, 23,  25, 30. 

#Chapter 5, Problems: 11, 13, 34

#---------------
#Answers: 
#Problem 1a: Valid probability mass function 
#Problem 1b: 0.625
#Problem 1c:
#Problem 1d:

#Problem 5: 1.125
#---------------

#1a - Valid probability mass function
# (1/4) + (1/2) + (1/8) + (1/8) = 1
# All probabilities are positive and they sum to 1 so it is a valid probability mass function

#1b - 0.25
#To find p(X >= 2) you must sum all the probabilities of x >= 2 (2 and 3)

p_two <- (1/8) + (1/8)
p_two 

#1c - 

#1d - 

#5 - 1.125
#To compute the mean of random variable X you multiply 
#p(x) * x and sum them together
#Stored the answer in m and printed it out

m <- ((1/4) * 0) + (.5 * 1) + ((1/8) * 2) + ((1/8) * 3)
m 

#8