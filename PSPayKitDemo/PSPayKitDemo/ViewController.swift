//
//  ViewController.swift
//  PSStripe
//
//  Created by Pawan Kumar Singh on 08/09/14.
//  Copyright (c) 2014 Pawan Kumar Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()

        //create a card with available information.
        var stripeCard: PSStripeCard = PSStripeCard()
        stripeCard.cardNumber = "4242424242424242"
        stripeCard.cardExpiryMonth = "09"
        stripeCard.cardExpiryYear = "2015"
        stripeCard.cardCVCCode = "123"
        
        PSStripe().createPaymentToken(stripeCard, completionCallback: {(tokenInfo, error) -> Void in
            print(tokenInfo)
        })

        //create paymentInput with required payment criteria.
        var stripePaymentInput = PSStripePaymentInput()
        stripePaymentInput.currency = "usd"
        stripePaymentInput.amount = 500
        stripePaymentInput.description = "Test description"
        stripePaymentInput.card = stripeCard

        PSStripe().makePayment(stripePaymentInput, completionCallback: { (paymentInfo, error) -> Void in
            print(paymentInfo)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

