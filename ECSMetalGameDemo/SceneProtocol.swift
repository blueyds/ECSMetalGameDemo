//
//  SceneProtocol.swift
//  ECSMetalGameDemo
//
//  Created by Craig Nunemaker on 12/4/24.
//

import Foundation
public protocol SceneProtocol: AnyObject{
	var manager: Manager { get }
	var camera: Camera? { get }
}

extension SceneProtocol{
	public func draw(using renderer: Renderer){
		if camera != nil {
			var viewMatrix = camera!.viewMatrix
			renderer!.rCE.setVertexBytes(&viewMatrix, length: Matrix.stride(), index: 2)
			var projectionMatrix = camera!.projectionMatrix
			renderer!.rCE.setVertexBytes(&projectionMatrix, length: Matrix.stride(), index: 3)
		}
		manager.draw(renderer: renderer)
	}

	public func update(){
		manager.update()
	}
}
