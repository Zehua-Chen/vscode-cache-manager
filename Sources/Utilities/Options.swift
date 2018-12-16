import Foundation

/// Command line options
public struct Options: Equatable, CustomStringConvertible {

    public enum Action: Equatable {
        case clean
        case list
        case help
        case version
    }

    /// A filter used to indicate what type of cache to ignore from either
    /// listing or cleaning
    public enum Filter: Equatable {
        /// All cache
        case all
        /// Cache that does not exist on disks any more
        case gone
        /// All workspace
        case workspaces
    }
    
    /// Global options, parsed from command line arguments
    public static let shared = Options(from: CommandLine.arguments)

    public var action: Action
    public var filter: Filter

    public var description: String {
        var message = ""

        switch action {
        case .clean:
            message += "clean "
        case .list:
            message += "list "
        default:
            break
        }

        switch filter {
        case .all:
            message += "-workspace"
        case .gone:
            message += "-gone"
        case .workspaces:
            message += "-workspaces"
        }

        return message
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

    var filter: Options.Filter {

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
