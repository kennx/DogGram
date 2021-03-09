//
//  BrowseView.swift
//  DogGram
//
//  Created by 张剑 on 2021/3/9.
//

import SwiftUI

struct BrowseView: View {
  
  var posts = PostArrayObject()
  
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      CarouseView()
      ImageGridView(posts: posts)
    }
    .navigationBarTitle("Browse")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct BrowseView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      BrowseView()
    }
  }
}
