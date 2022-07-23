import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var tamaImage: UIImageView!
    @IBOutlet weak var tamaName: UILabel!
    
    var tamaData: Tamagochi?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        backgroundView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        backgroundView.layer.cornerRadius = 5
        
        
        tamaName.text = tamaData?.name
        tamaName.font = .boldSystemFont(ofSize: 13)
        tamaImage.image = UIImage(named: tamaData?.image ?? "오류")
        
        
    }
    
    
    
}
