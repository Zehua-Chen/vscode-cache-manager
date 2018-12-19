//
//  VSCodeCacheFilter.swift
//  Utilities
//
//  Created by Zehua Chen on 12/17/18.
//
import Foundation

public enum VSCodeCache {
    
    case workspace(path: String, workspacePath: String)
    case other(path: String)

    public static func findCaches(
        in path: String = FileManager.vscodeCachePath) -> [VSCodeCache] {

        let manager = FileManager.default

        do {
            let folders = try manager.contentsOfDirectory(atPath: path)
            return _goThroughFolders(folders: folders)

        } catch {
            return []
        }

    }

    fileprivate static func _goThroughFolders(
        folders: [String]) -> [VSCodeCache] {

        var caches = [VSCodeCache]()

        for folder in folders {
            
            if folder != ".DS_Store" {
                caches.append(.other(path: folder))
            }

        }

        return caches
    }

}
