import UIKit

func getSpiralOrder(matrix:[[Int]])->[Int]{
    var valueToReturn = [Int]()
    
    let total = matrix[0].count * matrix.count
    
    var left = 0
    var right = matrix[0].count-1
    var top = 0
    var bottom = matrix.count-1
    
    while valueToReturn.count < total{
        // go right
        for column in stride(from: left, through: right, by: 1){
            valueToReturn.append(matrix[top][column])
        }
        // go down
        for row in stride(from: top+1, through: bottom, by: 1){
            valueToReturn.append(matrix[row][right])
        }
        // go left
        for column in stride(from: right-1, through: left, by: -1){
            valueToReturn.append(matrix[bottom][column])
            
        }
        // go up
        for row in stride(from: bottom-1, through: top+1, by: -1){
            valueToReturn.append(matrix[row][left])
        }
        
        left+=1
        right-=1
        top+=1
        bottom-=1
        
    }
    
    return valueToReturn
}






let matrix = [
    [1,2,3],
    [4,5,6],
    [7,8,9]
]
let spiderOrder = getSpiralOrder(matrix: matrix)
