//
//  Recipes.swift
//  Recipe-App
//
//  Created by Mohamed Salah on 10/09/2023.
//

import Foundation
import OptionallyDecodable

// MARK: - Recipes
struct Recipes: Codable {
    var count: Int
    var results: [RecipesList]

    enum CodingKeys: String, CodingKey {
        case count = "count"
        case results = "results"
    }
}

// MARK: - RecipesList
struct RecipesList: Codable {
    var id: Int
    var buzzID: Int?
    var originalVideoURL: String?
    var country: Country?
    var instructions: [Instruction]
    var userRatings: UserRatings
    var price: Price
    var name: String
    var thumbnailAltText: String
    var isShoppable: Bool
    var keywords: String?
    var servingsNounPlural: String?
    var beautyURL: String?
    var yields: String
    var canonicalID: String
    var facebookPosts: [JSONAny]
    var servingsNounSingular: String?
    var createdAt: Int
    var totalTimeMinutes: Int?
    var videoURL: String?
    var nutritionVisibility: String?
    var seoPath: String
    var brand: JSONNull?
    var slug: String
    var nutrition: Nutrition
    var show: Show
    var description: String
    var thumbnailURL: String
    var totalTimeTier: TotalTimeTier?
    var seoTitle: String?
    var videoID: Int?
    var language: String?
    var prepTimeMinutes: Int?
    var compilations: [Compilation]
    var numServings: Int
    var tipsAndRatingsEnabled: Bool
    var updatedAt: Int
    var renditions: [Rendition]
    var videoAdContent: VideoAdContent?
    var aspectRatio: AspectRatio?
    var cookTimeMinutes: Int?
    var showID: Int
    var sections: [Section]
    var brandID: JSONNull?
    var tags: [Tag]
    var draftStatus: DraftStatus?
    var inspiredByURL: String?
    var credits: [Credit]
    var approvedAt: Int
    var isOneTop: Bool
    var topics: [Topic]
    var promotion: Promotion?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case buzzID = "buzz_id"
        case originalVideoURL = "original_video_url"
        case country = "country"
        case instructions = "instructions"
        case userRatings = "user_ratings"
        case price = "price"
        case name = "name"
        case thumbnailAltText = "thumbnail_alt_text"
        case isShoppable = "is_shoppable"
        case keywords = "keywords"
        case servingsNounPlural = "servings_noun_plural"
        case beautyURL = "beauty_url"
        case yields = "yields"
        case canonicalID = "canonical_id"
        case facebookPosts = "facebook_posts"
        case servingsNounSingular = "servings_noun_singular"
        case createdAt = "created_at"
        case totalTimeMinutes = "total_time_minutes"
        case videoURL = "video_url"
        case nutritionVisibility = "nutrition_visibility"
        case seoPath = "seo_path"
        case brand = "brand"
        case slug = "slug"
        case nutrition = "nutrition"
        case show = "show"
        case description = "description"
        case thumbnailURL = "thumbnail_url"
        case totalTimeTier = "total_time_tier"
        case seoTitle = "seo_title"
        case videoID = "video_id"
        case language = "language"
        case prepTimeMinutes = "prep_time_minutes"
        case compilations = "compilations"
        case numServings = "num_servings"
        case tipsAndRatingsEnabled = "tips_and_ratings_enabled"
        case updatedAt = "updated_at"
        case renditions = "renditions"
        case videoAdContent = "video_ad_content"
        case aspectRatio = "aspect_ratio"
        case cookTimeMinutes = "cook_time_minutes"
        case showID = "show_id"
        case sections = "sections"
        case brandID = "brand_id"
        case tags = "tags"
        case draftStatus = "draft_status"
        case inspiredByURL = "inspired_by_url"
        case credits = "credits"
        case approvedAt = "approved_at"
        case isOneTop = "is_one_top"
        case topics = "topics"
        case promotion = "promotion"
    }
}

enum AspectRatio: String, Codable {
    case the11 = "1:1"
    case the169 = "16:9"
    case the45 = "4:5"
}

