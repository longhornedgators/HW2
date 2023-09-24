/// Copyright (c) 2023 Kodeco Inc.
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

enum Constants{
  enum General {
    public static let borderWidth = CGFloat(8)
    public static let startSliderValue = Double(0)
    public static let endSliderValue = Double(255)
    public static let endPadding = Double(20)
  }
}

struct ContentView: View {
  @State private var alertIsVisible: Bool = false
  @State private var sliderValue: Double = 0.0
  @State private var sliderColor: Color = Color.white
  @State private var redSliderValue: Double = 0.0
  @State private var greenSliderValue: Double = 0.0
  @State private var blueSliderValue: Double = 0.0
  @State private var foregroundColor = Color(red: 255, green: 50, blue: 0)

  var body: some View {
    ZStack {
      Color("BackgroundColor")
          .ignoresSafeArea()
    VStack {
      
      FontText(text: "Color Picker")

      RoundedRectangle(cornerRadius: 0)
        .foregroundColor(foregroundColor)
        .border(Color.brown, width: Constants.General.borderWidth)
       
      
      VStack {
        Text("Red")
          .foregroundColor(Color("TextColor"))
        SliderView(sliderValue: $redSliderValue, sliderColor: .constant(Color.red))
      }
      VStack {
        Text("Green")
          .foregroundColor(Color("TextColor"))
        SliderView(sliderValue: $greenSliderValue, sliderColor: .constant(Color.green))
      }
      VStack {
        Text("Blue")
          .foregroundColor(Color("TextColor"))
        SliderView(sliderValue: $blueSliderValue, sliderColor: .constant(Color.blue))
      }
      
      ButtonView(redSliderValue: $redSliderValue, greenSliderValue: $greenSliderValue, blueSliderValue: $blueSliderValue, foregroundColor: $foregroundColor)
   
    }
    .padding(Constants.General.endPadding)
    
    }
  }
}

struct ButtonView: View {
    @Binding var redSliderValue: Double
    @Binding var greenSliderValue: Double
    @Binding var blueSliderValue: Double
    @Binding var foregroundColor: Color
    
    var body: some View{
      Button("Set Color") {
        foregroundColor = Color(red: redSliderValue / 255, green: greenSliderValue / 255, blue: blueSliderValue / 255)
      }
      .frame(width: 150.0, height: 50.0)
      .background(
          ZStack {
              Color("ButtonColor")
            LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
              
          }
      )
      .foregroundColor(.white)
      .cornerRadius(21)
      .bold()
      .font(.title)
    }
   
    }

struct SliderView: View {
    @Binding var sliderValue: Double
    @Binding var sliderColor: Color
    var body: some View{
        HStack {
          Slider(value: $sliderValue, in: Constants.General.startSliderValue...Constants.General.endSliderValue)
            .accentColor(sliderColor)
            Text("\(Int(sliderValue.rounded()))")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
    ContentView()
        .preferredColorScheme(.dark)
        .previewDevice("iPhone 14 Pro Max")
  }
}

