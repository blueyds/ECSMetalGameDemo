import simd
import MetalKit

extension SIMD4<Float>{
    public var mtlClearColor: MTLClearColor{
        MTLClearColor(red: Double(x), green: Double(y), blue: Double(z), alpha: Double(w))
    }
    static public var black: SIMD4<Float>{ 
        SIMD4<Float>(0,0,0,1)
    }
    static public var navy: SIMD4<Float>{ 
        SIMD4<Float>(0,0,0.5,1)
    }
    static public var blue: SIMD4<Float>{ 
        SIMD4<Float>(0,0,1,1)
    }
    static public var green: SIMD4<Float> { 
        SIMD4<Float>(0, 0.5, 0,1)
    }
    static public var teal: SIMD4<Float>{ 
        SIMD4<Float>(0, 0.5, 0.5,1)
    }
    static public var lime: SIMD4<Float>{ 
        SIMD4<Float>(0, 1, 0, 1)
    }
    static public var aqua: SIMD4<Float> { 
        SIMD4<Float>(0, 1, 1, 1)
    }
    static public var maroon: SIMD4<Float>{ 
        SIMD4<Float>(0.5, 0, 0, 1)
    }
    static public var purple: SIMD4<Float> { 
        SIMD4<Float>(0.5, 0, 0.5, 1)
    }
    static public var olive: SIMD4<Float> { 
        SIMD4<Float>(0.5, 0.5, 0, 1)
    }
    static public var gray: SIMD4<Float> { 
        SIMD4<Float>(0.5, 0.5, 0.5, 1)
    }
    static public var silver: SIMD4<Float> { 
        SIMD4<Float>(0.75, 0.75, 0.75, 1)
    }
    static public var red: SIMD4<Float> { 
        SIMD4<Float>(1, 0, 0, 1)
    }
    static public var fuchsia: SIMD4<Float> { 
        SIMD4<Float>(1, 0, 1, 1)
    }
    static public var yellow: SIMD4<Float>{ 
        SIMD4<Float>(1, 1, 0, 1)
    }
    static public var white: SIMD4<Float> {
        SIMD4<Float>(1, 1, 1, 1)
    }
}


