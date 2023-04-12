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
    @State private var selectedColorIndex = 0
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(textArray[textIndex])
                .foregroundColor(colorScheme == .dark ? Color.white.opacity(0.9) : Color.black.opacity(0.9))
                .font(.system(size: 45, weight: .bold))
                .opacity(0.9)
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .multilineTextAlignment(.center)
                .lineSpacing(10)
            
            Spacer()
                
            HStack {
                VStack {
                    Image(systemName: "questionmark.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.accentColor)
                        .fontWeight(.regular)
                        .onTapGesture {
                            info = true
                        }
                        .sheet(isPresented: $info) {
                            Info(info: $info)
                                .presentationDetents([.medium])
                                .presentationCornerRadius(20)
                        }
                }
                .padding(.vertical, 15)
                .padding(.horizontal, 15)
                .background(.ultraThickMaterial)
                .cornerRadius(50)
                
                Spacer()
                
                VStack {
                    Image(systemName: "gear")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .fontWeight(.regular)
                        .onTapGesture {
                            config = true
                        }
                        .sheet(isPresented: $config) {
                            ConfigurationView(config: $config)
                                .presentationDetents([.fraction(6/8)])
                                .presentationCornerRadius(20)
                        }
                }
                .padding(.vertical, 15)
                .padding(.horizontal, 15)
                .background(.ultraThickMaterial)
                .cornerRadius(50)
            }
        }
        .padding(.horizontal, 30)
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { timer in
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
