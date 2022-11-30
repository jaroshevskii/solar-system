//
// Solar System
//

import Raylib

protocol SpaceObject {
  var name: String { get set }
  var model: Model { get set }
  var position: Vector3 { get set }

  func draw()
}

extension SpaceObject {
  
}

// struct Sun: SpaceObject {
//   var scale: Vector3
//   var name: String
//   var model: Model
//   var position: Vector3

//   func draw() {
//     Raylib.drawModel(model, position, scale, .white)
//   }
// }

struct PlanetLegacy: SpaceObject {
  var name: String
  var model: Model
  var position: Vector3
  var rotationAxis = Vector3()
  var rotationAngle: Float = 0.0
  var scale: Float

  func draw() {
    // Raylib.drawModelEx(
    //   model, position, rotationAxis, rotationAngle, Vector3(x: scale, y: Float, z: Float), .white)
  }
}

struct SpaceObjectLegacy {
  let name: String
  let model: Model
  let position: Vector3
  let rotationAxis: Vector3
  let rotationAngle: Float
  let scale: Float

  init(
    name: String, model: Model, position: Vector3, rotationAxis: Vector3? = nil,
    rotationAngle: Float? = nil, scale: Float
  ) {
    self.name = name
    self.model = model
    self.position = position
    self.rotationAxis = rotationAxis ?? Vector3()
    self.rotationAngle = rotationAngle ?? 0.0
    self.scale = scale
  }

  func draw() {
    Raylib.drawModelEx(
      model, position, rotationAxis, rotationAngle, Vector3(x: scale, y: scale, z: scale), .white)
    Raylib.drawModelWiresEx(
      model, position, rotationAxis, rotationAngle, Vector3(x: scale, y: scale, z: scale), .black)
    // Raylib.drawModelWires(model, position, scale, .white)
  }
}
