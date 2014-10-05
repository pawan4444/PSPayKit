//
//  PSStripe.swift
//  PSStripe
//
//  Created by Pawan Kumar Singh on 08/09/14.
//  Copyright (c) 2014 Pawan Kumar Singh.
//
//  I hereby declare this source code truly open source without
//  any obligation for copy, modify, redistribute and use for 
//  any comercial or non-comercial purposes. I also do-not take any
//  responsibility for any damage caused by this source code by any means.

import Foundation


/** 
    This class is top layer of PSStripe library and written to take care of all kind of stripe requests.
*/

class PSStripe {
    
    // MARK: - Stripe configuration values -
    let stripeBaseUrl = "https://api.stripe.com"
    let stripeAPIVersion = "v1"
    let tokenEndPoint = "tokens"
    let chargeEndPoint = "charges"
    let stripeSecretKey = "sk_test_10kK6JuwoW92K3iup7zs1H14"
    let stripePublishableKey = "pk_test_10kK6JuwoW92K3iup7zs1H14"
    let stripeCurrentVersion = "Stripe-Version: 2014-09-08"
    
    // MARK: - Stripe payment gateway request methods -
    
    /// This method will create a token which will be used latter to process the payment request.
    ///
    /// - Callback returns a dictionary which holds all information obtained from server as response for creating new token with stripCard information passed to stripe payment gateway.
    ///
    /// - If there is any error occured then error response will have that information.
    ///
    /// :param: stripeCard This field is a structure of type PSStripeCard.
    /// :param: callback Callback is a closure method which is triggered when request is completed either in success or failure.
    /// :returns: Void
    ///
    func createPaymentToken(stripeCard: PSStripeCard,
        completionCallback callback: (tokenInfo: NSDictionary!, error: NSError!) -> Void) -> Void {
        
        var request = NSMutableURLRequest(URL: createUrl(tokenEndPoint))
        request.setValue("Bearer \(stripeSecretKey)", forHTTPHeaderField: "Authorization")
        request.HTTPBody = stripeCard.toString().dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
        request.HTTPMethod = "POST"

        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.currentQueue(), { (response: NSURLResponse!, data: NSData!, connectionError: NSError!) -> Void in
         
            if connectionError != nil {
                var str: String = connectionError.localizedDescription

            }else{
                
                var str = NSString(data: data, encoding: NSUTF8StringEncoding)
                var error: NSError? = nil
                var dict: [String: AnyObject] = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: &error) as Dictionary
                callback(tokenInfo: dict, error: nil)
            }
        })
    }

    /// This method will request for a payment to be made for the given card (credit/debit) on stripe payment gateway.
    ///
    /// - Callback returns a dictionary which holds all information obtained from server as response for the request to process the payment using stripCard information passed to stripe payment gateway.
    ///
    /// - If there is any error occured then error response will have that information.
    ///
    /// :param: stripeCard This field is a structure of type PSStripeCard.
    /// :param: callback Callback is a closure method which is triggered when request is completed either in success or failure.
    /// :returns: Void
    ///

    func makePayment(stripePaymentInput: PSStripePaymentInput,
        completionCallback callback: (paymentInfo: NSDictionary!, error: NSError!) -> Void){

        var request = NSMutableURLRequest(URL: createUrl(chargeEndPoint))
        request.setValue("Bearer \(stripeSecretKey)", forHTTPHeaderField: "Authorization")
        request.HTTPBody = stripePaymentInput.toString().dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
        request.HTTPMethod = "POST"
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.currentQueue(), { (response: NSURLResponse!, data: NSData!, connectionError: NSError!) -> Void in
            
            if connectionError != nil {
                var str: String = connectionError.localizedDescription
                
            }else{
                
                var str = NSString(data: data, encoding: NSUTF8StringEncoding)
                var error: NSError? = nil
                var dict: [String: AnyObject] = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: &error) as Dictionary
                callback(paymentInfo: dict, error: nil)
            }
        })


    }
    
    // MARK: - Helper methods -
    func createUrl(endPoint: String) -> NSURL {
        let urlString: String = "\(stripeBaseUrl)/\(stripeAPIVersion)/\(endPoint)"
        return NSURL.URLWithString(urlString)
    }    
}