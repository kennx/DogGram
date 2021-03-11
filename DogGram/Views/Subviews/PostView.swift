//
//  PostView.swift
//  DogGram
//
//  Created by 张剑 on 2021/3/9.
//

import SwiftUI
import UIKit

struct PostView: View {
  
  @State var post: PostModel
  var showHeaderAndFooter: Bool
  @State var postImage: UIImage = UIImage(named: "dog1")!
  
  @State var animateLike: Bool = false
  @State var addHeartAnimationToView: Bool
  
  @State var showActionSheet: Bool = false
  
  @State var actionSheetType: PostActionSheetOption = .general
  
  enum PostActionSheetOption {
    case general
    case reporting
  }
  
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
          
          Button(action: {
            self.showActionSheet.toggle()
          }) {
            Image(systemName: "ellipsis")
              .font(.headline)
          }
          .accentColor(.primary)
          .actionSheet(isPresented: self.$showActionSheet) {
            self.getActionSheet()
          }
          
        }
        .padding(.all, 6)
      }
      
      // MARK: IMAGE
      
      ZStack {
        Image(uiImage: postImage)
          .resizable()
          .scaledToFit()
          .frame(minWidth: 0, maxWidth: .infinity)
        
        if self.addHeartAnimationToView {
          LikeAnimationView(animate: $animateLike)
        }
      }
      
      // MARK: FOOTER
      
      if showHeaderAndFooter {
        HStack(alignment: .center, spacing: 20) {
          Button(action: {
            if post.likeByUser {
              // unlike
              self.unlikePost()
            } else {
              // like
              self.likePost()
            }
          }) {
            Image(systemName: post.likeByUser ? "heart.fill" : "heart")
              .font(.title3)
          }
          .accentColor(post.likeByUser ? .red: .primary)
          
          NavigationLink(
            destination: CommentsView(),
            label: {
              Image(systemName: "bubble.middle.bottom")
                .font(.title3)
                .foregroundColor(.primary)
            })
          
          Button(action: {
            self.sharePost()
          }) {
            Image(systemName: "paperplane")
              .font(.title3)
          }
          .accentColor(.primary)
          
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
  
  // MARK: FUNCTIONS
  
  func likePost() {
    
    // Update the local data
    let updatePost = PostModel(postID: post.postID, userID: post.userID, username: post.username, caption: post.caption, dateCreated: post.dateCreated, likeCount: post.likeCount + 1, likeByUser: true)
    
    self.post = updatePost
    
    animateLike = true
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
      animateLike = false
    }
    
  }
  
  func unlikePost() {
    
    // Update the local data
    let updatePost = PostModel(postID: post.postID, userID: post.userID, username: post.username, caption: post.caption, dateCreated: post.dateCreated, likeCount: post.likeCount - 1, likeByUser: false)
    
    self.post = updatePost
    
  }
  
  func getActionSheet() -> ActionSheet {
    switch self.actionSheetType {
    case .general:
      return ActionSheet(title: Text("What would you like to do"), message: nil, buttons: [
        .destructive(Text("Report"), action: {
          self.actionSheetType = .reporting
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.showActionSheet.toggle()
          }
        }),
        .default(Text("Learn more..."), action: {
          print("Learn more...")
        }),
        
        .cancel()
      ])
    case .reporting:
      return ActionSheet(title: Text("Why are you reporting this post?"), message: nil, buttons: [
        .destructive(Text("This is inappropriate"), action: {
          self.reportPost(reason: "This is inappropriate")
        }),
        .destructive(Text("This is spam"), action: {
          self.reportPost(reason: "This is spam")
        }),
        .destructive(Text("It made me uncomfortable"), action: {
          self.reportPost(reason: "It made me uncomfortable")
        }),
        .cancel({
          self.actionSheetType = .general
        })
      ])
    }
  }
  
  func reportPost(reason: String) {
    print("REPORT POST NOW")
  }
  
  func sharePost() {
    
    let message = "Check out this post on DogGram!"
    let image = self.postImage
    let link = URL(string: "https://www.google.com")!
    
    let activityViewController = UIActivityViewController(activityItems: [message, image, link], applicationActivities: nil)
   
    let viewController = UIApplication.shared.windows.first?.rootViewController
    
    viewController?.present(activityViewController, animated: true, completion: nil)
    
  }
  
}

struct PostView_Previews: PreviewProvider {
  static var post: PostModel = PostModel(postID: "", userID: "", username: "Joe Green", caption: "This a test caption", dateCreated: Date(), likeCount: 0, likeByUser: false)
  static var previews: some View {
    PostView(post: post, showHeaderAndFooter: true, addHeartAnimationToView: true)
      .previewLayout(.sizeThatFits)
  }
}
