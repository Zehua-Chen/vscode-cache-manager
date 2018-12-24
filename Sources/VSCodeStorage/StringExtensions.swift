//
//  StringExtensions.swift
//  VSCodeStorage
//
//  Created by Zehua Chen on 12/19/18.
//

internal extension String {

    /// Append a path to a string
    ///
    /// Rules
    /// * `usr/ + lib = usr/lib`
    /// * `usr/ + /lib = usr/lib`
    /// * `usr + /lib = usr/lib`
    /// * `usr + lib = usr/lib`
    /// - Parameter path: the path to append
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

    /// Append a path to a string, and returns the appended string
    ///
    /// - Parameter path: the path to append
    /// - Returns: the new string
    func with(path: String) -> String {
        var temp = self
        temp.append(path: path)

        return temp
    }

    // Remove splace placeholders
    mutating func removeSpacePlaceholders() {
        let startIndex = self.startIndex
        var currentIndex = self.endIndex

        while currentIndex > startIndex {
            self.formIndex(before: &currentIndex)

            if self[currentIndex] == "%" {
                let spacePlaceholderEnd = self.index(currentIndex, offsetBy: 2)

                if self[currentIndex...spacePlaceholderEnd] == "%20" {
                    self.replaceSubrange(
                        currentIndex...spacePlaceholderEnd,
                        with: " ")
                }

            }

        }

    }
}
