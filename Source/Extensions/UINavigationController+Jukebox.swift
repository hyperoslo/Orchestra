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
      MethodSwizzler.swizzleMethod("popViewControllerAnimated:", cls: self)
      MethodSwizzler.swizzleMethod("popToViewController:animated", cls: self)
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

  func jukebox_popViewControllerAnimated(animated: Bool) {
    jukebox_popViewControllerAnimated(animated)

    guard animated && Jukebox.autoPlay else { return }

    do {
      try Jukebox.player.play(.Back)
    } catch {
      print(error)
    }
  }

  func jukebox_popToViewController(viewController: UIViewController, animated: Bool) -> [UIViewController]? {
    if animated && Jukebox.autoPlay {
      do {
        try Jukebox.player.play(.Back)
      } catch {
        print(error)
      }
    }

    return jukebox_popToViewController(viewController, animated: animated)
  }
}
