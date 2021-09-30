//
//  ViewController.swift
//  week03_UITableView
//
//  Created by 박지영 on 2021/09/18.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var TableviewMain: UITableView!
    
    //1. http 통신 방법: urlsession
    //2. JSON 데이터 형태 {"이름" : "박지영"}
//   {
//        [
//            {"이름" : "박지영"},
//            {"이름" : "fwe"},
//            {"이름" : "raef"}
//        ]
//
//    }
    
    func getNews(){
        let task = URLSession.shared.dataTask(with: URL(string: "https://newsapi.org/v2/top-headlines?country=kr&apiKey=b874a5e6a525452db6495dd93c9eb1ed")!) { (data,response,error) in
            
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: data)
                if let dictionary = jsonObject as? [String: Any],
                    let results = dictionary["results"] as? [[String: Any]] {
                    DispatchQueue.main.async {
                        results.forEach { print($0["body"] ?? "", terminator: "\n\n") }
              //        self.tableData = results
              //        self.Indextableview.reloadData()
                    }
                }
            } catch {
                print("JSONSerialization error:", error)
                
            }
            
            if let dataJson = data {

                //json parsing
                do{
                    let json =  try JSONSerialization.jsonObject(with: dataJson, options: []) as! Dictionary<String, Any>
                    let articles = json["articles"] as! Array<Dictionary<String, Any>>
                    print(articles)
                    for (idx, value) in articles.enumerated() {
                        if let v = value as? Dictionary<String,Any>{
                            print("\(v["title"])")
                        }
                    }
                }
                
              
//                {
//                "status": "ok",
//                "totalResults": 38,
//                -"articles": [
//                -{
//                -"source": {
//                "id": null,
//                "name": "MLB.com"
//                },
//                "author": "Adam Berry",
//                "title": "Rays clinch top seed, home-field advantage - MLB.com",
            }
        }
        
    }
    
    
    
    //셀을 반복할 횟수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //몇 개? 숫자
        return 50
    }
    
    //위의 numberOfRowsInSection 숫자만큼 반복
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //무엇? 10번 반복?
        //2가지!
        //1번 방법 - 임의의 cell 만들기 : 연습
        //2번 방법 - 스토리 보드 + id : 실전
//        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "TableCellType1")
        let cell = TableviewMain.dequeueReusableCell(withIdentifier: "Type1", for: indexPath) as! Type1
        // as? as! -> 부모 자식 친자확인
        cell.LabelText?.text = "\(indexPath.row)"
        
//        cell.textLabel?.text = "\(indexPath.row)"
        return cell
        
    }
    //클릭
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("click!! \(indexPath.row)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
       
        TableviewMain.delegate = self
        TableviewMain.dataSource = self
        getNews()
    }
    //tableview -> 여러 개의 행이 모여 있는 목룍 뷰 (화면)
    //정갈하게 보여주려고~ 전화번호부
    
    //1. 데이터가 무엇이니? - 전화번호부 목록
    //2. 데이터가 몇 개니? - 100, 1000개, 10000개 등등
    //3.(옵션) 행을 눌렀다! - 클릭
}


