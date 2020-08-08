//
//  CategoryCellTest.swift
//  HackathonMayaTests
//
//  Created by Ranjith Karuvadiyil on 08/08/20.
//  Copyright © 2020 Maya Ranjith. All rights reserved.
//

import XCTest
@testable import HackathonMaya

class CategoryCellTest: XCTestCase {

    var mockCell = CategoryCell()
    
    override func setUp() {
          super.setUp()
          let tableview = UITableView()
          tableview.register(CategoryCell.self, forCellReuseIdentifier:CellIdentifiers.categoryCell)
          mockCell = tableview.dequeueReusableCell(withIdentifier: CellIdentifiers.categoryCell ) as! CategoryCell
      }
    
    func testsetupViews(){
        let labels = UILabel()
        mockCell.addSubview(labels)
        
    }
    
    func testsetupCellWithValues(){
        let mockObj:Categories = Categories(name: "test", categoryID: 1)
        mockCell.textLabel?.text = mockObj.name
        
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
