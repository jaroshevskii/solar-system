//
// Solar System
//

import Raylib

struct Sun {
  var model: Model
  var position: Vector3
  var scale: Float

  func draw() {
    Raylib.drawModel(model, position, scale, .white)
  }
}