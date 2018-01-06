
import UIKit
import BEMCheckBox

class TaskCell: UITableViewCell {

    @IBOutlet weak var plantNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var checkBox: BEMCheckBox!
    
    var task: Task! {
        didSet {
            plantNameLabel.text = task.type.rawValue
            descriptionLabel.text = task.description
            checkBox.on = (task.type == Task.TaskType.done)
        }
    }
    
    @IBAction func toggleTask(_ sender: Any) {
        if(checkBox.on){
            task.type = Task.TaskType.done
            print("task set to done")
        }
    }
    

}
