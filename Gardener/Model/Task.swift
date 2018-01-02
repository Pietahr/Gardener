import Foundation

class Task {
    
    enum TaskType: String {
        
        case prune = "Prune"
        case done = "Done"
        
        static let values = [TaskType.prune, .done]
    }
    
    var months: [Int]
    var description: String
    var type: TaskType
    
    init(description: String,months: [Int], type: TaskType){
        self.months = months
        self.description = description
        self.type = type
    }
}
