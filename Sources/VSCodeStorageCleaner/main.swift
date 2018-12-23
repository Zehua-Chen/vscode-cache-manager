//
//  Clean.swift
//  VSCodeStorageCleaner
//
//  Created by Zehua Chen on 12/18/18.
//

import Utilities
import VSCodeStorage
import Foundation

/// Remove a list of storages
///
/// - Parameter storages: the storages to remove
internal func remove(storages: [VSCodeStorage]) {

    print("The following storage will be removed")
    print(storages: storages)
    print("Proceed [Y/N]?", separator: "", terminator: " ")

    var input = readLine() ?? ""

    if input.isEmpty {
        input = "Y"
    }

    guard input != "Y" else { return }

    let manager = FileManager.default

    for storage in storages {

        do {
            switch storage {
            case .other(let path):
                try manager.removeItem(atPath: path)
            case .workspace(let path, _):
                try manager.removeItem(atPath: path)
            }
        } catch {
            print(error.localizedDescription)
        }

    }

}

let options = Options.shared

switch options.action {
case .clean:
    let storages = VSCodeStorage.find().filter(using: options.filter)

    if !storages.isEmpty {
        remove(storages: storages)
    }
case .list:
    print(storages: VSCodeStorage.find().filter(using: options.filter))
case .help:
    print(About.documentation)
case .version:
    print("Version \(About.version)")
}
