import Foundation
import simd
public protocol Camera:Component{
	var viewMatrix: Matrix { get set }
	var projectionMatrix: Matrix { get }
	var position: SIMD3<Float> { get }
}

extension Camera{
	public func preDraw(){
		viewMatrix = .identity
		viewMatrix.translateModel(-position)
	}
	public func perspective(degreesFov: Float, aspectRatio: Float, nearZ: Float, farZ: Float )-> Matrix {
		var result = Matrix.identity
		let fov = degreesFov * Float.pi / 180
		let ys = 1 / tanf(fov * 0.5)
		let xs = ys / aspectRatio
		let zs = farZ / (nearZ - farZ)
		result.columns = (
			SIMD4<Float>(xs,  0, 0,   0),
			SIMD4<Float>( 0, ys, 0,   0),
			SIMD4<Float>( 0,  0, zs, -1),
			SIMD4<Float>( 0,  0, zs * nearZ, 0))
		return result
	}
	
}
public class CameraComponent: Component, Camera{
	public var entity: Entity? = nil
	public static var typeID: Int = Manager.getNewComponentTypeID()
	public var following: TransformComponent? = nil
	public var viewMatrix: Matrix = .identity
	public var position: SIMD3<Float> = .zero
	public var projectionMatrix: Matrix {
		perspective(degreesFov: 60, aspectRatio: 1, nearZ: 0, farZ: 100)
	}
	init(following: Entity?){
		self.following = following?.get()
	}
	public func postUpdate(){
		if following != nil {
			position = following!.position
		}
	}
}
