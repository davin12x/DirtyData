//
//  DataServices.swift
//  DirtyData
//
//  Created by Lalit on 2016-01-19.
//  Copyright © 2016 Bagga. All rights reserved.
//

import Foundation
import UIKit

class DataServices{
    static let instance = DataServices()
    private var _loadedePost = [Post]()
    let KEY_POSTS = "posts"
    var loadedPost:[Post]{
        get{
            return _loadedePost
        }
    }
    func savePosts(){
        let postData = NSKeyedArchiver.archivedDataWithRootObject(_loadedePost)
        NSUserDefaults.standardUserDefaults().setObject(postData, forKey: KEY_POSTS)
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }
    func loadPosts(){
       if let loadPost = NSUserDefaults.standardUserDefaults().objectForKey(KEY_POSTS) as? NSData{
        if let postArray = NSKeyedUnarchiver.unarchiveObjectWithData(loadPost) as? [Post]{
                _loadedePost = postArray
            }
        
        }
        NSNotificationCenter.defaultCenter().postNotificationName("postsLoaded", object: nil)
        
    }
    func saveImageAndCreatePath(image:UIImage)->String{
        let imgData = UIImagePNGRepresentation(image)
        let imgPath = "image\(NSDate.timeIntervalSinceReferenceDate()).png"
        let fullPath = documentsPathForFileName(imgPath)
        imgData?.writeToFile(fullPath, atomically: true)
        return imgPath
    
    }
    func imageForPath(path:String)->UIImage?{
        let fullPath = documentsPathForFileName(path)
        let image  = UIImage(named: fullPath)
        return image
    
    }
    func addPost(post:Post){
        _loadedePost.append(post)
        savePosts()
        loadPosts()
    }
    func documentsPathForFileName(name:String) -> String{
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let fullPath = paths[0] as NSString
        return fullPath.stringByAppendingPathComponent(name)
    }

}

