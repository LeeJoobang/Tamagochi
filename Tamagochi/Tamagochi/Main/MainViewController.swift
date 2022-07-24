import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var bubbleLabel: UILabel!
    @IBOutlet weak var bubbleImageView: UIImageView!
    @IBOutlet weak var tamaImageView: UIImageView!
    @IBOutlet weak var tamaNameLabel: UILabel!
    @IBOutlet weak var tamaStatusLabel: UILabel!
    @IBOutlet weak var riceTextField: UITextField!
    @IBOutlet weak var waterTextField: UITextField!
    @IBOutlet weak var addRiceButton: UIButton!
    @IBOutlet weak var addWaterButton: UIButton!
    
    var tamaData: Tamagochi?
    var levelCount = 0
    var riceCount = 0
    var waterCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout(data: tamaData!)
    }
    
    func layout(data: Tamagochi){
        print(data)
        view.backgroundColor = .white
        self.navigationItem.title = "주방의 다마고치"
        bubbleImageView.image = UIImage(named: "bubble")
        bubbleLabel.text = TamagochiInfo.statusMessage.randomElement()
        bubbleLabel.font = .boldSystemFont(ofSize: 13)
        bubbleLabel.numberOfLines = 0
        
        tamaImageView.image = UIImage(named: "1-1")
        
        tamaNameLabel.text = data.name
        tamaNameLabel.font = .boldSystemFont(ofSize: 13)
        
        riceTextField.placeholder = "밥주세요"
        riceTextField.textAlignment = .center
        
        waterTextField.placeholder = "물주세요"
        waterTextField.textAlignment = .center
        
        addRiceButton.setTitle("밥주기", for: .normal)
        addWaterButton.setTitle("물주기", for: .normal)
        
        tamaStatusLabel.text = "LV\(levelCount) + 밥알\(riceCount)개 + 물방울\(waterCount)개"
        tamaStatusLabel.font = .boldSystemFont(ofSize: 13)
    }
    
    func count(_ sender: UIButton, textField: UITextField, count: Int) -> Int {
        var count = Int()
        guard let tmp = textField.text else { return 0 }
        if tmp == ""{
            count += 1
            return count
        } else {
            count += Int(tmp) ?? 0
            return count
        }
    }
    
    func calculateLV() -> Int{
        levelCount = (riceCount / 5) + (waterCount / 2)
        return levelCount
    }
    
    func changeImage(level: Int) {
        guard let tamaData = tamaData else {
            return
        }
        let startNumber = tamaData.image.prefix(1)
        print(startNumber)

        
        switch level {
        case 1: tamaImageView.image = UIImage(named: "\(startNumber)-\(1)")
        case 2: tamaImageView.image = UIImage(named: "\(startNumber)-\(2)")
        case 3: tamaImageView.image = UIImage(named: "\(startNumber)-\(3)")
        case 4: tamaImageView.image = UIImage(named: "\(startNumber)-\(4)")
        case 5: tamaImageView.image = UIImage(named: "\(startNumber)-\(5)")
        case 6: tamaImageView.image = UIImage(named: "\(startNumber)-\(6)")
        case 7: tamaImageView.image = UIImage(named: "\(startNumber)-\(7)")
        case 8: tamaImageView.image = UIImage(named: "\(startNumber)-\(8)")
        case 9: tamaImageView.image = UIImage(named: "\(startNumber)-\(9)")
        case 10: tamaImageView.image = UIImage(named: "\(startNumber)-\(9)")
        default: ""
        }
    }
    
    @IBAction func addRiceButtonClicked(_ sender: UIButton) {
        riceCount += count(sender, textField: riceTextField, count: riceCount)
        calculateLV()
        tamaStatusLabel.text = "LV\(levelCount) + 밥알\(riceCount)개 + 물방울\(waterCount)개"
        changeImage(level: levelCount)

        print(riceCount)
    }
    
    @IBAction func addWaterButtonClicked(_ sender: UIButton) {
        waterCount += count(sender, textField: riceTextField, count: riceCount)
        calculateLV()
        tamaStatusLabel.text = "LV\(levelCount) + 밥알\(riceCount)개 + 물방울\(waterCount)개"
        print(waterCount)
    }
    
    
    
   
}
