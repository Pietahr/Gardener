
import UIKit

class MyPlantsViewController: UIViewController {
    
    var garden: Garden!
    
    @IBOutlet weak var plantsCollectionView: UICollectionView!

    override func viewDidLoad() {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch  segue.identifier {
        case "allPlants"?:
            break
        case "plantDetail"?:
            //let plantDetailController = (segue.destination as! UINavigationController).viewControllers[0] as! PlantDetailController
            let plantDetailController = segue.destination as! PlantDetailController
            let indexPath = plantsCollectionView!.indexPathsForSelectedItems!.first!
            let sectionNumberForPlantType =  Plant.PlantType.values[indexPath.section]
            plantDetailController.plant = garden.plants(for: sectionNumberForPlantType)[indexPath.item]
            plantDetailController.navigationItem.rightBarButtonItem = nil
        default:
            fatalError("Unknown segue")
        }
    }
    
    @IBAction func unwindFromAddPlant(_ segue: UIStoryboardSegue) {
        switch segue.identifier {
        case "addedPlant"?:
            let plantDetailController = segue.source as! PlantDetailController
            let plant = plantDetailController.plant!
            garden.plants.append(plant)
            
            let sectionNr = plant.enumTypeNumber()
            plantsCollectionView.insertItems(at: [IndexPath(row: garden.numberOfPlants(for: plant.plantType)-1, section: sectionNr)])
        default:
            fatalError("Unkown segue")
        }
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
        return garden.plants(for: type).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "plantCell", for: indexPath) as! PlantCell
        let type = Plant.PlantType.values[indexPath.section]
        //cell.plant = garden.plants(for: type)[indexPath.item]
        cell.plant = garden.plants(for: type)[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "monthNameHeader", for: indexPath) as! MonthNameHeader
        header.monthNumber = Plant.PlantType.values[indexPath.section]
        return header
    }
}

