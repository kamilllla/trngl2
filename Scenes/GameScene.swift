//
//  GameScene.swift
//  trngl2
//
//  Created by Камилла Балаева on 23.01.2023.
//

import MetalKit

class GameScene: Scene {

  var quad: Plane

  override init(device: MTLDevice, size: CGSize) {
    
    quad = Plane(device: device,
                 imageName: "texture.png")
    
    super.init(device: device, size: size)
    add(childNode: quad)
    
  }
}

