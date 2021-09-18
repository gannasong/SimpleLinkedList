//
//  SimpleLinkedList.swift
//  SimpleLinkedList
//
//  Created by SUNG HAO LIN on 2021/9/18.
//

import Foundation

public class SimpleLinkedList<T> {
  public typealias Node = SimpleNode<T>

  private var head: Node?
  private var tail: Node?

  public private(set) var count: Int = 0

  public var isEmpty: Bool {
    return head == nil
  }

  public var first: Node? {
    return head
  }

  public var last: Node? {
    return tail
  }

  // MARK: - Initialization

  public init() {}

  // MARK: - Public Methods

  public func append(value: T) {
    let newNode = Node(value: value)
    if let tailNode = tail {
      newNode.previous = tailNode
      tailNode.next = newNode
    } else {
      head = newNode
    }

    tail = newNode
    count += 1
  }

  public func removeAll() {
    head = nil
    tail = nil
    count = 0
  }

  public func removeFirst() -> T? {
    guard count > 0 else { return nil }
    return remove(node: head!)
  }

  public func remove(node: Node) -> T {
    let prev = node.previous
    let next = node.next

    if let prev = prev {
      prev.next = next
    } else {
      head = next
    }

    next?.previous = prev

    if next == nil {
      tail = prev
    }

    node.previous = nil
    node.next = nil
    count -= 1

    return node.value
  }
}
