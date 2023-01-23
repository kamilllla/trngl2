//
//  Plane.swift
//  trngl2
//
//  Created by Камилла Балаева on 21.01.2023.
//

import MetalKit

class Plane: Node {

  var vertices: [Vertex] = [
    Vertex(position: float3( -0.75, 0.75, 0),// V0
      color: float4(1, 0, 0, 1)),
    Vertex(position: float3( -0.75, -0.75, 0),// V1
      color: float4(0, 1, 0, 1)),
    Vertex(position: float3( 0.75, -0.75, 0), // V2
      color: float4(0, 0, 1, 1)),
    Vertex(position: float3( 0.75, 0.75, 0), // V3
      color: float4(1, 0, 1, 1))
  ]
  
  var indices: [UInt16] = [
    0, 1, 2,
    2, 3, 0
  ]
  
  var vertexBuffer: MTLBuffer?
  var indexBuffer: MTLBuffer?
  
  var time: Float = 0
  
  struct Constants {
    var animateBy: Float = 0.0
  }
  
  var constants = Constants()
 
  init(device: MTLDevice) {
    super.init()
    buildBuffers(device: device)
  }
  
  private func buildBuffers(device: MTLDevice) {
    vertexBuffer = device.makeBuffer(bytes: vertices,
                                     length: vertices.count *
                                      MemoryLayout<Vertex>.stride,
                                     options: [])
    indexBuffer = device.makeBuffer(bytes: indices,
                                    length: indices.count * MemoryLayout<UInt16>.size,
                                    options: [])
  }
  
  override func render(commandEncoder: MTLRenderCommandEncoder,
                       deltaTime: Float) {
    super.render(commandEncoder: commandEncoder,
                 deltaTime: deltaTime)
    guard let indexBuffer = indexBuffer else { return }
    
   
    
      commandEncoder.setVertexBuffer(vertexBuffer,
                                     offset: 0, index: 0)
      commandEncoder.setVertexBytes(&constants,
                                    length: MemoryLayout<Constants>.stride,
                                    index: 1)
    commandEncoder.drawIndexedPrimitives(type: .triangle,
                                         indexCount: indices.count,
                                         indexType: .uint16,
                                         indexBuffer: indexBuffer,
                                         indexBufferOffset: 0)
  }

}
