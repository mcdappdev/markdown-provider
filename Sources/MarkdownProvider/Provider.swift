import Vapor
import LeafProvider

public struct Provider: Vapor.Provider {

    public static let repositoryName = "markdown-provider"

    public func boot(_ drop: Droplet) {
        guard let renderer = drop.view as? LeafRenderer else {
            print("Markdown Provider only supports Leaf as a renderer")
            return
        }

        renderer.stem.register(Markdown())
    }

    public init(config: Config) throws {}
    public init() {}
    public func boot(_ config: Config) throws {}
    public func beforeRun(_: Vapor.Droplet) {}
}
