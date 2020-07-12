//
//  ExpensesViewController.swift
//  Split
//
//  Created by Momo Ozawa on 2020/07/11.
//  Copyright © 2020 Momo Ozawa. All rights reserved.
//

import RxCocoa
import RxDataSources
import RxSwift
import UIKit

class ExpensesViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    
    var viewModel: ExpensesViewModel!

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let input = ExpensesViewModel.Input()
        viewModel = ExpensesViewModel(input: input)
        
        bindUI()
    }
    
    func bindUI() {
        viewModel.output.expenses
            .drive(tableView.rx.items(
                cellIdentifier: "ExpenseCell",
                cellType: UITableViewCell.self)
            ) { (_, exchange, cell) in
                cell.textLabel?.text = exchange.title
                cell.detailTextLabel?.text = String(exchange.amount)
            }
            .disposed(by: disposeBag)
    }

}
