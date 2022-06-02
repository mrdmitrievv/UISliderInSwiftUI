//
//  ButtonView.swift
//  UISliderInSwiftUI
//
//  Created by Артём Дмитриев on 02.06.2022.
//

import SwiftUI

struct ButtonView: View {
  var title: String
  var action: () -> Void
  
    var body: some View {
      Button(action: action, label: {
        Text("\(title)")
          .foregroundColor(.blue)
          .font(.title2)
      })
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
      ButtonView(title: "Проверь меня!", action: {})
    }
}
