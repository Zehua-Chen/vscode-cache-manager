import XCTest

import UtilitiesTests
import VSCodeStorageTests

var tests = [XCTestCaseEntry]()
tests += UtilitiesTests.__allTests()
tests += VSCodeStorageTests.__allTests()

XCTMain(tests)
