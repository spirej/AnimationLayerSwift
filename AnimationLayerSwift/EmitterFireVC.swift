//
//  EmitterFireVC.swift
//  AnimationLayerSwift
//
//  Created by SPIREJ on 2019/3/21.
//  Copyright © 2019年 xiangshang360. All rights reserved.
//

import UIKit

class EmitterFireVC: UIViewController {
    
    let emitterCell = CAEmitterCell() //粒子单元cell
    let emitterLayer = CAEmitterLayer()//粒子发射图层

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.black;
        
        // Do any additional setup after loading the view.
        self.navigationItem.title = "粒子火焰效果"
        
        emitterCell.name = "fire"//粒子单元名称
        emitterCell.emissionLongitude = CGFloat(Double.pi)//该d粒子系统在xy平面的发射角度
        emitterCell.velocity = -1//粒子速度1，负表示沿y反方向运动
        emitterCell.velocityRange = 50//粒子速度范围
        emitterCell.emissionRange = 1.1//粒子发射角度
        emitterCell.yAcceleration = -200//粒子y方向的加速度分量
        emitterCell.scaleSpeed = 0.3//缩放比例，超大火苗
        emitterCell.birthRate = 500//粒子数
        emitterCell.lifetime = 1//粒子生命周期
        // 火焰颜色
        emitterCell.color = UIColor(red: 0.8, green: 0.4, blue: 0.2, alpha: 0.1).cgColor
        // 必须要设置粒子的“种子”内容
        emitterCell.contents = UIImage(named: "fire.png")!.cgImage
        
        emitterLayer.position = self.view.center//粒子发射位置
        emitterLayer.emitterSize = CGSize(width: 50, height: 10)//当前火苗大小
        // 当前粒子渲染模式 和 发射源模式
        emitterLayer.renderMode = .additive
        emitterLayer.emitterMode = .outline
        emitterLayer.emitterShape = .line
        // 粒子单元部署到粒子发射图层中
        emitterLayer.emitterCells = [emitterCell]
        self.view.layer.addSublayer(emitterLayer)
    }

    // 粒子速度
    @IBAction func velocityChanged(_ sender: UISlider) {
        // 重置粒子速度
        emitterLayer.setValue(sender.value, forKeyPath: "emitterCells.fire.velocity")
    }
    
    // 粒子数
    @IBAction func birthRateChanged(_ sender: UISlider) {
        // 重置粒子生成速度，即粒子数
        emitterLayer.setValue(sender.value, forKeyPath: "emitterCells.fire.birthRate")
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
