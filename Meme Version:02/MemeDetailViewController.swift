//
//  MemeDetailViewController.swift
//  Meme Version:01
//
//  Created by Sneha gindi on 02/08/16.
//  Copyright © 2016 Sneha gindi. All rights reserved.
//

import Foundation
import UIKit

class MemeDetailViewController: UIViewController {

    @IBOutlet weak var detailMemeImage: UIImageView!
    
    var memes: Meme!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.hidden = true
        
        self.detailMemeImage!.image = memes.memedImage
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.hidden = false
    }
}
