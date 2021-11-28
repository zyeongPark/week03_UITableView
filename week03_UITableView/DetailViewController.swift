//
//  DetailViewController.swift
//  week03_UITableView
//
//  Created by 박지영 on 2021/11/16.
//

import UIKit

class DetailViewController: UIViewController {
    
    //이전에 전달한 메모 저장하기
    var memo: Memo?
    
    //날짜 데이터 가져오려고 메모리스트뷰컨에 있던 거 복붙해옴
    let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        f.locale = Locale(identifier: "Ko_kr") //한글로 날짜 표기
        return f
    }()

    
    @IBAction func deleteMemo(_ sender: Any) {
        let alert = UIAlertController(title: "삭제 확인", message: "삭제합니까?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "삭제", style: .destructive) {[weak self] (action) in }
        alert.addAction(okAction)
        
        let cancelAction = UIAlertAction(title:"취소", style:.cancel , handler: nil  )
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil  )
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination.children.first as? ComposeViewController{
            vc.editTarget = memo
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

extension DetailViewController:
    UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell", for: indexPath)
            cell.textLabel?.text = memo?.content
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell", for: indexPath)
            cell.textLabel?.text = formatter.string(for: memo?.insertDate)
            return cell
        default:
            fatalError()
        }
    }
    
    
}
