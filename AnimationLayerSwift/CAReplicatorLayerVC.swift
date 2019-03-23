//
//  CAReplicatorLayerVC.swift
//  AnimationLayerSwift
//
//  Created by SPIREJ on 2019/3/23.
//  Copyright © 2019年 xiangshang360. All rights reserved.
//

/*
 CAReplicatorLayer
 主要用于图层的快速复制，并且复制会保持被复制图层的各种基础属性及动画
 
 基本属性
 
 instanceCount
 var instanceCount: Int
 拷贝图层的次数,包括其所有的子图层,默认值是1,也就是没有任何子图层被复制
 
 instanceDelay
 var instanceDelay: CFTimeInterval
 在短时间内的复制延时,一般用在动画上(支持动画的延时)
 
 instanceTransform
 var instanceTransform: CATransform3D
 复制图层在被创建时产生的和上一个复制图层的位移(位移的锚点是CAReplicatorlayer的中心点)
 
 preservesDepth
 var preservesDepth: Bool
 如果设置为YES,图层将保持于CATransformLayer类似的性质和相同的限制
 
 instanceColor
 var instanceColor: CGColor?
 设置多个复制图层的颜色,默认位白色
 
 instanceRedOffset
 var instanceRedOffset: Float
 设置每个复制图层相对上一个复制图层的红色偏移量
 
 instanceGreenOffset
 var instanceGreenOffset: Float
 设置每个复制图层相对上一个复制图层的绿色偏移量
 
 instanceBlueOffset
 var instanceBlueOffset: Float
 设置每个复制图层相对上一个复制图层的蓝色偏移量
 
 instanceAlphaOffset
 var instanceAlphaOffset: Float
 设置每个复制图层相对上一个复制图层的透明度偏移量
 
 */
import UIKit

enum ShowType {
    case radar
    case circle
    case scale
}

let kWidth = UIScreen.main.bounds.size.width

class CAReplicatorLayerVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
//        self.ui_radar()
        self.ui_circle()
    }
    
    // 雷达效果
    func ui_radar() {
        
        // 背景视图
        let bgView = UIView(frame: CGRect(x: 0, y: 0, width: kWidth, height: 200))
        bgView.center = self.view.center
        bgView.backgroundColor = UIColor.lightGray
        self.view.addSubview(bgView)
        
        // 动画原图层，就是不断变大的那个圆
        let animationLayer = CAShapeLayer()
        animationLayer.backgroundColor = UIColor.red.cgColor
        animationLayer.bounds = CGRect(x: 0, y: 0, width: 20, height: 20)
        animationLayer.cornerRadius = 10
        animationLayer.position = CGPoint(x: kWidth/2.0, y: 100)
        
        // 动画 - 放大
        let transformScaleAnim = CABasicAnimation(keyPath: "transform")
        let value = NSValue.init(caTransform3D:CATransform3DMakeScale(10, 10, 1))
        transformScaleAnim.toValue = value
        
        // 动画 - 透明度
        let alphaAnim = CABasicAnimation(keyPath: "opacity")
        alphaAnim.toValue = 0
        
        // 加入到动画组
        let animGroup = CAAnimationGroup()
        animGroup.animations = [transformScaleAnim, alphaAnim]
        animGroup.duration = 2
        animGroup.repeatCount = HUGE
        animationLayer.add(animGroup, forKey: nil)
        
        // 复制图层
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.addSublayer(animationLayer)
        replicatorLayer.instanceCount = 3 //复制图层数
        replicatorLayer.instanceDelay = 0.3//复制间隔时间
        
        // 加载到视图中显示
        bgView.layer.addSublayer(replicatorLayer)
    }
    
func ui_circle() {
    
    // 背景视图
    let bgView = UIView(frame: CGRect(x: 0, y: 0, width: kWidth, height: 200))
    bgView.center = self.view.center
    bgView.backgroundColor = UIColor.lightGray
    self.view.addSubview(bgView)
    
    // 动画原图层，就是不断转圈的圆
    let animationLayer = CAShapeLayer()
    animationLayer.backgroundColor = UIColor.red.cgColor
    animationLayer.bounds = CGRect(x: 0, y: 0, width: 20, height: 20)
    animationLayer.cornerRadius = 10
    animationLayer.position = CGPoint(x: kWidth/2.0, y: 50)
    animationLayer.transform = CATransform3DMakeScale(0, 0, 0)//初始隐藏
    
    // 动画 - 缩放
    let transformAnim = CABasicAnimation(keyPath: "transform")
    transformAnim.duration = 2
    transformAnim.repeatCount = HUGE
    transformAnim.fromValue = NSValue.init(caTransform3D: CATransform3DMakeScale(1, 1, 1))
    transformAnim.toValue = NSValue.init(caTransform3D: CATransform3DMakeScale(0.1, 0.1, 0.1))
    animationLayer.add(transformAnim, forKey: nil)
    
    // 复制图层
    let replicatorLayer = CAReplicatorLayer()
    replicatorLayer.frame = bgView.bounds
    replicatorLayer.addSublayer(animationLayer)
    replicatorLayer.instanceCount = 10 //复制图层数
    replicatorLayer.instanceDelay = 0.2//复制间隔时间
    replicatorLayer.instanceTransform = CATransform3DMakeRotation(CGFloat(Double.pi*2/Double(10)), 0, 0, 1.0)
    
    // 加载到视图中显示
    bgView.layer.addSublayer(replicatorLayer)
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
