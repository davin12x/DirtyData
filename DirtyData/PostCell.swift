//
//  PostCell.swift
//  DirtyData
//
//  Created by Lalit on 2016-01-19.
//  Copyright © 2016 Bagga. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var postImage:UIImageView!
    @IBOutlet weak var label : UILabel!
    @IBOutlet weak var desc: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        postImage.layer.cornerRadius = postImage.frame.size.width / 2
        postImage.clipsToBounds = true
    }
    func configureCell(post : Post){
        label.text = post.title
        desc.text = post.postDesc
        postImage.image = DataServices.instance.imageForPath(post.imagePath)
        
    }
}
