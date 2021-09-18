//
//  SimpleLinkedListTests.swift
//  SimpleLinkedListTests
//
//  Created by SUNG HAO LIN on 2021/9/18.
//

import XCTest

class SimpleLinkedList {
  private var head: SimpleNode?
  private var tail: SimpleNode?

  var isEmpty: Bool {
    return head == nil
  }

  var first: SimpleNode? {
    return head
  }

  var last: SimpleNode? {
    return tail
  }
}

class SimpleNode {
  var value: String

  init(value: String) {
    self.value = value
  }
}

class SimpleLinkedListTests: XCTestCase {

  func test_init_doesNotStoreAnyNode() {
    let sut = SimpleLinkedList()

    XCTAssertTrue(sut.isEmpty)
    XCTAssertNil(sut.first)
    XCTAssertNil(sut.last)
  }
}
