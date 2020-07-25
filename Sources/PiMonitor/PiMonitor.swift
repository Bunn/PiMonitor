internal struct Environment {
    var host: String
    var port: Int?
}


public struct PiMonitor {
    private let service = Service()
    private let environment: Environment
    
    
    // MARK: Public Methods
    
    public init(host: String, port: Int? = nil) {
        environment = Environment(host: host, port: port)
    }
    
    public func fetchSummary(completion: @escaping (Result<PiMetrics, PiMonitorError>) -> ()) {
        service.fetchMetrics(host: environment.host, port: environment.port, completion: completion)
    }
}
