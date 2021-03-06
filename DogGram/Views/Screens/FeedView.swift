//
//  FeedView.swift
//  DogGram
//
//  Created by 张剑 on 2021/3/9.
//

import SwiftUI

struct FeedView: View {
  
  @ObservedObject var posts: PostArrayObject
  var title: String
  
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      LazyVStack {
        ForEach(posts.dataArray, id: \.self) { post in
          PostView(post: post, showHeaderAndFooter: true, addHeartAnimationToView: true)
        }
      }
    }
    .navigationTitle(title)
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct FeedView_Previews: PreviewProvider {
  
  static var previews: some View {
    NavigationView {
      FeedView(posts: PostArrayObject(), title: "Feed Test")
    }
  }
}
