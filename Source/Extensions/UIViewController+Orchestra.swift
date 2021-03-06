import UIKit
import Sugar

extension UIViewController {

  // MARK: - Method Swizzling

  public override class func initialize() {
    struct Static {
      static var token: dispatch_once_t = 0
    }

    if self !== UIViewController.self { return }

    dispatch_once(&Static.token) {
      Swizzler.swizzle("viewWillAppear:", cls: self, prefix: "orchestra")
      Swizzler.swizzle("viewWillDisappear:", cls: self, prefix: "orchestra")
    }
  }

  func orchestra_viewWillAppear(animated: Bool) {
    orchestra_viewWillAppear(animated)

    let valid = parentViewController == nil || parentViewController is UINavigationController

    guard animated && valid else { return }

    var sound: Sound?

    if isMovingToParentViewController() {
      sound = .Push
    } else if isBeingPresented() {
      sound = .Present
    }

    guard let autoSound = sound else { return }

    Kapellmeister.engine.autoPlay(autoSound)
  }

  func orchestra_viewWillDisappear(animated: Bool) {
    orchestra_viewWillDisappear(animated)

    let valid = parentViewController == nil || parentViewController is UINavigationController

    guard animated && valid else { return }

    var sound: Sound?

    if isMovingFromParentViewController() {
      sound = .Pop
    } else if isBeingDismissed() {
      sound = .Dismiss
    }

    guard let autoSound = sound else { return }

    Kapellmeister.engine.autoPlay(autoSound)
  }
}

