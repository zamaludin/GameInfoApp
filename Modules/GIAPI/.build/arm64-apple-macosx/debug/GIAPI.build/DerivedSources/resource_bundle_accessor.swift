import class Foundation.Bundle

extension Foundation.Bundle {
    static let module: Bundle = {
        let mainPath = Bundle.main.bundleURL.appendingPathComponent("GIAPI_GIAPI.bundle").path
        let buildPath = "/Users/zamaludin/Documents/Zamal/Dicoding/Expert from cine/ios-cinewatch-main/Modules/GIAPI/.build/arm64-apple-macosx/debug/GIAPI_GIAPI.bundle"

        let preferredBundle = Bundle(path: mainPath)

        guard let bundle = preferredBundle ?? Bundle(path: buildPath) else {
            fatalError("could not load resource bundle: from \(mainPath) or \(buildPath)")
        }

        return bundle
    }()
}