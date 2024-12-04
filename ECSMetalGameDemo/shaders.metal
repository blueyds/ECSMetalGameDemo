//
//  shaders.metal
//  ECSMetalGameDemo
//
//  Created by Craig Nunemaker on 12/4/24.
//

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

vertex RasterizerData basic_vertex_shader(const device VertexIn *vertices [[ buffer(0)]],  constant float4x4 &modelMatrix [[ buffer(1) ]], uint vertexID [[vertex_id ]]){
	RasterizerData rd;
	float4 position = float4(vertices[vertexID].position, 1);
	rd.position = modelMatrix * position;
	rd.color = vertices[vertexID].color;
	return rd;
}

fragment half4 basic_fragment_shader(RasterizerData rd [[ stage_in ]]){
	return half4(rd.color.r, rd.color.g, rd.color.b, rd.color.a);
}


