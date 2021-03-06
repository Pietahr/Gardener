import Foundation
import MapKit

class Garden {
    
    var ownerName: String
    var location: String
    var plants: [Plant] = []
    
    var lat: CLLocationDegrees!
    var long: CLLocationDegrees!
    
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
        return tasks(done: false).filter { $0.type == type }
    }
    
    func plantTasksDoneByType(for type: Task.TaskType) -> [Task] {
        return tasks(done: true).filter { $0.type == type }
    }
 
    func tasks(done: Bool) -> [Task] {
        var tasks: [Task] = []
        
        for plant in plants {
            for task in plant.tasks{
                if task.done == done {
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
    
    func tasksForMonth(for monthNr: Int, done: Bool) -> [Task]{
        
        var newTasks: [Task] = []
    
        for task in tasks(done: done){
                if monthNr == task.monthForTask(){
                    newTasks.append(task)
                }
        }
        return newTasks
    }
}
