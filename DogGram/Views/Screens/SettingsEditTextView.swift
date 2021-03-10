//
//  SettingsEditTextView.swift
//  DogGram
//
//  Created by 张剑 on 2021/3/10.
//

import SwiftUI

struct SettingsEditTextView: View {
  
  @State var submissionText: String = ""
  @State var title: String
  @State var description: String
  @State var placeholder: String
  
  var body: some View {
    VStack {
      
      HStack {
        Text(self.description)
        Spacer()
      }
      
      TextField(self.placeholder, text: self.$submissionText)
        .padding()
        .frame(height: 60)
        .frame(maxWidth: .infinity)
        .background(Color.MyTheme.beigeColor)
        .cornerRadius(12)
        .font(.headline)
        .autocapitalization(.sentences)
      
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

struct SettingsEditTextView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      SettingsEditTextView(title: "Test title", description: "This is a description", placeholder: "Test placeholder")
    }
  }
}
