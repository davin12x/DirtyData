//
//  ViewController.swift
//  DirtyData
//
//  Created by Lalit on 2016-01-19.
//  Copyright © 2016 Bagga. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView:UITableView!
    //var posts = [Post]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.estimatedRowHeight = 93
        DataServices.instance.loadPosts()
       
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onPostsLoaded:", name: "postsLoaded", object: nil)
        
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let post = DataServices.instance.loadedPost[indexPath.row]
        print(post)
        if let cell = tableView.dequeueReusableCellWithIdentifier("postCell") as? PostCell{
            cell.configureCell(post)
            return cell
        }else{
            let cell = PostCell()
            cell.configureCell(post)
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 93
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataServices.instance.loadedPost.count
    }
    func onPostsLoaded(notify:AnyObject){
        tableView.reloadData()
    }
   


}

