import Foundation
import simd

public class QuadComponent: Component, VertexCollectionProtocol{
    public var entity: Entity?
    public var transform: TransformComponent?
    static public let typeID: Int = Manager.getNewComponentTypeID()
    
    public var vertices: [Vertex] = []
    public init(color: SIMD4<Float>){
        vertices.append(Vertex(x: -0.5, y:  0.5, u: 0, v: 0, color: color)) // TL
        vertices.append(Vertex(x:  0.5, y:  0.5, u: 1, v: 0, color: color)) // TR
        vertices.append(Vertex(x: -0.5, y: -0.5, u: 0, v: 1, color: color)) // BL
        vertices.append(Vertex(x: -0.5, y: -0.5, u: 0, v: 1, color: color)) // BL
        vertices.append(Vertex(x:  0.5, y:  0.5, u: 1, v: 0, color: color)) // TR
        vertices.append(Vertex(x:  0.5, y: -0.5, u: 1, v: 1, color: color)) // BR
    }

}
