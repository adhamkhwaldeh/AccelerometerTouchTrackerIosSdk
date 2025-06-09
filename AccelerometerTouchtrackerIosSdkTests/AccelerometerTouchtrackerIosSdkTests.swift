//
//  AccelerometerTouchtrackerIosSdkTests.swift
//  AccelerometerTouchtrackerIosSdkTests
//
//  Created by adham khwaldeh on 9/6/25.
//

import XCTest
import CoreMotion
@testable import AccelerometerTouchtrackerIosSdk

class AccelerometerManagerTests: XCTestCase {

    func testStartListening_WhenAccelerometerUnavailable_CallsDelegateWithError() {
        class MockDelegate: AccelerometerManagerDelegate {
            var didFailWithErrorCalled = false
            func accelerometerManager(with manager: AccelerometerManager, didReceiveData data: CMAccelerometerData) {}
            func accelerometerManager(with manager: AccelerometerManager, didFailWithError error: AccelerometerListenerError) {
                didFailWithErrorCalled = true
            }
        }

        let manager = AccelerometerManager()
        let delegate = MockDelegate()
        manager.delegate = delegate

        // Simulate unavailable accelerometer
        manager.motionManager = CMMotionManager()
//        manager.motionManager.isAccelerometerAvailable = false

        manager.startListening(updateInterval: 0.1)
        XCTAssertTrue(delegate.didFailWithErrorCalled)
    }
}
