import Foundation
import simd

public struct Vertex{
    public let position: SIMD3<Float>
    public let color: SIMD4<Float>
    public init(x: Float, y: Float, color: SIMD4<Float>){
        position  = SIMD3(x, y, 0)
        self.color = color
    }    
}

