import UIKit
import Cartography

class WelcomeController: UIViewController {

  lazy var imageView: UIImageView = {
    let image = UIImage(named: "hyperLogo")
    let imageView = UIImageView(image: image)

    return imageView
    }()

  lazy var button: UIButton = { [unowned self] in
    let button = UIButton(type: .System)
    button.backgroundColor = UIColor.hex("F57D2D")
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

    title = "Hyper iOS"
    view.backgroundColor = UIColor.whiteColor()

    [imageView, button].forEach { view.addSubview($0) }
    configureConstrains()
  }

  // MARK: - Configuration

  func configureConstrains() {
    let imageSize = imageView.frame.size

    constrain(imageView, button) { imageView, button in
      let superview = imageView.superview!

      imageView.top == superview.top + 150
      imageView.centerX == superview.centerX
      imageView.width == imageSize.width
      imageView.height == imageSize.height

      button.top == imageView.bottom + 120
      button.centerX == superview.centerX
      button.width == 200
      button.height == 50
    }
  }

  // MARK: - Actions

  func buttonDidPress() {
    let controller = MainController()
    navigationController?.pushViewController(controller, animated: true)
  }
}
