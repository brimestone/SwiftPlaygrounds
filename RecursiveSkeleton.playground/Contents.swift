import UIKit

func factorial(num: Int) -> Int {

  // condition to break recursion
  if num == 0 {
    return 1
  }

  // condition for recursive call
  else {
    return num * factorial(num: num - 1)
  }

}

var number = 3

// function call
var result = factorial(num: number)
print("The factorial of 3 is", result)
