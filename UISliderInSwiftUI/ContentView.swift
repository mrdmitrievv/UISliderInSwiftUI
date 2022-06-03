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
  
  var body: some View {
    VStack(spacing: 20) {
      Text("Подвинь слайдер, как можно ближе к: \(targetValue)")
        .font(.title3)
      HStack {
        Text("0")
        ColorUISlider(value: $currentValue, alphaValue: computeScore(), color: .red)
        Text("100")
      }
      ButtonView(title: "Проверь меня!", action: { alertIsPresented.toggle() })
        .alert(isPresented: $alertIsPresented) {
          Alert(title: Text("Твой результат:"),
                message: Text(" \(computeScore()) балл(ов) :)")
          )
        }
      ButtonView(title: "Начать заново", action: updateTargetValue)
    }
    .padding([.leading, .trailing])
  }
}

extension ContentView {
  private func computeScore() -> Int {
    let difference = abs(targetValue - lround(currentValue))
    return 100 - difference
  }
  
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
