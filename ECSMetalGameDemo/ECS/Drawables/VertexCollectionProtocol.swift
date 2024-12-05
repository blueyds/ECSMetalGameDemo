//
//  VertexCollectionProtocol.swift
//  ECSMetalGameDemo
//
//  Created by Craig Nunemaker on 12/4/24.
//

import Foundation
public protocol VertexCollectionProtocol: Component {
	var vertices: [Vertex] { get }
	var transform: TransformComponent? { get set }
}
extension VertexCollectionProtocol {
	public func setup() {
		transform = entity?.get()
	}
	public func draw(renderer: Renderer){
		guard let rCE = renderer.rCE else { return }
		rCE.pushDebugGroup("TypeID \(Self.typeID)")
		var modelMatrix = transform?.modelMatrix  ?? .identity
		rCE.setVertexBytes(&modelMatrix, length: Matrix.stride(), index: 1)

		rCE.setVertexBytes(vertices, length: Vertex.stride(of: vertices.count), index: 0)
		rCE.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: vertices.count)
		rCE.popDebugGroup()
	}
}
