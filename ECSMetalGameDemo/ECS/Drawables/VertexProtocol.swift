import Foundation
import simd
import Sizeable

public protocol VertexProtocol:  sizeable{
	init(x: Float, y: Float, u: Float, v: Float, color: SIMD4<Float>)
}

extension VertexProtocol{
	public func strideOfType(count: Int) -> Int {
		Self.stride(of: count)
	}
}


