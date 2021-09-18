//
//  SimpleLinkedListTests.swift
//  SimpleLinkedListTests
//
//  Created by SUNG HAO LIN on 2021/9/18.
//

import XCTest
import SimpleLinkedList

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

  func test_remove_removeAllNodes() {
    let samples = ["1", "2", "3", "4", "5"]
    let sut = makeSUT()

    samples.forEach { value in
      sut.append(value: value)
    }

    XCTAssertEqual(sut.count, 5)
    XCTAssertEqual(sut.first?.value, "1")
    XCTAssertEqual(sut.last?.value, "5")

    sut.removeAll()
    XCTAssertEqual(sut.count, 0)
    XCTAssertTrue(sut.isEmpty)
    XCTAssertNil(sut.first)
    XCTAssertNil(sut.last)
  }
  
  // MARK: - Helper

  private func makeSUT(file: StaticString = #file, line: UInt = #line) -> SimpleLinkedList {
    let sut = SimpleLinkedList()
    trackForMemoryLeaks(sut, file: file, line: line)
    return sut
  }
}
