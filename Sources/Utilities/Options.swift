import VSCodeCache

/// Command line options
public struct Options: Equatable, CustomStringConvertible {

    /// Action to perform on the cache.
    public enum Action: Equatable, CustomStringConvertible {
        /// Clean caches;
        ///
        /// Command: `clean`
        case clean
        /// List caches
        ///
        /// Command: `list`
        case list
        /// Print Help Info
        ///
        /// Command: `help`
        case help
        /// Print Version
        ///
        /// Command: `version`
        case version

        public var description: String {

            switch self {
            case .clean:
                return "clean"
            case .list:
                return "list"
            case .help:
                return "help"
            case .version:
                return "version"
            }

        }
    }

    
    
    /// Global options, parsed from command line arguments
    public static let shared = Options(from: CommandLine.arguments)

    /// Action perform.
    public var action: Action

    /// Filter used to perform the action.
    public var filter: VSCodeCacheFilter

    public var description: String {
        return "\(action) \(filter)"
    }

    /// Parse options from the command line
    ///
    /// - Parameter args: command line arguments
    public init(from args: [String]) {

        // TODO: Make sure argument is valid

        // Default action to list
        action = .list
        // Default filter to gone
        filter = .gone

        // Find subcommand, if there is one
        // When there is no subcommand, print the helper message to help
        // the user
        if args.count < 2 {
            action = .help
            return
        }

        for arg in args[1...] {

            // Parse options
            if arg.starts(with: "-") {
                filter = arg.filter
            // Parse sub command
            } else {
                action = arg.action

                if case .list = action {
                    filter = .all
                }

            }
        }
    }
}

fileprivate extension String {

    var filter: VSCodeCacheFilter {

        switch self {
        case "-all":
            return .all
        case "-gone":
            return .gone
        case "-workspaces":
            return .workspaces
        default:
            return .all
        }

    }

    var action: Options.Action {

        switch self {
        case "clean":
            return .clean
        case "list":
            return .list
        case "help":
            return .version
        case "version":
            return .version
        default:
            return .help
        }

    }
}
