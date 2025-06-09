//
//  ControllerTouchListener.swift
//  AccelerometerTouchtrackerIosSdk
//
//  Created by adham khwaldeh on 8/6/25.
//

// BaseTouchTrackingViewController.swift

import UIKit

//@objc(BaseTouchTrackingViewController)
//@objcMembers
@objc
public class BaseTouchTrackingViewController: UIViewController ,ControllerTouchDelegate{
   
    @objc public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if let touches = event?.allTouches, !touches.isEmpty {
            handleTouchEvent(with: event)
        }
    }

    @objc public nonisolated func handleTouchEvent(with event: UIEvent?) {
        // Abstract: Subclasses should override this method
        // Optionally, you can use fatalError() to enforce override
        // fatalError("Subclasses must override handleTouchEvent(_:)")
    }
}
