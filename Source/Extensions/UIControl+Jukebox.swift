import UIKit

extension UIButton {

  // MARK: - Method Swizzling

  public override class func initialize() {
    struct Static {
      static var token: dispatch_once_t = 0
    }

    if self !== UIButton.self { return }

    dispatch_once(&Static.token) {
      MethodSwizzler.swizzleMethod("initWithFrame:", cls: self)
      MethodSwizzler.swizzleMethod("initWithCoder:", cls: self)
    }
  }

  func jukebox_init(frame frame: CGRect) -> UIButton {
    let instance = jukebox_init(frame: frame)
    instance.addTarget(instance, action: "playSound",
      forControlEvents: .TouchUpInside)

    return instance
  }

  func jukebox_init(coder aDecoder: NSCoder) -> UIButton {
    let instance = jukebox_init(coder: aDecoder)
    instance.addTarget(instance, action: "playSound",
      forControlEvents: .TouchUpInside)

    return instance
  }

  func playSound() {
    Jukebox.autoPlay(.Button)
  }
}
