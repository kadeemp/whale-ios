//
//  ActivityCaptureViewController.swift
//  whale-ios-kadeem
//
//  Created by Kadeem Palacios on 5/3/17.
//  Copyright © 2017 Kadeem Palacios. All rights reserved.
//

import UIKit
import AVFoundation

class ActivityCaptureViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCameraSession()
        self.tabBarController?.tabBar.isHidden = true
        
        //trying to make the  navbar transparent
        //self.navigationController?.navigationBar.barTintColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 0.2)
        
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(ActivityCaptureViewController.recordVideo)) //Long function will call when user long press on button.
        button.addGestureRecognizer(longGesture)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //Layer that holds camera feed
        view.layer.addSublayer(previewLayer)
        
        cameraSession.startRunning()
        
        button.backgroundColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 0.2)
        button.layer.cornerRadius = button.frame.width/2
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(recordVideo), for: .touchUpInside)
        view.addSubview(button)
    }
    
    let button = UIButton(frame: CGRect(x: 150, y: 500, width: 90, height: 90))
    
    
    func recordVideo() {
        
    }
    
    lazy var cameraSession: AVCaptureSession = {
        let s = AVCaptureSession()
        s.sessionPreset = AVCaptureSessionPresetHigh
        return s
    }()
    
    lazy var previewLayer: AVCaptureVideoPreviewLayer = {
        let preview =  AVCaptureVideoPreviewLayer(session: self.cameraSession)
        preview?.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        preview?.position = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.midY)
        preview?.videoGravity = AVLayerVideoGravityResize
        return preview!
    }()
    
    func setupCameraSession() {
        
        let videoDevices = AVCaptureDevice.devices(withMediaType: AVMediaTypeVideo)
        var captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo) as AVCaptureDevice
        for device in videoDevices! {
            let  device = device as! AVCaptureDevice
            if device.position  == AVCaptureDevicePosition.front {
                captureDevice = device
                break
            }
        }
        do {
            let deviceInput = try AVCaptureDeviceInput(device: captureDevice)
            
            cameraSession.beginConfiguration()
            
            if (cameraSession.canAddInput(deviceInput) == true) {
                cameraSession.addInput(deviceInput)
            }
            
            let dataOutput = AVCaptureVideoDataOutput()
            dataOutput.videoSettings = [(kCVPixelBufferPixelFormatTypeKey as NSString) : NSNumber(value: kCVPixelFormatType_420YpCbCr8BiPlanarFullRange as UInt32)]
            dataOutput.alwaysDiscardsLateVideoFrames = true
            
            if (cameraSession.canAddOutput(dataOutput) == true) {
                cameraSession.addOutput(dataOutput)
            }
            
            cameraSession.commitConfiguration()
            
            let queue = DispatchQueue(label: "com.invasivecode.videoQueue")
            dataOutput.setSampleBufferDelegate(self, queue: queue)
            
        }
        catch let error as NSError {
            NSLog("\(error), \(error.localizedDescription)")
        }
    }
    
    
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputSampleBuffer sampleBuffer: CMSampleBuffer!, from connection: AVCaptureConnection!) {
        // Here you collect each frame and process it
    }
    
    func captureOutput(_ captureOutput: AVCaptureOutput!, didDrop sampleBuffer: CMSampleBuffer!, from connection: AVCaptureConnection!) {
        // Here you can count how many frames are dopped
    }
}
