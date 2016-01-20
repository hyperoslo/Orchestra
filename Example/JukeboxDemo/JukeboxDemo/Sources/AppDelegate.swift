import UIKit
import Hue
import Jukebox

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  lazy var navigationController: UINavigationController = { [unowned self] in
    let controller = UINavigationController(rootViewController: self.viewController)
    return controller
    }()

  lazy var viewController: WelcomeController = {
    let controller = WelcomeController()
    return controller
    }()

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    Jukebox.autoPlay = true

    window = UIWindow(frame: UIScreen.mainScreen().bounds)
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()

    UINavigationBar.appearance().tintColor = UIColor.hex("F57D2D")

    return true
  }
}
