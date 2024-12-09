public protocol Component: AnyObject{
    var entity: Entity? { get set}
    static var typeID: Int { get }
    func setup()
    func update()

	func preDraw() // mostly used to update final matrix calculations foor
	 // drawing outside of the actuall draw cycle

    func draw(renderer: any Renderer)
}

extension Component{
    public func setup(){}
    public func update() {}
	public func preDraw() {}
    public func draw(renderer: any Renderer){}
}

