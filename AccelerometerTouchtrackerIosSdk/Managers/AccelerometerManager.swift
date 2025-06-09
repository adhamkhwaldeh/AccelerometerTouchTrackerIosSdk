//
//  AccelerometerListener.swift
//  AccelerometerTouchtrackerIosSdk
//
//  Created by adham khwaldeh on 8/6/25.
//

// Updated AccelerometerManager
import CoreMotion

@objcMembers
public class AccelerometerManager : NSObject{
    public var motionManager = CMMotionManager()
    public weak var delegate: AccelerometerManagerDelegate?

    public override init() {}

    public func startListening(updateInterval: TimeInterval = 0.1) {
        guard motionManager.isAccelerometerAvailable else {
            delegate?.accelerometerManager(with: self, didFailWithError: .accelerometerUnavailable)
            return
        }
        motionManager.accelerometerUpdateInterval = updateInterval
        motionManager.startAccelerometerUpdates(to: .main) { [weak self] data, _ in
            guard let self = self, let data = data else { return }
            self.delegate?.accelerometerManager(with: self, didReceiveData: data)
        }
    }

    public func stopListening() {
        motionManager.stopAccelerometerUpdates()
    }
}
