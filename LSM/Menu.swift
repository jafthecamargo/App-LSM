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
    
    @State var textArray = ["Hola", "Como estás", "Me llamo", "M-A-F-E-R", "Mucho gusto"]
    @State var textIndex = 0
    @State private var selectedColorIndex = 0
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Text(textArray[textIndex])
                .foregroundColor(colorScheme == .dark ? Color.white.opacity(0.9) : Color.black.opacity(0.9))
                .font(.system(size: 30, weight: .bold))
                .opacity(0.9)
                .padding(.horizontal, 50)
                .padding(.vertical, 40)
                .multilineTextAlignment(.center)
                .lineSpacing(30)
                .lineLimit(1)
            
            Spacer()
                
            HStack {
                Button(action: {
                    self.info.toggle()
                }) {
                    Image(systemName: "info.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.accentColor)
                }
                .sheet(isPresented: $info) {
                    Info(info: $info)
                        .presentationDetents([.medium])
                }
                Spacer()
                Button(action: {
                    self.config.toggle()
                }) {
                    Image(systemName: "gear")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                }
                .sheet(isPresented: $config) {
                    ConfigurationView(config: $config)
                        .presentationDetents([.fraction(6/8)])
                }
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 10)
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { timer in
                withAnimation(.easeOut(duration: 0.5)) {
                    self.textIndex = (self.textIndex + 1) % self.textArray.count
                }
            }
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
