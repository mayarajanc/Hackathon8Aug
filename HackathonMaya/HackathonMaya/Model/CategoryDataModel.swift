//
//  CategoryDataModel.swift
//  HackathonMaya
//
//  Created by Ranjith Karuvadiyil on 08/08/20.
//  Copyright © 2020 Maya Ranjith. All rights reserved.
//

import UIKit

struct CategoryDataModel: Codable {
    var categories: [Categories]?
    
     enum CategoryDataCodingKeys: String,CodingKey{
        case categories = "categories"
    }
    
}

struct Categories:Codable {
    var name: String?
    var categoryID: Int?
    
    private enum CategoriesCodingKeys: String,CodingKey{
        case name = "name"
        case categoryID = "categoryID"
    }
}

extension CategoryDataModel{
    init(from decoder:Decoder) throws{
        let dataInfo =  try decoder.container(keyedBy: CategoryDataCodingKeys.self)
        categories = try dataInfo.decode([Categories].self , forKey: .categories)
        
    }
}
extension Categories{
    init(from decoder:Decoder) throws{
        let categoryInfo =  try decoder.container(keyedBy: CategoriesCodingKeys.self)
        name =  try categoryInfo.decodeIfPresent(String.self, forKey: .name) ?? ""
        categoryID =  try categoryInfo.decodeIfPresent(Int.self, forKey: .categoryID) ?? 0
    }
}
