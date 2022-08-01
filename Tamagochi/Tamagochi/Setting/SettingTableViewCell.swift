import UIKit

class SettingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var settingImageView: UIImageView!
    @IBOutlet weak var settingLabel: UILabel!
    @IBOutlet weak var myNameLabel: UILabel!

    override class func awakeFromNib() {
    }
    
    func configureCell(indexPath: Int){

        if indexPath == 0 {
            settingImageView.image = UIImage(systemName: "pencil")
            settingImageView.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
            
            settingLabel.text = "내 이름 설정하기"
            settingLabel.font = .boldSystemFont(ofSize: 13)
        
            guard let userName = UserDefaults.standard.string(forKey: "UserName") else { return }
            
            if userName == "" {
                myNameLabel.text = "고래밥"
            } else {
                myNameLabel.text = userName
            }
            myNameLabel.font = .boldSystemFont(ofSize: 13)
            
        } else if indexPath == 1 {
            myNameLabel.text = ""
            settingImageView.image = UIImage(systemName: "moon.fill")
            settingImageView.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)

            settingLabel.text = "다마고치 변경하기"
            settingLabel.font = .boldSystemFont(ofSize: 13)
        } else if indexPath == 2 {
            myNameLabel.text = ""
            settingImageView.image = UIImage(systemName: "arrow.clockwise")
            settingImageView.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
            UserDefaults.standard.set(false, forKey: "First")
            settingLabel.text = "데이터 초기화"
            settingLabel.font = .boldSystemFont(ofSize: 13)
        }
    }    
}
