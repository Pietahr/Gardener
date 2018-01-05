import UIKit

class PlantDetailCell: UITableViewCell{
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var task: Task! {
        didSet {
            typeLabel.text = task.type.rawValue
            descriptionLabel.text = task.description
        }
    }
    
}


