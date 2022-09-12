//
//  File.swift
//  
//
//  Created by Minh Vu on 12/09/2022.
//

import Foundation
import UIKit

class Toast {
    public var INSTANCE:Toast? = nil
    public func  makeText(text:String)->Toast{
        if INSTANCE == nil {
            INSTANCE = Toast()
        }
        INSTANCE!.toastText = text
        return INSTANCE!
    }
    
    public let window = UIApplication.shared.windows.first!
    
    public let contentView = UIView()
    public let lableToast = UILabel(frame: CGRect(x: 0, y: 0, width: 240, height: 40))
    public var toastText = ""
    public init(){
        lableToast.text = "Hi Minh"
        lableToast.textAlignment = .center
        lableToast.textColor = .black
        lableToast.backgroundColor = .clear
        lableToast.numberOfLines = 0

        contentView.frame = lableToast.frame
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 12
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.layer.borderWidth = 1
        contentView.center = CGPoint(x: window.center.x, y: window.center.y*7/5)
        contentView.addSubview(lableToast)
        
        print("chay vao day ================")
    }
    
    private var timer:DispatchSourceTimer? = nil
    func show(showTimeSec:Int = 20){
        if timer != nil {
            hide()
        }
        var w = CGFloat(16)*1.2 * CGFloat(toastText.count), h = CGFloat(40)
        if w > 240 {
            w = 240
            h = 70
        }
        lableToast.frame.size = CGSize(width: w, height: h)
        contentView.frame.size = lableToast.frame.size
        contentView.center.x = window.center.x
        
        lableToast.text = toastText
        contentView.alpha = 0.0
        window.addSubview(contentView)
        easyIn()
        
//        timer = DispatchSource.makeTimerSource(flags: .strict, queue: DispatchQueue.main)
//        timer?.schedule(deadline: .now() + .seconds(showTimeSec))
//
        timer = DispatchSource.makeTimerSource()
        timer?.schedule(deadline: .now() + .seconds(3), repeating: .seconds(1), leeway: .seconds(1))
        timer?.setEventHandler(handler: {
            self.hide()
        })
        timer?.resume()
        
        
        print("chay vao day ===============2222222=")
    }
    
    @objc public func hide(){
        self.contentView.removeFromSuperview()
        self.timer?.cancel()
        self.timer = nil
    }
    
    public func easyIn(){
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationCurve(.easeIn)
        UIView.setAnimationDuration(0.2)
        contentView.alpha = 1.0
        UIView.commitAnimations()
    }
}
