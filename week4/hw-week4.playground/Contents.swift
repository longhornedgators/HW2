import UIKit

/*
 a) In the assignment for Week 3, part D asked you to write a function that would compute the average of an array of Int. Using that function and the array created in part A, create two overloaded functions of the function average.
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

func average(val: [Double]?){
    var a1:[Double]? = val
    var sum=0.0
    guard let val = a1 else {
        print("The array is nil. Calculating the average is impossible.")
        return
    }
    
    for i in val{
        sum = sum+i
    }
    
    print("The average of the values in the array is \(Double(sum/Double(val.count)))")
}

func average(val: [Float]?){
    var a1:[Float]? = val
    var sum=Float(0)
    guard let val = a1 else {
        print("The array is nil. Calculating the average is impossible.")
        return
    }
    
    for i in val{
        sum = sum+i
    }
    
    print("The average of the values in the array is \(Float(sum/Float(val.count)))")
}

var optArray:[Int]? = [10,20,30]
var optDoubleArray:[Double]? = [10.5,20.5,30.5]
var optFloatArray:[Float]? = [10.5,20.5,30.5]


average(val: optArray)
average(val: optDoubleArray)
average(val: optFloatArray)

/*
 b) Create an enum called Animal that has at least five animals. Next, make a function called theSoundMadeBy that has a parameter of type Animal. This function should output the sound that the animal makes. For example, if the Animal passed is a cow, the function should output, “A cow goes moooo.”
 Hint: Do not use if statements to complete this section.
 Call the function twice, sending a different Animal each time.
 */

enum Animals: CaseIterable {
    case cow, dog, pig, sheep, elephant
}

func theSoundMadeBy(animal: Animals)-> String{
    switch animal {
    case .cow:
        return ("A cow goes moooo.")
    case .dog:
        return ("A dog goes bow.")
    case .elephant:
        return ("A elephant goes trumpeting")
    case .pig:
        return ("A pig goes snort")
    case .sheep:
        return ("A sheep goes baa")
    }
}

for animal in Animals.allCases{
    print(theSoundMadeBy(animal: animal))
}

/*
 c) This question will have you creating multiple functions that will require you to use closures and collections. First, you will do some setup.

 Create an array of Int called nums with the values of 0 to 100.
 Create an array of Int? called numsWithNil with the following values:
 79, nil, 80, nil, 90, nil, 100, 72

 Create an array of Int called numsBy2 with values starting at 2 through 100, by 2.
 Create an array of Int called numsBy4 with values starting at 2 through 100, by 4.

 You can set the values of the arrays above using whatever method you find the easiest. In previous weeks you were introduced to ranges and sequences in Swift. Leveraging those in the Array initializer will allow you to create the requested arrays in a single line. Don’t let the last two break your stride.

 - Create a function called evenNumbersArray that takes a parameter of [Int] (array of Int) and returns [Int]. The array of Int returned should contain all the even numbers in the array passed. Call the function passing the nums array and print the output.

 - Create a function called sumOfArray that takes a parameter of [Int?] and returns an Int. The function should return the sum of the array values passed that are not nil. Call the function passing the numsWithNil array, and print out the results.

 - Create a function called commonElementsSet that takes two parameters of [Int] and returns a Set<Int> (set of Int). The function will return a Set<Int> of the values in both arrays.

 - Call the function commonElementsSet passing the arrays numsBy2, numsBy4, and print out the results.
 */

let nums = Array(stride(from: 0, through: 100, by: 1))
let numsWithNil:[Int?] = [79, nil, 80, nil, 90, nil, 100, 72]
let numsBy2 = Array(stride(from: 2, through: 100, by: 2))
let numsBy4 = Array(stride(from: 2, through: 100, by: 4))

/*
 - Create a function called evenNumbersArray that takes a parameter of [Int] (array of Int) and returns [Int]. The array of Int returned should contain all the even numbers in the array passed. Call the function passing the nums array and print the output.
*/

func evenNumbersArray(val: [Int])->[Int]{
    return val.filter {$0 % 2==0}
}

print(evenNumbersArray(val: nums))

/*
 - Create a function called sumOfArray that takes a parameter of [Int?] and returns an Int. The function should return the sum of the array values passed that are not nil. Call the function passing the numsWithNil array, and print out the results.
 */

func sumOfArray(val: [Int?])->Int{
    let nonNilArray = val.compactMap{$0}
    return nonNilArray.reduce(0,+)
}

print(sumOfArray(val: numsWithNil))

/*
 - Create a function called commonElementsSet that takes two parameters of [Int] and returns a Set<Int> (set of Int). The function will return a Set<Int> of the values in both arrays.
 - Call the function commonElementsSet passing the arrays numsBy2, numsBy4, and print out the results.

 */

func commonElementsSet(array1: [Int], array2: [Int]) -> Set<Int>{
    return Set([array1, array2].flatMap({ (element: [Int]) -> [Int] in return element}))
}

print(commonElementsSet(array1: numsBy2,array2: numsBy4))

/*
 d) Create a struct called Square that has a stored property called sideLength and a computed property called area. Create an instance of Square and print the area.
 */

struct Square{
    var sideLength: Int
    var area: Int {
        get {
            return sideLength*sideLength
        }
    }
}

var square = Square(sideLength: 10)
print(square.area)
