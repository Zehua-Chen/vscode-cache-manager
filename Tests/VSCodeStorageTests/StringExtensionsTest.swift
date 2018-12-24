import XCTest
@testable import VSCodeStorage

final class StringExtensionsTest: XCTestCase {

    func testAppendPath() {
        var path = "/usr"

        XCTAssertEqual("/usr/lib", path.appended(path: "lib"))
        XCTAssertEqual("/usr/lib", path.appended(path: "/lib"))

        path = "/usr/"

        XCTAssertEqual("/usr/lib", path.appended(path: "lib"))
        XCTAssertEqual("/usr/lib", path.appended(path: "/lib"))
    }

    func testRemoveSpacePlaceholders() {
        var path = "/usr/some%20lib/maze%20runner"
        path.removeSpacePlaceholders()

        XCTAssertEqual("/usr/some lib/maze runner", path)
    }
}
