//
//  UISliderView.swift
//  UISliderInSwiftUI
//
//  Created by Артём Дмитриев on 02.06.2022.
//

import SwiftUI

struct ColorUISlider: UIViewRepresentable {
  @Binding var value: Double
  let alphaValue: Int
  let color: UIColor
  
  func makeUIView(context: Context) -> UISlider {
    let slider = UISlider(frame: .zero)
    slider.minimumValue = 0
    slider.maximumValue = 100
    slider.addTarget(context.coordinator,
                     action: #selector(Coordinator.valueChanged),
                     for: .valueChanged
    )
    
    return slider
  }  
  
  func updateUIView(_ uiView: UISlider, context: Context) {
    uiView.value = Float(value)
    uiView.thumbTintColor = color.withAlphaComponent(CGFloat(alphaValue)/100)
  }
  
  func makeCoordinator() -> Coordinator {
    Coordinator(value: $value)
  }
}

extension ColorUISlider {
  class Coordinator: NSObject {
    @Binding var value: Double
    
    init(value: Binding<Double>) {
      self._value = value
    }
    
    @objc func valueChanged(_ sender: UISlider) {
      value = Double(sender.value)
    }
  }
}

struct ColorUISlider_Previews: PreviewProvider {
    static var previews: some View {
      ColorUISlider(value: .constant(100), alphaValue: 10, color: .red)
    }
}
