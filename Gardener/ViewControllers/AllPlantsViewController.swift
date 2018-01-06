
import UIKit

class AllPlantsViewController: UIViewController {
    
    var plants: [Plant]!
    
    @IBOutlet weak var allPlantsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        plants = getPlants()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch  segue.identifier {
        case "plantDetail"?:
            //let plantDetailController = (segue.destination as! UINavigationController).viewControllers[0] as! PlantDetailController
            let plantDetailController = segue.destination as! PlantDetailController
            let indexPath = allPlantsCollectionView!.indexPathsForSelectedItems!.first!
            let sectionNumberForPlantType =  Plant.PlantType.values[indexPath.section]
            plantDetailController.plant = plants.filter{$0.plantType == sectionNumberForPlantType}[indexPath.item]
        default:
            fatalError("Unknown segue")
        }
    }
    
    
    func getPlants() -> [Plant] {
        let task = Task(description: "new Prune Task", months: [1], type: Task.TaskType.prune)
        let task2 = Task(description: "new Done Task", months: [1], type: Task.TaskType.done)
        
        let allPlants = [
            Plant(name: "test",officialName: "offTest",evergreen: true, description: "",type: Plant.PlantType.annual,imageName: "lavender"),
            Plant(name: "test1",officialName: "offTest",evergreen: true, description: "",type: Plant.PlantType.annual,imageName: "lavender"),
            Plant(name: "test2",officialName: "offTest",evergreen: true, description: "",type: Plant.PlantType.annual,imageName: "lavender"),
            Plant(name: "test3",officialName: "offTest",evergreen: true, description: "",type: Plant.PlantType.bush,imageName: "lavender"),
            Plant(name: "test4",officialName: "offTest",evergreen: true, description: "",type: Plant.PlantType.climber,imageName: "lavender"),
            Plant(name: "test5",officialName: "offTest",evergreen: true, description: "",type: Plant.PlantType.tree,imageName: "lavender")
        ]
        
        allPlants[0].tasks.append(task)
        allPlants[0].tasks.append(task2)
        return allPlants
    }

}

extension AllPlantsViewController: UICollectionViewDelegate {
    
}

extension AllPlantsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Plant.PlantType.values.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let type = Plant.PlantType.values[section]
        return plants.filter{$0.plantType == type}.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "plantCell", for: indexPath) as! PlantCell
        let type = Plant.PlantType.values[indexPath.section]
        //cell.plant = garden.plants(for: type)[indexPath.item]
        cell.plant = plants.filter{$0.plantType == type}[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "monthNameHeader", for: indexPath) as! MonthNameHeader
        header.monthNumber = Plant.PlantType.values[indexPath.section]
        return header
    }
}


