//
//  TouchWindow.swift
//  CodeExample
//
//  Created by adham khwaldeh on 9/6/25.
//

import UIKit

@objc public class TouchWindow: UIWindow {
    
    // Callback: takes touches and event
    @objc public var onTouchesEvent: ((Set<UITouch>, UIEvent) -> Void)?
    
    override public func sendEvent(_ event: UIEvent) {
        super.sendEvent(event)
        
        if event.type == .touches, let touches = event.allTouches {
            // Call the callback if it exists
            onTouchesEvent?(touches, event)
        }
    }
}
