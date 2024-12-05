import Foundation
import simd

public struct Vertex{
    public let position: SIMD3<Float> = .zero
    public let color: SIMD4<Float> = .zero
    public let texCoord: SIMD2<Float> = .zero
    public init(x: Float, y: Float, color: SIMD4<Float>){
        position  = SIMD3(x, y, 0)
        self.color = color
    }
    public init(x: Float, y: Float, u: Float, v: Float){
        position = SIMD3(x, y, 0)
        texCoord = SIMD2(u, v)
    }
    public init(x: Float, y: Float, u: Float, v: Float, color: SIMD4<Float>){
        position = SIMD3(x, y, 0)
        texCoord = SIMD2(u, v)
        self.color = color
    }
}

