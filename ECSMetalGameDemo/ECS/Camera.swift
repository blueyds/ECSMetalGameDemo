//
//  Camera.swift
//  ECSMetalGameDemo
//
//  Created by Craig Nunemaker on 12/5/24.
//

import Foundation
import simd

public protocol Camera: Component{
	var viewMatrix: Matrix { get set }
	var projectionMatrix: Matrix { get }
	var transform: TransformComponent? { get set  }
}


extension Camera{
	public func preDraw(){
		viewMatrix = transform?.viewMatrix ?? .identity
	}
	// our default set up will have it follow the transformComponent that is attached
	public func setup() {
		if transform == nil {
			transform = entity?.get()
		}
		// ok we need to create a transform coomponent for this camera
		if transform == nil {
			entity?.add(component: TransformComponent())
			transform = entity?.get()
		}
	}
	

}
