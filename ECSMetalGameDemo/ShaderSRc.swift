import SwiftUI

let shaderSrc: String = """
#include <metal_stdlib>
using namespace metal;

struct VertexIn{
    float3 position;
    float4 color;
};

struct RasterizerData{
    float4 position [[ position ]];
    float4 color;
};

vertex RasterizerData basic_vertex_shader(device VertexIn *vertices [[ buffer(0)]],  uint vertexID [[vertex_id ]]){
    RasterizerData rd;
    float3 position = vertices[vertexID].position;
    rd.position = position;
    rd.color = vertices[vertexID].color;
    return rd;
}

fragment half4 basic_fragment_shader(RasterizerData rd [[ stage_in ]]){
    return half4(rd.color.r, rd.color.g, rd.color.b, rd.color.a);
}


"""
