//
//  ContentView.swift
//  LSM
//
//  Created by Jafthe Jethro Camargo Pulgarin on 06/04/23.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @State private var menu = true
    @State private var showText = false
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            CustomCameraView()
            
            VStack {
                Text("Apunte el teléfono hacia la persona")
                    .font(.headline)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .font(.system(size: 15))
            .foregroundColor(Color.white)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
        }
        .edgesIgnoringSafeArea(.all)
        .sheet(isPresented: $menu) {
            Menu()
                .presentationDetents([.fraction(2/8), .medium])
                .presentationCornerRadius(20)
                .interactiveDismissDisabled()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
