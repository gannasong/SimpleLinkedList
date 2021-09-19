//
//  SimpleLinkedListTests.swift
//  SimpleLinkedListTests
//
//  Created by SUNG HAO LIN on 2021/9/18.
//

import XCTest
import SimpleLinkedList

class SimpleLinkedListTests: XCTestCase {

  func test_init_linkedListIsEmpty() {
    let sut = makeSUT(type: String.self)

    XCTAssertTrue(sut.isEmpty)
    XCTAssertEqual(sut.count, 0)
    XCTAssertNil(sut.first)
    XCTAssertNil(sut.last)
  }

  func test_append_appendOneValueToLinkedList() {
    let value = "1"
    let sut = makeSUT(type: String.self)

    expectAppend(sut: sut, values: [value]) {
      XCTAssertEqual(sut.first?.value, value)
      XCTAssertEqual(sut.last?.value, value)
    }
  }

  func test_append_appendTwoNodeToLinkedList() {
    let values = ["1", "2"]
    let sut = makeSUT(type: String.self)

    expectAppend(sut: sut, values: values) {
      XCTAssertEqual(sut.first?.value, values.first)
      XCTAssertEqual(sut.last?.value, values.last)
    }
  }

  func test_remove_removeAllNodes() {
    let values = ["1", "2", "3", "4", "5"]
    let sut = makeSUT(type: String.self)

    expectRemoveAll(sut: sut, values: values) {
      XCTAssertEqual(sut.count, 0)
      XCTAssertTrue(sut.isEmpty)
      XCTAssertNil(sut.first)
      XCTAssertNil(sut.last)
    }
  }

  func test_remove_removeNodesFromLinkedList() {
    let samples = ["1", "2", "3", "4", "5"]
    let sut = makeSUT(type: String.self)

    samples.forEach { value in
      sut.append(value: value)
    }

    let first = sut.first!
    let firstString = sut.remove(node: first)

    XCTAssertEqual(sut.count, 4)
    XCTAssertEqual(firstString, "1")
    XCTAssertEqual(sut.first?.value, "2")

    let last = sut.last!
    let lastString = sut.remove(node: last)

    XCTAssertEqual(sut.count, 3)
    XCTAssertEqual(lastString, "5")
    XCTAssertEqual(sut.last?.value, "4")
  }

  func test_remove_removeFirstNodeFromLinkedList() {
    let values = ["1", "2", "3", "4", "5"]
    let sut = makeSUT(type: String.self)
    var results: [String?] = []

    values.forEach { value in
      sut.append(value: value)
    }

    results.append(sut.removeFirst())
    XCTAssertEqual(results, ["1"])
    results.append(sut.removeFirst())
    XCTAssertEqual(results, ["1", "2"])
    results.append(sut.removeFirst())
    XCTAssertEqual(results, ["1", "2", "3"])
    results.append(sut.removeFirst())
    XCTAssertEqual(results, ["1", "2", "3", "4"])
    results.append(sut.removeFirst())
    XCTAssertEqual(results, ["1", "2", "3", "4", "5"])
    results.append(sut.removeFirst())
    XCTAssertEqual(results, ["1", "2", "3", "4", "5", nil])
  }

  // MARK: - Helper

  private func makeSUT<T>(type: T.Type, file: StaticString = #file, line: UInt = #line) -> SimpleLinkedList<T> {
    let sut = SimpleLinkedList<T>()
    trackForMemoryLeaks(sut, file: file, line: line)
    return sut
  }

  private func expectAppend<T>(sut: SimpleLinkedList<T>, values: [T], _ assert: () -> Void) {
    let expectedCount = values.count

    values.forEach { value in
      sut.append(value: value)
    }

    XCTAssertEqual(sut.count, expectedCount)
    XCTAssertFalse(sut.isEmpty)
    XCTAssertNotNil(sut.first)
    XCTAssertNotNil(sut.last)

    assert()
  }

  private func expectRemoveAll<T>(sut: SimpleLinkedList<T>, values: [T], _ assert: () -> Void) {
    values.forEach { value in
      sut.append(value: value)
    }

    sut.removeAll()

    XCTAssertEqual(sut.count, 0)
    XCTAssertTrue(sut.isEmpty)
    XCTAssertNil(sut.first)
    XCTAssertNil(sut.last)
  }
}
