import UIKit
import Toast

class ChangeNameViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    static let identifier = "ChangeNameViewController"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        self.navigationItem.title = "대장님의 이름 정하기"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(backButtonClicked))
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(savedName))
    }
    
    @objc
    func backButtonClicked(){
        self.navigationController?.popViewController(animated: true)
    }
        
    @objc
    func savedName(){
        guard let tmpTextField = self.userNameTextField.text else { return }
        if tmpTextField.count >= 2 && tmpTextField.count <= 6 {
            UserDefaults.standard.set(tmpTextField, forKey: "UserName")
            guard let userName = UserDefaults.standard.string(forKey: "UserName") else { return }
            self.navigationController?.popViewController(animated: true)
        } else {
            view.makeToast("대장 이름 2글자 이상 6글자 이하까지 가능합니다.", duration: 3.0, position: .bottom)
        }
    }
    
    
}
