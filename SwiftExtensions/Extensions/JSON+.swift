import Foundation

public extension Data {
    init?(json: Any) {
        guard let data = try? JSONSerialization.data(withJSONObject: json, options: .fragmentsAllowed)
        else { return nil }
        
        self.init(data)
    }
    
    func jsonToDictionary() -> [String: Any]? {
        (try? JSONSerialization.jsonObject(with: self, options: .allowFragments)) as? [String: Any]
    }
    
    func jsonToArray() -> [Any]? {
        (try? JSONSerialization.jsonObject(with: self, options: .allowFragments)) as? [Any]
    }
}

public extension String {
    init?(json: Any) {
        guard let data = Data(json: json) else { return nil }
        self.init(decoding: data, as: UTF8.self)
    }
    
    func jsonToDictionary() -> [String: Any]? {
        self.data(using: .utf8)?.jsonToDictionary()
    }
    
    func jsonToArray() -> [Any]? {
        self.data(using: .utf8)?.jsonToArray()
    }
}
