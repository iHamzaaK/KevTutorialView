//
//  kevTutorialView.swift
//  Test
//
//  Created by  Traffic MacBook Pro on 25/07/2016.
//  Copyright © 2016 My Macbook Pro. All rights reserved.
//

import UIKit

class kevTutorialView: UIView,UIScrollViewDelegate {
    
    
    let kevScrollView = UIScrollView()
    
    let kevPageControl = UIPageControl()
    
    let kevSkipButton  = UIButton()
    
    var viewsArray : NSMutableArray! = []
    
    var viewsDictionary = Dictionary<String,AnyObject>()
    
    var mainViewsContraints = [NSLayoutConstraint]()
    
    
    var sliderImageViewContraints : NSMutableArray = []
    
    var arrTutorialImage : Array<String>?
        {
        didSet{
        }
    }
    
    
    var scrollWidth : CGFloat! = 0.0
        {
        didSet{
            //   tutorialImplementation()
            
        }
    }
    
    
    var scrollHeight : CGFloat! = 0.0
        {
        didSet{
            //   tutorialImplementation()
            
        }
    }
    
    
    var total : Int = 0
    
    
    var currentPage : Int = 0
    
    
    var landscapeOrient : Bool = false
    
    
    
    
    override func awakeFromNib() {
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(kevTutorialView.setConstraintsWithWidth), name: UIApplicationDidChangeStatusBarOrientationNotification, object: nil)
        NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: #selector(kevTutorialView.configureTutorialScreen), userInfo: nil, repeats: false)

        
    }
    
    func configureTutorialScreen(){
        
        
        scrollWidth = CGRectGetWidth(self.frame)
        scrollHeight = CGRectGetHeight(self.frame)
        
        
        //ScrollView
        kevScrollView.backgroundColor = UIColor.clearColor()
        kevScrollView.pagingEnabled = true
        kevScrollView.delegate = self
        kevScrollView.translatesAutoresizingMaskIntoConstraints = false
        kevScrollView.showsHorizontalScrollIndicator = false
        kevScrollView.showsVerticalScrollIndicator = false
        
        self.addSubview(kevScrollView)
        
        //PageControl
        kevPageControl.currentPage = 0
        kevPageControl.numberOfPages = arrTutorialImage!.count
        kevPageControl.backgroundColor = UIColor.clearColor()
        kevPageControl.tintColor = UIColor.blackColor()
        kevPageControl.pageIndicatorTintColor = UIColor.grayColor()
        kevPageControl.currentPageIndicatorTintColor = UIColor.blueColor()
        kevPageControl.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(kevPageControl)
        
        
        //adding to views dictionary
        self.viewsDictionary["kevScroll"] = kevScrollView
        self.viewsDictionary["kevPage"] = kevPageControl
        //self.viewsDictionary["skipButton"] = kevSkipButton
        
        
        setConstraintsForMainViews()
        
    }
    
    func setConstraintsForMainViews() {
        
        // adding constraints for scrollView
        //Vertical Constraints
        let strVConstriant = "V:|-0-[kevScroll]-0-[kevPage(30)]-5-|"
        //HorizontalConstraints
        var strHConstriant = "H:|-0-[kevScroll]-0-|"
        addConstraintForMain(strVConstriant)
        addConstraintForMain(strHConstriant)
        
        //adding constranits for page control
        //vertical contraints 
     //   strVConstriant = "V:[kevPage]-5-|"
        //Horizontal Constriants
        strHConstriant = "H:[kevPage(==kevScroll)]"
        addPageConstraint(strHConstriant)
        
        NSLayoutConstraint.activateConstraints(mainViewsContraints)
        
        
        NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(kevTutorialView.tutorialImplementation), userInfo: nil, repeats: false)
        
      //  self .performSelector(#selector(kevTutorialView.tutorialImplementation), withObject: nil, afterDelay: 1)
        //    tutorialImplementation()
    }
    
    func addConstraintForMain(format: String){
        
        
        let newContraint = NSLayoutConstraint.constraintsWithVisualFormat(format, options: [], metrics: nil, views: self.viewsDictionary)
        
        self.mainViewsContraints += newContraint
        
    }
    
    
    func addPageConstraint(format:String){
        let newContraint = NSLayoutConstraint.constraintsWithVisualFormat(format, options: .AlignAllCenterX, metrics: nil, views: self.viewsDictionary)
        // let newConstraint = NSLayoutConstraint.constraint
        self.mainViewsContraints += newContraint
        
    }
    
    deinit{
        print("agaya bhia agaya")
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIApplicationDidChangeStatusBarOrientationNotification, object: nil)

    }
    
    func tutorialImplementation() {
        
        //  scrollWidth = CGRectGetWidth(self.frame)
        //scrollHeight = CGRectGetHeight(self.frame)
        total = arrTutorialImage!.count
        for i in 0...total - 1 {
            let key = "v\(i)"
            
            
            
            let imgView = UIImageView(image: UIImage(named: arrTutorialImage![i]))
            imgView.contentMode = .ScaleAspectFit
            imgView.translatesAutoresizingMaskIntoConstraints = false
            
        //    imgView.backgroundColor = UIColor.init(red: 223/255, green: 232/255, blue: 242/255, alpha: 1.0)
            
           // imgView.transform = CGAffineTransformMakeScale(0.75, 0.75)// test remove when replace with orginal
            
            self.kevScrollView.addSubview(imgView)
            
            
            
            
//            if i % 2 == 0 {
//                imgView.backgroundColor = UIColor.blackColor()
//                
//            }
//            else{
//                imgView.backgroundColor = UIColor.grayColor()
//                
//            }
            
            let str = "imgView\(i)"
            //let str = "imgView"
            //       let dictImgView = Dictionary(dictionaryLiteral: (str, imgView ))
            
            viewsDictionary[str]  = imgView
             let scrollwidth = CGRectGetWidth(self.kevScrollView.frame)
            let scrollHeight = CGRectGetHeight(self.kevScrollView.frame)

            
            let red_constraint_H = NSLayoutConstraint.constraintsWithVisualFormat("H:[imgView\(i)(\(scrollwidth))]", options: [], metrics: nil, views: viewsDictionary)
            
            red_constraint_H.first?.identifier = "first constraint masla H"
            
            let red_constraint_V = NSLayoutConstraint.constraintsWithVisualFormat("V:[imgView\(i)(\(scrollHeight))]", options: [], metrics: nil, views: viewsDictionary)
            
            red_constraint_V.last?.identifier = "first constraint masla V"
            
            viewsArray!.addObject(imgView)
            
            
            //  viewsDictionary[key] = viewsArray![i]
            
            
            // Get Constraint into array
            let arr = [red_constraint_H,red_constraint_V]
            sliderImageViewContraints .addObject(arr)
            imgView .addConstraints(red_constraint_H)
            imgView.addConstraints(red_constraint_V)
            
            
        }
        
        
        setVerticalAndHorizontalSpacingOfImagesFromSlider()
        
        kevScrollView.contentSize = CGSizeMake( CGFloat(total) * scrollWidth!, CGFloat(total) * scrollHeight!)
        
        
    }
    
    
    
    
    func setVerticalAndHorizontalSpacingOfImagesFromSlider(){
        
        var strContraintSet = NSMutableString.init(string: "H:|-0-")
        
        
        var dictView : Dictionary<String,AnyObject> = Dictionary()
        
        
        
        for i in 0...viewsArray!.count - 1 {
            
            let key = "v\(i)"
            
            
            dictView[key] = "\(viewsArray![i])"
            
            dictView .updateValue( (viewsArray![i]), forKey: key)
            
            strContraintSet = NSMutableString(string: "\(strContraintSet)[\(key)]-0-")
            
            if i == viewsArray!.count - 1{
                
                strContraintSet = NSMutableString(string: "\(strContraintSet)|")
                
            }
            
            
        }
        
        
        let metrics: [String : AnyObject] = ["vSpacing": 0, "hSpacing": 0]
        self .layoutIfNeeded()
        
        for i in 0...viewsArray!.count - 1 {
            
            
            let constraints_POS_V = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[v\(i)]", options: [], metrics: nil, views: dictView)
            
            
            
            // let constraints_POS_V = NSLayoutConstraint.constraintsWithVisualFormat("V:|-[v0]-|", options: [] , metrics: nil, views: dictView  )
            
            
            
            self.addConstraints(constraints_POS_V)
            
        }
        
        
        
        self .updateConstraints()
        self .layoutIfNeeded()
        
        //   let constraint_POS_ = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-", options: [], metrics: nil, views: dictView)
        
        let constraint_POS_H = NSLayoutConstraint.constraintsWithVisualFormat(strContraintSet as String, options: [], metrics: metrics, views: dictView)
        
        self.addConstraints(constraint_POS_H)
        
        
        
    }
    
    
    func setConstraintsWithWidth(){
        
        if UIInterfaceOrientationIsLandscape(UIApplication.sharedApplication().statusBarOrientation) {
           
            if  isPadPro() {
                self.scrollWidth = CGRectGetWidth(self.kevScrollView.frame)
                self.scrollHeight = CGRectGetHeight(self.kevScrollView.frame)

            }
            else  if isPad(){
                
                 self.scrollWidth = CGRectGetWidth(self.kevScrollView.frame)
                 self.scrollHeight = CGRectGetHeight(self.kevScrollView.frame)
            }
            else {
            self.scrollWidth = 736
            self.scrollHeight = 414 - 25
            }
        }
        else{
            self.scrollWidth = 414
            self.scrollHeight = 736 - 25
        }
        //        if landscapeOrient == false {
        //            print("Chaboooooo")
        //        }
        //        else{
        //
        
        
        for i in 0...sliderImageViewContraints.count - 1 {
            
            let constraintArr = sliderImageViewContraints[i].firstObject!
            
            
            
            
            let constant1 : NSLayoutConstraint = constraintArr!.objectAtIndex(0) as! NSLayoutConstraint
            
            constant1.identifier = "Masla"
            
            constant1.constant = self.scrollWidth
            
            //   sliderImageViewContraints[i].firstObject = constant1
            
            let constraintArr2 = sliderImageViewContraints[i].lastObject!
            
            
            let constant2 : NSLayoutConstraint = constraintArr2!.objectAtIndex(0) as! NSLayoutConstraint
            
            
            constant2.constant = self.scrollHeight
            constant2.identifier = "dosra Masla"
            
            
            self.updateConstraints()
            
            
            self.layoutIfNeeded()
            
            //  constant1.firstItem.constant = self.scrollWidth
            
        }
        
        gotoPage(false)
        //    }
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        kevPageControl.currentPage = Int(pageNumber)
    }
    
    
    func gotoPage(animated: Bool){
        let width = Int( CGRectGetWidth(self.frame))
        let xVal = CGFloat(width  * currentPage)
        self .kevScrollView.scrollRectToVisible(CGRectMake(xVal, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)), animated: animated)
        
        
    }
    
     func isPhone()->Bool{
        
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Phone{
            
            return true
        }
        else
        {
            return   false
            
        }
    }
     func isPad()->Bool{
        
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad{
            
            return true
        }
        else
        {
            return   false
            
        }
    }
    
    
     func isPadPro()->Bool{
        
        
        if (UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad &&
            (UIScreen.mainScreen().bounds.size.height == 1366 || UIScreen.mainScreen().bounds.size.width == 1366)) {
            return true
        }
        return false
        
        
    }

    
    
}
