//
//  ControllerTouchDelegate.swift
//  AccelerometerTouchtrackerIosSdk
//
//  Created by adham khwaldeh on 8/6/25.
//
import UIKit

public protocol ControllerTouchDelegate: AnyObject {
    func handleTouchEvent(with event: UIEvent?)
}
