//
//  cstrTests.swift
//  cstrTests
//
//  Created by Liu Yang on 6/3/16.
//  Copyright © 2016 Liu Yang. All rights reserved.
//

import XCTest
@testable import cstr

class cstrTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_strlen() {
        XCTAssert("Hello".strlen() == 5)
    }
    
    func test_strchr() {
        XCTAssert("Hello".strchr("l") == 2)
        XCTAssert("Hello".strchr("x") == nil)
    }
    
    func test_strcspn() {
        XCTAssert("fcba73".strcspn("1234567890") == 4)
        XCTAssert("abcdef".strcspn("1234567890") == 6)
    }
    
    func test_strpbrk() {
        XCTAssert("fcba73".strpbrk("1234567890") == 4)
        XCTAssert("abcdef".strpbrk("1234567890") == nil)
    }
    
    func test_strrchr() {
        XCTAssert("this is a sample string.".strrchr("s") == 17)
        XCTAssert("hello".strrchr("x") == nil)
    }
    
    func test_strspn() {
        XCTAssert("129th".strspn("1234567890") == 3)
        XCTAssert("12345".strspn("1234567890") == 5)
        XCTAssert("789abc123".strspn("1234567890") == 3)
    }
    
    func test_strstr() {
        XCTAssert("129th".strstr("th") == 3)
        XCTAssert("129th".strstr("st") == nil)
    }
    
    func test_strtok() {
        let str = "- This, is a sample string."
        let delimiters = " ,.-"
        
        let a = str.strtok(delimiters)
        XCTAssert(a != nil && a!.token == "This")
        
        let b = a!.rest.strtok(delimiters)
        XCTAssert(b != nil && b!.token == "is")
        
        let c = b!.rest.strtok(delimiters)
        XCTAssert(c != nil && c!.token == "a")
        
        let d = c!.rest.strtok(delimiters)
        XCTAssert(d != nil && d!.token == "sample")
        
        let e = d!.rest.strtok(delimiters)
        XCTAssert(e != nil && e!.token == "string")
        
        let f = e!.rest.strtok(delimiters)
        XCTAssert(f == nil)
        
        let g = "".strtok(delimiters)
        XCTAssert(g == nil)
    }
}
