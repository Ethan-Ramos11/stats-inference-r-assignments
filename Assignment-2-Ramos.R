#Chapter 2, Problems 5, 6, 10, 11, 21, 22, 25, 26, 31, 32
#---------------
#Answers: 
#5a: .8
#5b: .47
#5c: .61
#5d: .013

#6: .0652

#10: 0.5599

#11: 0.2865

#21a = 1/15

#21b = 2/15

#21c = 1/2

#22a = AD and CD

#22b = AB and BD

#22c = AC and BC

#25 See code and description 

#26 = Not independent 

#31a = 1/3

#31b = about .4285714

#32a = 0.8413169 (About .84)

#32b = .36
#---------------
#Problem 5a Answer = .8 1 - .2 = .8

#Problem 5b Answer = .47 .13 + .2 + .14 = .47

#Problem 5c
mm_colors <- c(Yellow = 0.14, Red = 0.13, Orange = 0.20, Brown = 0.12, Green = 0.20, Blue = 0.21)
1 - (1 - mm_colors["Blue"])^4 
#Answer = .61, The probability of drawing a blue is = 1 - chance of not getting any blues in 4 draws. 
#To get the probability of not drawing blues its (1 - .21)^4. You take this value and subtract it from 
# 1 to get the answer of .61

#Problem 5d
# P = n! * p₁ * p₂ * p₃ * p₄ * p₅ * p₆
# Where n! accounts for all possible permutations of the 6 colors
fact_6 <- factorial(6)
prob_product <- prod(mm_colors)
prob_unique <- fact_6 * prob_product
#Answer = .013

#Problem 6 
# In order to answer this question I use simulation. 
# I take the mean/average and replicate the experiment 10000 times 
# I count the number of blues and oranges, then return a 1 (true) if at least 9 blues
# and 6 oranges appear or a 0 (false) otherwise. 
mean(replicate(10000, {
  bag <- sample(names(mm_colors),30, replace=TRUE, prob=as.numeric(mm_colors));
  blue_count<- sum(bag == "Blue");
  orange_count <- sum(bag == "Orange");
  (blue_count >= 9) & (orange_count >= 6)
}))
#Answer = .0652

#Problem 10
# In order to answer this question I use simulation. 
# I take the mean/average and replicate the experiment 10000 times 
# I use a fair 6 sided dye and then sum up the rolls with 1/true being returned if 
# the sum is between 15 and 20 and 0/false otherwise
dice <- c(1,2,3,4,5,6)
dice_prob <- c(1/6,1/6,1/6,1/6,1/6,1/6)
mean(replicate(10000, {
  choice <- sample(dice,5, replace=TRUE, prob=dice_prob);
  sum <- sum(choice);
  (sum >= 15) & (sum <= 20)
}))
#Answer = 0.5599

#Problem 11 
# In order to answer this question I use simulation. 
# I take the mean/average and replicate the experiment 10000 times 
# I use a fair 6 sided dye and then sum up the rolls with 1/true being returned if 
# 20 was at any point the cumulative sum of the rolls and 0/false otherwise
mean(replicate(10000, {
  choice <- sample(dice,20, replace=TRUE, prob=dice_prob);
  sum <- sum(choice);
  20 %in% cumsum(choice)
}))
#Answer = 0.2865

#Problem 21a 
#To answer this first I got all the possible combinations of picking 2 numbers from 1-6
# Then I summed each pair, then got number of sums that equal 10
# I then divided the number of pairs with a sum of 10 by the number of pairs
pairs <- combn(1:6, 2)
sums <- apply(pairs, 2, sum)
ten_sum <- sum(sums == 10)
prob_ten <- ten_sum / ncol(pairs)
prob_ten
#Answer = 0.06666667 or 1/15

#Problem 21b
# To answer this first I got all the possible combinations of picking 2 numbers from 1-6
# Then I summed each pair, then got number of sums that is greater than or equal to 10
# I then divided the number of pairs with a sum of 10 or more by the number of pairs
pairs <- combn(1:6, 2)
sums <- apply(pairs, 2, sum)
at_least_ten <- sum(sums >= 10)
prob_at_least_ten <- at_least_ten / ncol(pairs)
prob_at_least_ten
#Answer = 0.1333333333 or 2/15


