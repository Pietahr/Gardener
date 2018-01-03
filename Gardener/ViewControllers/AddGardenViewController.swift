import UIKit
import MapKit
import CoreLocation

class AddGardenViewController: UITableViewController  {


    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var ownerNameTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var mapView: MKMapView!
    
    var garden: Garden?
    
    override func viewDidLoad() {
        if let garden = garden {
            title = garden.ownerName
            ownerNameTextField.text = garden.ownerName
            locationTextField.text = garden.location
            saveButton.isEnabled = true
        }
    }
    
    @IBAction func save() {
        if garden != nil {
            performSegue(withIdentifier: "didEditGarden", sender: self)
        } else {
            performSegue(withIdentifier: "didAddGarden", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "didAddGarden"?:
            garden = Garden(ownerName: ownerNameTextField.text!, location: locationTextField.text!)
        case "didEditGarden"?:
            garden!.ownerName = ownerNameTextField.text!
            garden!.location = locationTextField.text!
        default:
            fatalError("Unknown segue")
        }
    }
}
