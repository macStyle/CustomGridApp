//
//  Constant.swift
//  CustomGridApp
//
//  Created by Adam Jemni on 12/28/21.
//

import SwiftUI

let screen: CGSize = UIScreen.main.bounds.size
let divider : CGFloat = 1
var widthSmall = (screen.width / 3 ) - divider
var heighSmall = (widthSmall / 9) * 16
var widthBig = screen.width - widthSmall - divider
var heightBig = (heighSmall * 2 ) + divider
