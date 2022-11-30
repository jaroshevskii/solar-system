//
// Solar System
//

import Raylib

extension Raylib {
  static func draw(_ drawCanvas: () -> Void) {
    Raylib.beginDrawing()
    drawCanvas()
    Raylib.endDrawing()
  }
}

extension Camera {
  func mode3D(_ drawCanvas: () -> Void) {
    Raylib.beginMode3D(self)
    drawCanvas()
    Raylib.endMode3D()
  }
}