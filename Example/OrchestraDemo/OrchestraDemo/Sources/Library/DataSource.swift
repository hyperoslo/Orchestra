import UIKit

class DataSource<Model, Cell> : NSObject, UITableViewDataSource, UITableViewDelegate {

  let cellIdentifier: String
  let configureCell: (Model, Cell) -> Void
  var cellHeight: CGFloat = 64
  var items = [Model]()
  var action: (Model -> Void)?

  init(cellIdentifier: String, configureCell: (Model, Cell) -> Void) {
    self.cellIdentifier = cellIdentifier
    self.configureCell = configureCell
  }

  // MARK: - UITableViewDataSource

  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let count = items.count
    tableView.backgroundView?.hidden = count > 0

    return count
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
    let item = items[indexPath.item]

    if let cell = cell as? Cell {
      configureCell(item, cell)
    }

    return cell
  }

  // MARK: - UITableViewDelegate

  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return cellHeight
  }

  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)

    guard let action = action else { return }

    let item = items[indexPath.row]
    action(item)
  }
}
