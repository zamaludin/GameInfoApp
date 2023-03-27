import XCTest
import Alamofire
@testable import GIGame
@testable import Mocker


final class GIGameTests: XCTestCase {
  func testExample() throws {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct
    // results.
    XCTAssertEqual(GIGame().text, "Hello, World!")
  }
  
  func testRemoteData() throws {
    let configuration = URLSessionConfiguration.af.default
    configuration.protocolClasses = [MockingURLProtocol.self] + (configuration.protocolClasses ?? [])
    let sessionManager = Session(configuration: configuration)
    
    let fakeApiKey = UUID().uuidString
    let apiEndpoint = URL(string: "https://api.rawg.io/api/games?key=\(fakeApiKey)&page_size=50")!
    
    guard let pathGamesJson = Bundle.module.path(forResource: "games", ofType: "json") else {
      XCTFail("Couldn't find file 'games.json' in test bundle.")
      return
    }
    let urlGamesJson = URL(fileURLWithPath: pathGamesJson)
    let jsonData = try String(contentsOf: urlGamesJson).data(using: .utf8)
    
    let expectedData = try JSONDecoder().decode(GamesResponse.self, from: jsonData!)
    let requestExpectation = expectation(description: "Request should finish")
    
    let mockedData = try! JSONEncoder().encode(expectedData)
    let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 200, data: [.get: mockedData])
    mock.register()
    
    sessionManager
      .request(apiEndpoint)
      .responseDecodable(of: GamesResponse.self) { (response) in
        XCTAssertNotNil(response)
        
        switch response.result {
        case .success(let data):
          XCTAssertNotNil(data)
          requestExpectation.fulfill()
        case .failure(_):
          XCTFail("Failure in result!")
        }
      }.resume()
    
    wait(for: [requestExpectation], timeout: 10.0)
  }
  
  func testDetailRemoteData() throws {
    let configuration = URLSessionConfiguration.af.default
    configuration.protocolClasses = [MockingURLProtocol.self] + (configuration.protocolClasses ?? [])
    let sessionManager = Session(configuration: configuration)
    
    let fakeApiKey = UUID().uuidString
    let apiEndpoint = URL(string: "https://api.rawg.io/api/games/3498?key=\(fakeApiKey)&page_size=50")!
    
    guard let pathGamesJson = Bundle.module.path(forResource: "gamedetail", ofType: "json") else {
      XCTFail("Couldn't find file 'gamedetail.json' in test bundle.")
      return
    }
    let urlGamesJson = URL(fileURLWithPath: pathGamesJson)
    let jsonData = try String(contentsOf: urlGamesJson).data(using: .utf8)
    
    let expectedData = try JSONDecoder().decode(GameDetailResponse.self, from: jsonData!)
    let requestExpectation = expectation(description: "Request should finish")
    
    let mockedData = try! JSONEncoder().encode(expectedData)
    let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 200, data: [.get: mockedData])
    mock.register()
    
    sessionManager
      .request(apiEndpoint)
      .responseDecodable(of: GameDetailResponse.self) { (response) in
        XCTAssertNotNil(response)
        
        switch response.result {
        case .success(let data):
          XCTAssertNotNil(data)
          requestExpectation.fulfill()
        case .failure(_):
          XCTFail("Failure in result!")
        }
      }.resume()
    
    wait(for: [requestExpectation], timeout: 10.0)
  }
  
}
