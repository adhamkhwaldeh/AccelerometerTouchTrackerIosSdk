//
//  BaseTouchTrackingApplication.swift
//  AccelerometerTouchtrackerIosSdk
//
//  Created by adham khwaldeh on 9/6/25.
//

import UIKit
import AccelerometerTouchtrackerIosSdk

@objc open class BaseTouchTrackingApplication: UIApplication{
    
    public override func sendEvent(_ event: UIEvent) {
        super.sendEvent(event)
        if let touches = event.allTouches, !touches.isEmpty {
            handleTouchEvent(with: event)
        }
    }

    open nonisolated  func handleTouchEvent(with event: UIEvent) {
        // Abstract: Subclasses should override this method
        // Optionally, you can use fatalError() to enforce override
        // fatalError("Subclasses must override handleTouchEvent(_:)")
    }
}
