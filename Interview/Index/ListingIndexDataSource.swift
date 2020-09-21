import UIKit

typealias JSONObject = [AnyHashable: Any]

final class ListingIndexDataSource: NSObject {
  var products = [JSONObject]()
}

extension ListingIndexDataSource: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return products.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell : UITableViewCell
    if let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: "ProductCell") {
      cell = dequeuedCell
      
    } else {
      cell = UITableViewCell(style: .default, reuseIdentifier: "ProductCell")
    }
    
    cell.imageView?.image = nil
    
    let relatedItem = products[indexPath.item]
    
    cell.textLabel?.text = relatedItem["title"] as! String
    cell.textLabel?.numberOfLines = 2
    
    return cell
  }
}
