# ranges with if functions

x = range(1, 10)
if -1 in x:
    print("glen")
else:
    print("value does't exist")

days_of_week = ["Monday","Tuesday","wednesday","Thursday","Friday","Saturday","Sunday"]

day = input("Enter day to search")
if day in days_of_week or day.capitalize() in days_of_week:
    print("Valid")
else:
    print("invalid")


#validating strings
if "Glen" == "Glen":
    print("true")


if ("Glen" , "Tsime") == ("Glen" , "Tsime") :
    print("tue")

#validating using negation

x = "tsime"
if x != "glen" :
    print("true")

range1 = [1,2,3]

range2 = [3,2,1]

if range1.count(range1) == range2.count(range2) :
    print("true")
else:
    print("false")