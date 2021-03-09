//
//  CarouseView.swift
//  DogGram
//
//  Created by 张剑 on 2021/3/9.
//

import SwiftUI

struct CarouseView: View {
  
  @State var selection: Int = 0
  let maxCount: Int = 8
  @State var timerAdded: Bool = false
  
  var body: some View {
    TabView(selection: self.$selection,
            content:  {
              ForEach(1 ..< maxCount) { count in
                Image("dog\(count)")
                  .resizable()
                  .scaledToFill()
                  .tag(count)
              }
            })
      .tabViewStyle(PageTabViewStyle())
      .background(Color.red)
      .frame(height: 300)
      .animation(.default)
      .onAppear(perform: {
        if !self.timerAdded {
          addTimer()
        }
      })
  }
  
  // MARK: FUNCTIONS
  
  func addTimer() {
    
    timerAdded = true
    
    let timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { (timer) in
      
      if selection == (maxCount - 1) {
        selection = 0
      } else {
        selection += 1
      }
      
      
    }
    
    timer.fire()
    
  }
  
}

struct CarouseView_Previews: PreviewProvider {
  static var previews: some View {
    CarouseView()
      .previewLayout(.sizeThatFits)
  }
}
