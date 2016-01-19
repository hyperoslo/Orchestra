import UIKit
import Imaginary

class TeamController: UITableViewController {

  static let reusableIdentifier = "TeamCellIdentifier"

  var developers = [Developer]()

  let cellConfigure = { (developer: Developer, cell: UITableViewCell) -> Void in
    cell.textLabel?.text = developer.name
    cell.imageView?.setImage(developer.imageURL)
  }

  let action = { (developer: Developer) -> Void in
    UIApplication.sharedApplication().openURL(developer.githubURL)
  }

  lazy var dataSource: DataSource<Developer, UITableViewCell> = { [unowned self] in
    let dataSource = DataSource(
      cellIdentifier: TeamController.reusableIdentifier,
      cellConfigure: self.cellConfigure)

    dataSource.action = self.action

    return dataSource
  }()

  // MARK: - View Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    developers = Developer.developers.sort { $0.name < $1.name }
    dataSource.items = developers
    setupTableView()
  }

  // MARK: - Setup

  func setupTableView() {
    tableView.registerClass(UITableViewCell.self,
      forCellReuseIdentifier: ProjectListController.reusableIdentifier)
    tableView.backgroundColor = .whiteColor()
    tableView.tableFooterView = UIView(frame: CGRect.zero)
    tableView.dataSource = dataSource
    tableView.delegate = dataSource
  }
}
