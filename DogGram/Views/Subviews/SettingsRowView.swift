//
//  SettingsRowView.swift
//  DogGram
//
//  Created by 张剑 on 2021/3/10.
//

import SwiftUI

struct SettingsRowView: View {
  
  var leftIcon: String
  var text: String
  var color: Color
  
  var body: some View {
    HStack {
      
      ZStack {
        RoundedRectangle(cornerRadius: 8.0, style: .continuous)
          .fill(self.color)
        
        Image(systemName: self.leftIcon)
          .font(.title3)
          .foregroundColor(.white)
      }
      .frame(width: 36, height: 36, alignment: .center)
      
      Text(self.text)
      
      Spacer()
      
      Image(systemName: "chevron.right")
        .font(.headline)
      
      
    }
    .padding(.vertical, 4)
  }
}

struct SettingsRowView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsRowView(leftIcon: "heart.fill", text: "Row title", color: .red)
      .previewLayout(.sizeThatFits)
  }
}
