//
//  ArrayExtension.swift
//  Utilities
//
//  Created by Zehua Chen on 12/19/18.
//
import Foundation

public extension Array where Element == VSCodeStorage {

    func filter(using filter: VSCodeStorageFilter) -> [VSCodeStorage] {

        switch filter {
        case .all:
            return self
        case .workspaces:
            return _pick(workspaces: self)
        case .gone:
            return _pick(gone: self)
        }

    }

    fileprivate func _pick(
        workspaces storages: [VSCodeStorage]) -> [VSCodeStorage] {

        var temp = [VSCodeStorage]()
        temp.reserveCapacity(storages.count)

        for storage in storages {

            switch storage {
            case .workspace(_, _):
                temp.append(storage)
            default:
                break
            }

        }

        return temp
    }

    fileprivate func _pick(
        gone storages: [VSCodeStorage]) -> [VSCodeStorage] {

        var temp = [VSCodeStorage]()
        temp.reserveCapacity(storages.count)
        let manager = FileManager.default

        for storage in storages {

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
