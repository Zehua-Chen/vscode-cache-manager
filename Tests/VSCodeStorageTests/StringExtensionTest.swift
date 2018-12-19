//
//  StringExtension.swift
//  VSCodeStorageTests
//
//  Created by Zehua Chen on 12/19/18.
//

import XCTest
@testable import VSCodeStorage

final class StringExtensionTest: XCTestCase {

    func testEmpty() {
        var path = ""
        path.append(path: "usr")

        XCTAssertEqual("usr", path)

        path = "usr"
        path.append(path: "")

        XCTAssertEqual("usr", path)
    }

    func testSimple() {
        var path = "/usr"
        path.append(path: "/lib")

        XCTAssertEqual("/usr/lib", path)

        path = "/usr/"
        path.append(path: "lib")

        XCTAssertEqual("/usr/lib", path)
    }

    func testDuplicate() {
        var path = "/usr/"
        path.append(path: "/lib")

        XCTAssertEqual("/usr/lib", path)
    }

    func testMissing() {
        var path = "/usr"
        path.append(path: "lib")

        XCTAssertEqual("/usr/lib", path)
    }
}
