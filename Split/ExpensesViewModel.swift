//
//  ExpensesViewModel.swift
//  Split
//
//  Created by Momo Ozawa on 2020/07/11.
//  Copyright © 2020 Momo Ozawa. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

final class ExpensesViewModel: ViewModelType {
        
    var input: Input
    var output: Output

    struct Input { }
    
    struct Output {
        let expenses: Driver<[Expense]>
    }
    
    private let disposeBag = DisposeBag()

    init(input: Input) {
        self.input = input
        
        var expenses: [Expense] = []
        for i in 1...10 {
            let expense = Expense(title: "Expense \(i)", amount: Double(i), date: Date())
            expenses.append(expense)
        }
                
        self.output = Output(expenses: Observable.of(expenses).asDriver(onErrorJustReturn: []))
    }
    
}
