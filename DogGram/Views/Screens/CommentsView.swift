//
//  CommentsView.swift
//  DogGram
//
//  Created by 张剑 on 2021/3/9.
//

import SwiftUI

struct CommentsView: View {
  
  @State var submissionText: String = ""
  
  var body: some View {
    VStack {
      
      ScrollView(.vertical, showsIndicators: false) {
        Text("Hello World")
        Text("Hello World")
        Text("Hello World")
        Text("Hello World")
        Text("Hello World")
      }
      
      HStack {
        Image("dog1")
          .resizable()
          .scaledToFill()
          .frame(width: 40, height: 40, alignment: .center)
          .cornerRadius(20)
        
        TextField("Add a comment here...", text: self.$submissionText)
        
        Button(action: {
          
        }) {
          Image(systemName: "paperplane.fill")
            .font(.title2)
        }
        .accentColor(Color.MyTheme.purpleColor)
        
        
      }
      .padding(.all, 6)
      
    }
    .navigationTitle("Comments")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct CommentsView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      CommentsView()
    }
  }
}
