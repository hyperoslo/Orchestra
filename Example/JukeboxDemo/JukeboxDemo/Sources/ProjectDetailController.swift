import UIKit
import Cartography
import Imaginary

class ProjectDetailController: UIViewController {

  let project: Project

  lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .ScaleAspectFit

    return imageView
    }()

  lazy var infoLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .Center
    label.textColor = UIColor.blackColor()
    label.font = UIFont.systemFontOfSize(20)
    label.numberOfLines = 0

    return label
    }()

  lazy var button: UIButton = { [unowned self] in
    let button = UIButton(type: .System)
    button.backgroundColor = self.view.tintColor
    button.layer.cornerRadius = 20
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

    [imageView, infoLabel, button].forEach {
      view.addSubview($0)
    }

    imageView.setImage(project.imageURL)
    infoLabel.text = project.info

    setupConstrains()
  }

  // MARK: - Constrains

  func setupConstrains() {
    infoLabel.sizeToFit()

    constrain(imageView, infoLabel, button) { imageView, infoLabel, button in
      let superview = imageView.superview!

      imageView.top == superview.top + 79
      imageView.leading == superview.leading + 15
      imageView.trailing == superview.trailing - 15
      imageView.height == 150

      infoLabel.top == imageView.bottom + 15
      infoLabel.leading == imageView.leading
      infoLabel.trailing == imageView.trailing

      button.top == infoLabel.bottom + 15
      button.centerX == superview.centerX
      button.width == 200
      button.height == 50
    }
  }

  // MARK: - Actions

  func buttonDidPress() {
    UIApplication.sharedApplication().openURL(project.githubURL)
  }
}
