//
//  PostModel.swift
//  DogGram
//
//  Created by 张剑 on 2021/3/9.
//

import Foundation
import SwiftUI

struct PostModel: Identifiable, Hashable {
  
  var id = UUID()
  var postID: String // ID for the post in Database
  var userID: String // ID for the user in Database
  var username: String // Username of user in Database
  var caption: String?
  var dateCreated: Date
  var likeCount: Int
  var likeByUser: Bool
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
  
}

