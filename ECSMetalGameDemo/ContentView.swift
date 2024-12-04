<<<<<<< HEAD
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
=======
//
//  ContentView.swift
//  ECSMetalGameDemo
//
//  Created by Craig Nunemaker on 12/4/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
>>>>>>> main
