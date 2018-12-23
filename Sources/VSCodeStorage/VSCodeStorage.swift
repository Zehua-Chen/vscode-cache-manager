//
//  VSCodeCacheFilter.swift
//  Utilities
//
//  Created by Zehua Chen on 12/17/18.
//
import Foundation

/// A vscode storage is defined as a folder that stores data used
/// by vscode or its plugins while editing a specific workspace/folder.
public enum VSCodeStorage: Equatable, CustomStringConvertible {

    /// Representation of the json file "workspace.json"
    fileprivate struct _Workspace: Decodable {
        /// "folder" where the edited folder is
        var folder: String?
        /// "configuration": where the edited folder is
        var configuration: String?
        /// The name by which the json file is stored
        static let fileName = "workspace.json"
    }
    /// Workspace, both folder and workspace storage are considered to be
    /// workspace storage as they are similar.
    case workspace(path: String, workspacePath: String)
    /// Unrecognized storage
    case other(path: String)

    public var description: String {

        switch self {
        case .workspace(let path, _):
            return path
        case .other(let path):
            return path
        }

    }

    /// Find Visual Studio Code' code storage
    ///
    /// - Parameter path: a path representing the **User** folder storing
    /// VS Code's storage, in VS Code' cache folder.
    /// - Returns: an array of storage items
    public static func find(
        in path: String = FileManager.vscodeCachePath) -> [VSCodeStorage] {

        do {
            let storagePath = "\(path)/workspaceStorage"
            let manager = FileManager.default
            var folders = try manager.contentsOfDirectory(atPath: storagePath)
            
            folders.resolveAll(to: storagePath)

            return _inspect(folders: folders)
        } catch {
            return []
        }

    }

    /// Go over vs code storages
    ///
    /// - Parameters:
    ///   - folders: a list of folders to go over
    ///   - manager: file manager used to go over the folders
    /// - Returns: A list of VSCodeStorage describing the folders
    fileprivate static func _inspect(folders: [String]) -> [VSCodeStorage] {

        var caches = [VSCodeStorage]()
        let decoder = JSONDecoder()
        let manager = FileManager.default

        for folder in folders {
            // During folders.resolveAll, all nonfolders are cleared
            if folder.isEmpty {
                continue
            }
            
            let workspaceFile = folder.with(path: _Workspace.fileName)

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

                    // Get rid of redundant "file://"
                    if workspacePath.starts(with: "file://") {
                        let startIndex = workspacePath.startIndex
                        let endIndex = workspacePath.index(
                            startIndex, offsetBy: 6)
                        workspacePath.removeSubrange(startIndex...endIndex)
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

fileprivate extension Array where Element == String {

    /// Resolve all relative path names to a parent path name
    ///
    /// - Parameter parent: the parent path name
    mutating func resolveAll(to parent: String) {

        for i in 0..<self.count {

            if self[i] == ".DS_Store" {
                self[i].removeAll()
                continue
            }

            self[i] = parent.with(path: self[i])

        }

    }

}