// MARK: - Compilation
struct Compilation: Codable {
    var videoID: Int
    var createdAt: Int
    var videoURL: String
    var slug: String
    var id: Int
    var promotion: Promotion?
    var country: Country?
    var isShoppable: Bool
    var show: [Show]
    var thumbnailURL: String
    var approvedAt: Int
    var aspectRatio: AspectRatio?
    var keywords: JSONNull?
    var language: String?
    var thumbnailAltText: String?
    var name: String
    var canonicalID: String
    var beautyURL: String?
    var buzzID: Int?
    var facebookPosts: [JSONAny]
    var description: String?
    var draftStatus: DraftStatus?

    enum CodingKeys: String, CodingKey {
        case videoID = "video_id"
        case createdAt = "created_at"
        case videoURL = "video_url"
        case slug = "slug"
        case id = "id"
        case promotion = "promotion"
        case country = "country"
        case isShoppable = "is_shoppable"
        case show = "show"
        case thumbnailURL = "thumbnail_url"
        case approvedAt = "approved_at"
        case aspectRatio = "aspect_ratio"
        case keywords = "keywords"
        case language = "language"
        case thumbnailAltText = "thumbnail_alt_text"
        case name = "name"
        case canonicalID = "canonical_id"
        case beautyURL = "beauty_url"
        case buzzID = "buzz_id"
        case facebookPosts = "facebook_posts"
        case description = "description"
        case draftStatus = "draft_status"
    }
}

enum Country: String, Codable {
    case us = "US"
    case zz = "ZZ"
}

enum DraftStatus: String, Codable {
    case published = "published"
}

//enum Language: String, Codable {
//    case eng = "eng"
//}

enum Promotion: String, Codable {
    case full = "full"
    case partial = "partial"
}

// MARK: - Show
struct Show: Codable {
    var name: ShowName?
    var id: Int

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case id = "id"
    }
}

enum ShowName: String, Codable {
    case goodful = "Goodful"
    case tasty = "Tasty"
    case tastyTastyJunior = "Tasty: Tasty Junior"
    case tastyTastyVegetarian = "Tasty: Tasty Vegetarian"
}

//enum ThumbnailAltText: String, Codable {
//    case broccoliRecipesForHealthyYou = "Broccoli Recipes For Healthy You"
//    case easyToHardPorkRecipes = "Easy To Hard: Pork Recipes"
//    case empty = ""
//    case goodLuckFood = "Good Luck Food"
//    case onePotRecipes = "One-Pot Recipes"
//    case summerBreakRecipesForYourKids = "Summer Break Recipes For Your Kids"
//}

// MARK: - Credit
struct Credit: Codable {
    var name: String?
    var type: TypeEnum?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case type = "type"
    }
}

enum TypeEnum: String, Codable {
    case community = "community"
    case typeInternal = "internal"
}

// MARK: - Instruction
struct Instruction: Codable {
    var id: Int
    var position: Int
    var displayText: String
    var startTime: Int
    var appliance: String?
    var endTime: Int
    var temperature: Int?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case position = "position"
        case displayText = "display_text"
        case startTime = "start_time"
        case appliance = "appliance"
        case endTime = "end_time"
        case temperature = "temperature"
    }
}

// MARK: - Nutrition
struct Nutrition: Codable {
    var protein: Int?
    var fat: Int?
    var calories: Int?
    var sugar: Int?
    var carbohydrates: Int?
    var fiber: Int?
    var updatedAtString: String?
    var updatedAt: Date? {
          let formatter = DateFormatter()
          formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ" // adjust this format to match your date string
        return formatter.date(from: updatedAtString ?? "2023-09-10T12:00:00Z")
      }

    enum CodingKeys: String, CodingKey {
        case protein = "protein"
        case fat = "fat"
        case calories = "calories"
        case sugar = "sugar"
        case carbohydrates = "carbohydrates"
        case fiber = "fiber"
        case updatedAtString = "updated_at"
    }
}

//enum NutritionVisibility: String, Codable {
//    case auto = "auto"
//}

