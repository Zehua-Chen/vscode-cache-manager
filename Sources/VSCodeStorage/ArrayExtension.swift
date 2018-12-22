//
//  ArrayExtension.swift
//  Utilities
//
//  Created by Zehua Chen on 12/19/18.
//
import Foundation

public extension Array where Element == VSCodeStorage {

    /// Filter the array of vs code storage and returns a new array of filtered
    /// items
    ///
    /// - Parameter filter: the filter to apply
    /// - Returns: the filtered arrays
    func filter(using filter: VSCodeStorageFilter) -> [VSCodeStorage] {

        switch filter {
        case .all:
            return self
        case .workspaces:
            return self.workspaces
        case .gone:
            return self.gone
        }

    }

    /// A list of workspaces
    var workspaces: [VSCodeStorage] {

        var temp = [VSCodeStorage]()
        temp.reserveCapacity(self.count)

        for storage in self {

            switch storage {
            case .workspace(_, _):
                temp.append(storage)
            default:
                break
            }

        }

        return temp
    }

    /// A list of storages that are considered to be gone
    var gone: [VSCodeStorage] {

        var temp = [VSCodeStorage]()
        temp.reserveCapacity(self.count)
        let manager = FileManager.default

        for storage in self {

            switch storage {
            case .workspace(_, let workspacePath):
                if !manager.fileExists(atPath: workspacePath) {
                    temp.append(storage)
                }
            default:
                temp.append(storage)
            }
        }

        return temp
    }
}
