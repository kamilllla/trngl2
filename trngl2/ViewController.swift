//
//  ViewController.swift
//  trngl2
//
//  Created by Камилла Балаева on 21.01.2023.
//

import MetalKit

enum Colors {
  static let wenderlichGreen = MTLClearColor(red: 0.4,
                                             green: 0.4,
                                             blue: 0.21,
                                             alpha: 1.0)
}

class ViewController: NSViewController {

  var metalView: MTKView {
      return view as! MTKView
  }
  
  var renderer: Renderer?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    metalView.device = MTLCreateSystemDefaultDevice()
    guard let device = metalView.device else {
      fatalError("Device not created. Run on a physical device")
    }
    
    metalView.clearColor =  Colors.wenderlichGreen
      metalView.depthStencilPixelFormat = .depth32Float
    renderer = Renderer(device: device)
    renderer?.scene = GameScene(device: device, size: view.bounds.size)
    metalView.delegate = renderer
  }
}

