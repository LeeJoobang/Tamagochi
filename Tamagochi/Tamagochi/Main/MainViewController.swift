import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var bubbleLabel: UILabel!
    @IBOutlet weak var bubbleImageView: UIImageView!
    @IBOutlet weak var tamaImageView: UIImageView!
    
    var tamaData: Tamagochi?

    override func viewDidLoad() {
        super.viewDidLoad()
        layout(data: tamaData!)
    }
        
    func layout(data: Tamagochi){
        view.backgroundColor = .white
        self.navigationItem.title = "주방의 다마고치"
        bubbleImageView.image = UIImage(named: "bubble")
        bubbleLabel.text = TamagochiInfo.statusMessage.randomElement()
        bubbleLabel.font = .boldSystemFont(ofSize: 13)
        bubbleLabel.numberOfLines = 0
        
        tamaImageView.image = UIImage(named: data.image)
    }
    
    
}
