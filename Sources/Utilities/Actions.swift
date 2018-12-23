//
//  Actions.swift
//  Utilities
//
//  Created by Zehua Chen on 12/22/18.
//

/// Action to perform on the cache.
public enum Action: Equatable, CustomStringConvertible {
    /// Clean caches;
    ///
    /// Command: `clean`
    case clean
    /// List caches
    ///
    /// Command: `list`
    case list
    /// Print Help Info
    ///
    /// Command: `help`
    case help
    /// Print Version
    ///
    /// Command: `version`
    case version

    public var description: String {

        switch self {
        case .clean:
            return "clean"
        case .list:
            return "list"
        case .help:
            return "help"
        case .version:
            return "version"
        }

    }
}

internal extension String {

    /// Convert a string to an action
    var action: Action {

        switch self {
        case "clean":
            return .clean
        case "list":
            return .list
        case "help":
            return .help
        case "version":
            return .version
        default:
            return .help
        }

    }
    
}
