//
//  Constants.swift
//  Helloquent
//
//  Created by Morgan Trudeau on 2017-12-22.
//  Copyright © 2017 Morgan Trudeau. All rights reserved.
//

import Foundation

class Constants {
    
    // DBProvider
    static let USERS = "Users"
    static let ROOMS = "Rooms"
    static let MESSAGES = "Messages"
    static let MEDIA_MESSAGES = "Media_Messages"
    static let IMAGE_STORAGE = "Image_Storage"
    static let VIDEO_STORAGE = "Video_Storage"
    
    static let EMAIL = "email"
    static let PASSWORD = "password"
    static let DATA = "data"
    static let COLOR = "color"
    
    // Messages
    static let TEXT = "text"
    static let SENDER_ID = "sender_id"
    static let SENDER_NAME = "sender_name"
    static let URL = "url"
    
    // Room
    static let ROOM_NAME = "room_name"
    static let ROOM_ID = "room_id"
    static let ACTIVE_USERS = "active_users"
    
    // DB Handles
    static let CHILD_ADDED_HANDLE = "child_added_handle"
    static let CHILD_CHANGED_HANDLE = "child_changed_handle"
}
