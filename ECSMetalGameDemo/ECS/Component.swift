public protocol Component: AnyObject{
    var entity: Entity? { get set}
    static var typeID: Int { get }
    func setup()
    func update()
    func postUpdate() // may be used to do final preps for the preDraw cycle.
    	// cameras will usually use postUpdate
	
	func preDraw() // mostly used to update final matrix calculations foor drawing
    func draw(renderer: Renderer)
}

extension Component{
    public func setup(){}
    public func update() {}
    public func postUpdate() {}
	public func preDraw() {}
    public func draw(renderer: Renderer){}
}

