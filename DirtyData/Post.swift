//
//  Post.swift
//  DirtyData
//
//  Created by Lalit on 2016-01-19.
//  Copyright © 2016 Bagga. All rights reserved.
//

import Foundation

class Post:NSObject,NSCoding{

    private var _title:String!
    private var _imagePath:String!
    private var _postDesc:String!
    
    
    var imagePath : String{
        get{
            return _imagePath
        }
    }
    var title:String{
        get{
            return _title
        }
    }
    var postDesc :String{
        get{
            return _postDesc
        }
    }
    init(title:String,imagePath:String,postDesc:String){
        _title = title
        _imagePath = imagePath
        _postDesc = postDesc
    }
    override init() {
        
    }
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._imagePath = aDecoder.decodeObjectForKey("imagePath") as? String
        self._postDesc = aDecoder.decodeObjectForKey("description") as? String
        self._title = aDecoder.decodeObjectForKey("title") as? String
    }
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self._imagePath, forKey: "imagePath")
        aCoder.encodeObject(self._postDesc, forKey: "description")
        aCoder.encodeObject(self._title,forKey: "title")
    }
    
}
