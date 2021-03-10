//
//  PostImageView.swift
//  DogGram
//
//  Created by 张剑 on 2021/3/10.
//

import SwiftUI

struct PostImageView: View {
  
  @Environment(\.presentationMode) var presentationMode
  @State var captionText: String = ""
  @Binding var imageSelected: UIImage
  
  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      
      HStack {
        Button(action: {
          presentationMode.wrappedValue.dismiss()
        }) {
          Image(systemName: "xmark")
            .font(.title)
            .padding()
        }
        .accentColor(.primary)
      }
      
      Spacer()
      
      ScrollView(.vertical, showsIndicators: false) {
        
        Image(uiImage: self.imageSelected)
          .resizable()
          .scaledToFill()
          .frame(width: 200, height: 200, alignment: .center)
          .cornerRadius(12)
          .clipped()
        
        TextField("Add your caption here...", text: self.$captionText)
          .padding()
          .frame(height: 60)
          .frame(maxWidth: .infinity)
          .background(Color.MyTheme.beigeColor)
          .cornerRadius(12)
          .font(.headline)
          .padding(.horizontal)
          .autocapitalization(.sentences)
        
        Button(action: {
          postPicture()
        }) {
          Text("Post Picture!".uppercased())
            .font(.title3)
            .fontWeight(.bold)
            .padding()
            .frame(height: 60)
            .frame(maxWidth: .infinity)
            .background(Color.MyTheme.purpleColor)
            .cornerRadius(12)
            .padding(.horizontal)
        }
        .accentColor(Color.MyTheme.yellowColor)
          
      }
    }
    
  }
  
  // MARK: FUNCTIONS
  
  func postPicture() {
    print("POST PICTURE TO DATABASE HERE.")
  }
  
}

struct PostImageView_Previews: PreviewProvider {
  
  @State static var image = UIImage(named: "dog1")!
  
  static var previews: some View {
    PostImageView(imageSelected: $image)
  }
}
