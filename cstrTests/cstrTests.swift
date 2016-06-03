//
//  cstr Tests
//
//  Copyright (c) 2016 LIU YANG
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import XCTest
@testable import cstr

class cstrTests: XCTestCase {
    
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
