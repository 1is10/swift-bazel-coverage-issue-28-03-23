import XCTest
@testable import UrlGetClasses

class UrlGetClassesCommonTestCase: XCTestCase {
    var checkableStruct: CheckableStruct!
    override func setUp() {
        super.setUp()
        checkableStruct = .init()
    }

    override func tearDown() {
        checkableStruct = nil
        super.tearDown()
    }

    func testTrue() {
        XCTAssertTrue(checkableStruct.returnTrue())
    }
    func testFalse() {
        XCTAssertFalse(checkableStruct.returnFalse())
    }
}
