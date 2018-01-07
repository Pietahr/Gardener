import UIKit
import MapKit
import CoreLocation

class AddGardenViewController: UITableViewController, UISearchBarDelegate   {


    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var ownerNameTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var mapView: MKMapView!
    
    var garden: Garden?
    
    var startLocation: CLLocation!
    var tempLatitude: CLLocationDegrees!
    var tempLongitude: CLLocationDegrees!
    var currentLocationPoint: MKPointAnnotation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let garden = garden {
            title = garden.ownerName
            ownerNameTextField.text = garden.ownerName
            locationTextField.text = garden.location
            saveButton.isEnabled = true
        }

        if garden?.lat == nil || garden?.long == nil{
            //station gent
            startLocation = CLLocation(latitude: 51.036333, longitude: 3.710926)
        } else {
            //creating startlocation and indicating on map
            startLocation = CLLocation(latitude: (garden?.lat)!, longitude: (garden?.long)!)
            
            let pointer = MKPointAnnotation()
            pointer.title = String(format: "%@at:\n %@", (garden?.ownerName)!, (garden?.location)!)
            pointer.coordinate = startLocation.coordinate
            mapView.addAnnotation(pointer)
        }
        centerMapOnLocation(location: startLocation)
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
            garden!.long = tempLongitude
            garden!.lat = tempLatitude
        case "didEditGarden"?:
            garden!.ownerName = ownerNameTextField.text!
            garden!.location = locationTextField.text!
            garden!.long = tempLongitude
            garden!.lat = tempLatitude
        default:
            fatalError("Unknown segue")
        }
    }
    
    @IBAction func searchLocation(_ sender: Any) {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        //show controller
        present(searchController, animated: true, completion: nil)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        let indicator = UIActivityIndicatorView()
        indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        indicator.hidesWhenStopped = true
        indicator.center = self.view.center
        indicator.startAnimating()
        self.view.addSubview(indicator)
        
        searchBar.resignFirstResponder()
        dismiss(animated: true, completion: nil)
        
        let searchReq = MKLocalSearchRequest()
        searchReq.naturalLanguageQuery = searchBar.text
        let localSearch = MKLocalSearch(request: searchReq)
        
        localSearch.start { (response, error) in
            
            if response == nil
            {
                print(error.debugDescription)
            }
            else
            {
                let annotations = self.mapView.annotations
                self.mapView.removeAnnotations(annotations)
                
                self.tempLatitude = response?.boundingRegion.center.latitude
                self.tempLongitude = response?.boundingRegion.center.longitude
                
                let pointer = MKPointAnnotation()
                pointer.title = searchBar.text
                pointer.coordinate = CLLocationCoordinate2DMake(self.tempLatitude!, self.tempLongitude!)
                self.mapView.addAnnotation(pointer)
                
                self.locationTextField.text = pointer.title

                self.centerMapOnLocation(location: CLLocation(latitude: self.tempLatitude, longitude: self.tempLongitude))
            }
            
            indicator.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
            
        }
    }
    
    //:Source https://www.raywenderlich.com/160517/mapkit-tutorial-getting-started
    let regionRadius: CLLocationDistance = 800
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius, regionRadius)
        self.mapView.setRegion(coordinateRegion, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
