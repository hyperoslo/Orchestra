import UIKit
import Cartography
import Imaginary
import Hue

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

  deinit {
    imageView.removeObserver(self, forKeyPath: "image")
  }

  // MARK: - View Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    title = project.name
    view.backgroundColor = UIColor.whiteColor()

    [imageView, infoLabel, button].forEach {
      view.addSubview($0)
    }

    imageView.addObserver(self, forKeyPath: "image", options: [.New, .Old], context: nil)

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
      imageView.leading == superview.leading + 30
      imageView.trailing == superview.trailing - 30
      imageView.height == 150

      infoLabel.top == imageView.bottom + 30
      infoLabel.leading == imageView.leading
      infoLabel.trailing == imageView.trailing

      button.top == infoLabel.bottom + 50
      button.centerX == superview.centerX
      button.width == 200
      button.height == 50
    }
  }

  // MARK: - KVO

  override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
    guard let imageView = object as? UIImageView,
      image = imageView.image
      where keyPath == "image"
      else { return }

    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0)) {
      let (textColor, _, backgroundColor, _) = image.colors(imageView.frame.size)
      dispatch_async(dispatch_get_main_queue()) { [weak self] in
        guard let backgroundColor = backgroundColor,
          textColor = textColor
          else { return }

        self?.view.backgroundColor = backgroundColor
        self?.infoLabel.textColor = textColor
      }
    }
  }

  // MARK: - Actions

  func buttonDidPress() {
    UIApplication.sharedApplication().openURL(project.githubURL)
  }
}
