public protocol Component: AnyObject{
    var entity: Entity? { get set}
    static var typeID: Int { get }
    func setup()
    func update()
	func preDraw() // mostly used to update final matrix calculations foor drawing
    func draw(renderer: Renderer)
}

extension Component{
    public func setup(){}
    public func update() {}
	public func preDraw() {}
    public func draw(renderer: Renderer){}
}

