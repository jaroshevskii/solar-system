//
// Solar System
//

import Foundation
import Raylib

@main
class SolarSystemApp {
  let window = RWindow(
    width: 960,
    height: 540,
    title: "Solar System",
    configFlags: [.vsyncHint, .msaa4xHint]
  )
  var camera = Camera3D(
    position: Vector3(x: 47.5, y: 22.5, z: 47.5),
    target: Vector3(x: 0, y: -5, z: 0),
    up: Vector3(x: 0, y: 1, z: 0),
    fovy: 45,
    _projection: CameraProjection.perspective.rawValue
  )
  let sun = Sun(
    model: Raylib.loadModel(Bundle.module.path(forResource: "Sun", ofType: "glb") ?? ""),
    position: Vector3(x: 0, y: 0, z: 0),
    scale: 2 / 1000
  )
  var planets = [
    Planet(
      name: "Mercury",
      text: """
        The smallest planet in our solar system and nearest to the Sun, Mercury is only
        slightly larger than Earth's Moon.

        From the surface of Mercury, the Sun would appear more than three times as large
        as it does when viewed from Earth, and the sunlight would be as much as seven
        times brighter. Despite its proximity to the Sun, Mercury is not the hottest
        planet in our solar system - that title belongs to nearby Venus, thanks to its
        dense atmosphere.

        Because of Mercury's elliptical - egg-shaped - orbit, and sluggish rotation, the
        Sun appears to rise briefly, set, and rise again from some parts of the planet's
        surface. The same thing happens in reverse at sunset.
        """,
      model: Raylib.loadModel(Bundle.module.path(forResource: "Mercury", ofType: "glb") ?? ""),
      position: Vector3(x: 5, y: 0, z: 0),
      scale: 2 / 1000,
      spinSpeed: 5
    ),
    Planet(
      name: "Venus",
      text: """
        Venus is the second planet from the Sun and is Earth's closest planetary
        neighbor. It's one of the four inner, terrestrial (or rocky) planets, and it's
        often called Earth's twin because it's similar in size and density. These are
        not identical twins, however - there are radical differences between the two
        worlds.

        Venus has a thick, toxic atmosphere filled with carbon dioxide and it's
        perpetually shrouded in thick, yellowish clouds of sulfuric acid that trap heat,
        causing a runaway greenhouse effect. It's the hottest planet in our solar system,
        even though Mercury is closer to the Sun. Surface temperatures on Venus are about
        900 degrees Fahrenheit (475 degrees Celsius) - hot enough to melt lead. The
        surface is a rusty color and it's peppered with intensely crunched mountains and
        thousands of large volcanoes. Scientists think it's possible some volcanoes are
        still active.
        """,
      model: Raylib.loadModel(Bundle.module.path(forResource: "Venus", ofType: "glb") ?? ""),
      position: Vector3(x: 10, y: 0, z: 0),
      scale: 2 / 1000,
      spinSpeed: 10
    ),
    Planet(
      name: "Earth",
      text: """
        Our home planet is the third planet from the Sun, and the only place we know of
        so far that's inhabited by living things.

        While Earth is only the fifth largest planet in the solar system, it is the only
        world in our solar system with liquid water on the surface. Just slightly larger
        than nearby Venus, Earth is the biggest of the four planets closest to the Sun,
        all of which are made of rock and metal.

        The name Earth is at least 1,000 years old. All of the planets, except for
        Earth, were named after Greek and Roman gods and goddesses. However, the name
        Earth is a Germanic word, which simply means "the ground."
        """,
      model: Raylib.loadModel(Bundle.module.path(forResource: "Earth", ofType: "glb") ?? ""),
      position: Vector3(x: 15, y: 0, z: 0),
      scale: 2 / 1000,
      spinSpeed: 15
    ),
    Planet(
      name: "Mars",
      text: """
        Mars is the fourth planet from the Sun - a dusty, cold, desert world with a very
        thin atmosphere. Mars is also a dynamic planet with seasons, polar ice caps,
        canyons, extinct volcanoes, and evidence that it was even more active in the
        past.

        Mars is one of the most explored bodies in our solar system, and it's the only
        planet where we've sent rovers to roam the alien landscape.

        NASA currently has two rovers (Curiosity and Perseverance), one lander (InSight),
        and one helicopter (Ingenuity) exploring the surface of Mars.
        """,
      model: Raylib.loadModel(Bundle.module.path(forResource: "Mars", ofType: "glb") ?? ""),
      position: Vector3(x: 20, y: 0, z: 0),
      scale: 2 / 1000,
      spinSpeed: 20
    ),
    Planet(
      name: "Jupiter",
      text: """
        Jupiter has a long history of surprising scientists - all the way back to 1610
        when Galileo Galilei found the first moons beyond Earth. That discovery changed
        the way we see the universe.

        Fifth in line from the Sun, Jupiter is, by far, the largest planet in the solar
        system - more than twice as massive as all the other planets combined.

        Jupiter's familiar stripes and swirls are actually cold, windy clouds of ammonia
        and water, floating in an atmosphere of hydrogen and helium. Jupiter's iconic
        Great Red Spot is a giant storm bigger than Earth that has raged for hundreds
        of years.
        """,
      model: Raylib.loadModel(Bundle.module.path(forResource: "Jupiter", ofType: "glb") ?? ""),
      position: Vector3(x: 25, y: 0, z: 0),
      scale: 2 / 1000,
      spinSpeed: 25
    ),
    Planet(
      name: "Saturn",
      text: """
        Saturn is the sixth planet from the Sun and the second-largest planet in our
        solar system.

        Adorned with thousands of beautiful ringlets, Saturn is unique among the planets.
        It is not the only planet to have rings - made of chunks of ice and rock - but
        none are as spectacular or as complicated as Saturn's.

        Like fellow gas giant Jupiter, Saturn is a massive ball made mostly of hydrogen
        and helium.
        """,
      model: Raylib.loadModel(Bundle.module.path(forResource: "Saturn", ofType: "glb") ?? ""),
      position: Vector3(x: 30, y: 0, z: 0),
      scale: 2 / 1000,
      spinSpeed: 30
    ),
    Planet(
      name: "Uranus",
      text: """
        Uranus is the seventh planet from the Sun, and has the third-largest diameter in
        our solar system. It was the first planet found with the aid of a telescope,
        Uranus was discovered in 1781 by astronomer William Herschel, although he
        originally thought it was either a comet or a star.

        It was two years later that the object was universally accepted as a new planet,
        in part because of observations by astronomer Johann Elert Bode. Herschel tried
        unsuccessfully to name his discovery Georgium Sidus after King George III.
        Instead, the scientific community accepted Bode's suggestion to name it Uranus,
        the Greek god of the sky, as suggested by Bode.
        """,
      model: Raylib.loadModel(Bundle.module.path(forResource: "Uranus", ofType: "glb") ?? ""),
      position: Vector3(x: 35, y: 0, z: 0),
      scale: 2 / 1000,
      spinSpeed: 35
    ),
    Planet(
      name: "Neptune",
      text: """
        Dark, cold, and whipped by supersonic winds, ice giant Neptune is the eighth and
        most distant planet in our solar system.

        More than 30 times as far from the Sun as Earth, Neptune is the only planet in
        our solar system not visible to the naked eye and the first predicted by
        mathematics before its discovery. In 2011 Neptune completed its first 165-year
        orbit since its discovery in 1846.
        """,
      model: Raylib.loadModel(Bundle.module.path(forResource: "Neptune", ofType: "glb") ?? ""),
      position: Vector3(x: 40, y: 0, z: 0),
      scale: 2 / 1000,
      spinSpeed: 40
    ),
  ]

