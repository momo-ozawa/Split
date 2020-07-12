//
//  ViewModelType.swift
//  Split
//
//  Created by Momo Ozawa on 2020/07/12.
//  Copyright © 2020 Momo Ozawa. All rights reserved.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    var input : Input { get }
    var output : Output { get }
}
