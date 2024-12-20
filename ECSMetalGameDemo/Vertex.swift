//
//  Vertex.swift
//  ECSMetalGameDemo
//
//  Created by Craig Nunemaker on 12/8/24.
//

import Foundation
import GameColor

public struct Vertex:VertexProtocol{
	public let position: SIMD3<Float>
	public let color: GameColor
	public let texCoord: SIMD2<Float>

	public init(x: Float, y: Float, u: Float, v: Float, color: GameColor){
		position = SIMD3(x, y, 0)
		texCoord = SIMD2(u, v)
		self.color = color
	}
}
