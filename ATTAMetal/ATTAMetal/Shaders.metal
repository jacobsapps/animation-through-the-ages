//
//  Shaders.metal
//  ATTAMetal
//
//  Created by Jacob Bartlett on 10/08/2023.
//

#include <metal_stdlib>
using namespace metal;

vertex float4 vertex_main(constant float4* vertices [[buffer(0)]], uint vid [[vertex_id]]) {
    return vertices[vid];
}

fragment float4 fragment_main() {
    return float4(1, 0, 0, 1);
}
