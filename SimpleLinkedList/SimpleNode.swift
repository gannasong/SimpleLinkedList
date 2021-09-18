//
//  SimpleNode.swift
//  SimpleLinkedList
//
//  Created by SUNG HAO LIN on 2021/9/18.
//

import Foundation

public class SimpleNode {
  public var value: String
  public var next: SimpleNode?
  // To avoid ownership cycles, declare the previous pointer to be weak.
  public weak var previous: SimpleNode?

  public init(value: String) {
    self.value = value
  }
}
