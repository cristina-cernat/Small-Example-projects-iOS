//
//  MyView.swift
//  exercitii drawing
//
//  Created by Cristina Mihaela on 24.02.2022.
//

import UIKit

class MyView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation. */
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.lineWidth = 3
        path.lineCapStyle = .square

        // functii
        path.move(to: CGPoint(x: bounds.midX, y: bounds.midY)) // we can use double from swift 5.5
        path.addLine(to: CGPoint(x: bounds.minX, y: bounds.minY))
        path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY))
        path.close()

        UIColor.blue.setStroke()
        path.stroke()

        UIColor.red.setFill()
        path.fill()

        //path // cut
    }

}
