import XCTest

import SomeFeatureTests

var tests = [XCTestCaseEntry]()
tests += SomeFeatureTests.allTests()
XCTMain(tests)
