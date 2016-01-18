import UIKit

class MainController: UITabBarController {

  lazy var projectListController: UIViewController = ProjectListController()
  lazy var teamController: UIViewController = TeamController()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupTabBar()
  }

  func setupTabBar() {
    tabBar.translucent = true

    viewControllers = [
      projectListController,
      teamController
    ]

    selectedIndex = 0
  }
}
