//
//  PiMetrics.swift
//  
//
//  Created by Fernando Bunn on 25/07/2020.
//

import Foundation

public struct PiMetrics: Decodable {
    public let socTemperature: Double
    public let uptime: Double
    public let loadAverage: [Double]
    public let kernelRelease: String
    public let memory: Memory
}

public struct Memory: Decodable {
    public let totalMemory: Int
    public let freeMemory: Int
    public let availableMemory: Int
}

extension PiMetrics {
    public static func mockData() -> PiMetrics {
        PiMetrics(socTemperature: 10, uptime: 10, loadAverage: [10,20,30], kernelRelease: "10.20", memory: Memory(totalMemory: 100, freeMemory: 10, availableMemory: 20))
    }
}
