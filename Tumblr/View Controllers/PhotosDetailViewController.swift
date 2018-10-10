//
//  PhototsDetailViewController.swift
//  Tumblr
//
//  Created by Cesar Gutierrez on 10/5/18.
//  Copyright © 2018 Cesar Gutierrez. All rights reserved.
//

import UIKit

class PhototsDetailViewController: UIViewController {
    
    @IBOutlet var photoDView: UIImageView!
    
    var post: Post!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoDView.setImageWith(posts.imagePath)
    }

}
