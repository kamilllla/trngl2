//
//  ViewController.swift
//  trngl2
//
//  Created by Камилла Балаева on 21.01.2023.
//

import Cocoa
import MetalKit
enum Colors {
    static let wenderlichGreen = MTLClearColor(red:1.0, green: 0.4, blue: 0.21, alpha:1.0)
}

class ViewController: NSViewController {
    var metalView: MTKView{
        return view as! MTKView
    }

    var device: MTLDevice!
    var commandQueue: MTLCommandQueue!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        metalView.device=MTLCreateSystemDefaultDevice()
        device=metalView.device
        metalView.clearColor=Colors.wenderlichGreen
        metalView.delegate=self
        commandQueue = device.makeCommandQueue()
        
        

        // Do any additional setup after loading the view.
    }

}
extension ViewController: MTKViewDelegate{
    func mtkView(_ view:MTKView, drawableSizeWillChange size:
                 CGSize){ }
    func draw(in view: MTKView){
        guard let drawable = view.currentDrawable, let descriptor = view.currentDrawable,
              let descriptor = view.currentRenderPassDescriptor else {
                  return
              }
        let commandBuffer=commandQueue.makeCommandBuffer()
        let commandEncoder=commandBuffer?.makeRenderCommandEncoder(descriptor:
                                                                    descriptor)
        commandEncoder?.endEncoding()
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
}

