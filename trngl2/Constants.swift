import simd

struct ModelConstants {
    var modelViewMatrix = matrix_identity_float4x4
}

struct SceneConstants {
    var projectionMatrix = matrix_identity_float4x4
}

enum FunctionName: String {
    case fragmentShader = "fragment_shader"
    case vertexShader = "vertex_shader"
    case texturedFragment = "textured_fragment"
}
