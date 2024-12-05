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
		var viewMatrix = camera?.viewMatrix ?? Matrix.identity
		var projectionMatrix = camera?.projectionMatrix ?? Matrix.identity
		renderer.rCE!.setVertexBytes(&viewMatrix, length: Matrix.stride(), index: 2)
		renderer.rCE!.setVertexBytes(&projectionMatrix, length: Matrix.stride(), index: 3)
		manager.draw(renderer: renderer)

	}

	public func update(){
		manager.update()
	}
}
