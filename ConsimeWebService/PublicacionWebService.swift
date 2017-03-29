//
//  PublicacionWebService.swift
//  ConsimeWebService
//
//  Created by Admin on 28/03/17.
//  Copyright © 2017 Jorge Limo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class PublicacionWebService: NSObject {

    static func ListarTodos(completion: @escaping (_ result: Array<Comment>) -> Void){
        var resultado = Array<Comment>()
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        
        Alamofire.request(url!, method: .get, parameters: nil, encoding: URLEncoding.httpBody).responseJSON{(response) in
            //print(response.result.value)
            let json = JSON(response.result.value)
            print(json)
            print(json[0]["id"])
            
            for i in 0..<json.count {
                let publication = Comment()
                publication.title = json[i]["title"].string
                publication.detail = json[i]["body"].string
                resultado.append(publication)
            }
            
            completion(resultado)
        }
        
        
    }
}
