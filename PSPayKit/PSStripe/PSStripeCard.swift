//
//  PSStripeCard.swift
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

struct PSStripeCard {
    
    var cardNumber: String!
    var cardExpiryMonth: String!
    var cardExpiryYear: String!
    var cardCVCCode: String?
    
    var cardHolderName: String?
    var addressLine1: String?
    var addressLine2: String?
    var addressCity: String?
    var addressState: String?
    var addressCountry: String?
    
    //Fiends present in API response
    var cardId: String?
    var object: String?
    var lastFour: String?
    var brand: String?
    var funding: String?
    var fingerPrint: String?
    var countryCode: String?
    
    init() {
        
    }
    
    func toString () -> String {
        var cardInfoString: String = ""
        
        if cardNumber.isEmpty || cardExpiryMonth.isEmpty || cardExpiryYear.isEmpty {
            return cardInfoString
        }
        cardInfoString = "card[number]=\(cardNumber)"
        cardInfoString += "&card[exp_month]=\(cardExpiryMonth)"
        cardInfoString += "&card[exp_year]=\(cardExpiryYear)"
        
        if cardCVCCode?.isEmpty == false {
            cardInfoString += "&card[cvc]=\(cardCVCCode!)"
        }
        
        if cardHolderName?.isEmpty == false {
            cardInfoString += "&card[name]=\(cardHolderName)"
        }
        
        if addressLine1?.isEmpty == false {
            cardInfoString += "&card[address_line1]=\(addressLine1)"
        }
        
        if addressLine2?.isEmpty == false {
            cardInfoString += "&card[address_line2]=\(addressLine2)"
        }
        
        if addressCity?.isEmpty == false {
            cardInfoString += "&card[address_city]=\(addressCity)"
        }
        
        if addressState?.isEmpty == false {
            cardInfoString += "&card[address_state]=\(addressState)"
        }
        
        if addressCountry?.isEmpty == false {
            cardInfoString += "&card[address_country]=\(addressCountry)"
        }
        
        return cardInfoString
    }
}
