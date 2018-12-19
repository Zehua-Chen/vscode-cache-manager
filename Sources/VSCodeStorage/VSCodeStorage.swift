//
//  VSCodeCacheFilter.swift
//  Utilities
//
//  Created by Zehua Chen on 12/17/18.
//
import Foundation

public enum VSCodeStorage: CustomStringConvertible {

    fileprivate struct _Workspace: Decodable {
        var folder: String?
        var configuration: String?
    }
    
    case workspace(path: String, workspacePath: String)
    case other(path: String)

    public var description: String {

        switch self {
        case .workspace(let path, _):
            return path
        case .other(let path):
            return path
        }

    }

    fileprivate static let _workspaceFileName = "workspace.json"

    /// Find Visual Studio Code' code storage
    ///
    /// - Parameter path: a path representing the **User** folder storing
    /// VS Code's storage, in VS Code' cache folder.
    /// - Returns: an array of storage items
    public static func find(
        in path: String = FileManager.vscodeCachePath) -> [VSCodeStorage] {

        let manager = FileManager.default

        do {
            let storagePath = "\(path)/workspaceStorage"
            let folders = try manager
                .contentsOfDirectory(atPath: storagePath)
                .filter{ return $0 != ".DS_Store" }
                .map{ return "\(storagePath)/\($0)" }

            return _inspect(folders: folders, using: manager)
        } catch {
            return []
        }

    }

    fileprivate static func _inspect(
        folders: [String],
        using manager: FileManager) -> [VSCodeStorage] {

        var caches = [VSCodeStorage]()
        let decoder = JSONDecoder()

        for folder in folders {
            
            let workspaceFile = "\(folder)/\(_workspaceFileName)"

            if manager.fileExists(atPath: workspaceFile) {

                let data = manager.contents(atPath: workspaceFile)!

                if let workspace = try? decoder.decode(
                    _Workspace.self,
                    from: data) {

                    var workspacePath = ""

                    if workspace.folder != nil {
                        workspacePath = workspace.folder!
                    } else if workspace.configuration != nil {
                        workspacePath = workspace.configuration!
                    }

                    caches.append(
                        .workspace(
                            path: folder,
                            workspacePath: workspacePath))
                    
                    continue
                }

            }

            caches.append(.other(path: folder))
        }

        return caches
    }
}
