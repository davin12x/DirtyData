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
    var posts = [Post]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.estimatedRowHeight = 93
        let person1 = Post(title: "bagga", imagePath: "", postDesc: "My Name is Lalit")
        let person2 = Post(title: "Manpreet", imagePath: "", postDesc: "This is mAnpreet Brar")
        let person3 = Post(title: "Maya", imagePath: "", postDesc: "Maya means magic")
        
        posts.append(person1)
        posts.append(person2)
        posts.append(person3)
        tableView.reloadData()
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
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
        return posts.count
    }
   


}

