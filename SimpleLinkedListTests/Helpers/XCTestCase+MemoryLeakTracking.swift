//
//  XCTestCase+MemoryLeakTracking.swift
//  SimpleLinkedListTests
//
//  Created by SUNG HAO LIN on 2021/9/18.
//

import XCTest

extension XCTestCase {
  func trackForMemoryLeaks(_ instance: AnyObject, file: StaticString = #file, line: UInt = #line) {
    addTeardownBlock { [weak instance] in
      XCTAssertNil(instance, "Instance should have been deallocated. Potential memory leak.", file: file, line: line)
    }
  }
}
