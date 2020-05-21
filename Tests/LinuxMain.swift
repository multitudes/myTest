import XCTest

import myTestTests

var tests = [XCTestCaseEntry]()
tests += myTestTests.allTests()
XCTMain(tests)
