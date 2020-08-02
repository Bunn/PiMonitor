//
//  PiMetrics.swift
//  
//
//  Created by Fernando Bunn on 25/07/2020.
//

import Foundation

public struct PiMetrics: Codable {
    public let socTemperature: Double
    public let uptime: Double
    public let loadAverage: [Double]
    public let kernelRelease: String
    public let memory: Memory
}

public struct Memory: Codable {
    public let totalMemory: Int
    public let freeMemory: Int
    public let availableMemory: Int
}
