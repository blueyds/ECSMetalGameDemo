//
//  Meshes.swift
//  ECSMetalGameDemo
//
//  Created by Craig Nunemaker on 12/8/24.
//

import Foundation
import GameColor

class QuadComponent: CustomQuadMesh {
	var vertices: [Vertex] = []
	var color: SIMD4<Float> = .black
	var entity: Entity? = nil
	static var typeID: Int = Manager.getNewComponentTypeID()
	var transform: TransformComponent? = nil
	init(color: GameColor){
		self.color = color
	}
}
class TriangleComponent: CustomTriangleMesh{
	var vertices: [Vertex] = []
	var color: SIMD4<Float> = .black
	var entity: Entity? = nil
	static var typeID: Int = Manager.getNewComponentTypeID()
	var transform: TransformComponent? = nil
	init(color: GameColor){
		self.color = color
	}
}

