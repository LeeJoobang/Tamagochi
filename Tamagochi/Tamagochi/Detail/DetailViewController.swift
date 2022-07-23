import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        backgroundView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        backgroundView.layer.cornerRadius = 5
    }
}
