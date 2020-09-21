import UIKit

final class ListingIndexViewController: UIViewController {

  weak var tableView: UITableView!
  var dataSource = ListingIndexDataSource()

  override func viewDidLoad() {
    super.viewDidLoad()

    navigationItem.title = "Gear"
    tableView = makeTableView()
    fetchData()
  }
}

extension ListingIndexViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

  }
}

private extension ListingIndexViewController {
  func makeTableView() -> UITableView {
    let tableView = UITableView(frame: view.frame)
    view.addSubview(tableView)
    tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    tableView.dataSource = dataSource
    tableView.delegate = self
    tableView.rowHeight = 60
    return tableView
  }

  func fetchData() {
    let path = Bundle.main.url(forResource: "reverb-gear-index", withExtension: "json")!
    let data = try! Data(contentsOf: path)
    let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [JSONObject]
    dataSource.products = json
    
    tableView.reloadData()
  }
}
