import XCTest
import Foundation
import VSCodeStorage

final class ArrayExtensionTest: XCTestCase {

    func testAll() {
        let storages = [
            VSCodeStorage.workspace(path: "wierd", workspacePath: "wierd"),
            VSCodeStorage.other(path: "philosophy")
        ]

        let filtered = storages.filter(using: .all)

        XCTAssert(filtered == storages)
    }

    func testWorkspace() {
        let storages = [
            VSCodeStorage.workspace(path: "wierd", workspacePath: "wierd"),
            VSCodeStorage.other(path: "philosophy")
        ]

        let filtered = storages.filter(using: .workspaces)
        let expected = [
            VSCodeStorage.workspace(path: "wierd", workspacePath: "wierd")
        ]

        XCTAssert(filtered == expected)
    }

    func testGone() {
        let currentPath = Bundle.main.bundlePath

        let storages = [
            VSCodeStorage.workspace(path: "wierd", workspacePath: currentPath),
            VSCodeStorage.workspace(path: "wierd", workspacePath: "wierd"),
            VSCodeStorage.other(path: "philosophy")
        ]

        let filtered = storages.filter(using: .gone)
        let expected = [
            VSCodeStorage.workspace(path: "wierd", workspacePath: "wierd"),
            VSCodeStorage.other(path: "philosophy")
        ]

        XCTAssert(filtered == expected)
    }
}
