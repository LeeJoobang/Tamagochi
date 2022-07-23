import UIKit

class IntroCollectionViewController: UICollectionViewController {

    var tamagochiList = TamagochiInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "다마고치 선택하기"
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IntroCollectionViewCell.identifier, for: indexPath) as! IntroCollectionViewCell
        
        if indexPath.row <= 2 {
            let data = tamagochiList.tamagochi[indexPath.row]
//            let count = indexPath.row + 1
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
        let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.modalPresentationStyle = .formSheet
        
        // 2. 값전달 - vc 가 가지고 있는 프로퍼티에 데이터 추가

        vc.tamaData = tamagochiList.tamagochi[indexPath.row]
//        vc.movieData = movieData.movie[indexPath.row]
        // 값을 받아와 표시가 가능하게 된다.
        
        self.present(vc, animated: true)
    }
    
}
