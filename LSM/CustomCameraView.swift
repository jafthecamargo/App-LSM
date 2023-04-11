//
//  CustomCameraView.swift
//  LSM
//
//  Created by Jafthe Jethro Camargo Pulgarin on 07/04/23.
//

import SwiftUI

struct CustomCameraView: View {
    
    let cameraService = CameraService()
    
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        CameraView(cameraService: cameraService)
    }
}
