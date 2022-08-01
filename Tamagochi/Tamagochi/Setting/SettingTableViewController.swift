import UIKit

class SettingTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "설정"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(backButtonClicked))
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        self.view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    @objc
    func backButtonClicked(){
        self.navigationController?.popViewController(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.reuseIdentifier, for: indexPath) as? SettingTableViewCell
        cell?.configureCell(indexPath: indexPath.row)
        cell?.backgroundColor =  UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        return cell ?? tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.reuseIdentifier)!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 12
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let sb = UIStoryboard(name: "ChangeName", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: ChangeNameViewController.reuseIdentifier) as! ChangeNameViewController
            self.navigationController?.pushViewController(vc, animated: true)
            
        } else if indexPath.row == 1 {
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            let sceneDelegate = windowScene?.delegate as? SceneDelegate
            let sb = UIStoryboard(name: "Intro", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: IntroCollectionViewController.reuseIdentifier) as! IntroCollectionViewController
            let nav = UINavigationController(rootViewController: vc)
            sceneDelegate?.window?.rootViewController = nav
            sceneDelegate?.window?.makeKeyAndVisible()
            IntroCollectionViewController.navigationName = "변경"
            
        } else if indexPath.row == 2 {
            for key in UserDefaults.standard.dictionaryRepresentation().keys{
                UserDefaults.standard.removeObject(forKey: key.description)
            }
            
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            let sceneDelegate = windowScene?.delegate as? SceneDelegate
            let sb = UIStoryboard(name: "Intro", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: IntroCollectionViewController.reuseIdentifier) as! IntroCollectionViewController
            let nav = UINavigationController(rootViewController: vc)
            sceneDelegate?.window?.rootViewController = nav
            sceneDelegate?.window?.makeKeyAndVisible()
            IntroCollectionViewController.navigationName = "시작"
        }
    }
}
