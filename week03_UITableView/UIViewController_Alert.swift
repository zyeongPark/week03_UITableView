//
//  UIViewController_Alert.swift
//  week03_UITableView
//
//  Created by 박지영 on 2021/11/16.
//

import UIKit

//경고창 표시 메소드 구현
extension UIViewController{
    func alert (title: String = "alert!", message: String){
        //경고창 화면
        let alert = UIAlertController(title:title, message: message, preferredStyle: .alert)
        //확인 버튼
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        //화면에 보여주기
        present(alert, animated: true, completion: nil)
    }
    
}
