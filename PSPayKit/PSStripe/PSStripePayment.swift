//
//  PSStripePayment.swift
//  PSStripe
//
//  Created by Pawan Kumar Singh on 03/10/14.
//  Copyright (c) 2014 Pawan Kumar Singh. All rights reserved.
//
//  I hereby declare this source code truly open source without
//  any obligation for copy, modify, redistribute and use for
//  any comercial or non-comercial purposes. I also do-not take any
//  responsibility for any damage caused by this source code by any means.

import Foundation

struct PSStripePaymentInput {
    
    var amount: Int!
    var currency: String!
    var card: PSStripeCard!
    var description: String?
    var capture: Bool = true
    var receiptEmail: String?

    init() {
        
    }
    
    func toString() -> String {
        var tempString = "amount=\(amount)"
        tempString += "&currency=\(currency)"
        tempString += "&"+card.toString()
        tempString += "&description=\(description)"
        return tempString
        
    }
}
