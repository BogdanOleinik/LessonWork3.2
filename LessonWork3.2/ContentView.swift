//
//  ContentView.swift
//  LessonWork3.2
//
//  Created by Олейник Богдан on 23.02.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderValue = Double.random(in: 0...255)
    @State private var userName = ""
    @State private var displayName = ""
    @State private var alertPressed = false
    
    var body: some View {
        VStack(spacing: 40) {
            Text("\(lround(sliderValue))")
                .font(.largeTitle)
            UserNameView(userName: displayName)
            ColorSliderView(value: $sliderValue, color: .red)
            TextField("Enter your name", text: $userName)
                .textFieldStyle(.roundedBorder)
            Button("Done", action: checkUserName)
                .alert("Wrong format", isPresented: $alertPressed, actions: {}) {
                    Text("Enter you name")
                }
            VStack {
                Text("Welcome to")
                    .font(.system(size: 60))
                    .foregroundColor(.red)
                    .bold()
                Text("SwiftUI")
                    .font(.system(size: 60))
                    .foregroundColor(.red)
                    .bold()
            }
            
            Spacer()
        }
        .padding()
    }
    
    private func checkUserName() {
        if let _ = Double(userName) {
            userName = ""
            alertPressed.toggle()
            return
        }
        displayName = userName
        userName = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorSliderView: View {
    @Binding var value: Double
    let color: Color
    
    var body: some View {
        HStack {
            Text("0").foregroundColor(color)
            Slider(value: $value, in: 0...255, step: 1)
            Text("255").foregroundColor(color)
        }
    }
}

struct UserNameView: View {
    let userName: String
    var body: some View {
        HStack {
            HStack(alignment: .firstTextBaseline) {
                Text("USER NAME: ")
                    .frame(height: 60)
                Text(userName)
                    .font(.largeTitle)
            }
            Spacer()
        }
    }
}
