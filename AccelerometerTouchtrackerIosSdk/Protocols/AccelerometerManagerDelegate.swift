//
//  AccelerometerManagerDelegate.swift
//  AccelerometerTouchtrackerIosSdk
//
//  Created by adham khwaldeh on 8/6/25.
//
import CoreMotion

// Protocol definition
@objc public protocol AccelerometerManagerDelegate: AnyObject {
    @objc func accelerometerManager(with manager: AccelerometerManager, didReceiveData data: CMAccelerometerData)
    @objc func accelerometerManager(with manager: AccelerometerManager, didFailWithError error: AccelerometerListenerError)
}
