//
//  Post.swift
//  faceevents-social
//
//  Created by Asim Ahmed on 5/4/17.
//  Copyright © 2017 Asim Ahmed. All rights reserved.
//

import Foundation
import Firebase

class Post {
    //this is our caption
    private var _caption: String!
    //this is the image url
    private var _imageUrl: String!
    //number of likes
    private var _likes: Int!
    //post id
    private var _postKey: String!
    
    private var _postRef: FIRDatabaseReference!
    
    var caption: String {
        return _caption
    }
    
    var imageUrl: String {
        return _imageUrl
    }
    
    var likes: Int {
        return _likes
    }
    
    var postKey: String {
        return _postKey
    }
    
    init(caption: String, imageUrl: String, likes: Int) {
        self._caption = caption
        self._imageUrl = caption
        self._likes = likes
    }
    
    init(postKey: String, postData: Dictionary<String, AnyObject>) {
        self._postKey = postKey
        
        if let caption = postData["caption"] as? String {
            self._caption = caption
        }
        
        if let imageUrl = postData["imageUrl"] as? String {
            self._imageUrl = imageUrl
        }
        
        if let likes = postData["likes"] as? Int {
            self._likes = likes
        }
        
        _postRef = DataService.ds.REF_POSTS.child(_postKey)
        
    }
    
    func adjustLikes(addLike: Bool) {
        if addLike {
            _likes = _likes + 1
        } else {
            _likes = likes - 1
        }
        _postRef.child("likes").setValue(_likes)
        
    }
    
}
