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

float4x4 rotationMatrix(float angle, float3 axis) {
    float c = cos(angle);
    float s = sin(angle);
    float3 normalized = normalize(axis);
    float3 temp = (1.0 - c) * normalized;
    
    float4x4 rotation = {
        {c + temp.x * normalized.x, temp.x * normalized.y + s * normalized.z, temp.x * normalized.z - s * normalized.y, 0.0},
        {temp.y * normalized.x - s * normalized.z, c + temp.y * normalized.y, temp.y * normalized.z + s * normalized.x, 0.0},
        {temp.z * normalized.x + s * normalized.y, temp.z * normalized.y - s * normalized.x, c + temp.z * normalized.z, 0.0},
        {0.0, 0.0, 0.0, 1.0}
    };
    
    return rotation;
}

vertex VertexOut vertex_main(constant float4* vertices [[buffer(0)]], uint vid [[vertex_id]], constant float &time [[buffer(1)]]) {
    VertexOut out;
    
    float4x4 rotation = rotationMatrix(time, float3(0.0, 0.0, 1.0));

    out.position = rotation * vertices[vid];
    out.time = time;
    
    return out;
}

fragment float4 fragment_main(VertexOut in [[stage_in]]) {
    float r = sin(in.time) * 0.5 + 0.5;
    float g = sin(in.time + 2.0) * 0.5 + 0.5;
    float b = sin(in.time + 4.0) * 0.5 + 0.5;
    return float4(r, g, b, 1.0);
}
