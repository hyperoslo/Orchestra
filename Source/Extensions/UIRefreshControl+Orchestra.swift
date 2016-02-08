import UIKit
import Sugar

extension UIRefreshControl {

  // MARK: - Method Swizzling

  public override class func initialize() {
    struct Static {
      static var token: dispatch_once_t = 0
    }

    if self !== UIRefreshControl.self { return }

    dispatch_once(&Static.token) {
      Swizzler.swizzle("init", cls: self, prefix: "orchestra")
      Swizzler.swizzle("initWithFrame:", cls: self, prefix: "orchestra")
      Swizzler.swizzle("initWithCoder:", cls: self, prefix: "orchestra")
      Swizzler.swizzle("beginRefreshing", cls: self, prefix: "orchestra")
      Swizzler.swizzle("endRefreshing", cls: self, prefix: "orchestra")
    }
  }

  func orchestra_init() -> UIRefreshControl {
    let instance = orchestra_init()
    instance.addTarget(instance, action: "playSound",
      forControlEvents: .ValueChanged)

    return instance
  }

  func orchestra_init(frame frame: CGRect) -> UIRefreshControl {
    let instance = orchestra_init(frame: frame)
    instance.addTarget(instance, action: "playSound",
      forControlEvents: .ValueChanged)

    return instance
  }

  func orchestra_init(coder aDecoder: NSCoder) -> UIRefreshControl {
    let instance = orchestra_init(coder: aDecoder)
    instance.addTarget(instance, action: "playSound",
      forControlEvents: .ValueChanged)

    return instance
  }

  func orchestra_beginRefreshing() {
    orchestra_beginRefreshing()

    Kapellmeister.engine.autoPlay(.RefreshBegin)
  }

  func orchestra_endRefreshing() {
    orchestra_endRefreshing()

    Kapellmeister.engine.autoPlay(.RefreshEnd)
  }

  // MARK: - Actions

  func playSound() {
    Kapellmeister.engine.autoPlay(.RefreshBegin)
  }
}
