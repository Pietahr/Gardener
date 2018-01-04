import Foundation

class Plant {
    
    enum PlantType: String {
        
        case annual = "Annual"
        case biennial = "Biennial"
        case perennial = "Perennial"
        case grass = "Grass"
        case climber = "Climber"
        case bush = "Bush"
        case subshrub = "Subshrub"
        case tree = "Tree"

        static let values = [PlantType.subshrub, .tree, .annual, .biennial, .perennial, .grass, .climber, .bush]
        
    }
    
    var name: String
    var officialName: String
    var description: String
    var evergreen: Bool
    var plantAge: Int = 0
    var tasks: [Task] = []
    var imageName: String?
    var plantType: PlantType
    
    init(name: String, officialName: String, evergreen: Bool, description: String, type: PlantType){
        self.name = name
        self.officialName = officialName
        self.evergreen = evergreen
        self.description = description
        self.plantType = type
    }
    
    init(name: String, officialName: String, evergreen: Bool, description: String, type: PlantType, imageName: String){
        self.name = name
        self.officialName = officialName
        self.evergreen = evergreen
        self.description = description
        self.plantType = type
        self.imageName = imageName
    }
    
    func tasks(for type: Task.TaskType) -> [Task]{
        return tasks.filter { $0.type == type }
    }

}
