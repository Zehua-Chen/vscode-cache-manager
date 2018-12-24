import XCTest

extension StringExtensionsTest {
    static let __allTests = [
        ("testAppendPath", testAppendPath),
        ("testRemoveSpacePlaceholders", testRemoveSpacePlaceholders),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(StringExtensionsTest.__allTests),
    ]
}
#endif
