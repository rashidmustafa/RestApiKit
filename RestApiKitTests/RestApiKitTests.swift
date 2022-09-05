//
//  RestApiKitTests.swift
//  RestApiKitTests
//
//  Created by Rashid Mustafa on 30/08/2022.
//

import XCTest
@testable import RestApiKit

class RestApiKitTests: XCTestCase {

    private let utility = ApiClient.shared
    
    func test_getPopularTVApiData()
    {
        // ARRANGE
        let requestUrl = URL(string: "https://api.themoviedb.org/3/tv/popular?api_key=ecef14eac236a5d4ec6ac3a4a4761e8f&language=en-US&page=1")
        let expectation = XCTestExpectation(description: "Data received")
        let request = APIRequest(withUrl: requestUrl!, forHttpMethod: .get)

        utility.request(huRequest: request, resultType: TVShowModel.self) { (response) in
            switch response
            {
            case .success(let animal):

                // ASSERT
                XCTAssertNotNil(animal)
                XCTAssertNotNil(animal?.data)

            case .failure(let error):

                // ASSERT
                XCTAssertNil(error)
            }

            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 10.0)
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
