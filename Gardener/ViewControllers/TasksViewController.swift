import UIKit
import BEMCheckBox

class TasksViewController: UIViewController {
    
    var garden: Garden!
    
    @IBOutlet weak var tasksTableView: UITableView!

    override func viewDidLoad() {
        title = garden.ownerName
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
        return garden.plantTasksByTaskType(for: type).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskCell
        let type = Task.TaskType.values[indexPath.section]
        cell.task = garden.plantTasksByTaskType(for: type)[indexPath.item]
        return cell
    }
}

