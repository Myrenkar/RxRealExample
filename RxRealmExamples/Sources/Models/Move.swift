import Foundation
import RealmSwift

final class Move: Object, Decodable {
    @objc dynamic var move: SpecificMove?
}
