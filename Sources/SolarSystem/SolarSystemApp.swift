//
// Solar System
//

import Raylib

@main
class SolarSystemApp {
  let windowTitle = "Solard System"
  let windowResolution = (width: Int32(640), height: Int32(360))

  let text = "Solar System"
  let textFontSize: Int32 = 30
  let textPosition: (x: Int32, y: Int32)

  init() {
    Raylib.setConfigFlags(.vsyncHint)
    Raylib.initWindow(windowResolution.width, windowResolution.height, windowTitle)

    textPosition = (
      x: (windowResolution.width - Raylib.measureText(text, textFontSize)) / 2,
      y: (windowResolution.height - textFontSize) / 2
    )
  }

  deinit {
    Raylib.closeWindow()
  }

  func input() {

  }

  func update(deltaTime: Float) {

  }

  func draw() {
    Raylib.beginDrawing()
    Raylib.clearBackground(.black)

    Raylib.drawText(text, textPosition.x, textPosition.y, textFontSize, .white)
    Raylib.drawFPS(8, 8)

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
