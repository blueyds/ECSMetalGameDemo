import simd
public class TransformComponent: Component{
    public var entity: Entity? = nil
    static public let typeID: Int = Manager.getNewComponentTypeID()
    public var position: SIMD3<Float> = .zero
    public var modelMatrix: Matrix = .identity
    public init(x: Float, y: Float){
        position = SIMD3(x, y, 0)
    }
	public init(x: Float, y: Float, z: Float){
		position = SIMD3(x, y, z)
	}
    public func preDraw() {
        modelMatrix = .identity
        modelMatrix.translateModel(position)

    }
}

