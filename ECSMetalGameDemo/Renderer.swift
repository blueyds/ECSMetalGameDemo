import Foundation
import MetalKit

public class Renderer {
    let device = MTLCreateSystemDefaultDevice()
    let clearColor = SIMD4<Float>.gray.mtlClearColor
    let pixelFormat: MTLPixelFormat = .bgra8Unorm
    var defaultRenderPipeline: MTLRenderPipelineState? = nil
    var rCE: MTLRenderCommandEncoder? = nil
    init(){
        createRenderPipelineState()    
    }
    func set(renderCommandEncoder: MTLRenderCommandEncoder){
        rCE = renderCommandEncoder
        if defaultRenderPipeline != nil {
            rCE?.setRenderPipelineState(defaultRenderPipeline!)
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


    
}
