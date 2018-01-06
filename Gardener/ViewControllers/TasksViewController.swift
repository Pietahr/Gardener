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
        //number of months
        return 12
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return garden.tasksForMonth(for: section+1, done: history).count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .long
        return "\(dateformatter.monthSymbols[section])"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskCell
        cell.task = garden.tasksForMonth(for: indexPath.section+1, done: history)[indexPath.row]
        return cell
    }
}

