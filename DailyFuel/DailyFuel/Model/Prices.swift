//
//  Prices.swift
//
//  Created by pradeep.chaudhary on 6/30/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON


public class Prices: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let iocl = "iocl"
    static let hp = "hp"
  }

  // MARK: Properties
  public var iocl: [Iocl]?
  public var hp: [Hp]?

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
    if let items = json[SerializationKeys.iocl].array { iocl = items.map { Iocl(json: $0) } }
    if let items = json[SerializationKeys.hp].array { hp = items.map { Hp(json: $0) } }
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = iocl { dictionary[SerializationKeys.iocl] = value.map { $0.dictionaryRepresentation() } }
    if let value = hp { dictionary[SerializationKeys.hp] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.iocl = aDecoder.decodeObject(forKey: SerializationKeys.iocl) as? [Iocl]
    self.hp = aDecoder.decodeObject(forKey: SerializationKeys.hp) as? [Hp]
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(iocl, forKey: SerializationKeys.iocl)
    aCoder.encode(hp, forKey: SerializationKeys.hp)
  }

}
