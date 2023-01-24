//
//  Node.swift
//  trngl2
//
//  Created by Камилла Балаева on 21.01.2023.
//

import MetalKit

class Node {
  var name = "Untitled"
  var children: [Node] = []
  
  func add(childNode: Node) {
    children.append(childNode)
  }
  
  func render(commandEncoder: MTLRenderCommandEncoder,
              deltaTime: Float) {
    for child in children {
      child.render(commandEncoder: commandEncoder,
                   deltaTime: deltaTime)
    }
  }
}
