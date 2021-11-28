//
//  Model.swift
//  week03_UITableView
//
//  Created by 박지영 on 2021/11/15.
//

import Foundation

class Memo {
    var content: String
    var insertDate: Date
    
    init(content: String){
        self.content = content
        insertDate = Date()
    }
    
    static var dummyMemoList = [
        Memo(content: "hello world"),
        Memo(content: "!@#$")
    ]
     
}
