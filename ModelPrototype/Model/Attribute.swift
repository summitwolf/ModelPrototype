//
//  Protocols.swift
//  ModelPrototype
//
//  Created by Franklin Whitehurst on 2/13/24.
//

import Foundation

protocol AttributeEnum: CaseIterable, Equatable {
    var kind:String {get}
    var ordinal: Int {get}
}

protocol AttributeValues {
    var size: Int {get}
    func getValue(_ ordinal: Int) -> (any AttributeEnum)?
}

struct Attribute<T: AttributeEnum>: AttributeValues {
    
    let size: Int
    let attributes: [T]
    
    init() {
        var attributes = [T]()
        for attribute in T.allCases {
            attributes.append(attribute)
        }
        size = attributes.count
        self.attributes = attributes
    }
    
    func getValue(_ ordinal: Int) -> (any AttributeEnum)? {
        isValidOrdinal(ordinal) ? attributes[ordinal] : nil
    }

    func isValidOrdinal(_ ordinal: Int) -> Bool {
        ordinal >= 0 && ordinal < size
    }
    
}
