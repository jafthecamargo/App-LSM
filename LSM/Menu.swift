//
//  Menu.swift
//  LSM
//
//  Created by Jafthe Jethro Camargo Pulgarin on 10/04/23.
//

import SwiftUI

struct Menu: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var config = false
    @State private var info = false
    
    @State var textArray = ["hola", "como", "estás", "mi", "nombre", "m", "a", "f", "e", "r", "mucho", "gusto", "conocerte", "características"]
    @State var textIndex = 0
    @State var previousTexts: [String] = []
    
    @State var gradient = false
    
    let generator = UIImpactFeedbackGenerator(style: .light)
    
    var body: some View {
        VStack {

            ScrollView {
                VStack(spacing: 30) {
                    Spacer()
                    ForEach(previousTexts.reversed().indices, id: \.self) { index in
                        Text(previousTexts.reversed()[index])
                            .foregroundColor(colorScheme == .dark ? Color.white.opacity(index == 0 ? 0.9 : 0.6) : Color.black.opacity(index == 0 ? 0.9 : 0.6))
                            .font(.system(size: index == 0 ? 50 : 40, weight: .bold))
                            .opacity(index == 0 ? 0.9 : 0.6)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
            }
            .padding(.top, 15)
            .scrollDisabled(true)
    
            HStack {
                ZStack(alignment: .center) {
                    Circle()
                        .fill(.ultraThickMaterial)
                        .frame(width: 60, height: 60)
                    Image(systemName: "questionmark.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.accentColor)
                }
                .onTapGesture {
                    generator.impactOccurred()
                    info = true
                }
                .sheet(isPresented: $info) {
                    Info(info: $info)
                        .presentationDetents([.medium])
                        .presentationCornerRadius(20)
                }
                
                Spacer()
                
                ZStack {
                    Circle()
                        .fill(.ultraThickMaterial)
                        .frame(width: 60, height: 60)
                    Image(systemName: "gear")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                }
                .onTapGesture {
                    generator.impactOccurred()
                    config = true
                }
                .sheet(isPresented: $config) {
                    ConfigurationView(config: $config)
                        .presentationDetents([.large])
                        .presentationCornerRadius(20)
                }
            }
        }
        .padding(.horizontal, 30)
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { timer in
                let previousText = self.textArray[self.textIndex]
                self.previousTexts.append(previousText)
                self.textIndex = (self.textIndex + 1) % self.textArray.count
            }
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
