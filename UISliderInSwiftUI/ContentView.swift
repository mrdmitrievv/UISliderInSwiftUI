//
//  ContentView.swift
//  UISliderInSwiftUI
//
//  Created by Артём Дмитриев on 02.06.2022.
//

import SwiftUI

struct ContentView: View {
  @State private var currentValue = Double.random(in: 0...100)
  @State private var targetValue = Int.random(in: 0...100)
  @State private var alertIsPresented = false
  @State private var alphaValue: Int = 100
  
  private var yourScore: Int {
    let difference = abs(targetValue - lround(currentValue))
    return 100 - difference
  }
  
  var body: some View {
    VStack(spacing: 20) {
      Text("Подвинь слайдер, как можно ближе к: \(targetValue)")
        .font(.title3)
      
      HStack {
        Text("0")
        ColorUISlider(value: $currentValue, alphaValue: $alphaValue)
          .onChange(of: currentValue, perform: { _ in
            alphaValue = yourScore
          })
        Text("100")
      }
      ButtonView(title: "Проверь меня!", action: { alertIsPresented.toggle() })
        .alert(isPresented: $alertIsPresented) {
          Alert(title: Text("Твой результат:"),
                message: Text(" \(yourScore) балл(ов) :)")
          )
        }
      ButtonView(title: "Начать заново", action: updateTargetValue)
    }
    .padding([.leading, .trailing])
  }
}

extension ContentView {
  private func updateTargetValue() {
    targetValue = Int.random(in: 0...100)
    currentValue = Double.random(in: 0...100)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
