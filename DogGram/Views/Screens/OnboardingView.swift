//
//  OnboardingView.swift
//  DogGram
//
//  Created by 张剑 on 2021/3/10.
//

import SwiftUI

struct OnboardingView: View {
  var body: some View {
    VStack(spacing: 20) {
       
      Image("logo.transparent")
        .resizable()
        .scaledToFit()
        .frame(width: 100, height: 100, alignment: .center)
        .shadow(radius: 12)
      
      Text("Welcome to DogGram!")
        .font(.largeTitle)
        .fontWeight(.bold)
        .foregroundColor(Color.MyTheme.purpleColor)
      
      Text("Dogram is the #1 app for posting pictures of your dog and sharing them acrros the world. We are a dog-loving community and we're happy to have you!")
        .font(.headline)
        .fontWeight(.medium)
        .multilineTextAlignment(.center)
        .foregroundColor(Color.MyTheme.purpleColor)
        .padding()
      
      Button(action: {
        
      }) {
        SignInWithAppleButtonCustom()
          .frame(height: 60)
          .frame(maxWidth: .infinity)
      }
      
      Button(action: {
        
      }) {
        HStack {
          
          Image(systemName: "globe")
          
          Text("Sign in with Google")
          
        }
        .frame(height: 60)
        .frame(maxWidth: .infinity)
        .background(Color(.sRGB, red: 2222/255, green: 82/255, blue: 70/255, opacity: 1.0))
        .cornerRadius(6)
        .font(.system(size: 23, weight: .medium, design: .default))
      }
      .accentColor(Color.white)
      
    }
    .padding(.all, 20)
    .edgesIgnoringSafeArea(.all)
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.MyTheme.beigeColor)
    .edgesIgnoringSafeArea(.all)
  }
}

struct OnboardingView_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingView()
  }
}
