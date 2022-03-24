import UIKit

if let context = UIGraphicsGetCurrentContext() {
    context.addArc(center: CGPoint(x: bounds.midX, y: bounds.midY), radius: 100.0, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
    context.setLineWidth(5.0)
    UIColor.green.setFill() // set colors
    UIColor.red.setStroke()
    context.strokePath()
    context.fillPath()
    // ^ not good, it consumes the path and doesn't fill the cirle
}

// MARK: circle with bezier
let path = UIBezierPath()
path.addArc(withCenter: CGPoint(x: bounds.midX, y: bounds.midY), radius: 100.0, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
path.lineWidth = 5.0
UIColor.green.setFill()
UIColor.red.setStroke()
path.stroke()
path.fill()

let bp = UIBezierPath(roundedRect: bounds, cornerRadius: 16.0)
bp.addClip()
UIColor.black.setFill()
bp.fill()
}
