import Foundation

class Task {
    
    enum TaskType: String {
        
        case prune = "Prune"
        case winterCover = "Cover for winter"
        
        static let values = [TaskType.prune, .winterCover]
    }
    
    var done: Bool = false
    var months: [Int]{
        didSet {
            if months.contains(where: {$0 < 1 || $0 > 12 }){
                fatalError("monthNumber must be a value equal or between 1 and 12")
            }
        }
    }
    var description: String
    var type: TaskType
    var plantName: String?
    
    init(description: String,months: [Int], type: TaskType){
        self.months = months
        self.description = description
        self.type = type
    }
    
    func monthForTask() -> Int{
        //current monthnumber
        let date = Date()
        let calendar = Calendar.current
        let currentMonthNr = calendar.component(.month, from: date)
        //let currentMonthNr = 2
        
        //get first month for task in future
        for month in months {
            if month >= currentMonthNr{
                return month
            }
        }
        //all months for task have passed, display in last acceptable month
        return months[months.count-1]
    }
}
