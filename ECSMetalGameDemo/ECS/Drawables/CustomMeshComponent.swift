//
//  VertexCollectionProtocol.swift
//  ECSMetalGameDemo
//
//  Created by Craig Nunemaker on 12/4/24.
//

import Foundation
import SwiftMatrix


import Sizeable

public protocol CustomMeshComponent: Component {
	associatedtype V: VertexProtocol
	var vertices: [V] { get set }
	var transform: TransformComponent? { get set }
	func buildVertices()
}
extension CustomMeshComponent {
	public func setup() {
		if transform == nil{
			transform = entity?.get()
		} else {
			let _ = entity?.add(component: transform!)
		}

		buildVertices()
	}
	public func draw(renderer: any Renderer){
		renderer.pushDebug(named: "TypeID \(Self.typeID)")
		renderer.setModel(matrix: transform?.modelMatrix  ?? .identity)
		renderer.setVertex(vertices: <#T##[VertexProtocol]#>)
		renderer.drawPrimitives(count: vertices.count)
		renderer.popDebug()
	}
}
