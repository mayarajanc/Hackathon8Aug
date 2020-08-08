//
//  CategoryManager.swift
//  HackathonMaya
//
//  Created by Ranjith Karuvadiyil on 08/08/20.
//  Copyright © 2020 Maya Ranjith. All rights reserved.
//

import Foundation

class CategoryManager: NSObject {
    
    class func fetchCategories(completion: @escaping (_ dataModel: CategoryDataModel?, _ error: Error?) -> ()){
        if let path = Bundle.main.path(forResource: FileName.categoryFile, ofType: FileType.jsonType){
            do{
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let categoryList = try JSONDecoder().decode(CategoryDataModel.self, from: data)
                completion(categoryList,nil)
            }catch{
                completion(nil,error)
            }
        }
        
    }
}
