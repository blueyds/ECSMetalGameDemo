import Foundation
import SwiftMatrix

public protocol Renderer{
	associatedtype V: VertexProtocol
	func pushDebug(named: String)
	func setModel(matrix: Matrix)
	func setView(matrix: Matrix)
	func setProjection(matrix: Matrix)
	func setVertex(vertices: [V])
	func drawPrimitives(count: Int)
	func popDebug()
}
