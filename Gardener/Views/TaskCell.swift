
import UIKit
import BEMCheckBox

class TaskCell: UITableViewCell {

    @IBOutlet weak var plantNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var checkBox: BEMCheckBox!
    
    var task: Task! {
        didSet {
            plantNameLabel.text = task.plantName
            typeLabel.text = task.type.rawValue
            typeLabel.backgroundColor = getColorForType()
            typeLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
         //   typeLabel.textAlignment = NSTextAlignment.center
            descriptionLabel.text = task.description
            checkBox.on = (task.done)
        }
    }
    
    private func getColorForType() -> UIColor{
        var color = UIColor.white
        
        switch task.type {
        case Task.TaskType.prune:
            color = UIColor.blue
        case Task.TaskType.winterCover:
            color = UIColor.red
        }
        
        return color
    }
    
    @IBAction func toggleTask(_ sender: Any) {
        if(checkBox.on){
            task.done = true
        } else {
            task.done = false
        }
    }
    

}
