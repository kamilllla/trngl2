//
//  Scene.swift
//  trngl2
//
//  Created by Камилла Балаева on 23.01.2023.
//

import MetalKit

class Scene: Node {
  var device: MTLDevice
  var size: CGSize
  
  init(device: MTLDevice, size: CGSize) {
    self.device = device
    self.size = size
    super.init()
  }
}
