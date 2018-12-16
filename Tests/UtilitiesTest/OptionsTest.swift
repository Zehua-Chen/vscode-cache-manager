import XCTest
import Utilities

final class OptionsTest: XCTestCase {

    func test() throws {
        let args = ["vscode-cache"]
        let option = Options(from: args)
        XCTAssertTrue(Options.clean(filter: .gone) == option)
    }

    func testCleanShort() throws {
        let args = [
            "vscode-cache",
            "clean",
        ]
        let option = Options(from: args)
        XCTAssertTrue(Options.clean(filter: .gone) == option)
    }

    func testCleanGone() throws {
        let args = [
            "vscode-cache",
            "clean",
            "-gone"
        ]
        let option = Options(from: args)
        XCTAssertTrue(Options.clean(filter: .gone) == option)
    }

    func testCleanWorkspaces() throws {
        let args = [
            "vscode-cache",
            "clean",
            "-workspaces"
        ]
        let option = Options(from: args)
        XCTAssertTrue(Options.clean(filter: .workspaces) == option)
    }

    func testCleanAll() throws {
        let args = [
            "vscode-cache",
            "clean",
            "-all"
        ]
        let option = Options(from: args)
        XCTAssertTrue(Options.clean(filter: .all) == option)
    }

    func testListShort() throws {
        let args = [
            "vscode-cache",
            "list",
            ]
        let option = Options(from: args)
        XCTAssertTrue(Options.list(filter: .all) == option)
    }

    func testListWorkspaces() throws {
        let args = [
            "vscode-cache",
            "list",
            "-workspaces"
        ]
        let option = Options(from: args)
        XCTAssertTrue(Options.list(filter: .workspaces) == option)
    }

    func testLisGone() throws {
        let args = [
            "vscode-cache",
            "list",
            "-gone"
        ]
        let option = Options(from: args)
        XCTAssertTrue(Options.list(filter: .gone) == option)
    }

    func testListAll() throws {
        let args = [
            "vscode-cache",
            "list",
            "-all"
        ]
        let option = Options(from: args)
        XCTAssertTrue(Options.list(filter: .all) == option)
    }
}
