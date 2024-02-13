//
//  AttributeGroupCollection.swift
//  ModelPrototype
//
//  Created by Franklin Whitehurst on 2/13/24.
//

import Foundation

struct AttributeGroupCollection  {
    
    var attributeGroups = [AttributeGroup]()
    
    init(_ attributeEnums: [any AttributeValues], _ groups:[[Int]]) {
        for group in groups {
            var attributeGroups = [any AttributeEnum]()
            for (index,attribute) in attributeEnums.enumerated() {
                attributeGroups.append(attribute.getValue(group[index])!)
            }
            self.attributeGroups.append(AttributeGroup(attributeGroups))
        }
    }
    
    func getString() -> String {
        var rtn = String()
        for (index, element) in attributeGroups.enumerated() {
            rtn.append("Group Index: \(index)\n")
            rtn.append(element.getString())
        }
        return rtn
    }
    
}
