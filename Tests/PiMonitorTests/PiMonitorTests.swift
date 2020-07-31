import XCTest
@testable import PiMonitor

final class PiMonitorTests: XCTestCase {
    func testParser() {
        let data = """
        {"soc_temperature": 66.0, "uptime": 2188039.45, "load_average": [0.02, 0.1, 0.04], "kernel_release": "4.19.118-v7l+", "memory": {"total_memory": 1985984, "free_memory": 507668, "available_memory": 1614632}}
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let decoded = try decoder.decode(PiMetrics.self, from: data)
            XCTAssertEqual(decoded.socTemperature, 66.0, "it should have 66.0 temperature")
            XCTAssertEqual(decoded.uptime, 2188039.45, "it should have 2188039.45 uptime")
            XCTAssertEqual(decoded.kernelRelease, "4.19.118-v7l+", "it should have 4.19.118-v7l+ kernel release")
            
            let loadAverage = decoded.loadAverage
            XCTAssertEqual(loadAverage[0], 0.02, "it should have 0.02 load average1")
            XCTAssertEqual(loadAverage[1], 0.1, "it should have 0.1 load average5")
            XCTAssertEqual(loadAverage[2], 0.04, "it should have 0.04 load average15")
            
            let memory = decoded.memory
            XCTAssertEqual(memory.availableMemory, 1614632, "it should have 1614632 available memory")
            XCTAssertEqual(memory.totalMemory, 1985984, "it should have 1985984 total memory")
            XCTAssertEqual(memory.freeMemory, 507668, "it should have 507668 free memory")
        } catch {
            XCTFail("Can't decode test file bundle \(error)")
        }
    }

    static var allTests = [
        ("testParser", testParser),
    ]
}
