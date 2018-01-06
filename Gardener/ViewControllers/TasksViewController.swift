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
        if(!history){
            return Task.TaskType.values.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let type = Task.TaskType.values[section]
        if(!history){
            return garden.currentPlantTasksByType(for: type).count
        }
        return garden.plantTasksByType(for: Task.TaskType.done).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskCell
        if (!history){
            let type = Task.TaskType.values[indexPath.section]
            cell.task = garden.currentPlantTasksByType(for: type)[indexPath.row]
        } else {
            cell.task = garden.plantTasksByType(for: Task.TaskType.done)[indexPath.row]
        }
        return cell
    }
}

