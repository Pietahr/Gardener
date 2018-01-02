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

        static let values = [PlantType.annual, .biennial, .perennial, .grass, .climber, .bush, .subshrub, .tree]
    }
    
    var name: String
    var officialName: String
    var description: String
    var evergreen: Bool
    var plantAge: Int = 0
    var tasks: [Task] = []
    
    init(name: String, officialName: String, evergreen: Bool, description: String, type: PlantType?){
        self.name = name
        self.officialName = officialName
        self.evergreen = evergreen
        self.description = description
    }
    
    
}
