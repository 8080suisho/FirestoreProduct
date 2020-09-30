//
//  Post.swift
//  FirestoreProduct
//
//  Created by 諸星水晶 on 2020/09/30.
//

import Foundation
import Firebase

struct Post {
    let userName: String
    let message: String
    let postTime: String
    let lastUpdated: Timestamp

    init(data: [String: Any]) {
        userName = data["userName"] as! String
        message = data["message"] as! String
        postTime = data["postTime"] as! String
        lastUpdated = data["lastUpdated"] as! Timestamp
    }
}
