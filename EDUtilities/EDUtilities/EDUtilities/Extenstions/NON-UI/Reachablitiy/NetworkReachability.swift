//
//  NetworkReachability.swift
//  EDUtilities
//
//  Created by Edwin Wilson on 15/06/2020.
//  Copyright © 2020 Edwin Wilson. All rights reserved.
//

import UIKit
import SystemConfiguration

/**
 Check if Phone has access to network

 ~~~
 //HOW TO USE:
if NetworkReachability.isConnectedToNetwork() {
 //PHONE has internet
 }
 ~~~

 - Note: internet over wifi and Mobile data(Cellular)  is detected as part of this
 */
public class NetworkReachability {

    class func isConnectedToNetwork() -> Bool {

        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)

        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }

        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }
        // Working for Cellular and WIFI
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        let result = (isReachable && !needsConnection)

        return result

    }
}
