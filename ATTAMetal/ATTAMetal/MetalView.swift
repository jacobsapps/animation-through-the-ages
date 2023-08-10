//
//  MetalView.swift
//  ATTAMetal
//
//  Created by Jacob Bartlett on 09/08/2023.
//

import MetalKit

final class MetalView: MTKView {

    var commandQueue: MTLCommandQueue!
    var pipelineState: MTLRenderPipelineState!
    var displayLink: CADisplayLink!
    var startTime: CFTimeInterval?
    var time: Float = 0.0

    override init(frame frameRect: CGRect, device: MTLDevice?) {
        super.init(frame: frameRect, device: device)
        commandQueue = device?.makeCommandQueue()!
        createRenderPipelineState()
        clearColor = MTLClearColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0)
        displayLink = CADisplayLink(target: self, selector: #selector(update))
        displayLink.add(to: .current, forMode: .default)
    }

    required init(coder: NSCoder) {
        fatalError()
    }
    
    @objc func update(displayLink: CADisplayLink) {
        if startTime == nil {
            startTime = displayLink.timestamp
        }
        
        let elapsed = displayLink.timestamp - startTime!
        time = Float(elapsed)
        
        self.setNeedsDisplay()
    }
    
    func createRenderPipelineState() {
        let library = device?.makeDefaultLibrary()
        let vertexFunction = library?.makeFunction(name: "vertex_main")
        let fragmentFunction = library?.makeFunction(name: "fragment_main")
        
        let pipelineDescriptor = MTLRenderPipelineDescriptor()
        pipelineDescriptor.vertexFunction = vertexFunction
        pipelineDescriptor.fragmentFunction = fragmentFunction
        pipelineDescriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
        
        pipelineState = try? device?.makeRenderPipelineState(descriptor: pipelineDescriptor)
    }
    
    override func draw(_ rect: CGRect) {
        guard let drawable = currentDrawable,
              let renderPassDescriptor = currentRenderPassDescriptor else { return }
        
        let commandBuffer = commandQueue.makeCommandBuffer()!
        
        let renderEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: renderPassDescriptor)!
        renderEncoder.setRenderPipelineState(pipelineState)
        
        let vertices: [SIMD4<Float>] = [
            [-0.8, -0.4, 0.0, 1.0],
            [ 0.8, -0.4, 0.0, 1.0],
            [ 0.0,  0.4, 0.0, 1.0]
        ]
        
        renderEncoder.setVertexBytes(vertices, length: vertices.count * MemoryLayout<SIMD4<Float>>.size, index: 0)
        renderEncoder.setVertexBytes(&time, length: MemoryLayout<Float>.size, index: 1)
        renderEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: 3)
        renderEncoder.endEncoding()
        commandBuffer.present(drawable)
        commandBuffer.commit()
    }
}
