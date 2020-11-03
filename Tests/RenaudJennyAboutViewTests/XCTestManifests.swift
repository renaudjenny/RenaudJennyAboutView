import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    [
        testCase(RenaudJennyAboutViewTests.allTests),
    ]
}
#endif
