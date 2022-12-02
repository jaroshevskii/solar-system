![Screenshot](Docs/Assets/Screenshot.png)

# Solar System

The program shows a 3D model of the solar system.

## Build

```
swift build -c release \
  -Xswiftc -static-stdlib \
  -Xswiftc -cross-module-optimization
```