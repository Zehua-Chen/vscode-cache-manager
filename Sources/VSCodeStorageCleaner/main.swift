import Utilities
import VSCodeCache

let options = Options.shared

switch options.action {
case .help:
    print(About.documentation)
case .version:
    print(About.version)
default:
    let caches = VSCodeCache.findCaches()
}
