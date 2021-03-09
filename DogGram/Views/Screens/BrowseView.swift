//
//  BrowseView.swift
//  DogGram
//
//  Created by 张剑 on 2021/3/9.
//

import SwiftUI

struct BrowseView: View {
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      CarouseView()
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
