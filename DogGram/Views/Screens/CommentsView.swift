//
//  CommentsView.swift
//  DogGram
//
//  Created by 张剑 on 2021/3/9.
//

import SwiftUI

struct CommentsView: View {
  
  @State var submissionText: String = ""
  @State var commentArarry = [CommentModel]()
  
  var body: some View {
    VStack {
      
      ScrollView(.vertical, showsIndicators: false) {
        LazyVStack {
          ForEach(commentArarry, id: \.self) { comment in
            MessageView(comment: comment)
          }
        }
      }
      
      HStack {
        Image("dog1")
          .resizable()
          .scaledToFill()
          .frame(width: 40, height: 40, alignment: .center)
          .cornerRadius(20)
        
        TextField("Add a comment here...", text: self.$submissionText)
        
        Button(action: {
          self.commentArarry.append(CommentModel(commentID: "", userID: "", username: "Joe Green", content: self.submissionText, dateCreated: Date()))
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
    .onAppear(perform: {
      getComments()
    })
  }
  
  // MARK: FUNCTIONS
  
  func getComments() {
    
    print("GET COMMENTS FROM DATABASE")
    
    let comment1 = CommentModel(commentID: "", userID: "", username: "Joe Green", content: "This is the first comment.", dateCreated: Date())
    let comment2 = CommentModel(commentID: "", userID: "", username: "Alex", content: "This is the second comment.", dateCreated: Date())
    let comment3 = CommentModel(commentID: "", userID: "", username: "Stefanie", content: "This is the third comment.", dateCreated: Date())
    let comment4 = CommentModel(commentID: "", userID: "", username: "Chris", content: "This is the fourth comment.", dateCreated: Date())
    
    self.commentArarry.append(comment1)
    self.commentArarry.append(comment2)
    self.commentArarry.append(comment3)
    self.commentArarry.append(comment4)
    
    
  }
  
}

struct CommentsView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      CommentsView()
    }
  }
}
