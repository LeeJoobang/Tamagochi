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
            
        
            if TamagochiInfo.userName == "" {
                myNameLabel.text = "고래밥"
            } else {
                myNameLabel.text = TamagochiInfo.userName
            }
            
            myNameLabel.font = .boldSystemFont(ofSize: 13)
        } else if indexPath == 1 {
            settingImageView.image = UIImage(systemName: "moon.fill")
            settingImageView.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)

            settingLabel.text = "다마고치 변경하기"
            settingLabel.font = .boldSystemFont(ofSize: 13)
        } else if indexPath == 2 {
            settingImageView.image = UIImage(systemName: "arrow.clockwise")
            settingImageView.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
    
            settingLabel.text = "데이터 초기화"
            settingLabel.font = .boldSystemFont(ofSize: 13)
        }
    }    
}
