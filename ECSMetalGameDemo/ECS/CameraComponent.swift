import simd

public class CameraComponent: Component, Camera{
	public var entity: Entity? = nil
	public static var typeID: Int = Manager.getNewComponentTypeID()
	public var transform: TransformComponent? = nil
	public var viewMatrix: Matrix = .identity
	public var projectionMatrix: Matrix {
		var result: Matrix = .identity
		result.scale(SIMD3<Float>(0.1, 0.1, 1))
		return result
	}
	init(following: Entity? = nil){
		self.transform = following?.get()
	}
}
