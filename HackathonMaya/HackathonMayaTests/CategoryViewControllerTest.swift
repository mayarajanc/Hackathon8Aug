//
//  CategoryViewControllerTest.swift
//  HackathonMayaTests
//
//  Created by Ranjith Karuvadiyil on 08/08/20.
//  Copyright © 2020 Maya Ranjith. All rights reserved.
//

import XCTest
@testable import HackathonMaya

class CategoryViewControllerTest: XCTestCase {
    var vcMock = CateogyListViewController()
    
    override func setUp() {
        super.setUp()
        
        let story = UIStoryboard(name:"Main",bundle: nil)
        vcMock = (story.instantiateViewController(identifier: "CateogyListViewControllerVC") as? CateogyListViewController)!
        _ =  vcMock.view
    }

    
    func testCellForRow(){
        let cell = vcMock.tableView(vcMock.categoryListView, cellForRowAt: NSIndexPath(row: 0, section: 0) as IndexPath)
        XCTAssertTrue(cell is CategoryCell)
    }
    func testNumberOFRows(){
        let noOfRows = vcMock.categoryListView.numberOfRows(inSection: 0)
        XCTAssertEqual(noOfRows,0,"Number of rows in tableview should be 0")
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
