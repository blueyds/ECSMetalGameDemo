import Foundation
import simd

public struct Vertex{
    public let position: SIMD3<Float>
    public let color: SIMD4<Float>
	private static let defaultColor: SIMD4<Float> = .black
    public let texCoord: SIMD2<Float>
    public init(x: Float, y: Float, color: SIMD4<Float>){
        position  = SIMD3(x, y, 0)
        self.color = color
		texCoord = .zero
    }
    public init(x: Float, y: Float, u: Float, v: Float){
        position = SIMD3(x, y, 0)
        texCoord = SIMD2(u, v)
		self.color = Vertex.defaultColor
    }
    public init(x: Float, y: Float, u: Float, v: Float, color: SIMD4<Float>){
        position = SIMD3(x, y, 0)
        texCoord = SIMD2(u, v)
        self.color = color
    }
}

