import UIKit

extension UITabBar {

  // MARK: - Method Swizzling

  public override class func initialize() {
    struct Static {
      static var token: dispatch_once_t = 0
    }

    if self !== UITabBar.self { return }

    dispatch_once(&Static.token) {
      MethodSwizzler.swizzleMethod("setSelectedItem:", cls: self)
    }
  }

  func jukebox_setSelectedItem(tabBarItem: UITabBarItem?) {
    let selected = tabBarItem == selectedItem

    jukebox_setSelectedItem(tabBarItem)

    if selected {
      Jukebox.autoPlay(Sound.TabBar)
    }
  }
}

