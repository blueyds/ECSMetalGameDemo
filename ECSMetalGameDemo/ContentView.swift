import SwiftUI
import MetalView
import simd

let renderer = Renderer()
let game = Sandbox()
struct ContentView: View {
    var body: some View {
        VStack {
            MetalView(device: renderer.device, clearColor: renderer.clearColor, colorPixelFormat: renderer.pixelFormat)
				.onUpdate {
					game.update()
				}
                .onRender(){encoder in
                    renderer.set(renderCommandEncoder: encoder)
                    game.draw(using: renderer)
                    
                }
            Text("Hello, world!")
        }
        .task {
            game.setupECS()
        }
    }
}
