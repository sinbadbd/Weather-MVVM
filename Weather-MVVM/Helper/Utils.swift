//
//  Utils.swift
//  Weather-MVVM
//
//  Created by Imran on 20/1/21.
//

import UIKit
let buttonColor   = UIColor(red: 19/255, green: 124/255, blue: 205/255, alpha: 1)

func getButtonWithImage(frame:CGRect, imgName:String, imgSz:CGSize, imgClr:UIColor?) ->UIButton {
     let aBtn = UIButton(type: .custom)
     aBtn.frame = frame
    let image: UIImage? = UIImage(named:imgName)?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
     let imgView = UIImageView(frame: CGRect(x: aBtn.frame.size.width*0.5-imgSz.width*0.5, y: aBtn.frame.size.height*0.5-imgSz.height*0.5, width: imgSz.width, height: imgSz.height))
     imgView.tag = 1
     imgView.image = UIImage(named: imgName)
    if imgClr != nil {
        imgView.image = image
        imgView.tintColor = imgClr
    }
    
     aBtn.addSubview(imgView)
     
     return aBtn
 }
/**
Returns UIColor from hex string
 - hex : hex value
**/
func hexToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        return UIColor.gray
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
