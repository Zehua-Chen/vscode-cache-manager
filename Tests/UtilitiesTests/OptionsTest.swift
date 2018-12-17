import XCTest
import struct Utilities.Options

final class OptionsTest: XCTestCase {

    func testCleanShort() throws {

        let args = [
            "vscode-cache",
            "clean",
        ]
        let option = Options(from: args)

        XCTAssertEqual(option.action, Options.Action.clean)
        XCTAssertEqual(option.filter, Options.Filter.gone)
    }

    func testCleanGone() throws {
        let args = [
            "vscode-cache",
            "clean",
            "-gone"
        ]
        let option = Options(from: args)

        XCTAssertEqual(option.action, Options.Action.clean)
        XCTAssertEqual(option.filter, Options.Filter.gone)
    }

    func testCleanWorkspaces() throws {
        let args = [
            "vscode-cache",
            "clean",
            "-workspaces"
        ]
        let option = Options(from: args)

        XCTAssertEqual(option.action, Options.Action.clean)
        XCTAssertEqual(option.filter, Options.Filter.workspaces)
    }

    func testCleanAll() throws {
        let args = [
            "vscode-cache",
            "clean",
            "-all"
        ]
        let option = Options(from: args)

        XCTAssertEqual(option.action, Options.Action.clean)
        XCTAssertEqual(option.filter, Options.Filter.all)
    }

    func testListShort() throws {
        let args = [
            "vscode-cache",
            "list",
            ]
        let option = Options(from: args)

        XCTAssertEqual(option.action, Options.Action.list)
        XCTAssertEqual(option.filter, Options.Filter.all)
    }

    func testListWorkspaces() throws {
        let args = [
            "vscode-cache",
            "list",
            "-workspaces"
        ]
        let option = Options(from: args)

        XCTAssertEqual(option.action, Options.Action.list)
        XCTAssertEqual(option.filter, Options.Filter.workspaces)
    }

    func testLisGone() throws {
        let args = [
            "vscode-cache",
            "list",
            "-gone"
        ]
        let option = Options(from: args)

        XCTAssertEqual(option.action, Options.Action.list)
        XCTAssertEqual(option.filter, Options.Filter.gone)
    }

    func testListAll() throws {
        let args = [
            "vscode-cache",
            "list",
            "-all"
        ]
        let option = Options(from: args)

        XCTAssertEqual(option.action, Options.Action.list)
        XCTAssertEqual(option.filter, Options.Filter.all)
    }
}
