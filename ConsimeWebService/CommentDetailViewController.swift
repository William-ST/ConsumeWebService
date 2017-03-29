//
//  CommentDetailViewController.swift
//  ConsimeWebService
//
//  Created by alumno on 3/23/17.
//  Copyright © 2017 Jorge Limo. All rights reserved.
//

import UIKit

class CommentDetailViewController: UIViewController {

    var detailComment:Comment!
    
    @IBOutlet weak var textViewDetail: UITextView!
    
    @IBOutlet weak var navTitle: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("title: \(detailComment.title)")
        print("detail: \(detailComment.detail)")
        navTitle.title = detailComment.title
        textViewDetail.text = detailComment.detail
        // Do any additional setup after loading the view.
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
