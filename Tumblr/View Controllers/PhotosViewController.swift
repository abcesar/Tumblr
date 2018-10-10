//
//  PhotosViewController.swift
//  Tumblr
//
//  Created by Cesar Gutierrez on 10/3/18.
//  Copyright © 2018 Cesar Gutierrez. All rights reserved.
//

import UIKit
import AlamofireImage

var posts: [[String: Any]] = []

class PhotosViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var photosTableView: UITableView!
    
    var posts: [[String: Any]] = []
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photosTableView.rowHeight = 217
        photosTableView.delegate = self
        photosTableView.dataSource = self
        
        let url = URL(string: "https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV")!
        //let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        let task = session.dataTask(with: url) { (data, response, error) in
            //This will run when the network request returns
            if let error = error{
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                print(dataDictionary)
                
                let responseDictionary = dataDictionary["response"] as! [String: Any]
                // Store the returned array of dictionaries in our posts property
                self.posts = responseDictionary["posts"] as! [[String: Any]]
                
                self.photosTableView.reloadData()
                

            }
        }
        task.resume()
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //tableView.reloadData()
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! photosTableViewCell
        let post = posts[indexPath.row]
        //cell.textLabel?.text = "This is row \(indexPath.row)"
        // Configure YourCustomCell using the outlets that you've defined.
        if let photos = post["photos"] as? [[String: Any]] {
            // 1.
            let photo = photos[0]
            // 2.
            let originalSize = photo["original_size"] as! [String: Any]
            // 3.
            let urlString = originalSize["url"] as! String
            // 4.
            let url = URL(string: urlString)
            
            cell.photoImageView.af_setImage(withURL: url!)
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! PhotosDetailViewController
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        
    }
}
