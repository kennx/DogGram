//
//  DogGramApp.swift
//  DogGram
//
//  Created by 张剑 on 2021/3/9.
//

import SwiftUI
import FirebaseCore

@main
struct DogGramApp: App {
  
  init() {
    FirebaseApp.configure()
  }
  
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}
