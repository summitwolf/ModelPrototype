//
//  AttributeGroupCollectionFactory.swift
//  ModelPrototype
//
//  Created by Franklin Whitehurst on 2/13/24.
//

import Foundation

class AttributeGroupCollectionFactory: MixedRadixNumber {
    
    let attributes: [any AttributeValues]
    
    init(_ attributes: [any AttributeValues]) {
        self.attributes = attributes
        var bases = [Int]()
        for attribute in attributes {
            bases.append(attribute.size)
        }
        super.init(bases)!
    }
    
    func makeCompleteGroupColection() -> AttributeGroupCollection {
        let groups = makePossableMRNs()
        return AttributeGroupCollection(attributes,groups)
    }

}
