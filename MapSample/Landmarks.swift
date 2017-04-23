//
//  PointConstants.swift
//  MapSample
//
//  Created by 鈴木瑛二 on 2017/04/23.
//  Copyright © 2017年 jp.co.edu. All rights reserved.
//

import Foundation
import MapKit

enum Landmarks {
    case tokyoStation
    case nearTokyoStation
    case imperialPalace
    
    var point: CLLocationCoordinate2D {
        switch self {
        case .tokyoStation:
            return CLLocationCoordinate2DMake(35.681298, 139.766247)
        case .imperialPalace:
            return CLLocationCoordinate2DMake(35.68154, 139.752498)
        case .nearTokyoStation:
            return CLLocationCoordinate2DMake(35.681722038774126, 139.77147641071286)
        }
    }
}
