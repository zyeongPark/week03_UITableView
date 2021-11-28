//
//  ComposeViewController.swift
//  week03_UITableView
//
//  Created by 박지영 on 2021/11/16.
//

import UIKit

class ComposeViewController: UIViewController {
    
    var editTarget: Memo?//메모편집용

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var memoTextView: UITextView!
    
    
    @IBAction func save(_ sender: Any) {
        guard let memo = memoTextView.text,
                memo.count > 0 else{ //메모를 입력하지 않았다면 uiviewcontoller_alert 파일로 넘어감
                alert(message: "메모 입력하세요")
        
            return 
        }
        
        if let target = editTarget {
            target.content = memo
        }
        
        //메모를 잘 작성했다면 메모리스트에 추가
        let newMemo = Memo(content: memo)
        Memo.dummyMemoList.append(newMemo)
        
        //그리고 새 메모 화면 닫음
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let memo = editTarget{
            navigationItem.title = "편집하기"
            memoTextView.text = memo.content
        } else{
            navigationItem.title = "새 메모"
            memoTextView.text = ""
        }//없다면 그냥 쓰기 모드
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
