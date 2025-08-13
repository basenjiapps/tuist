import Foundation
import Path

public protocol XCStringsLinking {
    func link(path: AbsolutePath) throws
}

public class XCStringsLinker: XCStringsLinking {
    public init() {}
    
    public func link(path: AbsolutePath) throws {
        try link(target: path.dirname)
    }
    
    func link(target: String) throws {
        var arguments: [String] = []
        arguments.append(contentsOf: ["swift-sh"])
        arguments.append("\(target)/Scripts/utilities/fix_xcstrings_linking/run.swift")
        
        try System.shared.run(arguments)
    }
}
