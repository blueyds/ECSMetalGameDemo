import SwiftUI

class Sandbox: SceneProtocol{
    let player: Entity
    let  manager: Manager
    var camera: Camera? = nil

    var color: SIMD4<Float> = .blue
    init(){
        manager = Manager()
        player = manager.addNewEntity()
	let cameraEntity = manager.addNewEntity()

		player.add(component: TransformComponent(x: 0, y: 0))
	player.add(component: TriangleComponent(color: .purple))
	addNewTile(x: -1, y: 0, color: .red)
	addNewTile(x: 0, y: 0, color: .blue)
	addNewTile(x: -1, y: -1, color: .yellow)
	addNewTile(x: 0, y: -1, color: .green)
		cameraEntity.add(component: TransformComponent(x: 9, y: 9))
		//let transform:TransformComponent = cameraEntity.get()!
		//transform.scale = SIMD3(repeating: 0.1)
	cameraEntity.add(component: CameraComponent())
		let cameraComponent: CameraComponent = cameraEntity.get()!
		camera = cameraComponent as Camera
}
	func addNewTile(x: Float, y: Float, color: SIMD4<Float>){
		let tile = manager.addNewEntity()
		tile.add(component: TransformComponent(x: x, y: y, z: 0.9))
		tile.add(component: QuadComponent(color: color))
	}
    func setupECS(){
        
    }
	

}
