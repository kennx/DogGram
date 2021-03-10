//
//  SignInWithAppleButtonCustom.swift
//  DogGram
//
//  Created by 张剑 on 2021/3/10.
//

import Foundation
import SwiftUI
import AuthenticationServices

struct SignInWithAppleButtonCustom: UIViewRepresentable {
  
  func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
    return ASAuthorizationAppleIDButton(authorizationButtonType: .default, authorizationButtonStyle: .black)
  }
  
  func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {}
  
}
