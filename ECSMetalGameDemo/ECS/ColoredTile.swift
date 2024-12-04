import Foundation
import simd

public class ColoredTile: Component, VertexCollectionProtocol{
    public var entity: Entity?
    public var transform: TransformComponent?
    static public let typeID: Int = Manager.getNewComponentTypeID()
    
    public var vertices: [Vertex] = []
    public init(color: SIMD4<Float>){
        vertices.append(Vertex(x: 0, y: 1, color: color))
        vertices.append(Vertex(x: 1, y: 1, color: color))
        vertices.append(Vertex(x: 0, y: 0, color: color))
        vertices.append(Vertex(x: 0, y: 0, color: color))
        vertices.append(Vertex(x: 1, y: 1, color: color))
        vertices.append(Vertex(x: 1, y: 0, color: color))
    }

}
