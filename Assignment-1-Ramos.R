## Question 4
#- this is creating a vector using seq
# where you start at 0 end at 1 and go up by .2
p <- seq(0, 1, .2)

# Utilized the plot function to plot the graph with p being the x values and the 
# y values being the result of the function p (1-p)
plot(p, p*(1-p))

# Creates a graph with significantly more points. 
p <- seq(0, 1, .01)
plot(p, p*(1-p))
## Question 7
?rivers
#used mean to get the mean 
mean(rivers) 
#Ans = 591.1844

#Used sd to get the standard deviation
sd(rivers)
#493.8708

hist(rivers)

summary(rivers)
#Min = 135.0
# 1st Qu. = 135.0   
# Median = 425.0   
# Mean 3rd Qu. = 680.0  
# Max = 3710.0 

max (rivers)
#Longest lengths = Max = 3710.0

min (rivers)
#Shortest lengths = Min = 135.0

rivers[rivers > 1000]
#This creates a list where all the lengths are greater than 1000
# Result = 1459 1450 1243 2348 1171 3710 2315 2533 1306 1054 1270 1885 1100 1205 1038 1770

## Question 9
# 

region_freq <- list()
#Utilized a for loop to create a named list structure where 
# the key is the name of the region and the value is 
#the number of states in that region
for (name in state.region) {
  if (name %in% names(region_freq)) {
    region_freq[[name]] <- region_freq[[name]] + 1
  } else {
    region_freq[[name]] <- 1
  }
}
region_freq
#Ans = South: 16, West: 13, Northeast: 9, North Central: 12 

#Used .name and then [state.area] to get all the states with less than 10000 square miles
state.name[state.area < 10000]
#Ans = "Connecticut", "Delaware", "Hawaii", "Massachusetts","New Hampshire","New Jersey"   
# "Rhode Island", "Vermont"    

#used which min on the state.center with the lowest y parameter
state.name[which.min(state.center$y)]
#Ans = Florida

## Question 10
#Used to get information on mtcars
?mtcars
#Used to get the names of all cars with 4 forward gears. Rownames gives the name of the row 
rownames(mtcars[mtcars$gear == 4, ])
#Answer = "Mazda RX4", "Mazda RX4 Wag", "Datsun 710", "Merc 240D", "Merc 230"      
# "Merc 280", "Merc 280C", "Fiat 128", "Honda Civic", "Toyota Corolla",
# "Fiat X1-9", "Volvo 142E"    

#This describes the cars with a displacement > 150 and miles per gallon > 20
rownames(mtcars[mtcars$disp > 150 & mtcars$mpg > 20,])
#Utilizes & to denote and 
rownames(mtcars[mtcars$gear == 4 & mtcars$am == 1,])
#Answer = "Mazda RX4", "Mazda RX4 Wag", "Datsun 710", "Fiat 128", "Honda Civic"   
# "Toyota Corolla" "Fiat X1-9", "Volvo 142E"    

#Utilizes | as or 
rownames(mtcars[mtcars$gear == 4 | mtcars$am == 1,])
# "Mazda RX4", "Mazda RX4 Wag", "Datsun 710", "Merc 240D", "Merc 230"      
#"Merc 280", "Merc 280C", "Fiat 128", "Honda Civic", "Toyota Corolla"
#"Fiat X1-9", "Porsche 914-2", "Lotus Europa", "Ford Pantera L", "Ferrari Dino"  
#"Maserati Bora", "Volvo 142E"    

#Utilized mtcars[mtcars$carb == 2] in order to extract all the cars with 2 carburetors
cars_with_two_carb <- mtcars[mtcars$carb == 2,]
#Utilized mean to get the mean of the mpg of the cars with 2 carburetors
mean(cars_with_two_carb$mpg)
#Answer = 22.4
## Question 11
#Use given command to convert am to a factor with 2 levels
mtcars$am <- factor(mtcars$am, levels = c(0, 1), labels = c("auto", "manual"))
#Utilize length on the rownames to extract the length of the list with the am = auto 
length(rownames(mtcars[mtcars$am == "auto",]))
#ans = 19
#Utilize length on the rownames to extract the length of the list with the am = manual 
length(rownames(mtcars[mtcars$am == "manual",]))
# ans = 13
#Utilized the previous command adding an & to denote and to check for all the manual cars with 
# mpg > 25
length(rownames(mtcars[mtcars$am == "manual" & mtcars$mpg > 25,]))
#ans = 6
#Utilized the previous command adding an & to denote and to check for all the automatic cars with 
# mpg > 25
length(rownames(mtcars[mtcars$am == "auto" & mtcars$mpg > 25,]))
#ans = 0

## Question 13
#used to download the necessary package
install.packages("HistData")
#loads the package into the current session
library(HistData)
#Utilize ?DrinksWages in order to get necessary information for part a
#Utilized typeof in order to get the type of each variable
?DrinksWages
typeof(DrinksWages$class)
typeof(DrinksWages$trade)
typeof(DrinksWages$sober)
typeof(DrinksWages$drinks)
typeof(DrinksWages$wage)
typeof(DrinksWages$n)
#There are 70 observations on 6 variables. All the variable types are integer

#Used which.min in order to get the min wage and returned the observation for it.
DrinksWages[which.min(DrinksWages$wage),]
#Answer = Factory worker
#Utilized the sum variable in order to get the sum of the frame n

sum(DrinksWages$n)
#Ans = 604
#Utilized sum of n * wage and then divided it by the number of total workers by using sum(DrinksWages$n)
sum(DrinksWages$n * DrinksWages$wage) / sum(DrinksWages$n)
#Ans = $24.59

## Question 15
#Used to install the fosdata package
install.packages("remotes")
remotes::install_github("speegled/fosdata")
# Load the fosdata package
library(fosdata)
#Used to learn about the set
?bechdel
#Counted the number of rows and used the == to check which ones passed the test 
#Based on the binary variable which is a simplified metric for either PASS/FAIL
nrow(bechdel[bechdel$binary == "PASS", ])
#Ans = 803

#Divided the number of tests that PASS by the total number of entries, then multiplied it by 100
(nrow(bechdel[bechdel$binary == "PASS", ]) / nrow(bechdel)) * 100

#Ans = %44.76031

#Used table function and stored it in the variable year_movie
year_movie <- table(bechdel$year)

#Used which max in order to find the max in the table
which.max(year_movie)
#Ans = 2010

#Used documentation to read the number of different values for clean_test
?bechdel
#Ans = 5 (dubious, men, notalk, nowmen, and ok)

#Created a data frame called passed and used the bechdel$binary == "PASS"
#To accept only the passed entries
passed <- bechdel[bechdel$binary == "PASS"]

#Created a data frame called has_domgross and used the!is.na(bechdel$domgross)
#To accept only the entries where domgross is not null
has_domgross <- bechdel[!is.na(bechdel$domgross)]

