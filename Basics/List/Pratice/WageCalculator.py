working_hour = input("Enter working hour for week: ")
wage_per_hour = input("Enter working hour for week per hour: ")

working_hour = working_hour.split(" ")

working_hour = [int(i) for i in working_hour]

sum_working_hour = sum(working_hour)

print(f'Total Working Hours: {sum_working_hour}, working hours: {working_hour}')

if sum_working_hour >= 40:
    total = sum_working_hour * int(wage_per_hour)
    print(f'Total payment: {total} for working hours: {working_hour}')
else:
    extraHour = sum_working_hour - 40
    total = (sum_working_hour * int(wage_per_hour)) + (extraHour * int(wage_per_hour) * 1.5)
    print(f'Total payment: {total} for working hours: {working_hour}, extraHour: {extraHour}, extra payments: {extraHour * int(wage_per_hour)}')