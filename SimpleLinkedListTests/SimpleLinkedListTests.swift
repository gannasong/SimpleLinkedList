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

  var count: Int = 0

  var isEmpty: Bool {
    return head == nil
  }

  var first: SimpleNode? {
    return head
  }

  var last: SimpleNode? {
    return tail
  }

  func append(value: String) {
    let newNode = SimpleNode(value: value)

    head = newNode
    tail = newNode
    count += 1
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
    XCTAssertEqual(sut.count, 0)
    XCTAssertNil(sut.first)
    XCTAssertNil(sut.last)
  }

  func test_append_appendOneValueToLinkedList() {
    let value = "any-node"
    let sut = SimpleLinkedList()

    sut.append(value: value)

    XCTAssertEqual(sut.count, 1)
    XCTAssertFalse(sut.isEmpty)
    XCTAssertNotNil(sut.first)
    XCTAssertNotNil(sut.last)
  }
}
