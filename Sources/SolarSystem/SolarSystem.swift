//
// Solar System
//

import Foundation
import Raylib

@main
class SolarSystemApp {
  let windowTitle = "Solard System"
  let windowResolution = (width: Int32(960), height: Int32(540))

  var camera = Camera3D(
    position: Vector3(x: 5, y: 1, z: 5),
    target: Vector3(x: 0, y: 0, z: 0),
    up: Vector3(x: 0, y: 1, z: 0),
    fovy: 45,
    _projection: CameraProjection.perspective.rawValue
  )

  var earth: Planet

  init() {
    Raylib.setConfigFlags([
      .vsyncHint,
      .msaa4xHint,
    ])
    Raylib.initWindow(windowResolution.width, windowResolution.height, windowTitle)
    Raylib.setCameraMode(camera, .free)

    earth = Planet(
      name: "Earth",
      model: Raylib.loadModel(Bundle.module.path(forResource: "LowPolyEarth", ofType: "obj")!),
      position: Vector3(x: 4, y: 0, z: 0),
      rotationAxis: Vector3(x: 0, y: 1, z: 0),
      scale: Vector3(x: 1, y: 1, z: 1)
    )
  }

  static func main() {
    let solarSystemApp = SolarSystemApp()
    solarSystemApp.run()
  }

  func run() {
    while !Raylib.windowShouldClose {
      input()
      update(deltaTime: Raylib.getFrameTime())
      draw()
    }
  }

  func input() {
    if Raylib.isKeyPressed(.letterV) {
      if Raylib.isWindowState(.vsyncHint) {
        Raylib.clearWindowState(.vsyncHint)
      } else {
        Raylib.setWindowState(.vsyncHint)
      }
    }
  }

  func update(deltaTime: Float) {
    earth.rotationAngle += 30 * deltaTime

    if earth.rotationAngle >= 360 {
      earth.rotationAngle -= 360
    }

    let angle = earth.rotationAngle * Float.pi / 180
    earth.position.x = 0 + 4 * cos(angle)
    earth.position.z = 0 + 4 * sin(angle)

    Raylib.updateCamera(&camera)
  }

  func draw() {
    Raylib.draw {
      Raylib.clearBackground(.black)

      camera.mode3D {
        // Sun.
        Raylib.drawSphere(Vector3(), 2, .gold)

        earth.draw()

        // Mon.
        Raylib.drawSphere(
          Vector3(
            x: earth.position.x + 1.5 * cos((earth.rotationAngle * 4) * Float.pi / 180),
            y: 0,
            z: earth.position.z + 1.5 * sin((earth.rotationAngle * 4) * Float.pi / 180)
          ),
          0.25, .gray
        )

        Raylib.drawGrid(16, 1)
      }

      Raylib.drawFPS(8, 8)
      Raylib.drawText(
        """
        VSync: \(Raylib.isWindowState(.vsyncHint))
        MSAA 4x: \(Raylib.isWindowState(.msaa4xHint))

        \(earth.name):
            Position: \(earth.position)
            Rotation axis: \(earth.rotationAxis)
            Rotation angle: \(earth.rotationAngle)
        """, 8, 8 + 20 + 8, 10, .red)
    }
  }

  deinit {
    Raylib.unloadModel(earth.model)
    Raylib.closeWindow()
  }
}
