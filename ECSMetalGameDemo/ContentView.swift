import SwiftUI
import MetalView
import simd

let engine = GameRenderer()
let game = Sandbox()
struct ContentView: View {
    var body: some View {
        VStack {
            MetalView(device: renderer.device, clearColor: renderer.clearColor, colorPixelFormat: renderer.pixelFormat)
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
