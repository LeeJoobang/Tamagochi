import UIKit

class SettingTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "설정"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(backButtonClicked))
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        self.view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)

    }
    
    @objc
    func backButtonClicked(){
        self.dismiss(animated: true)
    }

}
