//
//  PhotosDetailViewController.swift
//  Tumblr
//
//  Created by Cesar Gutierrez on 10/10/18.
//  Copyright © 2018 Cesar Gutierrez. All rights reserved.
//

import UIKit
import AlamofireImage

class PhotosDetailViewController: UIViewController {

    @IBOutlet weak var photoDView: UIImageView!
    var photoURL: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoDView.af_setImage(withURL: photoURL!)
    }
    
}
