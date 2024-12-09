import SwiftUI
import GameColor

class Sandbox: SceneProtocol{
    let player: Entity
    let  manager: Manager
    var camera: Camera? = nil

    var color: SIMD4<Float> = .blue
    init(){
        manager = Manager()
        player = manager.addNewEntity()
	let cameraEntity = manager.addNewEntity()

	let _ = player.add(component: TransformComponent(x: 0, y: 0))
	let _ = player.add(component: TriangleComponent(color: .purple))
	addNewTile(x: -1, y: 0, color: .red)
	addNewTile(x: 0, y: 0, color: .blue)
	addNewTile(x: -1, y: -1, color: .yellow)
	addNewTile(x: 0, y: -1, color: .green)
		let _ = 	cameraEntity.add(component: TransformComponent(x: 0, y: 0))
		//let transform:TransformComponent = cameraEntity.get()!
		//transform.scale = SIMD3(repeating: 0.1)
		camera = cameraEntity.add(component: CameraComponent(scaledBy: SIMD3(0.5, 0.5, 1)))
}
	func addNewTile(x: Float, y: Float, color: SIMD4<Float>){
		let tile = manager.addNewEntity()
		let _ = tile.add(component: TransformComponent(x: x, y: y, z: 0.9))
		let _ = tile.add(component: QuadComponent(color: color))
	}
    func setupECS(){
        
    }
	

}
