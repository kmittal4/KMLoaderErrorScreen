# KMLoaderErrorScreen
A framework for global loading and error screen for iOS projects

Steps to include in project:
1) Open the XCode poject and build it.
2) Build the project.
3) After successful completion of the build, in products select the Framework file. Right click on it and select "Show in Finder"
4) Copy the framework file in Finder and copy it any place of your covenience.
5) Open your project folder in your Finder. Copy this framework inside your project folder. (recommended: Project folder>Create new folder "Frameworks")
6) Open your project in XCode. Migrate to your project file. Under Targets select your target> General. Under Embedded Binaries: Click on the '+' icon. Select 'Add other'. A finder window will open up. Migrate to your Framework file you just copied inside your project and select it.

Steps to use:

After you have included the framework inside your project:

- Include the framework inside your controller file by using : 

import KMLoaderErrorScreen

To show loader:

Create an object of LoaderScreenView :

LoaderScreenView(frame: 'frame of your view')

To show loader:

'your view'.addSubview('your LoaderScreenView object')

To hide loader:

'your LoaderScreenView object'.stopLoading()

Customisations for LoaderView:

//Set background blur style. Default is very white: 

    public func setBackgroundBlurr(effect:UIBlurEffect)
    
//Set activity indicator style. Default is Large white: 

    public func setIndicatorStyle(style:UIActivityIndicatorView.Style)
    
//set activity indicator color. Default is Blue: 

    public func setIndicatorColor(color:UIColor)
 
//If user wants to use a custom image as an indicator: 

    public func setCustomImage(frame:CGRect,withImage image:UIImage)
    
To show Error:

Create an object of ErrorScreenView :

ErrorScreenView(frame: 'frame of your view')

To show error:

'your view'.addSubview('your ErrorScreenView object')

Customisations for ErrorScreenView:

//Set background blur style. Default is very white: 

    public func setBackgroundBlurr(effect:UIBlurEffect)
    
//Set Label text. Default is "Error": 

    public func setLabelText(text: String)
    
//Set Label text colour. Default is Black: 

    public func setLabelTextColor(color: UIColor)

//Set interval of pop up. Default is 3 seconds: 

    public func setIntervalTime(intvl: Double)
    
//set error Image view. Default is set: 

    public func setErrorImage(image: UIImage)
    
//set error Image view dimensions. Default is 250,250: 

    public func setErrorViewFrame(width: Float, height:Float)






