import UIKit

class ProjectListController: UITableViewController {

  static let reusableIdentifier = "ProjectCellIdentifier"

  var projects = [Project]()

  lazy var dataSource: DataSource<Project, TableViewCell> = { [unowned self] in
    let dataSource = DataSource(
      cellIdentifier: ProjectListController.reusableIdentifier,
      configureCell: self.configureCell)

    dataSource.action = self.selectCell

    return dataSource
    }()

  // MARK: - View Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    projects = Project.projects.sort { $0.name < $1.name }
    dataSource.items = projects
    configureTableView()
  }

  // MARK: - Configuration

  func configureTableView() {
    tableView.registerClass(TableViewCell.self,
      forCellReuseIdentifier: ProjectListController.reusableIdentifier)
    tableView.backgroundColor = .whiteColor()
    tableView.tableFooterView = UIView(frame: CGRect.zero)
    tableView.dataSource = dataSource
    tableView.delegate = dataSource
  }

  func configureCell(project: Project, cell: TableViewCell) {
    cell.textLabel?.text = project.name
    cell.detailTextLabel?.text = project.githubURL.absoluteString
  }

  // MARK: - Actions

  func selectCell(project: Project) {
    let controller = ProjectDetailController(project: project)
    navigationController?.pushViewController(controller, animated: true)
  }
}
