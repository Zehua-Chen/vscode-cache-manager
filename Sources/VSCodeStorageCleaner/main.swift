//
//  Clean.swift
//  VSCodeStorageCleaner
//
//  Created by Zehua Chen on 12/18/18.
//

import Utilities
import VSCodeStorage
import Foundation

internal func remove(storages: [VSCodeStorage]) {

    print("The following storage will be removed")
    print(storages: storages)
    print("Proceed [Y/N]?", separator: "", terminator: " ")

    var input = readLine() ?? ""

    if input.isEmpty {
        input = "Y"
    }

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
    remove(storages: VSCodeStorage.find().filter(using: options.filter))
case .list:
    print(storages: VSCodeStorage.find().filter(using: options.filter))
case .help:
    print(About.documentation)
case .version:
    print("Version \(About.version)")
}
