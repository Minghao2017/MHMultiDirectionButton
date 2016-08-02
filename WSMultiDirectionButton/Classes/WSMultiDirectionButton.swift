//
//  MultiDirectionButton.swift
//  VerticalButton
//
//  Created by Xue on 16/6/27.
//  Copyright © 2016年 Xue. All rights reserved.
//

import UIKit

public enum WSMultiDirectionButtonDirection: Int {
    case LeftToRight = 0
    case RightToLeft
    case Vertical
}

/// 支持多个方向的UIButton子类。
@IBDesignable public class WSMultiDirectionButton: UIButton {

    @IBInspectable public var direction: Int = 0 {
        willSet {
            let d = WSMultiDirectionButtonDirection(rawValue: newValue)
            if d != nil {
                directionEnum = d!
            } else {
                directionEnum = .LeftToRight
            }
        }
    }
    
    @IBInspectable public var imageLabelSpacing: CGFloat = 8 {
        didSet {
            setNeedsLayout()
            layoutIfNeeded()
        }
    }
    
    private var directionEnum: WSMultiDirectionButtonDirection = .LeftToRight {
        didSet {
            setNeedsLayout()
            layoutIfNeeded()
        }
    }
    
    /**
     重写Layout过程
     */
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        switch directionEnum {
        case .Vertical:
            titleLabel?.textAlignment = NSTextAlignment.Center
            if imageView != nil {
                var imageFrame = imageView!.frame
                imageFrame.origin = CGPointMake(
                    CGFloat(truncf(Float(bounds.size.width - imageFrame.size.width))) / 2,
                                                CGFloat(truncf(Float(bounds.size.height - verticalModeSumHeight()))) / 2)
                imageView!.frame = imageFrame
            }
            
            if titleLabel != nil {
                let titleOldFrame = titleLabel!.frame
                let titleNewFrame = CGRectMake(
                    0,
                    CGRectGetMaxY(imageView == nil ? CGRectZero : imageView!.frame),
                    bounds.size.width,
                    titleOldFrame.height)
                titleLabel!.frame = titleNewFrame
            }
        default:
            titleLabel?.textAlignment = NSTextAlignment.Left
            let subWidth = horizontalSumWidth()
            let btnWidth = CGRectGetWidth(bounds)
            
            var lblFrame = CGRectZero
            if titleLabel != nil {
                lblFrame = titleLabel!.frame
            }
            
            if subWidth > btnWidth {
                lblFrame.size.width -= subWidth - btnWidth
            }
            
            var ivFrame = CGRectZero
            if imageView != nil {
                ivFrame = imageView!.frame
            }
            
            let startX = CGFloat(truncf(Float(btnWidth - subWidth) / 2))
            let lblFrameY = CGFloat(truncf((Float(bounds.size.height - lblFrame.size.height) / 2)))
            let ivFrameY = CGFloat(truncf(Float(bounds.size.height - ivFrame.size.height) / 2))
            if  directionEnum == .RightToLeft{
                lblFrame.origin = CGPointMake(startX, lblFrameY)
                ivFrame.origin = CGPointMake(CGRectGetMaxX(lblFrame) + imageLabelSpacing, ivFrameY)
            } else {
                ivFrame.origin = CGPointMake(startX, ivFrameY)
                lblFrame.origin = CGPointMake(CGRectGetMaxX(ivFrame) + imageLabelSpacing, lblFrameY)
            }
            titleLabel?.frame = lblFrame
            imageView?.frame = ivFrame
        }
    }
    
    override public func sizeThatFits(size: CGSize) -> CGSize {
        var lblSize = CGSizeZero
        if titleLabel != nil {
            lblSize = titleLabel!.sizeThatFits(size)
        }
        
        var ivSize = CGSizeZero
        if imageView != nil {
            ivSize = imageView!.sizeThatFits(size)
        }
        
        switch directionEnum {
        case .Vertical:
            return CGSizeMake(max(lblSize.width, ivSize.width), lblSize.height + ivSize.height + imageLabelSpacing)
        default:
            return CGSizeMake(lblSize.width + ivSize.width + imageLabelSpacing, max(lblSize.height, ivSize.height))
        }
    }
    
    /**
     重写内容布局大小
     
     - returns: 内容大小
     */
    override public func intrinsicContentSize() -> CGSize {
        let baseSize = CGSizeMake(1000, 1000) //一个超大的baseSize，保证sizeThatFits返回正确的尺寸
        return sizeThatFits(baseSize)
    }
    
   
    private func horizontalSumWidth() -> CGFloat {
        var sumWidth: CGFloat = 0
        
        if imageView != nil {
            let ivWidth = CGRectGetWidth(imageView!.frame)
            sumWidth += ivWidth
        }
        
        if titleLabel != nil {
            let titleWidth = CGRectGetWidth(titleLabel!.frame)
            sumWidth += titleWidth
        }
        
        if imageView != nil && titleLabel != nil {
            sumWidth += imageLabelSpacing
        }
        
        return sumWidth
    }
    
    private func verticalModeSumHeight() -> CGFloat {
        var sumHeight: CGFloat = 0
        
        if imageView != nil {
            let ivHeight = CGRectGetHeight(imageView!.frame)
            sumHeight += ivHeight
        }
        
        if titleLabel != nil {
            let titleHeight = CGRectGetHeight(titleLabel!.frame)
            sumHeight += titleHeight
        }
        
        if imageView != nil && titleLabel != nil {
            sumHeight += imageLabelSpacing
        }
        
        return sumHeight
    }
}

