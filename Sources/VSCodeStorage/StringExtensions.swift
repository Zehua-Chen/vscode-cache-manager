//
//  StringExtensions.swift
//  VSCodeStorage
//
//  Created by Zehua Chen on 12/19/18.
//

internal extension String {

    mutating func append(path: String) {

        guard let lastLetter = self.last else {
            self.append(path)
            return
        }

        if self.isEmpty {
            self = path
            return
        }

        if path.isEmpty {
            return
        }

        if path.starts(with: "/") {

            // If path has content other than "/"
            if path.count < 2 {
                return
            }

            if lastLetter == "/" {
                self.append(
                    contentsOf: path[path.index(after: path.startIndex)...])
            } else {
                self.append(path)
            }

        } else {

            if lastLetter == "/" {
                self.append(path)
            } else {
                self.append("/\(path)")
            }

        }

    }

    func with(path: String) -> String {
        var temp = self
        temp.append(path: path)

        return temp
    }
}
