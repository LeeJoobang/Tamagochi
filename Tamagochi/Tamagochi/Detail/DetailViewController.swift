import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var tamaImage: UIImageView!
    @IBOutlet weak var tamaNameLabel: UILabel!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var tamaInfoLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    static var detailTamaData: Tamagochi?
    var dismissCallBack: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailViewlayout()
    }
    
    func detailViewlayout(){
        view.backgroundColor = .clear
        backgroundView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        backgroundView.layer.cornerRadius = 5
        backgroundView.layer.borderWidth = 0.5
        backgroundView.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        
        tamaImage.image = UIImage(named: DetailViewController.detailTamaData?.image ?? "오류")
        UserDefaults.standard.set(DetailViewController.detailTamaData?.image ?? "오류", forKey: "TamaImage")

        
        tamaNameLabel.text = DetailViewController.detailTamaData?.name
        UserDefaults.standard.set(DetailViewController.detailTamaData?.name ?? "오류", forKey: "TamaName")

        tamaNameLabel.font = .boldSystemFont(ofSize: 13)
        tamaNameLabel.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        
        lineView.layer.borderWidth = 1
        lineView.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        
        tamaInfoLabel.text = DetailViewController.detailTamaData?.information
        UserDefaults.standard.set(DetailViewController.detailTamaData?.information ?? "오류", forKey: "TamaInformation")

        tamaInfoLabel.textAlignment = .center
        tamaInfoLabel.lineBreakMode = .byWordWrapping
        tamaInfoLabel.numberOfLines = 0
        tamaInfoLabel.font = .boldSystemFont(ofSize: 13)
        tamaInfoLabel.sizeToFit()
        
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.setTitleColor(UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1), for: .normal)
        startButton.setTitle("시작하기", for: .normal)
        startButton.setTitleColor(UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1), for: .normal)
    }
    
    @IBAction func cancelBackButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func startMainButton(_ sender: UIButton) {
        dismissCallBack?()
   
        
    }
}

