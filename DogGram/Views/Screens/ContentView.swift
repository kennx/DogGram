//
//  ContentView.swift
//  DogGram
//
//  Created by 张剑 on 2021/3/9.
//

import SwiftUI

struct ContentView: View {

  @Environment(\.colorScheme) var colorScheme
  
  var currentUserID: String? = "user"
  
  var body: some View {
    TabView {
      NavigationView {
        FeedView(posts: PostArrayObject(), title: "Feed")
      }
      .tabItem {
        Image(systemName: "book.fill")
        Text("Feed")
      }
      NavigationView {
        BrowseView()
      }
      .tabItem {
        Image(systemName: "magnifyingglass")
        Text("Browse")
      }
      
      NavigationView {
        UploadView()
      }
        .tabItem {
          Image(systemName: "square.and.arrow.up.fill")
          Text("Upload")
        }
      
      ZStack {
        if self.currentUserID != nil {
          NavigationView {
            ProfileView(isMyProfile: true, profileDisplayName: "My Profile", profileUserID: "")
          }
        } else {
          SignUpView()
        }
      }
        .tabItem {
          Image(systemName: "person.fill")
          Text("Profile")
        }
    }
    .accentColor(self.colorScheme == .light ? Color.MyTheme.purpleColor : Color.MyTheme.yellowColor)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
