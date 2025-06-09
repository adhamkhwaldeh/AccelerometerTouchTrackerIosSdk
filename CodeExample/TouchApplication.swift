//
//  TouchApplication.swift
//  CodeExample
//
//  Created by adham khwaldeh on 9/6/25.
//
import UIKit
import CoreMotion
import AccelerometerTouchtrackerIosSdk

public class TouchApplication:BaseTouchObjCApplication,AccelerometerManagerDelegate{
  
    
    public static weak var touchListener: ApplicationTouchDelegate?

    private let accelerometerListener = AccelerometerManager()

    public override init() {
        super.init()
        accelerometerListener.delegate = self
        self.onTouchesEvent = { [weak self] touches, event in
            guard let self = self else { return }
            // Handle touch events here
            print("Touches: \(touches), Event: \(event)")
        }
        accelerometerListener.startListening()
    }

    // MARK: - AccelerometerManagerDelegate
    public nonisolated func accelerometerManager(with manager: AccelerometerTouchtrackerIosSdk.AccelerometerManager, didReceiveData data: CMAccelerometerData) {
                print("Accelerometer: x=\(data.acceleration.x), y=\(data.acceleration.y), z=\(data.acceleration.z)")
    }
    
    public nonisolated func accelerometerManager(with manager: AccelerometerTouchtrackerIosSdk.AccelerometerManager, didFailWithError error: AccelerometerTouchtrackerIosSdk.AccelerometerListenerError) {
                print("Accelerometer error: \(error)")
    }

//    public nonisolated override func handleTouchEvent(with event: UIEvent) {
//        print("handleTouchEvent error: ")
//    }

}
