//
//  QuartzView.swift
//  Tracks
//
//  Created by 周登杰 on 2020/11/6.
//



import UIKit



extension CGContext {

    func savingGState<Result>(_ body: () throws -> Result) rethrows -> Result {
        self.saveGState()
        defer {
            self.restoreGState()
        }
        return try body()
    }
}



class QuartzView: UIView {

    // center and optionally scale the drawing
    func centerDrawing(inContext: CGContext,  drawingExtent: CGRect, scaleToFit: Bool = false) {
        let xScale = bounds.width / drawingExtent.width
        let yScale = bounds.height / drawingExtent.height
        let doScale = scaleToFit ? min(xScale, yScale) : 1.0
        let xExtra = bounds.width - drawingExtent.width*doScale
        let yExtra = bounds.height - drawingExtent.height*doScale
        inContext.translateBy(x: xExtra/2, y: yExtra/2)
        inContext.scaleBy(x: doScale, y: doScale)
        inContext.setLineCap(.round)
        inContext.setLineJoin(.round)
    }



    // As a matter of convinience we'll do all of our drawing here in subclasses of QuartzView.
    func drawInContext(_ ctx: CGContext) {
        // Default is to do nothing.
    }



    override func draw(_ rect: CGRect) {
        drawInContext(UIGraphicsGetCurrentContext()!)
    }

}


