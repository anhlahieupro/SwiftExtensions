import Foundation

public extension Encodable where Self: Decodable {
    func copyCodable() throws -> Self {
        let data = try JSONEncoder().encode(self)
        return try JSONDecoder().decode(Self.self, from: data)
    }
}
