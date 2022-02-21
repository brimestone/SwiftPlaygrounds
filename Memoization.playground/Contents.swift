import UIKit

var knownCalc:[Int:Int] = [Int:Int]()

func fib(_ n:Int) -> Int{
    if n == 1 { return n }
    if n == 0 { return n }
    
    if knownCalc[n] != nil {
        return knownCalc[n]!
    }else{
        print(n)
        let newCalc = fib(n - 1) + fib(n - 2)
        knownCalc[n] = newCalc
        return newCalc
    }
}


fib(70)
