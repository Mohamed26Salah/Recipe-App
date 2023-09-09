//
//  test2.swift
//  Recipe-App
//
//  Created by Mohamed Salah on 09/09/2023.
//

import Foundation

import Foundation
import OptionallyDecodable

// MARK: - DecodeScene
struct DecodeScene: Codable {
    var count: Int
    var results: [Result]

    enum CodingKeys: String, CodingKey {
        case count = "count"
        case results = "results"
    }
}

// MARK: - Result
struct Result: Codable {
    var nutritionVisibility: NutritionVisibility?
    var country: Country?
    var instructions: [Instruction]
    var language: Language?
    var cookTimeMinutes: Int?
    var promotion: Promotion?
    var seoPath: String
    var brand: JSONNull?
    var thumbnailURL: String
    var totalTimeMinutes: Int?
    var topics: [Topic]
    var totalTimeTier: TotalTimeTier
    var slug: String
    var description: String
    var draftStatus: DraftStatus?
    var updatedAt: Int
    var servingsNounPlural: ServingsNounPlural?
    var beautyURL: JSONNull?
    var canonicalID: String
    var videoID: Int?
    var keywords: String?
    var servingsNounSingular: ServingsNounSingular?
    var nutrition: Nutrition
    var name: String
    var thumbnailAltText: String
    var yields: String
    var id: Int
    var brandID: JSONNull?
    var compilations: [Compilation]
    var show: Show
    var inspiredByURL: String?
    var isShoppable: Bool
    var tipsAndRatingsEnabled: Bool
    var aspectRatio: AspectRatio?
    var isOneTop: Bool
    var originalVideoURL: String?
    var price: Price
    var showID: Int
    var prepTimeMinutes: Int?
    var buzzID: Int?
    var createdAt: Int
    var credits: [Credit]
    var approvedAt: Int
    var videoAdContent: VideoAdContent?
    var seoTitle: String?
    var facebookPosts: [JSONAny]
    var userRatings: UserRatings
    var sections: [Section]
    var tags: [Tag]
    var numServings: Int
    var videoURL: String?
    var renditions: [Rendition]

    enum CodingKeys: String, CodingKey {
        case nutritionVisibility = "nutrition_visibility"
        case country = "country"
        case instructions = "instructions"
        case language = "language"
        case cookTimeMinutes = "cook_time_minutes"
        case promotion = "promotion"
        case seoPath = "seo_path"
        case brand = "brand"
        case thumbnailURL = "thumbnail_url"
        case totalTimeMinutes = "total_time_minutes"
        case topics = "topics"
        case totalTimeTier = "total_time_tier"
        case slug = "slug"
        case description = "description"
        case draftStatus = "draft_status"
        case updatedAt = "updated_at"
        case servingsNounPlural = "servings_noun_plural"
        case beautyURL = "beauty_url"
        case canonicalID = "canonical_id"
        case videoID = "video_id"
        case keywords = "keywords"
        case servingsNounSingular = "servings_noun_singular"
        case nutrition = "nutrition"
        case name = "name"
        case thumbnailAltText = "thumbnail_alt_text"
        case yields = "yields"
        case id = "id"
        case brandID = "brand_id"
        case compilations = "compilations"
        case show = "show"
        case inspiredByURL = "inspired_by_url"
        case isShoppable = "is_shoppable"
        case tipsAndRatingsEnabled = "tips_and_ratings_enabled"
        case aspectRatio = "aspect_ratio"
        case isOneTop = "is_one_top"
        case originalVideoURL = "original_video_url"
        case price = "price"
        case showID = "show_id"
        case prepTimeMinutes = "prep_time_minutes"
        case buzzID = "buzz_id"
        case createdAt = "created_at"
        case credits = "credits"
        case approvedAt = "approved_at"
        case videoAdContent = "video_ad_content"
        case seoTitle = "seo_title"
        case facebookPosts = "facebook_posts"
        case userRatings = "user_ratings"
        case sections = "sections"
        case tags = "tags"
        case numServings = "num_servings"
        case videoURL = "video_url"
        case renditions = "renditions"
    }
}

enum AspectRatio: String, Codable {
    case the11 = "1:1"
    case the169 = "16:9"
    case the45 = "4:5"
}