  var spinAngle: Float = 0
  var tabIndex = 0 {
    didSet {
      if tabIndex == planets.count {
        tabIndex = 0
      } else if tabIndex == -1 {
        tabIndex = planets.count - 1
      }
    }
  }

  var isSpin = true
  var isViewingMode = false
  var isHelp = true

  init() {
    Raylib.setCameraMode(camera, .free)
  }

  static func main() {
    let solarSystemApp = SolarSystemApp()
    solarSystemApp.run()
  }

  func run() {
    while !Raylib.windowShouldClose {
      update(deltaTime: Raylib.getFrameTime())
      draw()
    }
  }

  func update(deltaTime: Float) {
    if Raylib.isKeyPressed(.letterS) {
      isSpin.toggle()
    }
    if Raylib.isKeyPressed(.letterV) {
      isViewingMode.toggle()
      isSpin = true

      if !isViewingMode {
        camera.position = Vector3(x: 47.5, y: 22.5, z: 47.5)
        camera.target = Vector3(x: 0, y: -5, z: 0)
      }
    }
    if Raylib.isKeyPressed(.letterH) {
      isHelp.toggle()
    }

    if isSpin {
      for index in planets.indices {
        planets[index].spin(around: sun.position, deltaTime: deltaTime)
      }
    }

    if isViewingMode {
      if Raylib.isKeyPressed(.tab) {
        if Raylib.isKeyDown(.leftControl) {
          tabIndex -= 1
        } else {
          tabIndex += 1
        }
      }

      let distanceToSun = Vector3(x: 2.5, y: 0.5, z: 2.5).distance(sun.position)
      spinAngle += planets[tabIndex].spinSpeed * deltaTime
      let spinAngleInRadians = planets[tabIndex].spinAngle * Float.pi / 180

      camera.position.x = planets[tabIndex].position.x + distanceToSun * cos(spinAngleInRadians)
      camera.position.z = planets[tabIndex].position.z + distanceToSun * sin(spinAngleInRadians)
      camera.position.y = 0.25

      camera.target = planets[tabIndex].position
      camera.target.y = -0.25
    } else {
      Raylib.updateCamera(&camera)
    }
  }

