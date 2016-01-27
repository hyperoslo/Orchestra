import UIKit
import Sugar

extension UITabBar {

  // MARK: - Method Swizzling

  public override class func initialize() {
    struct Static {
      static var token: dispatch_once_t = 0
    }

    if self !== UITabBar.self { return }

    dispatch_once(&Static.token) {
      Swizzler.swizzle("setSelectedItem:", cls: self, prefix: "orchestra")
    }
  }

  func orchestra_setSelectedItem(tabBarItem: UITabBarItem?) {
    let selected = tabBarItem == selectedItem

    orchestra_setSelectedItem(tabBarItem)

    if selected {
      Kapellmeister.engine.autoPlay(Sound.TabBar)
    }
  }
}

