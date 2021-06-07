//
//  Post.swift
//  InstagramKit
//
//  Created by Appernaut on 06/06/21.
//

import Foundation

struct Post: Identifiable {
    var id: String
    var userName: String
    var avatar: String
    var postImage: String
    var location: String?
    var caption: String
    var isLiked: Bool
    var isBookmarked: Bool
    var isSponsored: Bool
    var likes: Int
    var date: String?
}
