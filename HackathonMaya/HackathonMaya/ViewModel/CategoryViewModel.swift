//
//  CategoryViewModel.swift
//  HackathonMaya
//
//  Created by Ranjith Karuvadiyil on 08/08/20.
//  Copyright © 2020 Maya Ranjith. All rights reserved.
//

import Foundation

protocol CategoryViewModelDelegate: class {
    func didCategriesFetched()
    func showRequestError(_ error: String)
    
}

class CategoryViewModel{
    private var categoryData: CategoryDataModel?
    var categoryList: [Categories]?
    weak var delegate: CategoryViewModelDelegate?
}

extension CategoryViewModel{
    func fetchCategories(){
        CategoryManager.fetchCategories{(dataModel,error)in
           if error != nil{
                self.delegate?.showRequestError(error?.localizedDescription ?? "")
            }
            self.categoryList = []
            self.categoryList?.append(contentsOf: (dataModel?.categories ?? []))
            self.delegate?.didCategriesFetched()
        }
    }
}
