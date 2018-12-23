//
//  About.swift
//  Utilities
//
//  Created by Zehua Chen on 12/16/18.
//

struct Version: CustomStringConvertible {

    /// Major version
    let major: Int

    /// Minor version
    let minor: Int

    /// Path version
    let patch: Int

    public var description: String {
        return "\(major).\(minor).\(patch)"
    }
}

struct About {

    /// Version number
    public static let version = Version(major: 0, minor: 1, patch: 0)

    /// Documentation
    public static let documentation = """
usage: [command] [filters]
command:
    clean: remove vs code cache stored in .../workspaceStorage/
    list: list cache stored in .../workspaceStorage/
filters:
    -gone: caches that no longer exists
    -all: all the cache
    -workspaces: cache that represent a folder, not a file
"""
}
