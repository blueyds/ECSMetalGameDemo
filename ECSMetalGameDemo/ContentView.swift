import SwiftUI
import MetalView
import simd

let engine = GameRenderer()
let game = Sandbox()
struct ContentView: View {
    var body: some View {
        VStack {
			MetalView(device: engine.device, clearColor: engine.clearColor, colorPixelFormat: engine.pixelFormat, depthPixelFormat: engine.depthPixelFormat)
				.onUpdate {
					game.update()
				}
                .onRender(){encoder in
                    engine.set(renderCommandEncoder: encoder)
                    game.draw(using: engine)
                    
                }
            Text("Hello, world!")
        }
        .task {
            game.setupECS()
        }
    }
}
