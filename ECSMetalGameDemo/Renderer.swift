import Foundation
import MetalKit
public protocol Renderer{
	var rCE: MTLRenderCommandEncoder? { get }
}
public class GameRenderer: Renderer {
    let device = MTLCreateSystemDefaultDevice()
    let clearColor = SIMD4<Float>.gray.mtlClearColor
    let pixelFormat: MTLPixelFormat = .bgra8Unorm
    var defaultRenderPipeline: MTLRenderPipelineState? = nil
    var rCE: MTLRenderCommandEncoder? = nil
    var depthStencilStte: MTLDepthStencilState? = nil
    init(){
        createRenderPipelineState()
createDepthStencilState()	
    }
    func set(renderCommandEncoder: MTLRenderCommandEncoder){
        rCE = renderCommandEncoder
        if defaultRenderPipeline != nil {
            rCE?.setRenderPipelineState(defaultRenderPipeline!)
    }
        if depthStencilState != nil{
		rCE?.setDepthStencilState(depthStencilState!)
        }
    }
    func createRenderPipelineState(){
		let library = device!.makeDefaultLibrary()
        let vertexFunction = library!.makeFunction(name: "basic_vertex_shader")
        let fragmentFunction = library!.makeFunction(name: "basic_fragment_shader")
        let renderPipelineDescriptore = MTLRenderPipelineDescriptor()
        renderPipelineDescriptore.colorAttachments[0].pixelFormat = pixelFormat
        renderPipelineDescriptore.vertexFunction = vertexFunction
        renderPipelineDescriptore.fragmentFunction = fragmentFunction
        do{
            defaultRenderPipeline = try device?.makeRenderPipelineState(descriptor: renderPipelineDescriptore)
        } catch let error as NSError{
            print(error)
        }
    }
    func createDepthStencilState(){
	let depthStencilDescriptor = MTLDepthStencilStateDescriptor()
	depthStencilDescriptor.isDepthWriteEnabled = true
	depthStencilDescriptor.depthCompareFunction = .less
	depthStencilState = device.makeDepthStencilState(descriptor: depthStencilDescriptor)
    }
    
}
