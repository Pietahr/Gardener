import UIKit
import BEMCheckBox

class TasksViewController: UIViewController {
    
    var garden: Garden!
    var history: Bool!
    
    @IBOutlet weak var tasksTableView: UITableView!
    
    override func viewDidLoad() {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tasksTableView.reloadData()
    }
}

extension TasksViewController: UITableViewDelegate {
    
}

extension TasksViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return Task.TaskType.values.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let type = Task.TaskType.values[section]
        if(!history){
            return garden.currentPlantTasksByType(for: type).count
        }
        return garden.plantTasksDoneByType(for: type).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskCell
        let type = Task.TaskType.values[indexPath.section]
        if (!history){
            cell.task = garden.currentPlantTasksByType(for: type)[indexPath.row]
        } else {
            cell.task = garden.plantTasksDoneByType(for: type)[indexPath.row]
        }
        return cell
    }
}

