import UIKit

extension UINavigationController {

  // MARK: - Method Swizzling

  public override class func initialize() {
    struct Static {
      static var token: dispatch_once_t = 0
    }

    if self !== UINavigationController.self { return }

    dispatch_once(&Static.token) {
      MethodSwizzler.swizzleMethod("pushViewController:animated:", cls: self)
    }
  }

  func jukebox_pushViewController(viewController: UIViewController, animated: Bool) {
    jukebox_pushViewController(viewController, animated: animated)

    guard animated && Jukebox.autoPlay else { return }

    do {
      try Jukebox.player.play(.Forward)
    } catch {
      print(error)
    }
  }
}