// MARK: - Compilation
struct Compilation: Codable {
    var createdAt: Int
    var thumbnailURL: String
    var canonicalID: String
    var isShoppable: Bool
    var language: Language?
    var name: String
    var id: Int
    var buzzID: Int?
    var videoURL: String
    var beautyURL: String?
    var aspectRatio: AspectRatio?
    var country: Country?
    var keywords: JSONNull?
    var facebookPosts: [JSONAny]
    var show: [Show]
    var description: String?
    var slug: String
    var draftStatus: DraftStatus?
    var thumbnailAltText: ThumbnailAltText?
    var approvedAt: Int
    var promotion: Promotion?
    var videoID: Int

    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case thumbnailURL = "thumbnail_url"
        case canonicalID = "canonical_id"
        case isShoppable = "is_shoppable"
        case language = "language"
        case name = "name"
        case id = "id"
        case buzzID = "buzz_id"
        case videoURL = "video_url"
        case beautyURL = "beauty_url"
        case aspectRatio = "aspect_ratio"
        case country = "country"
        case keywords = "keywords"
        case facebookPosts = "facebook_posts"
        case show = "show"
        case description = "description"
        case slug = "slug"
        case draftStatus = "draft_status"
        case thumbnailAltText = "thumbnail_alt_text"
        case approvedAt = "approved_at"
        case promotion = "promotion"
        case videoID = "video_id"
    }
}

enum Country: String, Codable {
    case us = "US"
    case zz = "ZZ"
}

enum DraftStatus: String, Codable {
    case published = "published"
}

enum Language: String, Codable {
    case eng = "eng"
}

enum Promotion: String, Codable {
    case full = "full"
    case none = "none"
    case partial = "partial"
}

// MARK: - Show
struct Show: Codable {
    var name: Name?
    var id: Int

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case id = "id"
    }
}

enum Name: String, Codable {
    case goodful = "Goodful"
    case tasty = "Tasty"
    case tastyTastyJunior = "Tasty: Tasty Junior"
    case tastyTastyVegetarian = "Tasty: Tasty Vegetarian"
}

enum ThumbnailAltText: String, Codable {
    case broccoliRecipesForHealthyYou = "Broccoli Recipes For Healthy You"
    case easyToHardPorkRecipes = "Easy To Hard: Pork Recipes"
    case empty = ""
    case goodLuckFood = "Good Luck Food"
    case onePotRecipes = "One-Pot Recipes"
    case summerBreakRecipesForYourKids = "Summer Break Recipes For Your Kids"
    case tastyFoodForEveryMood = "Tasty Food For Every Mood"
}

// MARK: - Credit
struct Credit: Codable {
    var type: TypeEnum?
    var name: String?

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case name = "name"
    }
}

enum TypeEnum: String, Codable {
    case community = "community"
    case typeInternal = "internal"
}

// MARK: - Instruction
struct Instruction: Codable {
    var startTime: Int
    var appliance: String?
    var endTime: Int
    var temperature: Int?
    var id: Int
    var position: Int
    var displayText: String

    enum CodingKeys: String, CodingKey {
        case startTime = "start_time"
        case appliance = "appliance"
        case endTime = "end_time"
        case temperature = "temperature"
        case id = "id"
        case position = "position"
        case displayText = "display_text"
    }
}

// MARK: - Nutrition
struct Nutrition: Codable {
    var sugar: Int
    var carbohydrates: Int
    var fiber: Int
    var updatedAt: Date
    var protein: Int
    var fat: Int
    var calories: Int

    enum CodingKeys: String, CodingKey {
        case sugar = "sugar"
        case carbohydrates = "carbohydrates"
        case fiber = "fiber"
        case updatedAt = "updated_at"
        case protein = "protein"
        case fat = "fat"
        case calories = "calories"
    }
}

enum NutritionVisibility: String, Codable {
    case auto = "auto"
}

// MARK: - Price
struct Price: Codable {
    var total: Int
    var updatedAt: Date
    var portion: Int
    var consumptionTotal: Int
    var consumptionPortion: Int

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case updatedAt = "updated_at"
        case portion = "portion"
        case consumptionTotal = "consumption_total"
        case consumptionPortion = "consumption_portion"
    }
}

// MARK: - Rendition
struct Rendition: Codable {
    var duration: Int
    var bitRate: Int?
    var contentType: ContentType?
    var aspect: Aspect?
    var minimumBitRate: Int?
    var name: String
    var maximumBitRate: Int?
    var container: Container?
    var height: Int
    var fileSize: Int?
    var url: String
    var width: Int
    var posterURL: String

