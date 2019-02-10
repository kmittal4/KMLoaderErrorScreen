//
//  LoaderScreenView.swift
//  KMLoaderErrorScreen
//
//  Created by Kartik Mittal on 08/02/19.
//  Copyright © 2019 Kartik Mittal. All rights reserved.
//

import UIKit

public class LoaderScreenView: UIView {
    let nibName = "LoaderScreenView"
    var contentView: UIVisualEffectView!
    var color = UIColor.blue
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    //Do initial setup of content view
    private func setUpView() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.nibName, bundle: bundle)
        self.contentView = (nib.instantiate(withOwner: self, options: nil).first as! UIVisualEffectView)
        self.activityIndicator.color = color
        addSubview(contentView)
        contentView.center = self.center
        contentView.frame = self.frame
        contentView.autoresizingMask = []
        contentView.translatesAutoresizingMaskIntoConstraints = true
    }
    //Set background blur style. Default is very white
    public func setBackgroundBlurr(effect:UIBlurEffect) {
        self.contentView.effect = effect
    }
    //Set activity indicator style. Default is Large white
    public func setIndicatorStyle(style:UIActivityIndicatorView.Style) {
        self.activityIndicator.style = style
    }
    //set activity indicator color. Default is Blue
    public func setIndicatorColor(color:UIColor) {
        self.activityIndicator.color = color
    }
    //If user wants to use a custom image as an indicator.
    public func setCustomImage(frame:CGRect,withImage image:UIImage) {
        //remove the activity indicator from the view
        self.activityIndicator.removeFromSuperview()
        //calculate position of the image view
        let x = (self.contentView.frame.width/2)-(frame.size.width/2)
        let y = (self.contentView.frame.height/2)-(frame.size.height/2)
        let frameImage = CGRect(x: x, y: y, width: frame.size.width, height: frame.size.height)
        //set image inside imageview
        let imageView = UIImageView(frame: frameImage)
        imageView.image = image
        //rotate the image to show loading animation
        self.rotateAnimation(imageView: imageView)
        self.contentView.contentView.addSubview(imageView)
    }
    
    //automatically start loading as soon as the view enters the view
    public override func didMoveToSuperview() {
        self.startLoading()
    }
    
    private func startLoading() {
        if self.activityIndicator != nil {
            self.activityIndicator.startAnimating()
        }
    }
    
    public func stopLoading() {
        self.removeFromSuperview() //destroy self
        if self.activityIndicator != nil {
            self.activityIndicator.stopAnimating()
        }
    }
    
    //rotation animation code for image view
    private func rotateAnimation(imageView:UIImageView,duration: CFTimeInterval = 2.0) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(.pi * 2.0)
        rotateAnimation.duration = duration
        rotateAnimation.repeatCount = Float.greatestFiniteMagnitude// repear animation infintely
        imageView.layer.add(rotateAnimation, forKey: nil)
    }
}
