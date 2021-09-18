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
}

class SimpleNode {

}

class SimpleLinkedListTests: XCTestCase {

  func test_init_doesNotStoreAnyNode() {
    let sut = SimpleLinkedList()

    XCTAssertTrue(sut.isEmpty)
  }

}
