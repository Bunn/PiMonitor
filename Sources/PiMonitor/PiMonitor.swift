import Foundation

internal struct Environment {
    var host: String
    var port: Int?
    var secure: Bool = false
}

public struct PiMonitor {
    private var service = Service()
    private let environment: Environment
    
    public var timeoutInterval: TimeInterval {
        set {
            service.timeoutInterval = newValue
        }
        get {
            return service.timeoutInterval
        }
    }
    
    // MARK: Public Methods
    
    public init(host: String, port: Int? = nil, timeoutInterval: TimeInterval = 30, secure: Bool = false) {
        service.timeoutInterval = timeoutInterval
        environment = Environment(host: host, port: port, secure: secure)
    }
    
    public func fetchMetrics(completion: @escaping (Result<PiMetrics, PiMonitorError>) -> ()) {
        service.fetchMetrics(host: environment.host, port: environment.port, secure: environment.secure, completion: completion)
    }
}
