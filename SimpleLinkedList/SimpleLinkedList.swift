//
//  SimpleLinkedList.swift
//  SimpleLinkedList
//
//  Created by SUNG HAO LIN on 2021/9/18.
//

import Foundation

public class SimpleLinkedList {
  private var head: SimpleNode?
  private var tail: SimpleNode?

  public private(set) var count: Int = 0

  public var isEmpty: Bool {
    return head == nil
  }

  public var first: SimpleNode? {
    return head
  }

  public var last: SimpleNode? {
    return tail
  }

  public init() {}

  public func append(value: String) {
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

  public func removeAll() {
    head = nil
    tail = nil
    count = 0
  }
}
