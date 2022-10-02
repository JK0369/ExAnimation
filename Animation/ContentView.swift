//
//  ContentView.swift
//  Animation
//
//  Created by 김종권 on 2022/10/02.
//

import SwiftUI

struct ContentView : View {
  private let duration = 3.0
  @State var isAnimated = false
  @State var width1 = 150.0
  @State var width2 = 150.0
  @State var width3 = 150.0
  @State var width4 = 150.0
  @State var width5 = 150.0
  
  var body: some View {
    GeometryReader { geometry in
      VStack {
        Text("default")
          .frame(width: width1, height: geometry.size.height / 6)
          .background(Color.blue)
        Text("easeIn")
          .frame(width: width2 , height: geometry.size.height / 6)
          .background(Color.purple)
        Text("easeInOut")
          .frame(width: width3 , height: geometry.size.height / 6)
          .background(Color.orange)
        Text("easeOut")
          .frame(width: width4 , height: geometry.size.height / 6)
          .background(Color.green)
        Text("easeOut")
          .frame(width: width5 , height: geometry.size.height / 6)
          .background(Color.red)
        Button(action: {
          defer { isAnimated.toggle() }
          if isAnimated {
            width1 = 150.0
            width2 = 150.0
            width3 = 150.0
            width4 = 150.0
            width5 = 150.0
          } else {
            withAnimation{
              width1 = geometry.size.width
            }
            withAnimation(.easeIn(duration: duration)) {
              width2 = geometry.size.width
            }
            withAnimation(.easeInOut(duration: duration)) {
              width3 = geometry.size.width
            }
            withAnimation(.easeOut(duration: duration)) {
              width4 = geometry.size.width
            }
            withAnimation(.linear(duration: duration)) {
              width5 = geometry.size.width
            }
          }
        }) {
          Text("애니메이션")
        }
        .frame(width: geometry.size.width, height: geometry.size.height / 6)
        .foregroundColor(.blue)
      }
    }
  }
}
