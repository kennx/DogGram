//
//  PostArrayObject.swift
//  DogGram
//
//  Created by 张剑 on 2021/3/9.
//

import Foundation

class PostArrayObject: ObservableObject {
  
  @Published var dataArray = [PostModel]()
  
  init() {
    
    print("FETCH FROM DATABASE HERE.")
    
    let post1 = PostModel(postID: "", userID: "", username: "Joe Green", caption: "This is a test caption", dateCreated: Date(), likeCount: 0, likeByUser: false)
    let post2 = PostModel(postID: "", userID: "", username: "Jessica", caption:  nil, dateCreated: Date(), likeCount: 0, likeByUser: false)
    let post3 = PostModel(postID: "", userID: "", username: "Emily", caption: "This is a really really long caption.hahahaha.", dateCreated: Date(), likeCount: 0, likeByUser: false)
    let post4 = PostModel(postID: "", userID: "", username: "Chirstopher", caption: nil, dateCreated: Date(), likeCount: 0, likeByUser: false)
    
    self.dataArray.append(post1)
    self.dataArray.append(post2)
    self.dataArray.append(post3)
    self.dataArray.append(post4)
  }
  
  // USER FOR SINGLE POST SELECTION
  init(post: PostModel) {
    self.dataArray.append(post)
  }
  
}
