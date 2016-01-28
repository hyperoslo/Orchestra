import UIKit
import Sugar

extension UIButton {

  // MARK: - Method Swizzling

  public override class func initialize() {
    struct Static {
      static var token: dispatch_once_t = 0
    }

    if self !== UIButton.self { return }

    dispatch_once(&Static.token) {
      Swizzler.swizzle("initWithFrame:", cls: self, prefix: "orchestra")
      Swizzler.swizzle("initWithCoder:", cls: self, prefix: "orchestra")
    }
  }

  func orchestra_init(frame frame: CGRect) -> UIButton {
    let instance = orchestra_init(frame: frame)
    instance.addTarget(instance, action: "playSound",
      forControlEvents: .TouchUpInside)

    return instance
  }

  func orchestra_init(coder aDecoder: NSCoder) -> UIButton {
    let instance = orchestra_init(coder: aDecoder)
    instance.addTarget(instance, action: "playSound",
      forControlEvents: .TouchUpInside)

    return instance
  }

  func playSound() {
    Kapellmeister.engine.autoPlay(.Button)
  }
}
