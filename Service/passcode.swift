//
//  passcode.swift
//  CodeX
//
//  Created by Sachin Kumar Singh on 10/01/1941 Saka.
//  Copyright © 1941 Sachin Kumar Singh. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

func create_snipet()
{
    let senddata : [String : Any] = ["stdin": "42",
                                     "files": [
                                        "name": "main.py",
                                        "content": "print(42)"
        ]
    ]
    Alamofire.request("https://run.glot.io/languages/python", method: .post, parameters: senddata, encoding: JSONEncoding.default, headers: header).responseJSON
}
