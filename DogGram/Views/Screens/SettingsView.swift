//
//  SettingsView.swift
//  DogGram
//
//  Created by 张剑 on 2021/3/10.
//

import SwiftUI

struct SettingsView: View {
  
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    NavigationView {
      ScrollView(.vertical, showsIndicators: false) {
        
        // MARK: SECTION 1: DOGRAM
        GroupBox(label: SettingLabelView(labelTitle: "Dogram", labelImage: "dot.radiowaves.left.and.right")) {
          HStack(alignment: .center, spacing: 10) {
            Image("logo")
              .resizable()
              .scaledToFit()
              .frame(width: 80, height: 80, alignment: .center)
              .cornerRadius(12)
            
            Text("Dogram is the #1 app for posting pictures of your dog and sharing them acrros the world. We are a dog-loving community and we're happy to have you!")
              .font(.footnote)
          }
        }
        .padding()
        
        // MARK: SECTION 2: PROFILE
        GroupBox(label: SettingLabelView(labelTitle: "Profile", labelImage: "person.fill")) {
          
          NavigationLink(
            destination: SettingsEditTextView(submissionText: "Current display name", title: "Display Name", description: "You can edit your display name here. This will be seen by other users on your profile and on your posts!", placeholder: "Your display name here...")) {
            SettingsRowView(leftIcon: "pencil", text: "Display Name", color: Color.MyTheme.purpleColor)
          }
          
          NavigationLink(
            destination: SettingsEditTextView(submissionText: "Current bio here", title: "Profile Bio", description: "Your bio is a great place to let other users know a little about you. It will be shown on your profile only.", placeholder: "Your Bio here...")) {
            SettingsRowView(leftIcon: "text.quote", text: "Bio", color: Color.MyTheme.purpleColor)
          }
          
          NavigationLink(
            destination: SettingsEditImageView(title: "Profile Picture", description: "Your profile picture will be shown on your profile and on your posts. Most users make it an image of themselves or of their dog!", selectedImage: UIImage(named: "dog1")!)) {
            SettingsRowView(leftIcon: "photo", text: "Profile Picture", color: Color.MyTheme.purpleColor)
          }
          
          NavigationLink(
            destination: Text("dd")) {
            SettingsRowView(leftIcon: "figure.walk", text: "Sign out", color: Color.MyTheme.purpleColor)
            }
          
        }
        .padding()
        
        // MARK: SECTION 3: APPLICATION
        GroupBox(label: SettingLabelView(labelTitle: "Application", labelImage: "apps.iphone")) {
          
          Button(action: {
            self.openCustomURL(urlString: "https://www.google.com")
          }) {
            SettingsRowView(leftIcon: "folder.fill", text: "Privacy Policy", color: Color.MyTheme.yellowColor)
          }
          
          Button(action: {
            self.openCustomURL(urlString: "https://www.yahoo.com")
          }) {
            SettingsRowView(leftIcon: "folder.fill", text: "Terms & Conditions", color: Color.MyTheme.yellowColor)
          }
          
          Button(action: {
            self.openCustomURL(urlString: "https://www.bing.com")
          }) {
            SettingsRowView(leftIcon: "globe", text: "DogGram 's Website", color: Color.MyTheme.yellowColor)
          }
          
        }
        .padding()
        
        // MARK: SECTION 4: SIGN OFF
        GroupBox {
          Text("DogGram was mode with love. \n All Rights Reserved \n Cool Apps Inc. \n Copyright 2020 ❤️")
            .foregroundColor(.gray)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity)
        }
        .padding()
        .padding(.bottom, 80)
        
      }
      .navigationBarTitle("Settings")
      .navigationBarTitleDisplayMode(.large)
      .navigationBarItems(leading:
                            Button(action: {
                              self.presentationMode.wrappedValue.dismiss()
                            }) {
                              Image(systemName: "xmark")
                                .font(.title)
                      
                            }
        .accentColor(.primary)
      )
    }
  }
  
  
  // MARK: FUNCTIONS
  
  func openCustomURL(urlString: String) {
    guard let url = URL(string: urlString) else {
      return
    }
    
    if UIApplication.shared.canOpenURL(url) {
//      UIApplication.shared.open(url)
    }
  }
  
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
  }
}
