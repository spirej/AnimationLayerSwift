//
//  ViewController.swift
//  AnimationLayerSwift
//
//  Created by SPIREJ on 2019/3/21.
//  Copyright © 2019年 xiangshang360. All rights reserved.
//

/*
 UIView和CALayer的区别：
 （1）UIView继承UIResponder，因此UIView可以处理响应事件，而CALayer继承NSObject，所以它只负责内容的创建、绘制。
 （2）UIView负责对内容的管理，而CALayer负责对内容的绘制
 （3）UIView中的位置属性只有frame，bounds，center，而CALayer除了这些之外还有anchorPoint，position
 （4）通过修改CALayer可以实现UIView无法实现的很多高级功能
 
 Core Animation核心动画
 Core Animation为iOS核心动画，它提供了一组丰富的API可以用于制作各种高级炫酷的动画效果。CoreAnimation来自iOS的QuartzCore.framework框架，它具备以下特点：
 （1）直接作用于CALayer图层上
 （2）Core Animation的执行过程在后台执行，不阻塞主线程
 （3）可用CALayer绝大多数属性绘制高级动画效果
 
 Core Animation下各种常用动画类的继承关系图
 ...
 - @protocol CAMediaTiming 有很多动画公共的属性，比如常见的 duration speed repeatCount等
 - CAAnimation 主要用于实现动画的委托代理方法，比如动画的开始事件和结束事件
 - CAPropertyAnimation 为动画属性，分为CABasicAnimation基础动画和CAKeyframeAnimation关键帧动画
 - CAAnimationGroup 组合动画
 - CATransition 转场动画
 
 CABasicAnimation基础动画合集
 （1）位置动画
    posion
    注意animation.toValue属性表明改变了控件的位置，所以给一个新的position的x,y坐标 animation.byValue表明在控件原来位置的基础上，沿x,y坐标分别移动了多少
 （2）缩放动画
    transform.scale.x / transform.scale.y，scale有x,y两个属性表明当前UI控件的width/height的缩放系数
 （3）旋转动画
    transform.rotation
 （4）位移动画
    transform.translation.x / transform.translation.y 表示在x/y方向上移动
 （5）边框动画
    animation.keyPath = "borderWidth"
 （6）颜色渐变
    animation.keyPath = "backgroundColor"
    animation.keyPath = "borderColor"
 （7）淡入淡出
    animation.keyPath = "opacity"
 （8）阴影渐变
    animation.keyPath = "shadowOffset"
 
 Core Animation:
 
 CAKeyframeAnimation：是CALayer层下的关键帧动画类，实现类似UIView的关键帧动画效果（前面有介绍）。ACKeyframeAnimation是CAPropertyAnimation的一个子类，与CABasicAnimation原理类似，都是通过修改当前CALayer图层的value属性实现动画效果。不同的是CABasicAnimation一般只使用fromeValue/toValue/byValue，即只能修改一个value值。而CAKeyframeAnimation则可以修改一组value值来实现对动画的更精确细腻的控制。
 
 CAAnimation Group：组合动画，把各种动画组合起来形成各种效果
 
 CAKeyframeAnimation动画属性要点：
 （1）values
    数组类型，数组中的每个元素描述了一个关键帧的相关属性。比如描述关键帧位置的动画时，values描述的是位置信息；比如描述关键帧缩放动画时，values描述的是缩放比例信息
 （2）keyTimes
    关键帧在动画周期默认是匀速的。如果设置了该属性，那么每个关键帧显示的周期为keyTimes*duration
 （3）path
    控制动画路径，通过设置CGPathRef/CGMutablePathRef可以让动画按照自己绘制的路径运行
 
 案例
 CAEmitterCell粒子动画效果
 关键字：CAEmitterLayer / ACEmitterCell
 
 
 */

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc:EmitterFireVC = EmitterFireVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identify = "listCell"
        
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: identify) ?? .init(style: .default, reuseIdentifier: identify)
        
        cell.textLabel?.text = "\(indexPath.row + 1)"
        
        return cell
    }
}

