//
//  photosTableViewCell.swift
//  Tumblr
//
//  Created by Cesar Gutierrez on 10/3/18.
//  Copyright © 2018 Cesar Gutierrez. All rights reserved.
//

import UIKit
import AlamofireImage

class photosTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell") as! photosTableViewCell
        let post = posts[indexPath.row]
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
            
            tableView.reloadData()
        }
        
        
        return cell
    }
}
