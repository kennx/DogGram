//
//  SettingsEditImageView.swift
//  DogGram
//
//  Created by 张剑 on 2021/3/10.
//

import SwiftUI
import UIKit

struct SettingsEditImageView: View {
  
  @State var title: String
  @State var description: String
  @State var selectedImage: UIImage // image shown on this screen
  @State var sourceType: UIImagePickerController.SourceType = UIImagePickerController.SourceType.photoLibrary
  
  @State var showImagePicker: Bool = false
  
  
  var body: some View {
    VStack(alignment: .leading, spacing: 20) {
      
      HStack {
        Text(self.description)
        Spacer()
      }
      
      Image(uiImage: self.selectedImage)
        .resizable()
        .scaledToFill()
        .frame(width: 200, height: 200, alignment: .center)
        .clipped()
        .cornerRadius(12)
      
      Button(action: {
        self.showImagePicker.toggle()
      }) {
        Text("Import".uppercased())
          .font(.title)
          .fontWeight(.bold)
          .padding()
          .frame(height: 60)
          .frame(maxWidth: .infinity)
          .background(Color.MyTheme.yellowColor)
          .cornerRadius(12)
      }
      .accentColor(Color.MyTheme.purpleColor)
      .sheet(isPresented: self.$showImagePicker, content: {
        ImagePicker(imageSelected: self.$selectedImage, sourceType: self.$sourceType)
      })
      
      
      Button(action: {
        
      }) {
        Text("Save".uppercased())
          .font(.title)
          .fontWeight(.bold)
          .padding()
          .frame(height: 60)
          .frame(maxWidth: .infinity)
          .background(Color.MyTheme.purpleColor)
          .cornerRadius(12)
      }
      .accentColor(Color.MyTheme.yellowColor)
      
      Spacer()
      
    }
    .padding()
    .frame(maxWidth: .infinity)
    .navigationBarTitle(title)
  }
}

struct SettingsEditImageView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      SettingsEditImageView(title: "Title", description: "description", selectedImage: UIImage(named: "dog1")!)
    }
  }
}
