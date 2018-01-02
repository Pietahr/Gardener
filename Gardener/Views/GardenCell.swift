import UIKit

class GardenCell: UITableViewCell {
    
    @IBOutlet weak var addrLabel: UILabel!
    
    var garden: Garden! {
        //called after the property of the object has changed
        didSet {
            addrLabel.text = garden.location
        }
    }
}

