import UIKit

extension UIViewController {

  // MARK: - Method Swizzling

  public override class func initialize() {
    struct Static {
      static var token: dispatch_once_t = 0
    }

    if self !== UIViewController.self { return }

    dispatch_once(&Static.token) {
      MethodSwizzler.swizzleMethod("viewWillAppear:", cls: self)
      MethodSwizzler.swizzleMethod("viewWillDisappear:", cls: self)
    }
  }

  func jukebox_viewWillAppear(animated: Bool) {
    jukebox_viewWillAppear(animated)

    guard animated else { return }

    var sound: Sound?

    if isMovingToParentViewController() {
      sound = .Push
    } else if isBeingPresented() {
      sound = .Present
    }

    guard let autoSound = sound else { return }

    Jukebox.engine.autoPlay(autoSound)
  }

  func jukebox_viewWillDisappear(animated: Bool) {
    jukebox_viewWillDisappear(animated)

    guard animated else { return }

    var sound: Sound?

    if isMovingFromParentViewController() {
      sound = .Pop
    } else if isBeingDismissed() {
      sound = .Dismiss
    }

    guard let autoSound = sound else { return }

    Jukebox.engine.autoPlay(autoSound)
  }
}

