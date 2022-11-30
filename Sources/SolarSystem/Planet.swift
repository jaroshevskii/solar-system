//
// Solar System
//

import Raylib

struct Planet {
  var name: String
  var model: Model
  var position: Vector3
  var rotationAxis: Vector3
  var rotationAngle: Float = 0.0
  var scale: Vector3

  func draw() {
    Raylib.drawModelEx(model, position, rotationAxis, rotationAngle, scale, .white)
  }
}
