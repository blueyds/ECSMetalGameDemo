import simd
import SwiftMatrix
public class TransformComponent: Component{
    public var entity: Entity? = nil
    static public let typeID: Int = Manager.getNewComponentTypeID()
    public var position: SIMD3<Float> = .zero
	public var rotation: SIMD3<Float> = .zero
	public var scale: SIMD3<Float> = .one
    public var modelMatrix: Matrix = .identity
	public init(){}
    public init(x: Float, y: Float){
        position = SIMD3(x, y, 0)
    }
	public init(x: Float, y: Float, z: Float){
		position = SIMD3(x, y, z)
	}
    public func preDraw() {
        modelMatrix = .identity
        modelMatrix.translateModel(position)
		modelMatrix.rotate(rotation)
		modelMatrix.scale(scale)
    }

	public var viewMatrix: Matrix {
		var result:Matrix = .identity
		result.translateModel(-position)
		result.rotate(rotation)
		result.scale(scale)
		return result
	}
}

