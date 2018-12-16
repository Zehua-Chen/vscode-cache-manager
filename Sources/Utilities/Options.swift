import Foundation

/// Command line options
public struct Options: Equatable {

    public enum Action: Equatable {
        case clean
        case list
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

    /// Parse options from the command line
    ///
    /// - Parameter args: command line arguments
    public init(from args: [String]) {

        // TODO: Make sure argument is valid

        // Assign default values
        action = .clean
        filter = .gone

        // Find subcommand, if there is one
        if args.count < 2 {
            return
        }
        
        switch args[1] {
        case "clean":
            filter = .gone

            // If have addition arguments
            if args.count > 2 {
                filter = args[2].makeFilter()
            } else {
                filter = .gone

            }
        case "list":
            action = .list

            // If have addition arguments
            if args.count > 2 {
                filter = args[2].makeFilter()
            } else {
                filter = .all
            }

        default:
            break
        }

    }
}

fileprivate extension String {

    func makeFilter() -> Options.Filter {

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
}
