//
//  TouchWindowDelegate.swift
//  CodeExample
//
//  Created by adham khwaldeh on 9/6/25.
//

import UIKit

@objc public protocol TouchWindowDelegate: AnyObject {
    func touchWindow(_ window: TouchWindow, didReceiveTouches touches: Set<UITouch>, with event: UIEvent)
}
