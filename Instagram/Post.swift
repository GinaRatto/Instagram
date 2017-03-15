//
//  Post.swift
//  Instagram
//
//  Created by Gina Ratto on 2/23/17.
//  Copyright © 2017 Gina Ratto. All rights reserved.
//

import Foundation
import UIKit
import Parse

class Post: NSObject {
    
    var photo: UIImage?
    var caption: String?
    var username: String?

    init(photo: UIImage, caption: String, username: String) {
        self.photo = photo
        self.caption = caption
        self.username = username
    }
    
    class func postPhoto(photo: UIImage, caption: String?, success: PFBooleanResultBlock?) {
        
        let post = PFObject(className: "Post")
        post["caption"] = caption
        post["author"] = PFUser.current()
        post["media"] = getPhotoFile(photo: photo)
        post.saveInBackground(block: success)
    }
    
    class func getPhotoFile(photo: UIImage?) -> PFFile? {
        if let photo = photo {
            if let photo_data = UIImagePNGRepresentation(photo) {
                return PFFile(name: "photo.png", data: photo_data)
            }
        }
        return nil
    }
}
