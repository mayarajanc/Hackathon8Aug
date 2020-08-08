//
//  ViewController.swift
//  HackathonMaya
//
//  Created by Maya Ranjith on 08/08/20.
//  Copyright © 2020 Maya Ranjith. All rights reserved.
//

import UIKit

class CateogyListViewController: UIViewController {
    
    @IBOutlet weak var categoryListView: UITableView!
    
    lazy var viewModel: CategoryViewModel = {
        let viewmodel = CategoryViewModel()
        return viewmodel
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.delegate =  self
        
        categoryListView.register(UINib(nibName: NibName.categoryCell, bundle: nil), forCellReuseIdentifier: CellIdentifiers.categoryCell)

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.fetchCategories()
        
    }
    
    private func showAlert(title:String,message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    
}

extension CateogyListViewController: UITableViewDataSource {
    //MARK:- UITableview Datasource Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.categoryList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CategoryCell = (tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.categoryCell, for: indexPath) as? CategoryCell)!
    
        if  viewModel.categoryList?.count ?? 0 > 0 {
            cell.setupCellWithValues(model: (viewModel.categoryList?[indexPath.row])!)

            
        }
        
        return cell
    }
    
}

extension CateogyListViewController: CategoryViewModelDelegate{
    func didCategriesFetched(){
        DispatchQueue.main.async {
            
            self.categoryListView.reloadData()
            
        }
    }
    func showRequestError(_ error: String){
        showAlert(title: "", message: NetworkError.noDatafound)
        
    }
    
}

