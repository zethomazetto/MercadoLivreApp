//
//  MercadoLivreAppTests.swift
//  MercadoLivreAppTests
//
//  Created by Ezequiel Thomazetto on 13/12/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import XCTest
@testable import MercadoLivreApp

class MercadoLivreAppTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    struct TestSearchItemRequest: SearchItemRequest {
        var query: String
    }
    
    func testSearchItemRequest() {
        let searchWorker = SearchWorker(searchStore: MercadoLivreAPI())
        let request = TestSearchItemRequest(query: "Motorola G6")
        
        let searchItemSuccessExpectation = self.expectation(description: "Search Item success")
        
        searchWorker.searchItem(request: request, onSuccess: { searchItemResult in
            XCTAssertEqual(request.query, searchItemResult.query)
            searchItemSuccessExpectation.fulfill()
            
        }) { error in
            XCTFail(error.localizedDescription)
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    struct TestGetItemRequest: GetItemRequest {
        var itemId: String
    }
    
    func testGetItemRequest() {
        let itemWorker = ItemWorker(itemStore: MercadoLivreAPI())
        let request = TestGetItemRequest(itemId: "MLB1191972200")
        
        let searchItemSuccessExpectation = self.expectation(description: "Get Item success")
        
        itemWorker.getItem(request: request, onSuccess: { item in
            XCTAssertEqual(request.itemId, item.id)
            searchItemSuccessExpectation.fulfill()
        }) { error in
            XCTFail(error.localizedDescription)
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
}
