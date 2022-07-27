import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
                
        if UserDefaults.standard.bool(forKey: "First") {
            guard let scene = (scene as? UIWindowScene) else { return }
            window = UIWindow(windowScene: scene)
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            let nav = UINavigationController(rootViewController: vc)
            window?.rootViewController = nav
           
        } else {
            guard let scene = (scene as? UIWindowScene) else { return }
            window = UIWindow(windowScene: scene)
            let sb = UIStoryboard(name: "Intro", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "IntroCollectionViewController") as! IntroCollectionViewController
            window?.rootViewController = UINavigationController(rootViewController: vc)
        }
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
    }
    
    
}

