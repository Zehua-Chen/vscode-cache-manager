import XCTest

extension OptionsTest {
    static let __allTests = [
        ("testCleanAll", testCleanAll),
        ("testCleanGone", testCleanGone),
        ("testCleanShort", testCleanShort),
        ("testCleanWorkspaces", testCleanWorkspaces),
        ("testLisGone", testLisGone),
        ("testListAll", testListAll),
        ("testListShort", testListShort),
        ("testListWorkspaces", testListWorkspaces),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(OptionsTest.__allTests),
    ]
}
#endif