#Problem 21c
# To answer this first I got all the possible combinations of picking 2 numbers from 1-6
# Then I summed each pair, then got number of sums that is 10 and the number of sums that are
# >= 10. Then I divided the number of 10s by the number of sums >= 10
pairs <- combn(1:6, 2)
sums <- apply(pairs, 2, sum)
exactly_ten <- sum(sums == 10)
at_least_ten <- sum(sums >= 10)
prob_ten_at_least_ten <- exactly_ten / at_least_ten
prob_ten_at_least_ten
#Answer = 1/2

#22a Answer = AD and CD
# AD is disjoint because if the dice matches it is impossible for the sum to equal 7
# CD is disjoint because if the dice match than one cannot be larger than the other 

#22b
# To determine independence, I check if P(X ∩ Y) = P(X) × P(Y) for each pair of events
#Answer = AB and BD

# First create the sample space for rolling two dice (white and red)
white <- 1:6
red <- 1:6
sample_space <- expand.grid(white = white, red = red)

# Define the four events as described in the problem
event_A <- subset(sample_space, white + red == 7)
event_B <- subset(sample_space, white %% 2 == 1)
event_C <- subset(sample_space, red > white)
event_D <- subset(sample_space, white == red)

# Calculate probability of each individual event
total_outcomes <- nrow(sample_space)  
p_A <- nrow(event_A) / total_outcomes
p_B <- nrow(event_B) / total_outcomes
p_C <- nrow(event_C) / total_outcomes
p_D <- nrow(event_D) / total_outcomes

# Find the intersection of each pair of events
AB <- merge(event_A, event_B)
AC <- merge(event_A, event_C)
AD <- merge(event_A, event_D)
BC <- merge(event_B, event_C)
BD <- merge(event_B, event_D)
CD <- merge(event_C, event_D)

# Calculate the probability of each intersection
p_AB <- nrow(AB) / total_outcomes
p_AC <- nrow(AC) / total_outcomes
p_AD <- nrow(AD) / total_outcomes
p_BC <- nrow(BC) / total_outcomes
p_BD <- nrow(BD) / total_outcomes
p_CD <- nrow(CD) / total_outcomes

# Calculate what the probabilities would be if the events were independent
expected_p_AB <- p_A * p_B
expected_p_AC <- p_A * p_C
expected_p_AD <- p_A * p_D
expected_p_BC <- p_B * p_C
expected_p_BD <- p_B * p_D
expected_p_CD <- p_C * p_D

# Check if each pair is independent by comparing actual vs expected probabilities
AB_independent <- p_AB == expected_p_AB
AB_independent #True 
AC_independent <- p_AC == expected_p_AC
AC_independent #False
AD_independent <- p_AD == expected_p_AD
AD_independent #False
BC_independent <- p_BC == expected_p_BC
BC_independent #False
BD_independent <- p_BD == expected_p_BD
BD_independent #True 
CD_independent <- p_CD == expected_p_CD
CD_independent #False

#Answer = AB and BD


#22c Answer is the remaining combinations not seen in the previous 2 questions 
# Answer = AC and BC

#25 To Answer this question, first I set up the sample space with all possible outcomes,
# then I defined and calculated the probability of each outcome. Then I calculated the intersect 
# using the built in intersect function. Then I multiplied probabilities for independence testing
# I then compared the intersection to its respective multiplication and found that A and B, A and C, 
# and B and C are independent, but A and B and C are not independent because 
# the multiplication = 1/8 while the intersection = 1/4


sample_space <- c("HH", "HT", "TH", "TT")

# Define the events
# A: first toss is heads (HH, HT)
event_A <- c("HH", "HT")

# B: second toss is heads (HH, TH)
event_B <- c("HH", "TH")

# C: both tosses are the same (HH, TT)
event_C <- c("HH", "TT")

#Calculate the probability of each event by dividing the accepted outcome by all outcomes
prob_A <- length(event_A) / length(sample_space)
prob_B <- length(event_B) / length(sample_space)
prob_C <- length(event_C) / length(sample_space)


#Calculate intersections using built in intersect function
a_and_b <- intersect(event_A,event_B)
a_and_c <- intersect(event_A,event_C)
b_and_c <- intersect(event_B,event_C)
a_and_b_and_c <- intersect(a_and_b, event_C)

#Calculate the probabilities of each intersect 
p_a_b <- length(a_and_b) / length(sample_space)
p_a_c <- length(a_and_c) / length(sample_space)
p_b_c <- length(b_and_c) / length(sample_space)
p_a_b_c <- length(a_and_b_and_c) / length(sample_space)

#Calculate products for independence testing
p_a_times_b = prob_A * prob_B
p_a_times_c = prob_A * prob_C
p_b_times_c = prob_B * prob_C
p_a_times_b_times_c = prob_A * prob_B * prob_C

