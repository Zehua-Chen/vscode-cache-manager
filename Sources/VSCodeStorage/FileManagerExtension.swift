//
//  VSCodeCacheManager.swift
//  Utilities
//
//  Created by Zehua Chen on 12/17/18.
//
import Foundation

public extension FileManager {

    public class var vscodeCachePath: String {
        #if os(macOS)
        return "/Users/\(NSUserName())/Library/Application Support/Code/User/workspaceStorage"
        #elseif os(Linux)
        return "?"
        #endif
    }

}
