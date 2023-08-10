//
//  Shaders.metal
//  ATTAMetal
//
//  Created by Jacob Bartlett on 10/08/2023.
//

#include <metal_stdlib>
using namespace metal;

struct VertexOut {
    float4 position [[position]];
    float time;
};

vertex VertexOut vertex_main(constant float4* vertices [[buffer(0)]], uint vid [[vertex_id]], constant float &time [[buffer(1)]]) {
    VertexOut out;
    out.position = vertices[vid];
    out.time = time;
    return out;
}

fragment float4 fragment_main(VertexOut in [[stage_in]]) {
    float r = sin(in.time) * 0.5 + 0.5;
    float g = sin(in.time + 2.0) * 0.5 + 0.5;
    float b = sin(in.time + 4.0) * 0.5 + 0.5;
    return float4(r, g, b, 1.0);
}
