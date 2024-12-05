import simd

public class CameraComponent: Component, Camera{
	public var projectionScale: SIMD3<Float>

	public var entity: Entity? = nil
	public static var typeID: Int = Manager.getNewComponentTypeID()
	public var transform: TransformComponent? = nil
	public var viewMatrix: Matrix = .identity
	public var projectionMatrix: Matrix {
		var result: Matrix = .identity
		result.scale(projectionScale)
		return result
	}
	init(scaledBy: SIMD3<Float>){
		projectionScale = scaledBy
	}
}
