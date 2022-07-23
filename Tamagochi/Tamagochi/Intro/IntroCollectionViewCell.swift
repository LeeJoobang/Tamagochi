import UIKit

class IntroCollectionViewCell: UICollectionViewCell {
    static let identifier = "IntroCollectionViewCell"
    
    @IBOutlet weak var tamaBackgroundView: UIView!
    @IBOutlet weak var tamaImageView: UIImageView!
    @IBOutlet weak var tamaName: UILabel!
    
    func configureInfo(data: Tamagochi){
        tamaName.text = data.name
        tamaName.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        tamaName.font = .boldSystemFont(ofSize: 13)
        tamaName.adjustsFontSizeToFitWidth = true
        tamaName.layer.borderWidth = 0.5
        tamaName.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        tamaName.layer.cornerRadius = 5
        tamaImageView.image = UIImage(named: data.image)
    }
}
