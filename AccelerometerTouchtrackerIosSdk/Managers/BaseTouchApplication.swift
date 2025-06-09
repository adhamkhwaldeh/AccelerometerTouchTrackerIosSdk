//
//  BaseTouchApplication.swift
//  CodeExample
//
//  Created by adham khwaldeh on 9/6/25.
//

// BaseApplication.swift

import UIKit

@objcMembers public class BaseTouchApplication: UIApplication {
    
    public var onTouchesEvent: ((Set<UITouch>, UIEvent) -> Void)?
    
    override public func sendEvent(_ event: UIEvent) {
        super.sendEvent(event)
        
        if event.type == .touches, let touches = event.allTouches {
            onTouchesEvent?(touches, event)
        }
    }
}