// MARK: - Price
struct Price: Codable {
    var consumptionPortion: Int
    var total: Int
    var updatedAtString: String
    var portion: Int
    var consumptionTotal: Int

    var updatedAt: Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ" // adjust this format to match your date string
        return formatter.date(from: updatedAtString)
    }

    enum CodingKeys: String, CodingKey {
        case consumptionPortion = "consumption_portion"
        case total = "total"
        case updatedAtString = "updated_at"
        case portion = "portion"
        case consumptionTotal = "consumption_total"
    }
}


// MARK: - Rendition
struct Rendition: Codable {
    var height: Int
    var fileSize: Int?
    var url: String
    var duration: Int
    var bitRate: Int?
    var name: RenditionName?
    var minimumBitRate: Int?
    var maximumBitRate: Int?
    var container: Container?
    var posterURL: String
    var contentType: ContentType?
    var aspect: Aspect?
    var width: Int

    enum CodingKeys: String, CodingKey {
        case height = "height"
        case fileSize = "file_size"
        case url = "url"
        case duration = "duration"
        case bitRate = "bit_rate"
        case name = "name"
        case minimumBitRate = "minimum_bit_rate"
        case maximumBitRate = "maximum_bit_rate"
        case container = "container"
        case posterURL = "poster_url"
        case contentType = "content_type"
        case aspect = "aspect"
        case width = "width"
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

enum RenditionName: String, Codable {
    case low = "low"
    case mp41280X720 = "mp4_1280x720"
    case mp4320X180 = "mp4_320x180"
    case mp4320X320 = "mp4_320x320"
    case mp4480X480 = "mp4_480x480"
    case mp4640X360 = "mp4_640x360"
    case mp4640X640 = "mp4_640x640"
    case mp4720X404 = "mp4_720x404"
    case mp4720X720 = "mp4_720x720"
}

// MARK: - Section
struct Section: Codable {
    var components: [Component]
    var name: String?
    var position: Int

    enum CodingKeys: String, CodingKey {
        case components = "components"
        case name = "name"
        case position = "position"
    }
}

// MARK: - Component
struct Component: Codable {
    var position: Int
    var measurements: [Measurement]
    var rawText: String
    var extraComment: String
    var ingredient: Ingredient
    var id: Int

    enum CodingKeys: String, CodingKey {
        case position = "position"
        case measurements = "measurements"
        case rawText = "raw_text"
        case extraComment = "extra_comment"
        case ingredient = "ingredient"
        case id = "id"
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
    var system: System?
    var name: String
    var displayPlural: String
    var displaySingular: String
    var abbreviation: String

    enum CodingKeys: String, CodingKey {
        case system = "system"
        case name = "name"
        case displayPlural = "display_plural"
        case displaySingular = "display_singular"
        case abbreviation = "abbreviation"
    }
}

enum System: String, Codable {
    case imperial = "imperial"
    case metric = "metric"
    case none = "none"
}

//enum ServingsNounPlural: String, Codable {
//    case cookies = "cookies"
//    case pancakes = "pancakes"
//    case serving = "serving"
//    case servings = "servings"
//}
//
//enum ServingsNounSingular: String, Codable {
//    case cookie = "cookie"
//    case pancake = "pancake"
//    case serving = "serving"
//}

// MARK: - Tag
struct Tag: Codable {
    var displayName: String
    var type: String
    var rootTagType: RootTagType?
    var name: String
    var id: Int

    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
        case type = "type"
        case rootTagType = "root_tag_type"
        case name = "name"
        case id = "id"
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
    case under45Minutes = "Under 45 minutes"
}

enum Tier: String, Codable {
    case under15_Minutes = "under_15_minutes"
    case under30_Minutes = "under_30_minutes"
    case under45_Minutes = "under_45_minutes"
}

// MARK: - UserRatings
struct UserRatings: Codable {
    var score: Double
    var countNegative: Int
    var countPositive: Int

    enum CodingKeys: String, CodingKey {
        case score = "score"
        case countNegative = "count_negative"
        case countPositive = "count_positive"
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
