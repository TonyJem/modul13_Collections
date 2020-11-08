import UIKit

//MARK: - Task1:
print("--- Task1 ---")
//Создайте кортеж для двух человек с одинаковыми типами данных и параметрами.
//При том одни значения доставайте по индексу, а другие — по параметру.

var personOne = (name:"Johnny", surname:"Appleseed", age:246, profession:"nurseryman")
var personTwo = (name:"Arnold", surname:"Schwarzenegger", age:73, profession:"actor")

print(personOne.0)
print(personOne.1)
print(personOne.2)
print(personOne.3)

print(personTwo.name)
print(personTwo.surname)
print(personTwo.age)
print(personTwo.profession)

//MARK: - Task2:
print("\n--- Task2 ---")
//Создайте массив «дни в месяцах» (12 элементов содержащих количество дней в соответствующем месяце).

let daysInMonths = [31,28,31,
                    30,31,30,
                    31,31,30,
                    31,30,31]

//Используя цикл for и этот массив...
//  * выведите количество дней в каждом месяце:
for daysInMonth in daysInMonths {

    print(daysInMonth)
}

//  * используйте еще один массив с именами месяцев чтобы вывести название месяца + количество дней
let monthNames = ["January", "February", "March",
                  "April", "May", "June",
                  "July", "August", "September",
                  "October", "November", "December"]

print("\nMonths and days:")
for (index, daysInMonth) in daysInMonths.enumerated() {
    print("In \(monthNames[index]): \(daysInMonth) days")
}

//  * сделайте тоже самое, но используя массив кортежей с параметрами (имя месяца, количество дней)
let monthTuples = [("January", 31), ("February", 28), ("March", 31),
                   ("April", 30), ("May", 31), ("June", 30),
                   ("July", 31), ("August", 31), ("September", 30),
                   ("October", 31), ("November", 30), ("December", 31)]
print("\nThe same with Tuples:")
for monthTuple in monthTuples {
    print("In \(monthTuple.0): \(monthTuple.1) days")
}

//  * сделайте тоже самое, только выводите дни в обратном порядке (порядок в исходном массиве не меняется)
print("\nThe same, but backwards:")
for index in stride(from: monthTuples.count-1, to: 0, by: -1){
    print("In \(monthTuples[index].0): \(monthTuples[index].1) days")
}

func dayIn(month:Int) -> Int{
    let monthIndex = month - 1
    return daysInMonths[monthIndex]
}

//  * для произвольно выбранной даты (месяц и день) посчитайте количество дней до конца года
func restOfDaysFrom(month:Int, day:Int)->Int? {
    guard month>0 && month<=12 && day>0 && day<=dayIn(month: month) else {
        return nil
    }
    
    //Count rest of days in a current month
    let monthIndex = month - 1
    let restOfDaysInCurrentMonth = monthTuples[monthIndex].1 - day
    
    //Calculate days for rest of months
    var daysForRestOfMonths = 0
    if month < 12 {
        for index in stride(from: monthIndex + 1, to: monthTuples.count, by:1){
            daysForRestOfMonths += monthTuples[index].1
        }
    }
    return restOfDaysInCurrentMonth + daysForRestOfMonths
}

//количество дней до конца года:
if let daysLeft = restOfDaysFrom(month: 01, day: 01) {
    print("There are \(daysLeft) days left till the end of the year.")
} else {
    print("Please enter correct Month or Day. \nMonth has to be a number in range from 1 to 12 \nDay has to be in ranges below: ")
    for (index, days) in daysInMonths.enumerated(){
        print("For month \(index+1) day has to be in a range: from 1 to \(days)")
    }
}

//MARK: - Task3:
print("\n--- Task3 ---")
//Создайте словарь, как журнал студентов, где имя и фамилия студента это ключ, а оценка за экзамен — значение.

var students = ["Григорий Ганжа":4,
                "Нелли Леднёва":5,
                "Ваня Федоскин":5,
                "Отто Фукин":3,
                "Гена Ляпишев":1,
                "Виктория Коровянская":2]

// Check if getting proper value:
if let mark = students["Виктория Коровянская"]{
    print(mark) // 2 is ok!
}

//Повысьте студенту оценку за экзамен:
students["Виктория Коровянская"] = 3
// Check if value has been changed correctly:
if let mark = students["Виктория Коровянская"]{
    print(mark) // 3 is ok!
}

//Если оценка положительная (4 или 5) или удовлетворительная (3), то выведите сообщение с поздравлением, отрицательная (1, 2) - отправьте на пересдачу:

// NOTE: Solution prepared as separate task, with idea to learn how to implement Struct and Array, and create new Dictionary based on these data source:
struct Student {
    let name: String
    let surname: String
    var examMark: Int
    var ifNeedToRetakeExam: Bool? {
        switch examMark {
        case 1, 2:
            return true
        case 3,4,5:
            return false
        default:
            return nil
        }
    }
    
    func congratulateIfPassedExam(){
        guard ifNeedToRetakeExam != nil else {
            print("Can't tell results, please check Exam mark if it is correct!")
            return
        }
        
        if let ifNeedToRetakeExam = ifNeedToRetakeExam {
            if ifNeedToRetakeExam {
                print("Exam is not passed! \(name) \(surname) needs to retake it :(")
            } else {
                print("Congratulation to \(name) \(surname)! He passed exam :)")
            }
        }
    }
}

var student0 = Student(name: "Григорий", surname: "Ганжа", examMark: 4)
var student1 = Student(name: "Нелли", surname: "Леднёва", examMark: 5)
var student2 = Student(name: "Ваня", surname: "Федоскин", examMark: 5)
var student3 = Student(name: "Отто", surname: "Фукин", examMark: 3)
var student4 = Student(name: "Гена", surname: "Ляпишев", examMark: 1)
var student5 = Student(name: "Виктория", surname: "Коровянская", examMark: 2)

var allStudents = [student0,
                   student1,
                   student2,
                   student3,
                   student4,
                   student5]

var examMarks = [String:Int]()

for student in allStudents{
    examMarks[student.name + " " + student.surname ] = student.examMark
}
print("\nGroup exam results:")
print(examMarks)

//Print who passed and who didnt':
for (student, mark) in examMarks {
    if mark > 2 {
        print("\(student) passed exam! Congratulation!!!")
    } else {
        print("\(student) didn't pass exam! Need to retake :(")
    }
}

//Doublecheck if passed from array':
print("\nDoublecheck from array:")
for student in allStudents {
    student.congratulateIfPassedExam()
}

//Добавьте еще несколько студентов — это ваши новые одногруппники!
examMarks["Александр Леднёв"] = 4
examMarks["Мария Чувичкина"] = 2
examMarks["Полина Иванченко"] = 3
examMarks["Александр Збруев"] = 5
print("\nNew students have been added")
print(examMarks)

//Удалите одного студента — он отчислен
examMarks["Гена Ляпишев"] = nil
print("\nOne student was removed. Updated list below:")
print(examMarks)

//Посчитайте средний балл всей группы по итогам экзамена.
// Предполагаем, что оценку выбывшего студета учитывать не надо :)
var sumOfMarks = 0
for (_,mark) in examMarks {
    sumOfMarks += mark
}
let averageMark = Double(sumOfMarks) / Double(examMarks.count)
print("Average mark : \(averageMark)")
