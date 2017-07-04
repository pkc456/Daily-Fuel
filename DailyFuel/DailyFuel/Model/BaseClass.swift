//
//  BaseClass.swift
//
//  Created by pradeep.chaudhary on 6/30/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON


public class BaseClass: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let state = "state"
    static let updated = "updated"
    static let prices = "prices"
    static let fuel = "fuel"
  }

  // MARK: Properties
  public var state: String?
  public var updated: String?
  public var prices: Prices?
  public var fuel: String?

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
    state = json[SerializationKeys.state].string
    updated = json[SerializationKeys.updated].string
    prices = Prices(json: json[SerializationKeys.prices])
    fuel = json[SerializationKeys.fuel].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = state { dictionary[SerializationKeys.state] = value }
    if let value = updated { dictionary[SerializationKeys.updated] = value }
    if let value = prices { dictionary[SerializationKeys.prices] = value.dictionaryRepresentation() }
    if let value = fuel { dictionary[SerializationKeys.fuel] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.state = aDecoder.decodeObject(forKey: SerializationKeys.state) as? String
    self.updated = aDecoder.decodeObject(forKey: SerializationKeys.updated) as? String
    self.prices = aDecoder.decodeObject(forKey: SerializationKeys.prices) as? Prices
    self.fuel = aDecoder.decodeObject(forKey: SerializationKeys.fuel) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(state, forKey: SerializationKeys.state)
    aCoder.encode(updated, forKey: SerializationKeys.updated)
    aCoder.encode(prices, forKey: SerializationKeys.prices)
    aCoder.encode(fuel, forKey: SerializationKeys.fuel)
  }

}
