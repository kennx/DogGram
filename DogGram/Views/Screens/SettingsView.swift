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
          
          SettingsRowView(leftIcon: "pencil", text: "Display Name", color: Color.MyTheme.purpleColor)
          SettingsRowView(leftIcon: "text.quote", text: "Bio", color: Color.MyTheme.purpleColor)
          SettingsRowView(leftIcon: "photo", text: "Profile Picture", color: Color.MyTheme.purpleColor)
          SettingsRowView(leftIcon: "figure.walk", text: "Sign out", color: Color.MyTheme.purpleColor)
          
        }
        .padding()
        
        // MARK: SECTION 3: APPLICATION
        GroupBox(label: SettingLabelView(labelTitle: "Application", labelImage: "apps.iphone")) {
          
          SettingsRowView(leftIcon: "folder.fill", text: "Privacy Policy", color: Color.MyTheme.yellowColor)
          SettingsRowView(leftIcon: "folder.fill", text: "Terms & Conditions", color: Color.MyTheme.yellowColor)
          SettingsRowView(leftIcon: "globe", text: "DogGram 's Website", color: Color.MyTheme.yellowColor)
          
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
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
  }
}
