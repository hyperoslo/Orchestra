import UIKit
import Cartography

class ViewController: UIViewController {

  lazy var button: UIButton = { [unowned self] in
    let button = UIButton(type: .System)
    button.backgroundColor = self.view.tintColor
    button.layer.cornerRadius = 20
    button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
    button.titleLabel?.font = UIFont.systemFontOfSize(18)
    button.setTitle(NSLocalizedString("Enter", comment: "").uppercaseString,
      forState: .Normal)

    return button
    }()

  // MARK: - View Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    title = "Jukebox"
    view.backgroundColor = UIColor.whiteColor()

    view.addSubview(button)
    setupConstrains()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  // MARK: - Constrains

  func setupConstrains() {
    constrain(button) { button in
      button.center == button.superview!.center
      button.width == 200
      button.height == 50
    }
  }
}

