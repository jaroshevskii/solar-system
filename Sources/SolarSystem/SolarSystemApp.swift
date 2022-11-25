//
// Solar System
//

import Raylib

@main
class SolarSystemApp {
  let windowTitle = "Solard System"
  let windowResolution: (width: Int32, height: Int32) = (960, 540)

  let text = "OMG..."
  let textFontSize: Int32 = 20
  let textPosition: (x: Int32, y: Int32)

  var camera = Camera3D(
    position: Vector3(x: 10.0, y: 1.0, z: 10.0),
    target: Vector3(x: 0.0, y: 0.0, z: 0.0),
    up: Vector3(x: 0.0, y: 1.0, z: 0.0),
    fovy: 45.0,
    _projection: CameraProjection.perspective.rawValue
  )

  let cubePosition = Vector3(x: 0.0, y: 0.0, z: 0.0)

  var sphere = (
    position: Vector3(x: 0.0, y: 0.0, z: 0.0),
    radius: Float(1.0),
    rings: Int32(0),
    slices: Int32(0),
    color: Color.blue,
    wiresColor: Color.skyBlue
  )

  init() {
    Raylib.setConfigFlags([
      .vsyncHint
      // .msaa4xHint,
      // .fullscreenMode,
    ])
    Raylib.initWindow(windowResolution.width, windowResolution.height, windowTitle)
    Raylib.setCameraMode(camera, .free)

    textPosition = (
      x: (windowResolution.width - Raylib.measureText(text, textFontSize)) / 2,
      y: 8
    )
  }

  deinit {
    Raylib.closeWindow()
  }

  func input() {
    if Raylib.isKeyPressed(.up) { sphere.slices += 1 }
    if Raylib.isKeyPressed(.down) { sphere.slices -= 1 }
    if Raylib.isKeyPressed(.right) { sphere.rings += 1 }
    if Raylib.isKeyPressed(.left) { sphere.rings -= 1 }
  }

  func update(deltaTime: Float) {
    Raylib.updateCamera(&camera)
  }

  func draw() {
    Raylib.beginDrawing()
    Raylib.clearBackground(.black)

    Raylib.beginMode3D(camera)

    // Raylib.drawCube(cubePosition, 2.0, 2.0, 2.0, .red)
    // Raylib.drawCubeWires(cubePosition, 2.0, 2.0, 2.0, .maroon)
    // Raylib.drawSphere(spherePosition, 1.0, .blue)
    // Raylib.drawSphereWires(spherePosition, 1.0, 16, 0, .skyBlue)

    Raylib.drawSphereEx(
      sphere.position, sphere.radius, sphere.rings, sphere.slices, sphere.color)
    Raylib.drawSphereWires(
      sphere.position, sphere.radius, sphere.rings, sphere.slices, sphere.wiresColor)

    // Raylib.drawSphere(centerPos: Vector3, radius: Float, color: Color)
    // Raylib.drawSphereWires(centerPos: Vector3, radius: Float, rings: Int32, slices: Int32, color: Color)
    // Raylib.drawSphereEx(centerPos: Vector3, radius: Float, rings: Int32, slices: Int32, color: Color)

    Raylib.drawGrid(16, 1.0)

    Raylib.endMode3D()

    Raylib.drawFPS(8, 8)
    Raylib.drawText(
      """
      Sphere:
          Rings: \(sphere.rings)
          Slices: \(sphere.slices)
      """, 8, 8 + 20 + 8, 10, .red)

    Raylib.endDrawing()
  }

  func run() {
    while !Raylib.windowShouldClose {
      input()
      update(deltaTime: Raylib.getFrameTime())
      draw()
    }
  }

  static func main() {
    let solarSystemApp = SolarSystemApp()
    solarSystemApp.run()
  }
}
