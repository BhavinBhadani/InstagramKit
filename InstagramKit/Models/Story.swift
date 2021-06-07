//
//  Story.swift
//  InstagramKit
//
//  Created by Appernaut on 06/06/21.
//

import Foundation

struct Story: Identifiable {
    var id: String
    var userImage: String
    var userName: String
    var isMine: Bool
    var isSeen: Bool
}
