//
// Solar System
//

import Foundation
import Raylib

struct Planet {
  var name: String
  var text: String
  var model: Model
  var position: Vector3
  var scale: Float
  var spinSpeed: Float

  var spinAngle: Float = 0 {
    didSet {
      if spinAngle >= 360 { spinAngle -= 360 }
    }
  }

  init(
    name: String, text: String, model: Model, position: Vector3, scale: Float,
    spinSpeed: Float
  ) {
    self.name = name
    self.text = text
    self.model = model
    self.position = position
    self.scale = scale
    self.spinSpeed = spinSpeed
  }

  func draw() {
    Raylib.drawModel(model, position, scale, .white)
  }

  mutating func spin(around sunPosition: Vector3, deltaTime: Float) {
    let distanceToSun = position.distance(sunPosition)
    spinAngle += spinSpeed * deltaTime
    let spinAngleInRadians = spinAngle * Float.pi / 180

    position.x = sunPosition.x + distanceToSun * cos(spinAngleInRadians)
    position.z = sunPosition.z + distanceToSun * sin(spinAngleInRadians)
  }
}
