//
//  ViewController.swift
//  ConsimeWebService
//
//  Created by alumno on 3/23/17.
//  Copyright © 2017 Jorge Limo. All rights reserved.
//

import UIKit
import MBProgressHUD

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!

    var commentList = Array<Comment>();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentList.count
    }
    
    func getListComment() {
        commentList.removeAll()
        for i in 0...8 {
            let comment = Comment()
            comment.title = "Comentario \(i)"
            comment.detail = "Contenido de la publición \(i)"
            commentList.append(comment)
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let comment = commentList[indexPath.row]
        self.performSegue(withIdentifier: "commentDetailLink", sender: comment)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! TableViewCell
        
        let index = indexPath.row
        let comment = commentList[index]
        
        
        
        cell.lblTitle.text = comment.title
        cell.txtContent.text = comment.detail
        
        return cell
    }
    
    
    @IBAction func btnRefreshTouch(_ sender: AnyObject) {
        self.getListComment()
        tableView.reloadData()
        
        let hud = MBProgressHUD(view: self.view)
        hud.show(animated: true)
        hud.label.text = "Cargando"
        
        PublicacionWebService.ListarTodos(completion: { (response) in
            hud.hide(animated: true)
            self.commentList = response
            self.tableView.reloadData()
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "commentDetailLink" {
            let detailViewController = segue.destination as! CommentDetailViewController
            detailViewController.detailComment = (sender as! Comment)
        }
    }
    
}

