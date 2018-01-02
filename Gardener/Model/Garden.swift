import Foundation

class Garden {
    
    var ownerName: String
    var location: String
    var plants: [Plant] = []
    
    init(ownerName: String, location: String) {
        self.ownerName = ownerName
        self.location = location
    }
}


