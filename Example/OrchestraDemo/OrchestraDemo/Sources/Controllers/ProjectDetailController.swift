import UIKit
import Cartography
import Imaginary
import Hue

class ProjectDetailController: UIViewController {

  let project: Project

  lazy var scrollView: UIScrollView = {
    let scrollView = UIScrollView(frame: CGRectZero)
    scrollView.alwaysBounceVertical = true

    return scrollView
    }()

  lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .ScaleAspectFit

    return imageView
    }()

  lazy var infoLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .Center
    label.textColor = UIColor.hex("999")
    label.font = UIFont.systemFontOfSize(18)
    label.numberOfLines = 0

    return label
    }()

  lazy var button: UIButton = { [unowned self] in
    let button = UIButton(type: .System)
    button.backgroundColor = UIColor.hex("F57D2D")
    button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
    button.titleLabel?.font = UIFont.systemFontOfSize(18)
    button.setTitle(NSLocalizedString("View on GitHub", comment: "").uppercaseString,
      forState: .Normal)

    button.addTarget(self, action: "buttonDidPress", forControlEvents: .TouchUpInside)

    return button
    }()

  // MARK: - Initializers

  required init(project: Project) {
    self.project = project
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - View Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    title = project.name
    view.backgroundColor = UIColor.whiteColor()

    view.addSubview(scrollView)
    [imageView, infoLabel, button].forEach {
      scrollView.addSubview($0)
    }

    imageView.setImage(project.imageURL)
    infoLabel.text = project.info

    configureConstrains()
  }

  // MARK: - Configuration

  func configureConstrains() {
    infoLabel.sizeToFit()

    constrain(scrollView) { scrollView in
      scrollView.edges == scrollView.superview!.edges
    }

    constrain(imageView, infoLabel, button) { imageView, infoLabel, button in
      let superview = imageView.superview!

      imageView.top == superview.top + 15
      imageView.centerX == superview.centerX
      imageView.width == 300
      imageView.height == 150

      infoLabel.top == imageView.bottom + 30
      infoLabel.left == imageView.left
      infoLabel.right == imageView.right

      button.top == infoLabel.bottom + 40
      button.centerX == superview.centerX
      button.width == 200
      button.height == 50
    }

    view.layoutIfNeeded()

    scrollView.contentSize = CGSize(
      width: view.frame.width,
      height: button.frame.maxY + 20)
  }

  // MARK: - Actions

  func buttonDidPress() {
    UIApplication.sharedApplication().openURL(project.githubURL)
  }
}
