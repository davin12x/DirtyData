//
//  Post.swift
//  DirtyData
//
//  Created by Lalit on 2016-01-19.
//  Copyright © 2016 Bagga. All rights reserved.
//

import Foundation

class Post{

    private var _title:String
    private var _imagePath:String
    private var _postDesc:String
    
    init(title:String,imagePath:String,postDesc:String){
        _title = title
        _imagePath = imagePath
        _postDesc = postDesc
    }
    
}
