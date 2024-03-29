import UIKit
import Toast

class MainViewController: UIViewController{
    
    @IBOutlet weak var bubbleLabel: UILabel!
    @IBOutlet weak var bubbleImageView: UIImageView!
    @IBOutlet weak var tamaImageView: UIImageView!
    @IBOutlet weak var tamaNameLabel: UILabel!
    @IBOutlet weak var tamaStatusLabel: UILabel!
    @IBOutlet weak var riceTextField: UITextField!
    @IBOutlet weak var waterTextField: UITextField!
    @IBOutlet weak var addRiceButton: UIButton!
    @IBOutlet weak var addWaterButton: UIButton!
    
    static var MainTamaData: Tamagochi?
    
    var levelCount = 0
    var riceCount = 0
    var waterCount = 0
    var currentStatus = ""
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.set(true, forKey: "First")
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationItem.title = "고래밥의 다마고치"
        guard let tmp = UserDefaults.standard.string(forKey: "First") else { return }
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle.fill"), style: .plain, target: self, action: #selector(settingInformation))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        
        if tmp != "1"{
            guard let unwrappTamaData = MainViewController.MainTamaData else {
                return
            }
            layout(data: unwrappTamaData)
        } else {
            layout()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let userName = UserDefaults.standard.string(forKey: "UserName") else { return }
        if userName == "" {
            self.navigationItem.title = "고래밥의 다마고치"
        }else {
            self.navigationItem.title = "\(userName)의 다마고치"
        }
    }
    
    @objc
    func settingInformation(_ sender: UIButton){
        let sb = UIStoryboard(name: "Setting", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: SettingTableViewController.reuseIdentifier) as! SettingTableViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func layout(data: Tamagochi){
        riceTextField.keyboardType = .numberPad
        waterTextField.keyboardType = .numberPad
        view.backgroundColor =  UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
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
        
        tamaStatusLabel.text = currentStatus
        tamaStatusLabel.font = .boldSystemFont(ofSize: 13)
    }
    
    func layout(){
        riceTextField.keyboardType = .numberPad
        waterTextField.keyboardType = .numberPad
        view.backgroundColor =  UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
        bubbleImageView.image = UIImage(named: "bubble")
        bubbleLabel.text = TamagochiInfo.statusMessage.randomElement()
        bubbleLabel.font = .boldSystemFont(ofSize: 13)
        bubbleLabel.numberOfLines = 0
        
        tamaImageView.image = UIImage(named: "1-1")
        
        guard let tamaName = UserDefaults.standard.string(forKey: "TamaName") else { return }
        tamaNameLabel.text = tamaName
        tamaNameLabel.font = .boldSystemFont(ofSize: 13)
        
        riceTextField.placeholder = "밥주세요"
        riceTextField.textAlignment = .center
        
        waterTextField.placeholder = "물주세요"
        waterTextField.textAlignment = .center
        
        addRiceButton.setTitle("밥주기", for: .normal)
        addWaterButton.setTitle("물주기", for: .normal)
        
        tamaStatusLabel.text = "LV1 + 밥알0개 + 물방울0개"
        tamaStatusLabel.font = .boldSystemFont(ofSize: 13)
    }
    
    func count(_ sender: UIButton, textField: UITextField, count: Int) -> Int {
        var count = Int()
        guard let tmpButton = sender.currentTitle else { return 0 }
        guard let tmp = textField.text else { return 0 }
        
        if tmpButton == "밥주기"{
            if tmp == "" {
                count += 1
                return count
            } else {
                if Int(tmp) ?? 0 > 99 {
                    view.makeToast("100개 이상 밥을 줄 수 없습니다", duration: 3.0, position: .bottom)
                    return count
                } else {
                    count += Int(tmp) ?? 0
                    return count
                }
            }
        }
        
        if tmpButton == "물주기"{
            if tmp == "" {
                count += 1
                return count
            } else {
                if Int(tmp) ?? 0 > 49 {
                    view.makeToast("50개 이상 물을 줄 수 없습니다", duration: 3.0, position: .bottom)
                    return count
                } else {
                    count += Int(tmp) ?? 0
                    return count
                }
            }
        }
        return count
    }
    
    func calculateLV() -> Int{
        let calculateTmp = ((riceCount / 5) + (waterCount / 2)) / 10
        
        if calculateTmp >= 0 && calculateTmp < 2 {
            levelCount = 1
        } else if calculateTmp >= 10 {
            levelCount = 10
        } else {
            levelCount = calculateTmp
        }
        return levelCount
    }
    
    func changeImage(level: Int) {
        guard let tamaImage = UserDefaults.standard.string(forKey: "TamaImage") else { return }
        let startNumber = tamaImage.prefix(1)
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
        default:
            return
        }
    }
    
    @IBAction func addRiceButtonClicked(_ sender: UIButton) {
        riceCount += count(sender, textField: riceTextField, count: riceCount)
        levelCount = calculateLV()
        currentStatus = savedData()
        
        bubbleLabel.text = TamagochiInfo.statusMessage.randomElement()
        tamaStatusLabel.text = currentStatus
        changeImage(level: levelCount)
    }
    
    @IBAction func addWaterButtonClicked(_ sender: UIButton) {
        waterCount += count(sender, textField: waterTextField, count: waterCount)
        levelCount = calculateLV()
        currentStatus = savedData()
        
        bubbleLabel.text = TamagochiInfo.statusMessage.randomElement()
        tamaStatusLabel.text = currentStatus
        changeImage(level: levelCount)
    }
    
    func savedData() -> String{
        UserDefaults.standard.set(levelCount, forKey: "LevelCount")
        UserDefaults.standard.set(riceCount, forKey: "RiceCount")
        UserDefaults.standard.set(waterCount, forKey: "WaterCount")
        return "LV\(levelCount) + 밥알\(riceCount)개 + 물방울\(waterCount)개"
    }
}
