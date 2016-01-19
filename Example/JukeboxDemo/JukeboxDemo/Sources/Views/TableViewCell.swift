import UIKit

class TableViewCell: UITableViewCell {

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: .Subtitle, reuseIdentifier: reuseIdentifier)
    detailTextLabel?.textColor = UIColor.lightGrayColor()
    imageView?.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
