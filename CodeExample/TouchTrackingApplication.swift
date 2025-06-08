//
//  TouchTrackingApplication.swift
//  CodeExample
//
//  Created by adham khwaldeh on 8/6/25.
//

import UIKit
import CoreMotion
import AccelerometerTouchTrackerSdk


public class TouchTrackingApplication: BaseTouchTrackingApplication, AccelerometerManagerDelegate {
    public static weak var touchListener: ApplicationTouchDelegate?

    private let accelerometerListener = AccelerometerManager()

    public override init() {
        super.init()
        accelerometerListener.delegate = self
        accelerometerListener.startListening()
    }
    
    // MARK: - AccelerometerManagerDelegate

    public nonisolated func accelerometerManager(_ manager: AccelerometerManager, didReceiveData data: CMAccelerometerData){
        print("Accelerometer: x=\(data.acceleration.x), y=\(data.acceleration.y), z=\(data.acceleration.z)")
    }
    public nonisolated func accelerometerManager(_ manager: AccelerometerManager, didFailWithError error: AccelerometerListenerError){
        print("Accelerometer error: \(error)")
    }
 
    public nonisolated override func handleTouchEvent(with event: UIEvent) {
        print("handleTouchEvent error: ")
    }
    
}