    enum CodingKeys: String, CodingKey {
        case duration = "duration"
        case bitRate = "bit_rate"
        case contentType = "content_type"
        case aspect = "aspect"
        case minimumBitRate = "minimum_bit_rate"
        case name = "name"
        case maximumBitRate = "maximum_bit_rate"
        case container = "container"
        case height = "height"
        case fileSize = "file_size"
        case url = "url"
        case width = "width"
        case posterURL = "poster_url"
    }
}

enum Aspect: String, Codable {
    case landscape = "landscape"
    case square = "square"
}

enum Container: String, Codable {
    case mp4 = "mp4"
    case ts = "ts"
}

enum ContentType: String, Codable {
    case applicationVndAppleMpegurl = "application/vnd.apple.mpegurl"
    case videoMp4 = "video/mp4"
}

// MARK: - Section
struct Section: Codable {
    var components: [Component]
    var name: JSONNull?
    var position: Int

    enum CodingKeys: String, CodingKey {
        case components = "components"
        case name = "name"
        case position = "position"
    }
}

// MARK: - Component
struct Component: Codable {
    var measurements: [Measurement]
    var rawText: String
    var extraComment: String
    var ingredient: Ingredient
    var id: Int
    var position: Int

    enum CodingKeys: String, CodingKey {
        case measurements = "measurements"
        case rawText = "raw_text"
        case extraComment = "extra_comment"
        case ingredient = "ingredient"
        case id = "id"
        case position = "position"
    }
}

// MARK: - Ingredient
struct Ingredient: Codable {
    var updatedAt: Int
    var name: String
    var createdAt: Int
    var displayPlural: String
    var id: Int
    var displaySingular: String

    enum CodingKeys: String, CodingKey {
        case updatedAt = "updated_at"
        case name = "name"
        case createdAt = "created_at"
        case displayPlural = "display_plural"
        case id = "id"
        case displaySingular = "display_singular"
    }
}

// MARK: - Measurement
struct Measurement: Codable {
    var unit: Unit
    var quantity: String
    var id: Int

    enum CodingKeys: String, CodingKey {
        case unit = "unit"
        case quantity = "quantity"
        case id = "id"
    }
}

// MARK: - Unit
struct Unit: Codable {
    var displaySingular: String
    var abbreviation: String
    var system: System?
    var name: String
    var displayPlural: String

    enum CodingKeys: String, CodingKey {
        case displaySingular = "display_singular"
        case abbreviation = "abbreviation"
        case system = "system"
        case name = "name"
        case displayPlural = "display_plural"
    }
}

enum System: String, Codable {
    case imperial = "imperial"
    case metric = "metric"
    case none = "none"
}

enum ServingsNounPlural: String, Codable {
    case cookies = "cookies"
    case pancakes = "pancakes"
    case serving = "serving"
    case servings = "servings"
}

enum ServingsNounSingular: String, Codable {
    case cookie = "cookie"
    case pancake = "pancake"
    case serving = "serving"
}

// MARK: - Tag
struct Tag: Codable {
    var id: Int
    var displayName: String
    var type: String
    var rootTagType: RootTagType?
    var name: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case displayName = "display_name"
        case type = "type"
        case rootTagType = "root_tag_type"
        case name = "name"
    }
}

enum RootTagType: String, Codable {
    case appliance = "appliance"
    case businessTags = "business_tags"
    case cookingStyle = "cooking_style"
    case cuisine = "cuisine"
    case dietary = "dietary"
    case difficulty = "difficulty"
    case equipment = "equipment"
    case featurePage = "feature_page"
    case healthy = "healthy"
    case meal = "meal"
    case occasion = "occasion"
    case seasonal = "seasonal"
}

// MARK: - Topic
struct Topic: Codable {
    var name: String
    var slug: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case slug = "slug"
    }
}

// MARK: - TotalTimeTier
struct TotalTimeTier: Codable {
    var tier: Tier?
    var displayTier: DisplayTier?

    enum CodingKeys: String, CodingKey {
        case tier = "tier"
        case displayTier = "display_tier"
    }
}

enum DisplayTier: String, Codable {
    case under15Minutes = "Under 15 minutes"
    case under30Minutes = "Under 30 minutes"
}

enum Tier: String, Codable {
    case under15_Minutes = "under_15_minutes"
    case under30_Minutes = "under_30_minutes"
}

// MARK: - UserRatings
struct UserRatings: Codable {
    var countPositive: Int
    var score: Double
    var countNegative: Int

    enum CodingKeys: String, CodingKey {
        case countPositive = "count_positive"
        case score = "score"
        case countNegative = "count_negative"
    }
}

enum VideoAdContent: String, Codable {
    case none = "none"
    case undetermined = "undetermined"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
