import Foundation

class Task {
    
    enum TaskType: String {
        
        case prune = "Prune"
        case winterCover = "Cover for winter"
        
        static let values = [TaskType.prune, .winterCover]
    }
    
    var done: Bool = false
    var months: [Int]
    var description: String
    var type: TaskType
    
    init(description: String,months: [Int], type: TaskType){
        self.months = months
        self.description = description
        self.type = type
    }
}
