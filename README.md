# PiMonitor

This is a simple Swift Package for getting Pi-hole metricts from [pi_monitor](https://github.com/Bunn/pi_monitor)


## Interface

```swift
public struct PiMonitor {

    public init(host: String, port: Int? = nil)

    public func fetchSummary(completion: @escaping (Result<PiMetrics, PiMonitorError>) -> ())
}
```
