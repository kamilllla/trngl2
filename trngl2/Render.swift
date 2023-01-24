//
//  Render.swift
//  trngl2
//
//  Created by Камилла Балаева on 21.01.2023.
//

import MetalKit

class Renderer: NSObject {
  let device: MTLDevice
  let commandQueue: MTLCommandQueue
  
  var scene: Scene?
  
  var samplerState: MTLSamplerState?

  init(device: MTLDevice) {
    self.device = device
      commandQueue = device.makeCommandQueue()! 
    super.init()
    buildSamplerState()
  }
  
  private func buildSamplerState() {
    let descriptor = MTLSamplerDescriptor()
    descriptor.minFilter = .linear
    descriptor.magFilter = .linear
    samplerState = device.makeSamplerState(descriptor: descriptor)
  }
}

extension Renderer: MTKViewDelegate {
  func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) { }
  
  func draw(in view: MTKView) {
    guard let drawable = view.currentDrawable,
      let descriptor = view.currentRenderPassDescriptor else { return }
    let commandBuffer = commandQueue.makeCommandBuffer()
    let commandEncoder =
      commandBuffer?.makeRenderCommandEncoder(descriptor: descriptor)
    
    let deltaTime = 1 / Float(view.preferredFramesPerSecond)
      commandEncoder?.setFragmentSamplerState(samplerState, index: 0)
    
      scene?.render(commandEncoder: commandEncoder as! MTLRenderCommandEncoder,
                  deltaTime: deltaTime)
    
      commandEncoder?.endEncoding()
      commandBuffer?.present(drawable)
      commandBuffer?.commit()
  }
}


