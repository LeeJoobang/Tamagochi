import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var tamaImage: UIImageView!
    @IBOutlet weak var tamaNameLabel: UILabel!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var tamaInfoLabel: UILabel!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    var detailTamaData: Tamagochi?
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
        
        tamaImage.image = UIImage(named: detailTamaData?.image ?? "오류")
        
        tamaNameLabel.text = detailTamaData?.name
        tamaNameLabel.font = .boldSystemFont(ofSize: 13)
        tamaNameLabel.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        
        lineView.layer.borderWidth = 1
        lineView.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        
        tamaInfoLabel.text = detailTamaData?.information
        tamaInfoLabel.font = .boldSystemFont(ofSize: 13)
        tamaInfoLabel.textAlignment = .center
        tamaInfoLabel.numberOfLines = 0
        
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.setTitleColor(UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1), for: .normal)
        startButton.setTitle("시작하기", for: .normal)
        startButton.setTitleColor(UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1), for: .normal)
        
        let detail = DetailViewController()
        let main = MainViewController()
        print(detail.detailTamaData)
        main.MainTamaData = detail.detailTamaData
    }
    
    @IBAction func cancelBackButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func startMainButton(_ sender: UIButton) {
        dismissCallBack?()
//        print(detailTamaData)
//        let mainSb = UIStoryboard(name: "Main", bundle: nil)
//        guard let mainVc = mainSb.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else { return }
//        mainVc.MainTamaData = detailTamaData
//        mainVc.currentStatus = "hi"
//        
    }
}

