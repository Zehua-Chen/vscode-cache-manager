import Utilities
import VSCodeStorage

let options = Options.shared

let caches = VSCodeStorage.find()
var counter = 0

for cache in caches {

    switch cache {
    case .workspace(_, let workspacePath):
        print("\(counter): \(workspacePath)")
    case .other(let path):
        print("\(counter): \(path)")
    }

    counter += 1
}
