import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupViewControllers()
        makeOpaqueNavBar()
    }
    
    private func setupTabBar() {
        let customTabBar = CustomTabBar()
        setValue(customTabBar, forKey: "tabBar")
        
        // Tab bar görünümünü özelleştir
        tabBar.tintColor = Colors.primary
        tabBar.unselectedItemTintColor = .systemGray2
        
        // Item'lar için görünüm ayarları
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 11, weight: .regular),
            .foregroundColor: UIColor.systemGray2
        ]
        
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 11, weight: .medium),
            .foregroundColor: UIColor.systemBlue
        ]
        
        tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = appearance
        }
    }
    

    private func createNavController(
        for rootViewController: UIViewController,
        image: UIImage?,
        selectedImage: UIImage?,
        title: String?
    ) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.navigationController?.navigationBar.tintColor = .black
        navController.tabBarItem.image = image
        navController.tabBarItem.selectedImage = selectedImage
        navController.navigationItem.title = title
        return navController
    }
    
    private func setupViewControllers() {
        let homeVC = createNavController(
            for: HomeController(),
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill"), title: "Home"
        )
        
        let historyVC = createNavController(
            for: HistoryController(),
            image: UIImage(systemName: "clock.arrow.trianglehead.counterclockwise.rotate.90"),
            selectedImage: UIImage(systemName: "clock.arrow.trianglehead.counterclockwise.rotate.90"), title: "History"
        )
        
        let chatVC = createNavController(
            for: ChatController(),
            image: UIImage(systemName: "ellipsis.message"),
            selectedImage: UIImage(systemName: "ellipsis.message.fill"), title: "Chat"
        )
        
        let profileVC = createNavController(
            for: ProfileController(),
            image: UIImage(systemName: "person"),
            selectedImage: UIImage(systemName: "person.fill"), title: "Profile"
        )
        
        setViewControllers([homeVC, historyVC, chatVC, profileVC], animated: false)
    }
    
    
    
    
    private func makeViewController() -> UIViewController {
        let vc = UIViewController()
        vc.view.backgroundColor = .systemBackground
        return vc
    }
}
