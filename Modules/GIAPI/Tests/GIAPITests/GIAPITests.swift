import XCTest
@testable import GIAPI

final class GIAPITests: XCTestCase {
  func testEndpointUrl() throws {
    XCTAssertNotNil(Endpoints.Get.games.url)
  }
}
