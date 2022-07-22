import UIKit

class IntroCollectionViewCell: UICollectionViewCell {
    static let identifier = "IntroCollectionViewCell"
    
    @IBOutlet weak var tamaBackgroundView: UIView!
    @IBOutlet weak var tamaImageView: UIImageView!
    @IBOutlet weak var tamaName: UILabel!
    
    func configureInfo(data: Tamagochi){
        tamaName.text = data.name
        tamaName.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        tamaName.font = .boldSystemFont(ofSize: 11)
        tamaName.adjustsFontSizeToFitWidth = true
        tamaName.textAlignment = .center
        tamaName.layer.borderWidth = 0.5
        tamaName.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
    }
    
}
//extension UILabel {
//    func setMargins(margin: CGFloat = 2){
//        if let textString = self.text {
//            var paragraphStyle = NSMutableParagraphStyle()
//            paragraphStyle.firstLineHeadIndent = margin
//            paragraphStyle.headIndent = margin
//            paragraphStyle.tailIndent = -margin
//            let attributedString = NSMutableAttributedString(string: textString)
//            attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
//            attributedText = attributedString
//        }
//    }
}
