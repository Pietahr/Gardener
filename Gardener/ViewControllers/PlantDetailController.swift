
import UIKit

class PlantDetailController: UIViewController {
    
    var plant: Plant!
    
    @IBOutlet weak var tasksTableView: UITableView!
    @IBOutlet weak var plantImageView: UIImageView!
    @IBOutlet weak var plantNameLabel: UILabel!
    @IBOutlet weak var plantOfficialName: UILabel!
    @IBOutlet weak var plantDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        plantImageView.image = UIImage(named: plant.imageName!)
        plantNameLabel.text = plant.name
        plantOfficialName.text = plant.officialName
        plantDescriptionLabel.text = plant.description
    }
}

extension PlantDetailController: UITableViewDelegate {
    
}

extension PlantDetailController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plant.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "plantDetailCell", for: indexPath) as! PlantDetailCell
        cell.task = plant.tasks[indexPath.row]
        return cell
    }
}
