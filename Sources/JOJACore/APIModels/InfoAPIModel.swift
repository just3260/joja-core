//
//  File.swift
//  
//
//  Created by Andrew on 2023/12/20.
//

import Foundation

public struct InfoAPIModel: Codable, Hashable, Sendable {
    public let version: String
    public let minimumClientVersion: String

    public init(version: String, minimumClientVersion: String) {
        self.version = version
        self.minimumClientVersion = minimumClientVersion
    }

    public static let sample: InfoAPIModel = .init(
        version: "1.2.0",
        minimumClientVersion: "1.0.0"
    )
}
