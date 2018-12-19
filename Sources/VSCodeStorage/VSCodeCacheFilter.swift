//
//  VSCodeCacheFilter.swift
//  Utilities
//
//  Created by Zehua Chen on 12/17/18.
//
/// A filter used to indicate what type of cache to ignore from either
/// the "action"
public enum VSCodeCacheFilter: Equatable, CustomStringConvertible {
    /// All cache
    ///
    /// Command: `-all`
    case all
    /// Cache that does not exist on disks any more
    ///
    /// Command: `-gone`
    case gone
    /// All workspace
    ///
    /// Command: `-workspaces`
    case workspaces

    public var description: String {

        switch self {
        case .all:
            return "-all"
        case .gone:
            return "-gone"
        case .workspaces:
            return "-workspaces"
        }

    }
}
