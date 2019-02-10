//
//  ErrorScreenView.swift
//  KMLoaderErrorScreen
//
//  Created by Kartik Mittal on 10/02/19.
//  Copyright © 2019 Kartik Mittal. All rights reserved.
//

import UIKit

public class ErrorScreenView: UIView {

    @IBOutlet weak var imageViewWidth: NSLayoutConstraint!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var errorTextLabel: UILabel!
    @IBOutlet weak var imageViewHeight: NSLayoutConstraint!
    // MARK: Set Up View
    let nibName = "ErrorScreenView"
    var contentView: UIVisualEffectView!
    var color = UIColor.black
    var textLabel = "Error"
    var image:UIImage?
    var timer: Timer?
    var interval = 3.0
    public override init(frame: CGRect) {
        // For use in code
        super.init(frame: frame)
        setUpView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        // For use in Interface Builder
        super.init(coder: aDecoder)
        setUpView()
    }
    
    // Allow view to control itself
    public override func layoutSubviews() {
        // Rounded corners
        self.layoutIfNeeded()
        self.contentView.layer.masksToBounds = true
        self.contentView.clipsToBounds = true
        self.contentView.layer.cornerRadius = 10
    }
    
    private func setUpView() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.nibName, bundle: bundle)
        self.contentView = (nib.instantiate(withOwner: self, options: nil).first as! UIVisualEffectView)
        self.errorTextLabel.text = self.textLabel
        self.errorTextLabel.textColor = self.color
        if self.image != nil {
            self.imageView.image = self.image
        } else {
            self.imageView.image = UIImage(named: "ErrorImage", in: bundle, compatibleWith: nil)
        }
        addSubview(contentView)
        contentView.center = self.center
        contentView.autoresizingMask = []
        contentView.translatesAutoresizingMaskIntoConstraints = true
    }
    
    //Set background blur style. Default is very white
    public func setBackgroundBlurr(effect:UIBlurEffect) {
        self.contentView.effect = effect
    }
    //Set Label text. Default is "Error"
    public func setLabelText(text: String) {
        self.errorTextLabel.text = text
    }
    //Set Label text colour. Default is Black
    public func setLabelTextColor(color: UIColor) {
        self.errorTextLabel.textColor = color
    }
    
    //Set interval of pop up. Default is 3 seconds
    public func setIntervalTime(intvl: Double) {
        self.interval = intvl
    }
    
    //set error Image view. Default is set
    public func setErrorImage(image: UIImage) {
        self.imageView.image = image
    }
    
    //set error Image view height and width. Default is 100, 100
    public func setErrorImageViewDimensions(width: CGFloat, height:CGFloat) {
        self.imageViewWidth.constant = width
        self.imageViewHeight.constant = height
    }
    
    //set error Image view dimensions. Default is 250,250
    public func setErrorViewFrame(width: Float, height:Float) {
        let x = (self.frame.width/2) - CGFloat(width/2)
        let y = (self.frame.height/2) - CGFloat(height/2)
        let frame = CGRect(x: x, y: y, width: CGFloat(width), height: CGFloat(height))
        self.contentView.frame = frame
    }
    
    public override func didMoveToSuperview() {
        self.contentView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(withDuration: 0.15, animations: {
            self.contentView.alpha = 1.0
            self.contentView.transform = CGAffineTransform.identity
        }) { _ in
            self.timer = Timer.scheduledTimer(
                timeInterval: TimeInterval(self.interval),
                target: self,
                selector: #selector(self.removeSelf),
                userInfo: nil,
                repeats: false)
        }
    }
    
    @objc private func removeSelf() {
        UIView.animate(
            withDuration: 0.15,
            animations: {
                self.contentView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                self.contentView.alpha = 0.0
        }) { _ in
            self.removeFromSuperview()
        }
    }

}
