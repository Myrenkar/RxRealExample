/// Defines request's method
enum Method: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

protocol APIRequest {
    
    /// HTTP method
    var method: Method { get }
    
    /// Path to resource
    var path: String { get }
    
    /// HTTP method
    var urlBuilder: APIURLBuilder { get }
}

// MARK: - Default values for API request
extension APIRequest {
    
    var method: Method { return .get }
    
    var urlBuilder: APIURLBuilder { return PokemonURLBuilder() }
}
