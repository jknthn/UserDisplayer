//
//  UIViewController+NetworkActivityIndicator.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 05/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import UIKit

protocol NetworkActivityDisplayer {
    func showNetworkActivityIndicator()
    func hideNetworkActivityIndicator()
}

extension NetworkActivityDisplayer {
    
    func showNetworkActivityIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func hideNetworkActivityIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
}

extension UIViewController: NetworkActivityDisplayer { }
