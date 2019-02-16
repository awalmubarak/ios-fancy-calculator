//
//  StructEnum.swift
//  Calculator
//
//  Created by Mubarak Awal on 16/02/2019.
//  Copyright © 2019 Mubarak Awal. All rights reserved.
//

import Foundation

enum Operator: String {
    case add = "+"
    case minus = "-"
    case times = "*"
    case divide = "/"
    case nothing = ""
}

enum CalculationState: String {
    case enteringNumber = "0"
    case newNumberStarted = "1"
}
