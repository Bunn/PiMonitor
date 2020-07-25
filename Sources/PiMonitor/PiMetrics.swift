//
//  PiMetrics.swift
//  
//
//  Created by Fernando Bunn on 25/07/2020.
//

import Foundation

public struct PiMetrics: Codable {
    let socTemperature: Double
    let uptime: Double
    let loadAverage: [Double]
    let kernelRelease: String
}
