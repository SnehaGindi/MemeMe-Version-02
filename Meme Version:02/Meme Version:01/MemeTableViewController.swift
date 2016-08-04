//
//  MemeTableViewController.swift
//  Meme Version:01
//
//  Created by Sneha gindi on 01/08/16.
//  Copyright © 2016 Sneha gindi. All rights reserved.
//

import Foundation
import UIKit

class MemeTableViewController: UITableViewController {
  
    var savedMemes: [Meme] {
        get {
            let object = UIApplication.sharedApplication().delegate
            let appDelegate = object as! AppDelegate
            return appDelegate.memes
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedMemes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("memeTableCell")!
        let savedMeme = self.savedMemes[indexPath.row]
    
        cell.textLabel?.text = savedMeme.topText
        cell.imageView?.image = savedMeme.memedImage
        
        return cell;
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        detailController.memes = self.savedMemes[indexPath.row]
        self.navigationController!.pushViewController(detailController, animated: true)
    }
}
