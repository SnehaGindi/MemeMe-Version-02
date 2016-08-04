//
//  MemeCollectionVC.swift
//  Meme Version:01
//
//  Created by Sneha gindi on 01/08/16.
//  Copyright © 2016 Sneha gindi. All rights reserved.
//

import Foundation
import UIKit

class MemeCollectionVC: UICollectionViewController {
    
    var savedMemes: [Meme] {
        get {
            let object = UIApplication.sharedApplication().delegate
            let appDelegate = object as! AppDelegate
            return appDelegate.memes
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionView?.reloadData()
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return self.savedMemes.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MemeCollectionViewCell", forIndexPath: indexPath) as! MemeCollectionViewCell
        
        let meme = self.savedMemes[indexPath.row]
        
        cell.collectionLabel.text = meme.topText
        cell.collectionImage?.image = meme.memedImage
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        detailController.memes = self.savedMemes[indexPath.row]
        self.navigationController!.pushViewController(detailController, animated: true)
    }
    
}
