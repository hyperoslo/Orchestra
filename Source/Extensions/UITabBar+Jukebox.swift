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
      Swizzler.swizzle("setSelectedItem:", cls: self, prefix: "jukebox")
    }
  }

  func jukebox_setSelectedItem(tabBarItem: UITabBarItem?) {
    let selected = tabBarItem == selectedItem

    jukebox_setSelectedItem(tabBarItem)

    if selected {
      Jukebox.engine.autoPlay(Sound.TabBar)
    }
  }
}

