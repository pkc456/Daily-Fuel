//
//  Hp.swift
//
//  Created by pradeep.chaudhary on 6/30/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON


public class Hp: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let price = "price"
    static let city = "city"
    static let change = "change"
  }

  // MARK: Properties
  public var price: String?
  public var city: String?
  public var change: String?

  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public convenience init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public required init(json: JSON) {
    price = json[SerializationKeys.price].string
    city = json[SerializationKeys.city].string
    change = json[SerializationKeys.change].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = price { dictionary[SerializationKeys.price] = value }
    if let value = city { dictionary[SerializationKeys.city] = value }
    if let value = change { dictionary[SerializationKeys.change] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.price = aDecoder.decodeObject(forKey: SerializationKeys.price) as? String
    self.city = aDecoder.decodeObject(forKey: SerializationKeys.city) as? String
    self.change = aDecoder.decodeObject(forKey: SerializationKeys.change) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(price, forKey: SerializationKeys.price)
    aCoder.encode(city, forKey: SerializationKeys.city)
    aCoder.encode(change, forKey: SerializationKeys.change)
  }

}
