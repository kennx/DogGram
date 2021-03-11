//
//  OnboardingVIewPart2.swift
//  DogGram
//
//  Created by 张剑 on 2021/3/11.
//

import SwiftUI
import UIKit

struct OnboardingViewPart2: View {
  
  @State var displayName: String = ""
  @State var showImagePicker: Bool = false
  
  // for image picker
  @State var selectedImage: UIImage = UIImage(named: "logo")!
  @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
  
  var body: some View {
    VStack(alignment: .center, spacing: 20) {
      
      Text("What's your name?")
        .font(.title)
        .fontWeight(.bold)
        .foregroundColor(Color.MyTheme.yellowColor)
      
      TextField("Add your name here...", text: self.$displayName)
        .padding()
        .frame(height: 60)
        .frame(maxWidth: .infinity)
        .background(Color.MyTheme.beigeColor)
        .cornerRadius(12)
        .font(.headline)
        .autocapitalization(.sentences)
        .padding(.horizontal)
      
      Button(action: {
        self.showImagePicker.toggle()
      }) {
        Text("Finish: Add profile picture")
          .font(.headline)
          .fontWeight(.bold)
          .padding()
          .frame(height: 60)
          .frame(maxWidth: .infinity)
          .background(Color.MyTheme.yellowColor)
          .cornerRadius(12)
          .padding(.horizontal)
      }
      .accentColor(Color.MyTheme.purpleColor)
      .opacity(self.displayName != "" ? 1 : 0)
      .animation(.easeInOut(duration: 1.0))
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.MyTheme.purpleColor)
    .edgesIgnoringSafeArea(.all)
    .sheet(isPresented: self.$showImagePicker, onDismiss: self.createProfile) {
      ImagePicker(imageSelected: self.$selectedImage, sourceType: self.$sourceType)
    }
    
  }
  
  
  // MARK: FUNCTIONS
  
  func createProfile() {
    print("CREATE PROFILE NOW")
  }
  
  
}

struct OnboardingViewPart2_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingViewPart2()
  }
}
