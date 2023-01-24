//
//  Types.swift
//  trngl2
//
//  Created by Камилла Балаева on 21.01.2023.
//

import simd

struct Vertex {
  var position: float3
  var color: float4
  var texture: float2
}

struct ModelConstants {
  var modelViewMatrix = matrix_identity_float4x4
}
