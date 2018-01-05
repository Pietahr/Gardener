
import UIKit

class MyPlantsViewController: UIViewController {
    
    //var garden: Garden!
    var plants: [Plant]!
    
    @IBOutlet weak var plantsCollectionView: UICollectionView!

    override func viewDidLoad() {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch  segue.identifier {
        case "showTasks"?:
            break
        case "allPlants"?:
            let plantsViewController = segue.destination as! MyPlantsViewController
            plantsViewController.plants = MyPlantsViewController.getPlants()
            plantsViewController.navigationItem.rightBarButtonItem = nil
        default:
            fatalError("Unknown segue")
        }
    }
    
    class func getPlants() -> [Plant] {
        let allPlants = [
            Plant(name: "test",officialName: "offTest",evergreen: true, description: "",type: Plant.PlantType.annual,imageName: "lavender"),
            Plant(name: "test1",officialName: "offTest",evergreen: true, description: "",type: Plant.PlantType.annual,imageName: "lavender"),
            Plant(name: "test2",officialName: "offTest",evergreen: true, description: "",type: Plant.PlantType.annual,imageName: "lavender"),
            Plant(name: "test3",officialName: "offTest",evergreen: true, description: "",type: Plant.PlantType.annual,imageName: "lavender"),
            Plant(name: "test4",officialName: "offTest",evergreen: true, description: "",type: Plant.PlantType.annual,imageName: "lavender"),
            Plant(name: "test5",officialName: "offTest",evergreen: true, description: "",type: Plant.PlantType.annual,imageName: "lavender")
            ]
        return allPlants
    }
}

extension MyPlantsViewController: UICollectionViewDelegate {
    
}

extension MyPlantsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Plant.PlantType.values.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let type = Plant.PlantType.values[section]
        //return garden.numberOfPlants(for: type)
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

