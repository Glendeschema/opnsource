# naming indexing and Slicing

first_name = "Letlhonolo is in love"
last_name = "Tsime"

print(first_name[:])


#working with arrays
days_of_week = ["Monday","Tuesday","wednesday","Thursday","Friday","Saturday","Sunday"]
day = days_of_week[2] # printing 3rd element in an array days_of_week

print(day[:3])# printing from char 0  to 3 excluding 3 itself

print("Sorted days of week")

x = days_of_week.insert(1, "Glen") # inserting an element in an array on position 1
print(days_of_week)

days_of_week.reverse() #reversing elements in an array
days_of_week.remove("Glen")# Removing memeber of an array in list.
days_of_week.sort(reverse=t)

print(days_of_week)


# lists

list(range(10)) # start is included , end val is exluded (0-9) = 10 values

list(range(1, 11)) # start incld , end ex (1-10)

list(range(0, 30, 5)) #range between 0-30 divided by multiples of 5 ex end val ( 0 ,5,10,15,20,25,30)

list(range(0, 10, 3)) # range 0-10 with multiples of 3 ex remainder ex end val if true ( 0,3,6,9)

list(range(0, -10, -1)) # range 0 - (-9) ex val with multiples of -1  ( 0 , -1 , -2 ....-9)

list(range(0)) # will produce an empty set

list(range(1, 0)) #will produce an empty set


