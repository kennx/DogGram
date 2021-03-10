//
//  ProfileView.swift
//  DogGram
//
//  Created by 张剑 on 2021/3/10.
//

import SwiftUI

struct ProfileView: View {
  
  var isMyProfile: Bool
  @State var profileDisplayName: String
  var profileUserID: String
  
  var posts = PostArrayObject()
  
  var body: some View {
    ScrollView(.vertical , showsIndicators: false) {
      ProfileHeaderView(profileDisplayName: self.$profileDisplayName)
      Divider()
      ImageGridView(posts: posts)
    }
    .navigationBarTitle("Profile")
    .navigationBarTitleDisplayMode(.inline)
    .navigationBarItems(trailing:
                          Button(action: {
                            
                          }) {
                            Image(systemName: "line.horizontal.3")
                          }
                          .accentColor(Color.MyTheme.purpleColor)
                          .opacity(isMyProfile ? 1.0 : 0.0)
    )
  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      ProfileView(isMyProfile: true, profileDisplayName: "Joe", profileUserID: "")
    }
  }
}
