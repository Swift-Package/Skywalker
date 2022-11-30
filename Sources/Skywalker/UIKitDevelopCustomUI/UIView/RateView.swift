//
//  RateView.swift
//  
//
//  Created by 杨俊艺 on 2022/3/29.
//

import UIKit

@objc
public protocol RateViewDelegate {
    func rateViewRatingDidChange(rateView: RateView, newRating: Float)
}

@objcMembers
public class RateView: UIView {
    
    var notSelectedImage: UIImage? { didSet { refresh() } }
    var fullSelectedImage: UIImage? { didSet { refresh() } }
    var rating: Float = 0 { didSet { refresh() } }
    var editable = false
    var imageViews: [UIImageView] = []
    var maxRating = 5 { didSet { rebindMaxRating() } }
    
    var midMargin: CGFloat = 5
    var leftMargin: CGFloat = 0
    var minImageSize = CGSize(width: 5, height: 5)
    var delegate: RateViewDelegate!
    
    private func refresh() {
        for (i, imageView) in imageViews.enumerated() {
            if (rating >= Float(i + 1)) {
                imageView.image = fullSelectedImage;
            } else {
                imageView.image = notSelectedImage;
            }
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        guard notSelectedImage != nil else { return }
        
        let desiredImageWidth = (frame.width - (leftMargin * 2) - (midMargin * CGFloat(imageViews.count))) / CGFloat(imageViews.count)
        let imageWidth = max(minImageSize.width, desiredImageWidth)
        let imageHeight = max(minImageSize.height, frame.height);
        
        for (i, imageView) in imageViews.enumerated() {
            let imageFrame = CGRect(x: leftMargin + (CGFloat(i) * (midMargin + imageWidth)), y: 0, width: imageWidth, height: imageHeight)
            imageView.frame = imageFrame
        }
    }
    
    private func rebindMaxRating() {
        imageViews.forEach { $0.removeFromSuperview() }
        imageViews.removeAll()
        
        for _ in 0..<maxRating {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageViews.append(imageView)
            addSubview(imageView)
        }
        
        setNeedsLayout()
        refresh()
    }
    
    func handleTouch(touchLocation: CGPoint) {
        guard editable else { return }
        
        var newRating = 0
        
        for i in stride(from: imageViews.count - 1, to: -1, by: -1) {
            let imageView = imageViews[i]
            if touchLocation.x > imageView.frame.minX {
                newRating = i + 1
                break;
            }
        }
        
        rating = Float(newRating)
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLocation = touch.location(in: self)
            handleTouch(touchLocation: touchLocation)
        }
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLocation = touch.location(in: self)
            handleTouch(touchLocation: touchLocation)
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        delegate.rateViewRatingDidChange(rateView: self, newRating: rating)
    }
}
