import Utilities

let options = Options.shared

switch options.action {
case .help:
    print(About.documentation)
case .version:
    print(About.version)
default:
    print(options)
}
