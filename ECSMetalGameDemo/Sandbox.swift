import SwiftUI

class Sandbox: SceneProtocol{
    let player: Entity
    let  manager: Manager
    let camera: Camera? = nil

    var color: SIMD4<Float> = .blue
    init(){
        manager = Manager()
        player = manager.addNewEntity()
	camera = manager.addNewEntity()

        player.add(component: TransformComponent(x: 0, y: 0))
	player.add(component: TriangleComponent(color: .purple))
	addNewTile(x: -1, y: 0, color: .red)
//	addNewTile(x: 0, y: 0, color: .blue)
	addNewTile(x: -1, y: -1, color: .yellow)
	addNewTile(x: 0, y: -1, color: .green)
	camera.add(component: CameraComponent(following: player))
}	
	func addNewTile(x: Float, y: Float, color: SIMD4<Float>){
		let tile = manager.addNewEntity()
		tile.add(component: TransformComponent(x: x, y: y))
		tile.add(component: ColoredTile(color: color))
	}
    func setupECS(){
        
    }
	

}
