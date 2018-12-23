//
//  Filter.swift
//  VSCodeStorageCleaner
//
//  Created by Zehua Chen on 12/22/18.
//

import VSCodeStorage
import Utilities

extension Array where Element == VSCodeStorage {

    func filter(using: Filter) -> [VSCodeStorage] {

        switch using {
        case .all:
            return self
        case .gone:
            return self.gone
        case .workspaces:
            return self.workspaces
        }

    }

}
