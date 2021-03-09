//
//  UploadView.swift
//  DogGram
//
//  Created by 张剑 on 2021/3/9.
//

import SwiftUI

struct UploadView: View {
  var body: some View {
    ZStack(alignment: .center) {
      VStack {
        Button(action: {
          
        }) {
          Text("take photo".uppercased())
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(Color.MyTheme.yellowColor)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(Color.MyTheme.purpleColor)
        
        Button(action: {
          
        }) {
          Text("Import photo".uppercased())
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(Color.MyTheme.purpleColor)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(Color.MyTheme.yellowColor)
      }
      
      Image("logo.transparent")
        .resizable()
        .scaledToFit()
        .frame(width: 100, height: 100, alignment: .center)
        .shadow(radius: 12)
    }
    .edgesIgnoringSafeArea(.top)
  }
}

struct UploadView_Previews: PreviewProvider {
  static var previews: some View {
    UploadView()
  }
}
