//
//  ContentView.swift
//  LSM
//
//  Created by Jafthe Jethro Camargo Pulgarin on 06/04/23.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @State private var menu = false
    
    @State private var capturedImage: UIImage? = nil
    @State private var isCustomCameraViewPresenteed = false
    
    var body: some View {
        VStack {
            CustomCameraView()
        }
        .edgesIgnoringSafeArea(.all)
        .sheet(isPresented: $menu) {
            Menu()
                .presentationDetents([.fraction(2/8), .large])
                .interactiveDismissDisabled()
        }
        .onAppear {
            menu = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
