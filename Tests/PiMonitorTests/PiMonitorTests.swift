import XCTest
@testable import PiMonitor

final class PiMonitorTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(PiMonitor().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
