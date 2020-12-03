//
//  JSONObject.swift
//  TeskTaskYushkov
//
//  Created by Иван Юшков on 03.12.2020.
//

import Foundation

struct JSONObject: Decodable {
    let data: [Datum]
    let error: String
}

struct Datum: Decodable {
    let id: Int
    let title: String
    let imageSquare1X, imageSquare2X, imageSquare3X: String
    let imageWide1X, imageWide2X, imageWide3X: String
    let isRecommended, isKeystone, isUserCreated: JSONNull
    let rateAverage: Double
    let rateCount: Int
    let isCore: String?
    let isActive: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case imageSquare1X = "image-square1x"
        case imageSquare2X = "image-square2x"
        case imageSquare3X = "image-square3x"
        case imageWide1X = "image-wide1x"
        case imageWide2X = "image-wide2x"
        case imageWide3X = "image-wide3x"
        case isRecommended = "is-recommended"
        case isKeystone = "is-keystone"
        case isUserCreated = "is-user-created"
        case rateAverage = "rate-average"
        case rateCount = "rate-count"
        case isCore = "is-core"
        case isActive = "is_active"
    }
    
    class JSONNull: Codable, Hashable {
        
        public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
            return true
        }
        
        public var hashValue: Int {
            return 0
        }
        
        public init() {}
        
        public required init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if !container.decodeNil() {
                throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
            }
        }
        
        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encodeNil()
        }
    }
}