  func draw() {
    Raylib.draw {
      Raylib.clearBackground(.black)

      camera.mode3D {
        sun.draw()

        for planet in planets {
          planet.draw()

          // Draw the planet orbit.
          let orbitCenter = Vector3()
          let orbitRadius = planet.position.distance(sun.position)
          let orbitRotationAxis = Vector3(x: 1, y: 0, z: 0)
          let orbitRotationAngle: Float = 90
          let orbitColor = Color.gray
          Raylib.drawCircle3D(
            orbitCenter, orbitRadius, orbitRotationAxis, orbitRotationAngle, orbitColor)
        }
      }

      if isViewingMode {
        let text = planets[tabIndex].text
        let fontSize: Int32 = 10
        let textLinesCount = Int32(text.components(separatedBy: .newlines).count)
        let textWidth = Raylib.measureText(text, fontSize)
        let textPositionX: Int32 = (window.width - textWidth) / 2 + (window.width - textWidth) / 16
        let textPositionY: Int32 =
          window.height - textLinesCount * (fontSize + fontSize / 2) + fontSize / 2 - 8

        Raylib.drawText(text, textPositionX + 1, textPositionY + 1, fontSize, .black)
        Raylib.drawText(text, textPositionX, textPositionY, fontSize, .white)

        let name = planets[tabIndex].name.uppercased() + ": "
        let namePositionX = textPositionX - Raylib.measureText(name, fontSize)

        Raylib.drawText(name, namePositionX + 1, textPositionY + 1, fontSize, .black)
        Raylib.drawText(name, namePositionX, textPositionY, fontSize, .white)
      }

      if isHelp {
        let fontSize: Int32 = 10

        let aboutText = "The program shows a 3D model of the solar system."
        let aboutTextWidth = Raylib.measureText(aboutText, fontSize)
        let aboutTextPositionX: Int32 = (window.width - aboutTextWidth) / 2
        let aboutTextPositionY: Int32 = 8 + 8
        Raylib.drawText(aboutText, aboutTextPositionX + 1, aboutTextPositionY + 1, fontSize, .black)
        Raylib.drawText(aboutText, aboutTextPositionX, aboutTextPositionY, fontSize, .white)

        let titleText = "[  Control Layout  ]"
        let titleTextWidth = Raylib.measureText(titleText, fontSize)
        let titleTextPositionX: Int32 = (window.width - titleTextWidth) / 2
        let titleTextPositionY: Int32 = aboutTextPositionY + fontSize * 2 + 8 + 8
        Raylib.drawText(titleText, titleTextPositionX + 1, titleTextPositionY + 1, fontSize, .black)
        Raylib.drawText(titleText, titleTextPositionX, titleTextPositionY, fontSize, .white)

        let keysDescription = """
          Close the program window.
          Show/close help.
          Enable/disable planet rotation.
          Enable/disable planet view mode.
          Switch planet (view mode).
          Switch the planet in the reverse direction (view mode).
          Move the camera (free mode).
          Move the camera around the target (free mode).
          Zoom in/out camera (free mode).
          """
        let keysDescriptionWidth = Raylib.measureText(keysDescription, fontSize)
        let keysDescriptionPositionX: Int32 =
          (window.width - keysDescriptionWidth) / 2 + (window.width - keysDescriptionWidth) / 8
        let keysDescriptionPositionY: Int32 = titleTextPositionY + fontSize * 2 + fontSize / 2
        Raylib.drawText(
          keysDescription, keysDescriptionPositionX + 1, keysDescriptionPositionY + 1, fontSize,
          .black)
        Raylib.drawText(
          keysDescription, keysDescriptionPositionX, keysDescriptionPositionY, fontSize, .white)

        let keys = [
          "ESC",
          "H",
          "S",
          "V",
          "TAB",
          "CTRL + TAB",
          "MMB",
          "ALT + MMB",
          "MW",
        ]
        for (index, key) in keys.enumerated() {
          let keyText = "[  \(key)  ] - "
          let keyTextWidth = Raylib.measureText(keyText, fontSize)
          let keyTextPositionX = keysDescriptionPositionX - keyTextWidth
          let keyTextPositionY = keysDescriptionPositionY + (fontSize + fontSize / 2) * Int32(index)
          Raylib.drawText(keyText, keyTextPositionX + 1, keyTextPositionY + 1, fontSize, .black)
          Raylib.drawText(keyText, keyTextPositionX, keyTextPositionY, fontSize, .white)
        }
      }

      Raylib.drawFPS(8, 8)
      Raylib.drawText(
        """
        Window:
            Resolution:
                Width: \(window.width)
                Height: \(window.height)
            Config flags:
                VSync: \(Raylib.isWindowState(.vsyncHint))
                MSAA 4x: \(Raylib.isWindowState(.msaa4xHint))

        Camera:
            Position:
                X: \(camera.position.x)
                Y: \(camera.position.y)
                Z: \(camera.position.z)
            Target:
                X: \(camera.target.x)
                Y: \(camera.target.y)
                Z: \(camera.target.z)
        """, 8, 8 + 20 + 8, 10, .red)
    }
  }

  deinit {
    Raylib.unloadModel(sun.model)
    for planet in planets {
      Raylib.unloadModel(planet.model)
    }
  }
}
