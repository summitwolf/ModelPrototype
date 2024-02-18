//
//  AttributeGroup.swift
//  ModelPrototype
//
//  Created by Franklin Whitehurst on 2/13/24.
//

import Foundation

class AttributeGroup {
    
    let attributes: [any AttributeEnum]
    
    required init(_ attributes: [any AttributeEnum]) {
        self.attributes = attributes
    }
    
    func getString() -> String {
        var rtn = String()
        for (index, element) in attributes.enumerated() {
            rtn.append("Attribute Index: \(index): Kind:\(element.kind): Ordinal: \(element.ordinal): Value: \(element)\n")
        }
        return rtn
    }
}
