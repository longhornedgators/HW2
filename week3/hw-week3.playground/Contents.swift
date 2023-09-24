import UIKit

//a.Create an array of Int called nums with values 0 through 20. Iterate over the Array and print the even numbers.

print("**************")
print("a")
print("**************")

var nums = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]

for i in nums{
    if i%2 == 0 {
        print(i)
    }
}

/*b) In your Playground, define the following String:
let sentence = “The qUIck bRown fOx jumpEd over the lAzy doG”

Iterate over sentence counting the vowels (a, e, i, o, u), ignoring the case.*/

print("**************")
print("b")
print("**************")

let sentence = "The qUIck bRown fOx jumpEd over the lAzy doG"
let vowels = ["a","e","i","o","u"]
var count=0

let char = Array(sentence.lowercased())

for str in char{
    if(vowels.contains(String(str))) {
        count=count+1
    }
}

print("The number of vowel is \(count)")


/*
 
 c) Create two arrays of Int with the values of 0 through 4. Use a nested for loop to print a mini multiplication table. The output, which should be multiple lines, should be in the following format:
 0 * 0 = 0

 The format follows the number from the first array, space, followed by the character *, space,  followed by the number from the second array, space,  followed by =, space, followed by the result of the number from the first array multiplied by the number from the second array (just like the example above). There are a couple of ways to achieve this, but String Interpolation is the easiest.
 
 */

print("**************")
print("c")
print("**************")

let a1 = [0,1,2,3,4]
let a2 = [0,1,2,3,4]

for x in a1 {
    for y in a2 {
        print("\(x) * \(y) = \(x*y)")
    }
}

print("**************")
print("d")
print("**************")

/*
 d) Write a function called average that takes an optional array of Int. If the array is not nil, calculate the average of the array's values and print:
 “The average of the values in the array is <average>.”

 Where <average> is the calculated average. If the array is nil, print:
 “The array is nil. Calculating the average is impossible.”

 Note: the average is calculated by summing the values in the array and dividing by the number of elements.

 Call this function two times. First, pass in the nums array from part A and second by passing an optional array of Int.
 */

func average(val: [Int]?){
    var a1:[Int]? = val
    var sum=0
    guard let val = a1 else {
        print("The array is nil. Calculating the average is impossible.")
        return
    }
    
    for i in val{
        sum = sum+i
    }
    
    print("The average of the values in the array is \(Double(sum/val.count))")
}

var optArray:[Int]? = [10,20,30]

average(val: nums)
average(val: optArray)

/*
 e) Create a struct called Person with the properties firstName, lastName, and age. Choose appropriate data types for the properties. Include a method on Person called details that prints the values stored in the properties in the following format:
  Name: <firstName> <lastName>, Age: <age>

 Create an instance of Person called person. Pass your first name, last name, and age for the properties. Finally, call the method details.
 */

print("**************")
print("e")
print("**************")

struct Person{
    var firstName: String
    var lastName: String
    var age: Int
    
    func details(){
        print("Name: \(firstName) \(lastName), Age: \(age)" )
    }
}

var person = Person(firstName: "Lakshmi", lastName: "Chakarapani", age: 25)
person.details()


/*
 f) Create a class called Student with two properties: person of type Person and grades, an array of Int. The class must have a method called calculateAverageGrade that takes no parameters and returns a Double. Include a method called details that prints the values of the properties stored in Student along with the average grade in the following format:
  Name: <firstName> <lastName>, Age: <age>, GPA: <average grade>.

 Create an instance of Student called student passing in your first name, last name, age, and an array of five numbers: 94, 99, 81, 100, 79. Next call the details method to output the details of the student.
 */

print("**************")
print("f")
print("**************")

class Student{
    var person: Person
    var grades: [Int]
    
    init(person: Person, grades: [Int]) {
        self.person = person
        self.grades = grades
    }
    
    func calculateAverageGrade()-> Double{
        var sum: Double=0
        var avg:Double = 0.0
        for i in 0..<grades.count{
            sum = sum + Double(grades[i])
            print(sum)
        }
        avg = sum/Double(grades.count)
        return avg
    }
    
    func details(){
        print("Name: \(person.firstName) \(person.lastName), Age: \(person.age), GPA: \(calculateAverageGrade())." )
    }
}

var student = Student(person: person, grades: [94,99,81,100,79])

student.details()

