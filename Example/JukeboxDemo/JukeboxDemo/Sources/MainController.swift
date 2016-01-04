import UIKit
import Cartography

class MainController: UIViewController {

  lazy var button: UIButton = { [unowned self] in
    let button = UIButton(type: .System)
    button.backgroundColor = self.view.tintColor
    button.layer.cornerRadius = 20
    button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
    button.titleLabel?.font = UIFont.systemFontOfSize(18)
    button.setTitle(NSLocalizedString("Enter", comment: "").uppercaseString,
      forState: .Normal)

    button.addTarget(self, action: "buttonDidPress", forControlEvents: .TouchUpInside)

    return button
    }()

  // MARK: - View Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    title = "Hyper"
    view.backgroundColor = UIColor.whiteColor()

    view.addSubview(button)
    setupConstrains()
  }

  // MARK: - Constrains

  func setupConstrains() {
    constrain(button) { button in
      button.center == button.superview!.center
      button.width == 200
      button.height == 50
    }
  }

  // MARK: - Actions

  func buttonDidPress() {
    print("hello 1")
    let controller = ProjectListController()
    navigationController?.pushViewController(controller, animated: true)
  }
}
