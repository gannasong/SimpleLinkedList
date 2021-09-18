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
    if let tailNode = tail {
      newNode.previous = tailNode
      tailNode.next = newNode
    } else {
      head = newNode
    }

    tail = newNode
    count += 1
  }
}

class SimpleNode {
  var value: String
  var next: SimpleNode?
  // To avoid ownership cycles, declare the previous pointer to be weak.
  weak var previous: SimpleNode?

  init(value: String) {
    self.value = value
  }
}

class SimpleLinkedListTests: XCTestCase {

  func test_init_doesNotStoreAnyNode() {
    let sut = makeSUT()

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
    XCTAssertEqual(sut.first?.value, value)
    XCTAssertEqual(sut.last?.value, value)
  }

  func test_append_appendTwoNodeToLinkedList() {
    let value = "any-node"
    let anotherValue = "another-node"
    let sut = makeSUT()

    sut.append(value: value)
    sut.append(value: anotherValue)

    XCTAssertEqual(sut.count, 2)
    XCTAssertEqual(sut.first?.value, value)
    XCTAssertEqual(sut.last?.value, anotherValue)
  }

  // MARK: - Helper

  private func makeSUT() -> SimpleLinkedList {
    let sut = SimpleLinkedList()
    return sut
  }
}
