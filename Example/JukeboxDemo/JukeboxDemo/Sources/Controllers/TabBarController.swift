import UIKit
import Hue

class MainController: UITabBarController {

  lazy var projectListController: UINavigationController = {
    let controller = ProjectListController()
    let navigationController = UINavigationController(rootViewController: controller)
    controller.tabBarItem.title = "Open Source"
    controller.tabBarItem.image = UIImage(named: "tabProjects")

    return navigationController
  }()

  lazy var teamController: TeamController = {
    let controller = TeamController()
    controller.tabBarItem.title = "Team"
    controller.tabBarItem.image = UIImage(named: "tabTeam")

    return controller
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupTabBar()
  }

  func setupTabBar() {
    tabBar.translucent = true
    tabBar.tintColor = UIColor.hex("F57D2D")

    viewControllers = [
      projectListController,
      teamController
    ]

    selectedIndex = 0
  }
}
