//
//  ContentView.swift
//  Fill_Light
//
//  Created by chongyuyuan on 2025-03-07.
//

import SwiftUI

struct ContentView: View {
    @State private var bgColor: Color = .white  // 颜色状态，默认白色
    @State private var brightness: CGFloat = UIScreen.main.brightness  // 屏幕亮度

    var body: some View {
        VStack {
            Spacer()

            // 颜色选择器
            ColorPicker("选择补光颜色", selection: $bgColor)
                .padding()
                .labelsHidden()

            // 亮度调节
            Slider(value: $brightness, in: 0...1, step: 0.05) {
                Text("亮度")
            }
            .padding()
            .onChange(of: brightness) { newValue in
                UIScreen.main.brightness = newValue  // 调整屏幕亮度
            }

            Spacer()
        }
        .background(bgColor)  // 设置背景颜色
        .edgesIgnoringSafeArea(.all)  // 让颜色填充整个屏幕
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
