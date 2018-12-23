//
//  StringExtension.swift
//  VSCodeStorageCleaner
//
//  Created by Zehua Chen on 12/23/18.
//

internal extension String {

    /// Given a path /usr/lib, get the base name of the path, "lib"
    var baseName: Substring {

        guard var i = self.lastIndex(of: "/") else {
            return self[self.startIndex...]
        }

        self.formIndex(after: &i)

        return self[i...]
    }
}
