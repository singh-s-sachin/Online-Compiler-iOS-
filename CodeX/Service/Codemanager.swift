//
//  File.swift
//  CodeX
//
//  Created by Sachin Kumar Singh on 10/01/1941 Saka.
//  Copyright © 1941 Sachin Kumar Singh. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
public var outputcode = "Running"
class Codemanager {
    static let instance = Codemanager()
    func compile_snippet(inputs : String,language : String, content: String) -> String{
        let headers = [
            "X-RapidAPI-Key": "4557241795msh8251a31d6146c22p14af94jsnaeb5931d2c0d",
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        var parameters = [
            "async": 0,
            "input" : inputs,
            "time_limit": 10,
            "memory_limit":  262144,
            "client_secret": "ceaf93f10f7330318aecc742f76bda4fae74b12e",
            "source": content,
            "lang": language
            ] as [String : Any]
        Alamofire.request("https://ideas2it-hackerearth.p.rapidapi.com/run/", method: .post, parameters: parameters , encoding: JSONEncoding.default, headers: headers).responseJSON {(response) in
            if response.result.error == nil{
        guard let data = response.data else { return }
        do{
            let json = try JSON(data: data)
            print(json)
            outputcode = json["error"].stringValue + json["output"].stringValue + json["message"].stringValue
            
        }
        catch{
            debugPrint(error)
        }
    } else {
    debugPrint(response.result.error as Any)
    }
    }
        return outputcode
    }
}

