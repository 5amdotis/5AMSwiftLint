# 5AMSwiftLint

Add [SwiftLint](https://github.com/realm/SwiftLint/) to your Xcode Project or Swift Package as a Plugin.

## Info

- SwiftLint Version: 0.50.3
- SwiftLint Repo: https://github.com/realm/SwiftLint/


## Requirements

- macOS version 10.15 Catalina
- Swift 5.7


## Usage in Xcode Project

1. Add this repo https://github.com/5amdotis/5AMSwiftLint as Swift Package to your project
2. Add `SwiftLintPlugin` to Run Build Tool Plug-ins in Build Phases
3. Build project
4. Trust and Enable Build Plug-ins
5. For CI/CD: add option `-skipPackagePluginValidation` to `xcodebuild` command


## Usage in Swift Package

1. Add dependency
``` 
dependencies: [
    // ...
    .package(url: "https://github.com/5amdotis/5AMSwiftLint", from: "1.0.0"),
]
```
2. Add to target
```
targets: [
    .target(
        name: "YOUR_TARGET",
        dependencies: [],
        plugins: [
            .plugin(name: "SwiftLintPlugin", package: "5AMSwiftLint")
        ]
    ),
]
```
3. Build package
4. Trust and Enable Build Plug-ins


## License

5AMSwiftLint is licenced under [BSD 3-Clause License](LICENSE.md).
