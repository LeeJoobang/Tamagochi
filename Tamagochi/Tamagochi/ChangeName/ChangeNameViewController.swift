import UIKit
import Toast

class ChangeNameViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        self.navigationItem.title = "대장님의 이름 정하기"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(backButtonClicked))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(savedName))
    }
    
    @objc
    func backButtonClicked(){
        self.navigationController?.popViewController(animated: true)
    }
        
    @objc
    func savedName(){
        TamagochiInfo.userName = self.userNameTextField.text ?? ""
        view.makeToast("\(TamagochiInfo.userName)으로 변경되었습니다.", duration: 3.0, position: .bottom)
    }
}
