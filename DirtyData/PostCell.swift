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
        // Initialization code
    }
    func configureCell(post : Post){
        label.text = post.title
        desc.text = post.postDesc
        
    }
}
