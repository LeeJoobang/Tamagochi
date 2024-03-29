import UIKit

class IntroCollectionViewController: UICollectionViewController {
    
    var tamagochiList = TamagochiInfo()
    static var navigationName = "선택"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "다마고치 \(IntroCollectionViewController.navigationName)하기"
        layout()
    }
    
    func layout(){
        self.collectionView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 8
        let width = UIScreen.main.bounds.width - (spacing * 4)
        
        layout.itemSize = CGSize(width: width / 3, height: (width / 3) * 1.2)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        
        layout.minimumLineSpacing = CGFloat(spacing)
        layout.minimumInteritemSpacing = spacing
        
        collectionView.collectionViewLayout = layout
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IntroCollectionViewCell.reuseIdentifier, for: indexPath) as! IntroCollectionViewCell
        
        if indexPath.row <= 2 {
            let data = tamagochiList.tamagochi[indexPath.row]
            cell.configureInfo(data: data)
        } else {
            cell.tamaImageView.image = UIImage(named: "noImage")
            cell.tamaName.text = "준비중이예요."
            cell.tamaName.font = .boldSystemFont(ofSize: 13)
            cell.tamaName.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
            cell.tamaName.layer.borderWidth = 0.5
            cell.tamaName.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
            cell.tamaName.layer.cornerRadius = 5
            cell.tamaName.adjustsFontSizeToFitWidth = true
            
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Detail", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: DetailViewController.reuseIdentifier) as! DetailViewController
        if indexPath.row < tamagochiList.tamagochi.count {
            DetailViewController.detailTamaData = tamagochiList.tamagochi[indexPath.row]
            vc.modalPresentationStyle = .formSheet
            
            vc.dismissCallBack = { [self] in
                vc.dismiss(animated: true) {}
                let sb = UIStoryboard(name: "Main", bundle: nil)
                guard let vc = sb.instantiateViewController(withIdentifier: MainViewController.reuseIdentifier) as? MainViewController else { return }
                MainViewController.MainTamaData = DetailViewController.detailTamaData
                UserDefaults.standard.set(self.tamagochiList.tamagochi[indexPath.row].image, forKey: "TamaImage")
                vc.currentStatus = "LV\(vc.levelCount) + 밥알\(vc.riceCount)개 + 물방울\(vc.waterCount)개"
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
            self.present(vc, animated: true)
        }
    }
}


