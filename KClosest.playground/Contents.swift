import UIKit
import CoreLocation

struct User{
    let userId:Int
    let location:CLLocation
}

class Solution {
    func closestUser(_ users: [User], _ closest: Int,_ region:CLLocation)->[User] {
        if closest > users.count{
            return users
        }
        
        let sortedUser =  users.sorted { itemA, itemB in
            region.distance(from: itemA.location) > region.distance(from: itemB.location)
        }
        return Array(sortedUser[..<closest])
    }
}
var users:[User] = [User]()
let locations:[Int:[Double:Double]] = [
    0:[43.946490:-70.530860],
    1:[37.660560:-122.428540],
    2:[37.690320:-122.463120],
    3:[37.648460:-122.488290],
    4:[37.847220:-122.480540],
    5:[37.805730:-122.438840],
    6:[34.206740:-118.158240],
    7:[37.693170:-122.467000]
]
for (key, value) in locations{
    users.append(User(userId: key, location: CLLocation(latitude: value.keys.first!, longitude: value.values.first!)))
}
let solution = Solution()
// # Las Vegas = 36.114647 -115.172813
solution.closestUser(users, 2, CLLocation(latitude: 36.114647, longitude: -115.172813))

