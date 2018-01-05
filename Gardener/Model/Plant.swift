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

        static let values = [PlantType.annual, .biennial, .perennial, .grass, .climber, .subshrub, .bush, .tree]
        
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
    
    func enumTypeNumber() -> Int{
        var number: Int
        switch plantType {
        case PlantType.annual:
            number = 0
        case PlantType.biennial:
            number = 1
        case PlantType.perennial:
            number = 2
        case PlantType.grass:
            number = 3
        case PlantType.climber:
            number = 4
        case PlantType.subshrub:
            number = 5
        case PlantType.bush:
            number = 6
        case PlantType.tree:
            number = 7
        }
        return number
    }

}
