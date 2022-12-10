//
// Solar System
//

import Raylib

class RWindow {
  init(width: Int32, height: Int32, title: String, configFlags: ConfigFlags? = nil) {
    if let flags = configFlags {
      Raylib.setConfigFlags(flags)
    }
    Raylib.initWindow(width, height, title)
  }

  var width: Int32 {
    Raylib.getScreenWidth()
  }

  var height: Int32 {
    Raylib.getScreenHeight()
  }

  deinit {
    Raylib.closeWindow()
  }
}

extension Raylib {
  static func draw(_ body: () -> Void) {
    Raylib.beginDrawing()
    body()
    Raylib.endDrawing()
  }
}

extension Camera {
  func mode3D(_ body: () -> Void) {
    Raylib.beginMode3D(self)
    body()
    Raylib.endMode3D()
  }
}

extension Model {
  init(_ path: String) {
    self = Raylib.loadModel(path)
  }
}
