import Foundation
import simd

public protocol CustomQuadMesh: CustomMeshComponent{
	var color: SIMD4<Float> { get }
}

extension CustomQuadMesh{
	public func buildVertices(){
		vertices.append(V(x: -0.5, y:  0.5, u: 0, v: 0, color: color)) // TL
		vertices.append(V(x:  0.5, y:  0.5, u: 1, v: 0, color: color)) // TR
		vertices.append(V(x: -0.5, y: -0.5, u: 0, v: 1, color: color)) // BL
		vertices.append(V(x: -0.5, y: -0.5, u: 0, v: 1, color: color)) // BL
		vertices.append(V(x:  0.5, y:  0.5, u: 1, v: 0, color: color)) // TR
		vertices.append(V(x:  0.5, y: -0.5, u: 1, v: 1, color: color)) // BR
	}

}
