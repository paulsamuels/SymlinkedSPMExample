import UIKit

class ViewController: UITableViewController {
  var posts: [BlogPost] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.register(DetailCell.self, forCellReuseIdentifier: "Cell")
    
    Server().fetch { [weak self] in
      do {
        self?.posts = try JSONDecoder().decode(BlogPostsRequest.self, from: $0).posts
        self?.tableView.reloadData()
      } catch {
        print(error)
      }
    }
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return posts.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    
    let post = posts[indexPath.row]
    
    cell.textLabel?.text       = post.title
    cell.detailTextLabel?.text = post.tags.joined(separator: ", ")
    
    return cell
  }
  
  class DetailCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
      super.init(style: .value1, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
  }
}
