import UIKit
import Imaginary

class TeamController: UITableViewController {

  static let reusableIdentifier = "TeamCellIdentifier"

  var developers = [Developer]()

  lazy var dataSource: DataSource<Developer, TableViewCell> = { [unowned self] in
    let dataSource = DataSource(
      cellIdentifier: TeamController.reusableIdentifier,
      configureCell: self.configureCell)

    dataSource.action = self.selectCell

    return dataSource
  }()

  // MARK: - View Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    developers = Developer.developers.sort { $0.name < $1.name }
    dataSource.items = developers
    configureTableView()
  }

  // MARK: - Configuration

  func configureTableView() {
    tableView.registerClass(TableViewCell.self,
      forCellReuseIdentifier: TeamController.reusableIdentifier)
    tableView.backgroundColor = .whiteColor()
    tableView.tableFooterView = UIView(frame: CGRect.zero)
    tableView.dataSource = dataSource
    tableView.delegate = dataSource
  }

  func configureCell(developer: Developer, cell: TableViewCell) {
    cell.textLabel?.text = developer.name
    cell.imageView?.setImage(developer.imageURL,
      placeholder: UIImage(named: "placeholder"))
  }

  // MARK: - Actions

  func selectCell(developer: Developer) {
    UIApplication.sharedApplication().openURL(developer.githubURL)
  }
}
