import Foundation
import simd

public class CameraComponent: Component{
	public var entity: Entity? = nil
	public static var typeID: Int = Manager.getNewComponentTypeID()
	public var following: TransformComponent? = nil
	public var viewMatrix: Matrix = .identity
	init(following: Entity?){
		self.following = following.get()
	}
	public func preDraw(){
		guard let position = following?.position else {
			return
		 }
		viewMatrix = .identity
		viewMatrix.translateModel(-position)
	}
}