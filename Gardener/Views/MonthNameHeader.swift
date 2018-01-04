import UIKit

class MonthNameHeader: UICollectionReusableView {
    
    @IBOutlet weak var monthNameLabel: UILabel!
    
    var monthNumber: Plant.PlantType! {
        didSet {
            monthNameLabel.text = monthNumber.rawValue
        }
    }
}
