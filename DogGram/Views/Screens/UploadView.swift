//
//  UploadView.swift
//  DogGram
//
//  Created by 张剑 on 2021/3/9.
//

import SwiftUI
import UIKit

struct UploadView: View {
  
  @State var showImagePicker: Bool = false
  @State var imageSelected: UIImage = UIImage(named: "logo")!
  @State var sourceType: UIImagePickerController.SourceType = .camera
  
  @State var showPostImageView: Bool = false
  
  @Environment(\.colorScheme) var colorScheme
  
  var body: some View {
    ZStack(alignment: .center) {
      VStack {
        Button(action: {
          self.sourceType = UIImagePickerController.SourceType.camera
          self.showImagePicker.toggle()
        }) {
          Text("take photo".uppercased())
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(Color.MyTheme.yellowColor)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(Color.MyTheme.purpleColor)
        
        Button(action: {
          self.sourceType = UIImagePickerController.SourceType.photoLibrary
          self.showImagePicker.toggle()
        }) {
          Text("Import photo".uppercased())
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(Color.MyTheme.purpleColor)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(Color.MyTheme.yellowColor)
      }
      .sheet(isPresented: self.$showImagePicker, onDismiss: self.segueToPostImageView, content: {
        ImagePicker(imageSelected: self.$imageSelected, sourceType: self.$sourceType)
          .preferredColorScheme(self.colorScheme == .light ? .light : .dark)
          .accentColor(self.colorScheme == .light ? Color.MyTheme.purpleColor : Color.MyTheme.yellowColor)
      })
      
      Image("logo.transparent")
        .resizable()
        .scaledToFit()
        .frame(width: 100, height: 100, alignment: .center)
        .shadow(radius: 12)
        .fullScreenCover(isPresented: self.$showPostImageView, content: {
          PostImageView(imageSelected: self.$imageSelected)
        })
      
    }
    .edgesIgnoringSafeArea(.top)
  }
  
  // MARK: FUNCIONS
  
  func segueToPostImageView() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
      self.showPostImageView.toggle()
    }
  }
  
}

struct UploadView_Previews: PreviewProvider {
  static var previews: some View {
    UploadView()
  }
}
