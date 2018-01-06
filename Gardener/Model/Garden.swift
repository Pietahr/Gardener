import Foundation

class Garden {
    
    var ownerName: String
    var location: String
    var plants: [Plant] = []
    
    init(ownerName: String, location: String) {
        self.ownerName = ownerName
        self.location = location
    }
    
    func plantTasksByType(for type: Task.TaskType) -> [Task] {
        var tasks: [Task] = []
        
        for plant in plants {
            for task in plant.tasks(for: type){
                tasks.append(task)
            }
        }
        return tasks
    }
    
    func currentPlantTasksByType(for type: Task.TaskType) -> [Task] {
        return currentTasks().filter { $0.type == type }
    }
    
    
    func currentTasks() -> [Task] {
        var tasks: [Task] = []
        
        for plant in plants {
            for task in plant.tasks{
                if task.type != Task.TaskType.done {
                    tasks.append(task)
                }
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


