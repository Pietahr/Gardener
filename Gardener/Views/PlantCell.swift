
import UIKit

class PlantCell: UICollectionViewCell{
    
    @IBOutlet weak var plantImageView: UIImageView!
    @IBOutlet weak var plantNameLabel: UILabel!
    
    var plant: Plant! {
        didSet {
            plantImageView.image = UIImage(named: plant.imageName!)
            plantNameLabel.text = plant.name
        }
    }
    
}

