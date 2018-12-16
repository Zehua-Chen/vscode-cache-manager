public enum Options: Equatable {

    public enum Filter {
        case all
        case gone
        case workspaces
    }
    
    /// Global options, parsed from command line arguments
    public static let shared = Options(from: CommandLine.arguments)

    case clean(filter: Filter)
    case list(filter: Filter)

    public init(from args: [String]) {
        // Assign default options
        self = .clean(filter: .gone)

        // Find subcommand, if there is one
        if args.count < 2 {
            return
        }
        
        switch args[1] {
        case "clean":
            // If have addition arguments
            if args.count > 2 {
                _handleClean(args: args[2...])
            // otherwise defaults to gone
            } else {
                self = .clean(filter: .gone)
            }
        case "list":
            if args.count > 2 {
                _handleList(args: args[2...])
            } else {
                self = .list(filter: .all)
            }

        default:
            break
        }

    }

    fileprivate mutating func _handleClean(args: ArraySlice<String>) {

        switch args.first! {
        case "-gone":
            self = .clean(filter: .gone)
        case "-all":
            self = .clean(filter: .all)
        case "-workspaces":
            self = .clean(filter: .workspaces)
        default:
            self = .clean(filter: .gone)
        }

    }

    fileprivate mutating func _handleList(args: ArraySlice<String>) {

        switch args.first! {
        case "-gone":
            self = .list(filter: .gone)
        case "-all":
            self = .list(filter: .all)
        case "-workspaces":
            self = .list(filter: .workspaces)
        default:
            self = .list(filter: .all)
        }

    }
}
