import Foundation
import MetalKit
public protocol Renderer{
	var rCE: MTLRenderCommandEncoder? { get }
}
public class GameRenderer: Renderer {
    let device = MTLCreateSystemDefaultDevice()
    let clearColor = SIMD4<Float>.gray.mtlClearColor
    let pixelFormat: MTLPixelFormat = .bgra8Unorm
	let depthPixelFormat: MTLPixelFormat = .depth32Float
    var defaultRenderPipeline: MTLRenderPipelineState? = nil
    public var rCE: MTLRenderCommandEncoder? = nil
    var depthStencilState: MTLDepthStencilState? = nil
    init(){
		createDepthStencilState()	
        createRenderPipelineState()

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
		if depthStencilState != nil {
			renderPipelineDescriptore.depthAttachmentPixelFormat = depthPixelFormat
		}
        renderPipelineDescriptore.vertexFunction = vertexFunction
        renderPipelineDescriptore.fragmentFunction = fragmentFunction
        do{
            defaultRenderPipeline = try device?.makeRenderPipelineState(descriptor: renderPipelineDescriptore)
        } catch let error as NSError{
            print(error)
        }
    }
    func createDepthStencilState(){
		let depthStencilDescriptor = MTLDepthStencilDescriptor()
	depthStencilDescriptor.isDepthWriteEnabled = true
	depthStencilDescriptor.depthCompareFunction = .less
	depthStencilState = device?.makeDepthStencilState(descriptor: depthStencilDescriptor)
    }
    
}
