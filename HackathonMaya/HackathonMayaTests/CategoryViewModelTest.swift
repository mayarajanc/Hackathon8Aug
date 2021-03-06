//
//  CategoryViewModelTest.swift
//  HackathonMayaTests
//
//  Created by Ranjith Karuvadiyil on 08/08/20.
//  Copyright © 2020 Maya Ranjith. All rights reserved.
//

import XCTest
@testable import HackathonMaya

class CategoryViewModelTest: XCTestCase {
    var viewmodelMock = CategoryViewModel()
    
    func fetchCategories(){
    let expectataion = self.expectation(description: "Wait for service call")
        let expectTime :Double = 3
        viewmodelMock.fetchCategories()
        DispatchQueue.main.asyncAfter(deadline: .now() + expectTime){
                  expectataion.fulfill()
              }
              waitForExpectations(timeout: expectTime+1)
              XCTAssertNotNil(viewmodelMock.categoryList)

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
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
