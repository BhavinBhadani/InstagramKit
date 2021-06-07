//
//  DemoData.swift
//  InstagramKit
//
//  Created by Appernaut on 06/06/21.
//

import Foundation

struct DemoData {
    static let stories: [Story] = [
        Story(id: "1", userImage: "avatar1", userName: "Your Story", isMine: true, isSeen: false),
        Story(id: "2", userImage: "avatar2", userName: "marine", isMine: false, isSeen: false),
        Story(id: "3", userImage: "avatar3", userName: "pablo", isMine: false, isSeen: false),
        Story(id: "4", userImage: "avatar4", userName: "iosdev", isMine: false, isSeen: true),
        Story(id: "5", userImage: "avatar5", userName: "alpha_ios", isMine: false, isSeen: false),
    ]
    
    static let posts: [Post] = [
        Post(id: "1", userName: "john_ios", avatar: "avatar1", postImage: "banner1", location: nil, caption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum", isLiked: false, isBookmarked: false, isSponsored: false, likes: 405, date: "30 minutes ago"),
        
        Post(id: "2", userName: "alpha_ios", avatar: "avatar5", postImage: "banner2", location: "Pune, Maharastra", caption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", isLiked: false, isBookmarked: false, isSponsored: false, likes: 1024, date: "2 hours ago"),
        
        Post(id: "3", userName: "marine", avatar: "avatar2", postImage: "banner3", location: "Surat, Gujarat", caption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", isLiked: false, isBookmarked: false, isSponsored: false, likes: 10111, date: "12 hours ago"),
        
        Post(id: "4", userName: "Apple", avatar: "ic_apple_logo", postImage: "sponsored_post", location: nil, caption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", isLiked: false, isBookmarked: false, isSponsored: true, likes: 124956, date: "4 hours ago"),
        
        Post(id: "5", userName: "iosdev", avatar: "avatar4", postImage: "banner4", location: "Bangaluru, Karnataka", caption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", isLiked: false, isBookmarked: false, isSponsored: false, likes: 109, date: "1 day ago"),
    ]

}
