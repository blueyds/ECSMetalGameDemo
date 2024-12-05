//
//  TriangleComponent.swift
//  ECSMetalGameDemo
//
//  Created by Craig Nunemaker on 12/4/24.
//

import Foundation

public class TriangleComponent: Component, VertexCollectionProtocol {
	public var entity: Entity?
	
	public static var typeID: Int = Manager.getNewComponentTypeID()

	public var transform: TransformComponent? = nil

	public var vertices: [Vertex] = []
	public init(color: SIMD4<Float>){
		vertices.append(Vertex(x: 0, y: 0.5, color: color)) // TOP
		vertices.append(Vertex(x: 0.5, y: -0.5, color: color)) // BR
		vertices.append(Vertex(x: -0.5, y: -0.5, color: color)) // BL
	}


}
