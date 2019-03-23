//
//  GradientLayerVC.swift
//  AnimationLayerSwift
//
//  Created by SPIREJ on 2019/3/22.
//  Copyright © 2019年 xiangshang360. All rights reserved.
//

/*
 CAGradientLayer可以拆解为三个主要组成部分
 CA:CoreAnimation的缩写，表明使用的是iOS框架下的核心动画部分
 Gradient:梯度的意思，描述当前动画的特点，实现一些梯度功能的动画效果。比如位置的梯度变化、颜色的梯度渐变等
 Layer:当前动画作用在Layer内容层
 
 属性
 
 colors
 var colors: [AnyObject]?
 一个内部是CGColorRef的数组,规定所有的梯度所显示的颜色,默认为nil
 locations
 var locations: [NSNumber]?
 一个内部是NSNumber的可选数组,规定所有的颜色梯度的区间范围,选值只能在0到1之间,并且数组的数据必须单增,默认值为nil
 endPoint
 var endPoint: CGPoint
 图层颜色绘制的终点坐标,也就是阶梯图层绘制的结束点,默认值是(0.5,1.0)
 startPoint
 var startPoint: CGPoint
 与endPoint相互对应,就是绘制阶梯图层的起点坐标,绘制颜色的起点,默认值是(0.5,0.0)
 type
 var type:String
 绘制类型,默认值是kCAGradientLayerAxial,也就是线性绘制,各个颜色阶层直接的变化是线性的
 */

import UIKit

class GradientLayerVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.black
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 200))
        view.center = self.view.center
        self.view.addSubview(view)
        
        let gradientLayer:CAGradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        gradientLayer.colors = [UIColor.clear.cgColor,UIColor.white.cgColor,UIColor.clear.cgColor]
        gradientLayer.locations = [0.0, 0.5, 1.0]
        view.layer.addSublayer(gradientLayer)
        
        let gradientAnimation:CABasicAnimation = CABasicAnimation()
        gradientAnimation.keyPath = "colors"
        gradientAnimation.fromValue = [UIColor.clear.cgColor,UIColor.white.cgColor,UIColor.clear.cgColor]
        gradientAnimation.toValue = [UIColor.blue.cgColor,UIColor.red.cgColor,UIColor.cyan.cgColor]
        
        //另一种方式 位置
        //gradientLayer.locations = [0.0, 0.05, 0.1]
        //gradientAnimation.keyPath = "locations"
        //gradientAnimation.fromValue = [0.0, 0.05, 0.1]
        //gradientAnimation.toValue = [0.9, 0.95, 1.0]
        
        gradientAnimation.duration = 3.0
        // 动画结束后保持结束后的状态
        gradientAnimation.isRemovedOnCompletion = false
        gradientAnimation.fillMode = .forwards
        
        gradientLayer.add(gradientAnimation, forKey: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
