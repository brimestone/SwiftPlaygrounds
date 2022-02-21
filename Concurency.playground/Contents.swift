import Cocoa

class FizzBuzz{
    var n:Int
    let dispatchGroup = DispatchGroup()
    
    init(_ n:Int){
        self.n = n
    
        for n in 1...n{
            self.dispatchGroup.enter()
            if n % 3 == 0 && n % 5 == 0 {
                self.printFizzBuzz()
            }else if n % 3 == 0 && n % 5 != 0{
                self.printFizz()
            }else if n % 3 != 0 && n % 5 == 0{
                self.printBuzz()
            }else{
                self.printNumber(n)
            } 
            self.dispatchGroup.wait() // Serialize
        }
        // self.dispatchGroup.wait() // Not serialize
        self.dispatchGroup.notify(queue: DispatchQueue.main, work: DispatchWorkItem(block: {
            print("Done!")
        }))
        
    }
    func printFizz(){
        DispatchQueue(label: "fizz", attributes: .concurrent).async {
            print("Fizz")
            self.dispatchGroup.leave()
        }
    }
    func printBuzz(){
        DispatchQueue(label: "buzz", attributes: .concurrent).async {
            print("Buzz")
            self.dispatchGroup.leave()
        }
    }
    func printFizzBuzz(){
        DispatchQueue(label: "fizzbuzz", attributes: .concurrent).async {
            print("FizzBuzz")
            self.dispatchGroup.leave()
        }
        
    }
    func printNumber(_ number:Int){
        DispatchQueue(label: "number", attributes: .concurrent).async {
            print(number)
            self.dispatchGroup.leave()
        }
    }
}
let fizzBuzz = FizzBuzz(45)
