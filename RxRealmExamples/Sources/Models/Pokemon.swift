import Foundation
import RealmSwift

class Pokemon: Object, Decodable {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var sprites: Sprites? = nil
    let moves: List<Move> = List([])

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case sprites
        case moves
    }

    required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        sprites = try container.decodeIfPresent(Sprites.self, forKey: .sprites)
        let movesArray = try container.decode([Move].self, forKey: .moves)
        moves.append(objectsIn: movesArray)
    }

    override static func primaryKey() -> String? {
        return "id"
    }
}
