//
//  SettingLabelView.swift
//  DogGram
//
//  Created by 张剑 on 2021/3/10.
//

import SwiftUI

struct SettingLabelView: View {
  
  var labelTitle: String
  var labelImage: String
  
  var body: some View {
    VStack {
      HStack {
        
        Text(self.labelTitle)
          .fontWeight(.bold)
        Spacer()
        Image(systemName: self.labelImage)
        
      }
      Divider()
        .padding(.vertical, 4)
      
    }
  }
}

struct SettingLabelView_Previews: PreviewProvider {
  static var previews: some View {
    SettingLabelView(labelTitle: "Text Label", labelImage: "heart")
      .previewLayout(.sizeThatFits)
  }
}
