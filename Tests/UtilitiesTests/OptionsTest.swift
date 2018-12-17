import XCTest
import Utilities
import VSCodeCache

final class OptionsTest: XCTestCase {

    func testCleanShort() throws {

        let args = [
            "vscode-cache",
            "clean",
        ]
        let option = Options(from: args)

        XCTAssertEqual(option.action, Options.Action.clean)
        XCTAssertEqual(option.filter, VSCodeCacheFilter.gone)
    }

    func testCleanGone() throws {
        let args = [
            "vscode-cache",
            "clean",
            "-gone"
        ]
        let option = Options(from: args)

        XCTAssertEqual(option.action, Options.Action.clean)
        XCTAssertEqual(option.filter, VSCodeCacheFilter.gone)
    }

    func testCleanWorkspaces() throws {
        let args = [
            "vscode-cache",
            "clean",
            "-workspaces"
        ]
        let option = Options(from: args)

        XCTAssertEqual(option.action, Options.Action.clean)
        XCTAssertEqual(option.filter, VSCodeCacheFilter.workspaces)
    }

    func testCleanAll() throws {
        let args = [
            "vscode-cache",
            "clean",
            "-all"
        ]
        let option = Options(from: args)

        XCTAssertEqual(option.action, Options.Action.clean)
        XCTAssertEqual(option.filter, VSCodeCacheFilter.all)
    }

    func testListShort() throws {
        let args = [
            "vscode-cache",
            "list",
            ]
        let option = Options(from: args)

        XCTAssertEqual(option.action, Options.Action.list)
        XCTAssertEqual(option.filter, VSCodeCacheFilter.all)
    }

    func testListWorkspaces() throws {
        let args = [
            "vscode-cache",
            "list",
            "-workspaces"
        ]
        let option = Options(from: args)

        XCTAssertEqual(option.action, Options.Action.list)
        XCTAssertEqual(option.filter, VSCodeCacheFilter.workspaces)
    }

    func testLisGone() throws {
        let args = [
            "vscode-cache",
            "list",
            "-gone"
        ]
        let option = Options(from: args)

        XCTAssertEqual(option.action, Options.Action.list)
        XCTAssertEqual(option.filter, VSCodeCacheFilter.gone)
    }

    func testListAll() throws {
        let args = [
            "vscode-cache",
            "list",
            "-all"
        ]
        let option = Options(from: args)

        XCTAssertEqual(option.action, Options.Action.list)
        XCTAssertEqual(option.filter, VSCodeCacheFilter.all)
    }
}
