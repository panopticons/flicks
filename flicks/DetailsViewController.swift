//
//  DetailsViewController.swift
//  flicks
//
//  Created by fer on 2/13/17.
//  Copyright © 2017 fer. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var pic : UIImage!
    var mtitle = ""
    var info = ""
    
    
    
    @IBOutlet weak var movieSummary: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var detailedPhoto: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    //@IBOutlet weak var movieInfo: UITextView!
    @IBOutlet weak var movieInfo: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width, height: movieSummary.frame.origin.y + movieSummary.frame.size.height)
        
        titleLabel.text = mtitle
        movieInfo.text = info
        detailedPhoto.image = pic
        
        movieInfo.sizeToFit()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
