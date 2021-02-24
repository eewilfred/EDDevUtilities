//
//  Location+Extenstions.swift
//  EDUtilities
//
//  Created by Edwin Wilson on 09/05/2020.
//  Copyright © 2020 Edwin Wilson. All rights reserved.
//

import Foundation
import CoreLocation

extension CLLocation {

    func geocode(completion: @escaping (_ placemark: [CLPlacemark]?, _ error: Error?) -> Void)  {
        CLGeocoder().reverseGeocodeLocation(self, completionHandler: completion)
    }
}

extension CLPlacemark {

    func getLocationString() -> String {

        return "\(subLocality ?? ""), \(locality ?? ""), \(isoCountryCode ?? "")"
    }
}
