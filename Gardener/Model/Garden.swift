import Foundation

class Garden {
    
    var ownerName: String
    var location: String
    var plants: [Plant] = []
    
    init(ownerName: String, location: String) {
        self.ownerName = ownerName
        self.location = location
    }
    
    func plantTasksByTaskType(for type: Task.TaskType) -> [Task] {
        var tasks: [Task] = []
        
        for plant in plants {
            for task in plant.tasks(for: type){
                tasks.append(task)
            }
        }
        return tasks
    }
    
    func numberOfPlants(for type: Plant.PlantType) -> Int {
        return plants(for: type).count
    }
    
    func plants(for type: Plant.PlantType) -> [Plant] {
        return plants.filter{$0.plantType == type}
    }
}


