//
//  ApplicationTouchListener.swift
//  AccelerometerTouchtrackerIosSdk
//
//  Created by adham khwaldeh on 8/6/25.
//

// TouchTrackingApplication.swift
import UIKit

@objc public protocol ApplicationTouchDelegate: AnyObject {
    func handleTouchEvent(with event: UIEvent)
//    func applicationDidDetectTouch(_ touches: Set<UITouch>, with event: UIEvent?)
}
