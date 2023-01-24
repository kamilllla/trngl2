//
//  GameScene.swift
//  trngl2
//
//  Created by Камилла Балаева on 23.01.2023.
//

import MetalKit

class GameScene: Scene {

  //var quad: Plane
  var cube: Cube

  override init(device: MTLDevice, size: CGSize) {
    cube = Cube(device: device)
    //quad = Plane(device: device,
                 //imageName: "texture.png")
    
    super.init(device: device, size: size)
    add(childNode: cube)
    //add(childNode: quad)

    //quad.position.z = -3
   //quad.scale = float3(3)
  }
  
  override func update(deltaTime: Float) {
    cube.rotation.y += deltaTime
  }
}


