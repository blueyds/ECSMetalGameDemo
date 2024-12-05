//
//  SceneProtocol.swift
//  ECSMetalGameDemo
//
//  Created by Craig Nunemaker on 12/4/24.
//

import Foundation
public protocol SceneProtocol: AnyObject{
	var manager: Manager { get }
	var camera: Entity { get }
}

extension SceneProtocol{
	public func draw(using renderer: Renderer){
		if let cameraComponent: CameraComponent = camera.get(){
			var viewMatrix = cameraComponent.viewMatrix
			guard let rCE = renderer.rCE else { return}
			rCE.setVertexBytes(&viewMatrix, length: Matrix.stride(), index: 2)
			manager.draw(renderer: renderer)
		}
	}
	public func update(){
		manager.update()
	}
}
