import SwiftUI

class Sandbox{
    let player: Entity
    let  manager: Manager
    let camera: Entity

    var color: SIMD4<Float> = .blue
    init(){
        manager = Manager()
        player = manager.addNewEntity()
		camera = manager.addNewEntity()

        player.add(component: TransformComponent(x: -1, y: -1))
	player.add(component: TriangleComponent(color: .purple))
	addNewTile(x: -1, y: 0, color: .red)
	addNewTile(x: 0, y: 0, color: .blue)
	//addNewTile(x: -1, y: -1, color: .yellow)
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
	func update(){
		manager.update()
	}
    func draw(using renderer: Renderer){
		if let cameraComponent: CameraComponent = camera.get(){
			var viewMatrix = cameraComponent.viewMatrix
			guard let rCE = renderer.rCE else { return}
			rCE.setVertexBytes(&viewMatrix, length: Matrix.stride(), index: 2)
			manager.draw(renderer: renderer)
    	}

//        renderer.rCE?.setVertexBytes(vertices, length: MemoryLayout<Vertex>.stride * vertices.count, index: 0)
//        renderer.rCE?.setFragmentBytes(&color, length: MemoryLayout<SIMD4<Float>>.stride, index: 1)
//        renderer.rCE?.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: vertices.count) 
    }
}