#Check if the intersection = the multiplication of probabilities 
a_b_are_independent <- p_a_b == p_a_times_b
a_b_are_independent #TRUE
a_c_are_independent <- p_a_c == p_a_times_c
a_c_are_independent #TRUE
b_c_are_independent <- p_b_c == p_b_times_c
b_c_are_independent #TRUE
a_b_c_are_independent <- p_a_b_c == p_a_times_b_times_c
a_b_c_are_independent #FALSE

#26 The probability of event A = 1/6 because it is a fair die. To calculate the probability of B
# we simulate the 3 dice rolls and count the number of times the first dice roll is equal to the max
# of all dice rolls. To calculate the intersect we do another simulation where we take the mean of 
# all the roles where the first element is the max and is equal to 5. Probability of B is around .4229
# probability of a intersect b is about .11. Since A * B != intesect (A, B) they are not independent

#Get probability of B via simulation
prob_B <- mean(replicate(10000, {
  die_roll <- sample(1:6, 3, TRUE);
  die_roll[1] == max(die_roll)
}))
prob_B # .4229

#Get probability of the intersect via simulation
prob_AB <- mean(replicate(10000, {
  die_roll <- sample(1:6, 3, TRUE);
  die_roll[1] == max(die_roll) & die_roll[1] == 5
}))

prob_AB #.1143

#Answer: Not independent

#31 
#Setup 
box_one <- c("R","R","R","B","B","B","B")
box_two <- c("R","R","B","B","B","B","B")

#31a To solve, first calculate the chances of picking box 1 or two. Then calculate 
# the probability of picking red from either box. Finally, sum the products of the chance 
# of getting a certain box with the chance of picking red from that box
#Probability of box one being selected is 1/3 which is given
box_one_chosen <- 1/3

#Chance of red being chosen from box 1
reds_box_one <- sum(box_one== "R")
#Get the probability of picking red from box one
p_red_box_one <- reds_box_one / length(box_one)

#Probability of box two being selected is 2/3 (1-1/3)
box_two_chosen <- 2/3
#Chance of red being chosen from box 2
reds_box_two <- sum(box_two== "R")
#Get the probability of picking red from box one
p_red_box_two <- reds_box_two / length(box_two)

#Sum the product of the chance of the box being chosen and number of reds in that box
p_red_chosen_total <- (box_one_chosen * p_red_box_one) + (box_two_chosen * p_red_box_two)

p_red_chosen_total # 1/3

#Answer = 1/3

#31b 
#B1 = Picking box 1
#R = picking red 
#R|B1 = Picking red from box 1
#Using Bayes rule, we know that P(B1|R) = [P(R|B1) × P(B1)] / P(R)
#All these values are known 
p_b1_r <- (p_red_box_one * box_one_chosen) / p_red_chosen_total
p_b1_r # About .4285714
#Answer about .4285714

#32 To solve, first setup the boxes and probabilities. Each box i has i red and 9-i blue marbles.
# Calculate the probability of drawing 3 consecutive red marbles from each box 
# using the formula (prob of red from box i)^3. Then find the probability of drawing 3 consecutive 
# red marbles overall by summing the product of the probability of picking each box with the 
# probability of drawing 3 consecutive reds from that box.

#setup 
boxes <- 0:9
red_marbles <- boxes
blue_marble <- 9 - red_marbles

prob_pick_box <- rep(1/10, 10)

prob_red_from_box_i <- red_marbles / 9

prob_three_red_i <- (prob_red_from_box_i)^3

prob_three_red <- sum(prob_pick_box * prob_three_red_i)

#32a To find the probability that the fourth marble is red given three consecutive reds,
# first use Bayes' theorem to calculate the probability that each box was selected given 
# that 3 consecutive red marbles were drawn. Then calculate the weighted average of the
# probability of drawing a red marble from each box, with weights being the updated 
# probabilities of box selection after observing the 3 red marbles.

prob_three_from_box_i <- (prob_three_red_i * prob_pick_box) / prob_three_red

prob_fourth_red_given_three_red <- sum(prob_three_from_box_i * prob_red_from_box_i)

prob_fourth_red_given_three_red #About .8413169


#32b To find the probability that box 9 was chosen given three consecutive reds,
# use the conditional probabilities calculated in part (a) and simply look at the 
# probability for box 9 (which is at index 10 in R).
prob_three_from_box_i[10] #About .36