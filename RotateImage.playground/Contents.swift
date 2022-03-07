import UIKit

var matrix = [
    [1,2,3],
    [4,5,6],
    [7,8,9]
]

var result = [[7,4,1],[8,5,2],[9,6,3]]

func rotateMatrix(_ matrix:inout [[Int]]){
    matrix.reverse()
    let n = matrix.count
    for i in 0..<n{
        for j in i..<n{
            let tmp = matrix[i][j]
            matrix[i][j] = matrix[j][i]
            matrix[j][i] = tmp
        }
    }
    
}


print(matrix)
rotateMatrix(&matrix)
print(matrix)
print(result)
