//
//  EmitterNenoVC.swift
//  AnimationLayerSwift
//
//  Created by SPIREJ on 2019/3/22.
//  Copyright © 2019年 xiangshang360. All rights reserved.
//

import UIKit

class EmitterNenoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "霓虹效果"

        self.view.backgroundColor = UIColor.black
        
        let emitterCell = CAEmitterCell()
        emitterCell.name = "neonlight"
        emitterCell.emissionLongitude  = CGFloat(Double.pi*2)// emissionLongitude:x-y 平面的 发 射方向
        emitterCell.velocity = 50// 粒子速度
        emitterCell.velocityRange = 50// 粒子速度范围
        emitterCell.scaleSpeed = -0.2// 缩放比例 超大火苗
        emitterCell.scale = 0.1//缩放比例
        //R G B alpha的s颜色速度渐变效果
        emitterCell.redSpeed = -0.2
        emitterCell.greenSpeed = -0.1
        emitterCell.blueSpeed = 0.1
        emitterCell.alphaSpeed = -0.2
        emitterCell.birthRate = 100//粒子生成速度
        emitterCell.lifetime = 4//粒子生命周期
        emitterCell.color = UIColor.white.cgColor//粒子背景颜色
        //粒子效果内容
        emitterCell.contents = UIImage(named: "neonlight.png")!.cgImage
        
        let emitterLayer = CAEmitterLayer()
        emitterLayer.position = self.view.center// 粒子发射位置
        emitterLayer.emitterSize = CGSize(width: 2, height: 2)// 控制粒子大小
        emitterLayer.renderMode = CAEmitterLayerRenderMode.backToFront//着色(渲染)模式
        emitterLayer.emitterMode = CAEmitterLayerEmitterMode.outline// 控制发射源模式 即形状
        emitterLayer.emitterShape = CAEmitterLayerEmitterShape.circle//形状
        
        emitterLayer.emitterCells = [emitterCell]
        self.view.layer.addSublayer(emitterLayer)
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
