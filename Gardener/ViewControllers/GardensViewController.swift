//
//  GardensViewController.swift
//  Gardener
//

import Foundation
import UIKit

class GardensViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var gardens: [Garden] = []
    var plants: [Plant] = []
    var tasks: [Task] = []
    
    private var indexPathToEdit: IndexPath!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch  segue.identifier {
        case "addGarden"?:
            break
        case "editGarden"?:
            let addGardenViewController = segue.destination as! AddGardenViewController
            addGardenViewController.garden = gardens[indexPathToEdit.row]
        case "showTasks"?:
            let tabController = segue.destination as! UITabBarController
            let tasksViewController = (tabController.viewControllers![0] as! UINavigationController).viewControllers[0] as! TasksViewController
            let tasksViewControllerHistory = (tabController.viewControllers![1] as! UINavigationController).viewControllers[0] as! TasksViewController
            let plantsViewController = (tabController.viewControllers![2] as! UINavigationController).viewControllers[0] as! MyPlantsViewController
            let selection = tableView.indexPathForSelectedRow!
            tasksViewController.garden = gardens[selection.row]
            tasksViewController.history = false
            tasksViewControllerHistory.garden = gardens[selection.row]
            tasksViewControllerHistory.history = true
            plantsViewController.garden = gardens[selection.row]
            tableView.deselectRow(at: selection, animated: true)
        default:
            fatalError("Unknown segue")
        }
    }

    @IBAction func unwindFromAddProject(_ segue: UIStoryboardSegue) {
        switch segue.identifier {
        case "didAddGarden"?:
            let addGardenViewController = segue.source as! AddGardenViewController
            gardens.append(addGardenViewController.garden!)
            tableView.insertRows(at: [IndexPath(row: gardens.count - 1, section: 0)], with: .automatic)
        case "didEditGarden"?:
            tableView.reloadRows(at: [indexPathToEdit], with: .automatic)
        default:
            fatalError("Unkown segue")
        }
    }
    
    override func viewDidLoad() {
        
        generateData()

        plants[0].tasks.append(tasks[0])
        plants[1].tasks.append(tasks[1])
        plants[1].tasks.append(tasks[2])
        plants[2].tasks.append(tasks[3])
        
        
        for i in 0...(plants.count-1){
            gardens[0].plants.append(plants[i])
        }
/*
        gardens[2].plants[0].tasksPerType(for: Task.TaskType.prune).forEach{ task in
            print("\n" + task.type.rawValue)
        }
 */

    }
    
    func generateData(){
        gardens = [
            Garden(ownerName: "Jansens",location: "Gijzegem-Dorp Aalst"),
            Garden(ownerName: "Dedecker",location: "Straat Lochristi"),
            Garden(ownerName: "Appelmans",location: "Straat Brussel")
        ]
        
        plants = [
            Plant(name: "common grape vine", officialName: "Vitis vinifera", evergreen: false,
                  description: "It is a liana growing to 35 yards (32 m) in length, with flaky bark. The leaves are alternate, palmately lobed, 5–20 cm (2.0–7.9 in) long and broad. The fruit is a berry, known as a grape; in the wild species it is 6 mm (0.24 in) diameter and ripens dark purple to blackish with a pale wax bloom; in cultivated plants it is usually much larger, up to 3 cm (1.2 in) long, and can be green, red, or purple (black). The species typically occurs in humid forests and streamsides.",
                  type: Plant.PlantType.climber),
            Plant(name: "apple tree", officialName: "Malus domestica", evergreen: false,
                  description: "The apple is a deciduous tree, generally standing 6 to 15 ft (1.8 to 4.6 m) tall in cultivation and up to 30 ft (9.1 m) in the wild. When cultivated, the size, shape and branch density are determined by rootstock selection and trimming method. The leaves are alternately arranged dark green-colored simple ovals with serrated margins and slightly downy undersides.",
                  type: Plant.PlantType.tree),
            Plant(name: "lavender", officialName: "Lavandula angustifolia", evergreen: true,
                  description: "The genus includes annual or short-lived herbaceous perennial plants, and shrub-like perennials, subshrubs or small shrubs. Leaf shape is diverse across the genus. They are simple in some commonly cultivated species; in other species they are pinnately toothed, or pinnate, sometimes multiple pinnate and dissected. In most species the leaves are covered in fine hairs or indumentum, which normally contain the essential oils.",
                  type: Plant.PlantType.subshrub),
            Plant(name: "apple blorb", officialName: "Malus domestica", evergreen: false,
                  description: "blorb", type: Plant.PlantType.tree),
            Plant(name: "Boom", officialName: "Malus domestica", evergreen: false,
                  description: "blorb", type: Plant.PlantType.tree)
        ]
        plants[0].imageName = "graveVine"
        plants[1].imageName = "appleTree"
        plants[2].imageName = "lavender"
        plants[3].imageName = "appleTree"
        plants[4].imageName = "appleTree"
        
        tasks = [
            Task(description: "Omvang van de kruin met een derde verminderen. Verwijder de gespleten takken die elkaar kruisen, de takken die slecht geplaatst zijn en de waterloten", months: [1,11,12], type: Task.TaskType.prune),
            Task(description: "Ranken snoeien boven de tweede, derde of vierde goedgevormde knop vanaf de basis. Verwijder de twijg die de vorige herfst druiven heeft gedragen door deze vanaf de basis af te knippen.", months: [2,3], type: Task.TaskType.done),
            Task(description: "Beperk de lengte van de ranken tot 40-50 cm: snoei de vruchtbare twijgen op ongeveer twee bladeren na de laatste druif.", months: [5,6,7,8,9], type: Task.TaskType.prune),
            Task(description: "Snij de takken met enkele centimeters af, waarbij u de afgeronde vorm van de stuik respecteert.", months: [3,4], type: Task.TaskType.prune)
        ]
        
    }

}

/**
 Extensions can add new initializers to existing types. This enables you to extend other types to accept your own custom types as initializer parameters, or to provide additional initialization options that were not included as part of the type’s original implementation.
 */
// Source: Tasks on Chamilo
extension GardensViewController: UITableViewDelegate {
    // voor elke rij, welke swipe action moet ik tonen
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let editAction = UIContextualAction(style: .normal ,title: "Edit"){
            (action, view, completionHandler) in
            self.indexPathToEdit = indexPath
            self.performSegue(withIdentifier: "editGarden", sender: self)
            completionHandler(true)
        }
        editAction.backgroundColor = UIColor.orange
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){
            (action,view,competionHandler) in
            self.gardens.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            competionHandler(true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
    }
}

extension GardensViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gardens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gardenCell", for: indexPath) as! GardenCell
        cell.garden = gardens[indexPath.row]
        return cell
    }
}
