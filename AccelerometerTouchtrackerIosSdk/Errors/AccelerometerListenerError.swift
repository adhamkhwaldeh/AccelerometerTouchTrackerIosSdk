//
//  AccelerometerListenerError.swift
//  AccelerometerTouchtrackerIosSdk
//
//  Created by adham khwaldeh on 8/6/25.
//


@objc public enum AccelerometerListenerError: Int {
    case accelerometerUnavailable = 0
}

extension AccelerometerListenerError: Error {}
