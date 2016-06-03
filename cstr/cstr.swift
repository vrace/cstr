//
//  cstr.swift -- C 90 string related methods port to Swift
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

import Foundation

public extension String {
    func strlen() -> Int {
        return self.characters.count
    }
    
    func strchr(ch: Character) -> Int? {
        for item in self.characters.enumerate() {
            if item.element == ch {
                return item.index
            }
        }
        return nil
    }
    
    func strcspn(span: String) -> Int {
        if let index = self.strpbrk(span) {
            return index
        }
        return self.strlen()
    }
    
    func strpbrk(breaks: String) -> Int? {
        for item in self.characters.enumerate() {
            if breaks.strchr(item.element) != nil {
                return item.index
            }
        }
        return nil
    }
    
    func strrchr(ch: Character) -> Int? {
        for item in self.characters.enumerate().reverse() {
            if item.element == ch {
                return item.index
            }
        }
        return nil
    }
    
    func strspn(span: String) -> Int {
        for item in self.characters.enumerate() {
            if span.strchr(item.element) == nil {
                return item.index
            }
        }
        return self.strlen()
    }
    
    func strstr(str: String) -> Int? {
        if let range = self.rangeOfString(str) {
            return self.startIndex.distanceTo(range.startIndex)
        }
        return nil
    }
    
    func strtok(delimiters: String) -> (token: String, rest: String)? {
        let start = self.strspn(delimiters)
        let count = self.substringFromIndex(self.startIndex.advancedBy(start)).strcspn(delimiters)
        
        if count > 0 {
            let tokenBegin = self.startIndex.advancedBy(start)
            let tokenEnd = tokenBegin.advancedBy(count)
            let token = self.substringWithRange(tokenBegin ..< tokenEnd)
            let rest = self.substringFromIndex(tokenEnd)
            return (token: token, rest: rest)
        }
        
        return nil
    }
}
