import UIKit

class ProjectListController: UITableViewController {

  static let reusableIdentifier = "ProjectCellIdentifier"

  let items = Project.projects

  // MARK: - View Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    self.title = "Projects"
    setupTableView()
  }

  // MARK: - Setup

  func setupTableView() {
    tableView.registerClass(UITableViewCell.self,
      forCellReuseIdentifier: ProjectListController.reusableIdentifier)
    //tableView.separatorStyle = .None
    tableView.backgroundColor = .whiteColor()
    tableView.tableFooterView = UIView(frame: CGRect.zero)
  }
}

extension ProjectListController {

  override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 70
  }

  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let item = items[indexPath.row]
    tableView.deselectRowAtIndexPath(indexPath, animated: true)

    //let controller
    //navigationController?.pushViewController(controller, animated: true)
  }
}

// MARK: - UITableViewDataSource

extension ProjectListController {

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCellWithIdentifier(ProjectListController.reusableIdentifier)
      else { return UITableViewCell() }

    let item = items[indexPath.row]

    cell.textLabel?.text = item.name
    cell.detailTextLabel?.text = item.githubURL.absoluteString

    return cell
  }
}
