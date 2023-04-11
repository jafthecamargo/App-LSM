//
//  CameraView.swift
//  LSM
//
//  Created by Jafthe Jethro Camargo Pulgarin on 07/04/23.
//

import SwiftUI
import AVFoundation

struct CameraView: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController
    
    let cameraService: CameraService
    
    func makeUIViewController(context: Context) -> UIViewController {
        cameraService.start()
        let viewController = UIViewController()
        viewController.view.backgroundColor = .black
        viewController.view.layer.addSublayer(cameraService.previewLayer)
        cameraService.previewLayer.frame = viewController.view.bounds
        return viewController
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(cameraService)
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) { }
    
    class Coordinator: NSObject {
        let cameraService: CameraService
        
        init(_ cameraService: CameraService) {
            self.cameraService = cameraService
        }
    }
}
