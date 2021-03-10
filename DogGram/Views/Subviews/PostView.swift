//
//  PostView.swift
//  DogGram
//
//  Created by 张剑 on 2021/3/9.
//

import SwiftUI

struct PostView: View {
  
  @State var post: PostModel
  var showHeaderAndFooter: Bool
  
  var body: some View {
    VStack(alignment: .center, spacing: 0) {
      // MARK: HEADER
      if showHeaderAndFooter {
        HStack {
          
          NavigationLink(
            destination: ProfileView(isMyProfile: false, profileDisplayName: post.username, profileUserID: post.userID),
            label: {
              Image("dog1")
                .resizable()
                .scaledToFill()
                .frame(width: 30, height: 30, alignment: .center)
                .cornerRadius(15)
              
              Text(post.username)
                .font(.callout)
                .fontWeight(.medium)
                .foregroundColor(.primary)
            })
          
          
          
          Spacer()
          
          Image(systemName: "ellipsis")
            .font(.headline)
        }
        .padding(.all, 6)
      }
      
      // MARK: IMAGE
      
      Image("dog1")
        .resizable()
        .scaledToFit()
        .frame(minWidth: 0, maxWidth: .infinity)
      
      // MARK: FOOTER
      
      if showHeaderAndFooter {
        HStack(alignment: .center, spacing: 20) {
          Image(systemName: "heart")
            .font(.title3)
          
          NavigationLink(
            destination: CommentsView(),
            label: {
              Image(systemName: "bubble.middle.bottom")
                .font(.title3)
                .foregroundColor(.primary)
            })
          
          Image(systemName: "paperplane")
            .font(.title3)
          
          Spacer()
        }
        .padding(.all, 6)
        
        if let caption = post.caption {
          HStack {
            Text(caption)
            Spacer()
          }
          .padding(.all, 6)
        }
      }
      
    }
  }
}

struct PostView_Previews: PreviewProvider {
  static var post: PostModel = PostModel(postID: "", userID: "", username: "Joe Green", caption: "This a test caption", dateCreated: Date(), likeCount: 0, likeByUser: false)
  static var previews: some View {
    PostView(post: post, showHeaderAndFooter: true)
      .previewLayout(.sizeThatFits)
  }
}
