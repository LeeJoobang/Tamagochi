import UIKit

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

    var tamaData: Tamagochi?
    var levelCount = 0
    var riceCount = 0
    var waterCount = 0
    var currentStatus = ""
    
    //MARK: 뷰 컨트롤로의 생명주기
    
    ///시작화면으로 돌아가는 메서드
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if TamagochiInfo.userName == "" {
            self.navigationItem.title = "고래밥의 다마고치"
        } else {
            self.navigationItem.title = "\(TamagochiInfo.userName)의 다마고치"
        }
        
    
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle.fill"), style: .plain, target: self, action: #selector(settingInformation))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        layout(data: tamaData!)
    }
    
    @objc
    func settingInformation(_ sender: UIButton){
        let sb = UIStoryboard(name: "Setting", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SettingTableViewController") as! SettingTableViewController
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true)
    }
    
    //MARK: 레이아웃
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
    
    //MARK: 카운트 메서드
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
        let calculateTmp = (riceCount / 5) + (waterCount / 2)
        if calculateTmp >= 10 {
            levelCount = 10
        } else {
            levelCount = calculateTmp
        }
        return levelCount
    }
    
    func changeImage(level: Int) {
        guard let tamaData = tamaData else {
            return
        }
        let startNumber = tamaData.image.prefix(1)
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
