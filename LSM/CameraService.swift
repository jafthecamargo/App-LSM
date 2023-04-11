//
//  CameraService.swift
//  LSM
//
//  Created by Jafthe Jethro Camargo Pulgarin on 07/04/23.
//

import Foundation
import AVFoundation

class CameraService {
    
    var session: AVCaptureSession?
    
    let output = AVCapturePhotoOutput()
    let previewLayer = AVCaptureVideoPreviewLayer()
    
    func start() {
        checkPermissions()
    }
    
    private func checkPermissions() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in
                guard granted else { return }
                DispatchQueue.main.async {
                    self?.setupCamera()
                }
            }
        case .restricted:
            break
        case .denied:
            break
        case .authorized:
            setupCamera()
        @unknown default:
            break
        }
    }
    
    private func setupCamera() {
        let session = AVCaptureSession()
        if let device = AVCaptureDevice.default(for: .video) {
            do {
                let input = try AVCaptureDeviceInput(device: device)
                if session.canAddInput(input) {
                    session.addInput(input)
                }
                
                if session.canAddOutput(output) {
                    session.addOutput(output)
                }
                
                previewLayer.videoGravity = .resizeAspectFill
                previewLayer.session = session
                
                DispatchQueue.global(qos: .userInitiated).async { [weak self] in
                    self?.session?.startRunning()
                }
                
                self.session = session
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
