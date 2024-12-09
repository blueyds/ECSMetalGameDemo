//
//  GameRenderer.swift
//  ECSMetalGameDemo
//
//  Created by Craig Nunemaker on 12/8/24.
//

import Foundation
import MetalKit
public class GameRenderer: MetalRenderer {
	public typealias V = Vertex

	//private var vertices: [Vertex] = []
	public let vertexBufferIndex: Int = 0
	public let modelMatrixIndex: Int = 1
	public let viewMatrixIndex: Int = 2
	public let projectionMatrixIndex: Int = 3

	public var device = MTLCreateSystemDefaultDevice()
	public let clearColor = SIMD4<Float>.gray.clearColor
	public let pixelFormat: MTLPixelFormat = .bgra8Unorm
	public let depthPixelFormat: MTLPixelFormat? = .depth32Float
	var defaultRenderPipeline: MTLRenderPipelineState? = nil
	public var rCE: MTLRenderCommandEncoder? = nil
	var depthStencilState: MTLDepthStencilState? = nil
	init(){
		depthStencilState = createDepthStencilState(compareFn: .less)
		defaultRenderPipeline = createRenderPipeline(vertex: "basic_vertex_shader", fragment: "basic_fragmemt_shader")
	}

	public func setVertex(vertices: [V]) {
		var modelVertices: [V] = vertices
		let stride = V.stride(of: modelVertices.count)
		rCE!.setVertexBytes(modelVertices, length: stride, index: vertexBufferIndex)


	}
	public func set(renderCommandEncoder: MTLRenderCommandEncoder){
		rCE = renderCommandEncoder
		if defaultRenderPipeline != nil {
			rCE?.setRenderPipelineState(defaultRenderPipeline!)
	}
		if depthStencilState != nil{
		rCE?.setDepthStencilState(depthStencilState!)
		}
	}


}
