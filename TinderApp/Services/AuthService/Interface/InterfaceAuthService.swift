//
//  InterfaceAuthService.swift
//  TinderApp
//
//  Created by Serg on 13.02.2020.
//  Copyright © 2020 Sergey Gladkiy. All rights reserved.
//

import Foundation

protocol InterfaceAuthService {
    var keyToken: String { get }
    var valueToken: String { get }
}
