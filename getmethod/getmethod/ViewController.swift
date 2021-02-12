//
//  ViewController.swift
//  URLSession_Practice
//
//  Created by 박대희 on 2021/02/10.
//

import UIKit

class ViewController: UIViewController {
    let accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJpZCI6MTMsInJvbGVzIjpbIlJPTEVfVVNFUiJdLCJpYXQiOjE2MTI4NTM4Njl9.4SPbd-J_3jrKgf-JS3yiXo7PIwJEqTnwTvOh0YpMPdM"
    let session = URLSession.shared
    let url = URL(string: "http://test.ground.yourssu.com:8080/v1/boards/3/posts?direction=GREATER_THAN&size=100&time=2021-02-09T13:52:00Z")!
 
    func request() {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            print(response!) // 옵셔널 강제 해제 구현한 부분
            
            // guard 문 특성상 함수나 메소드에만 사용할 수 있기 때문에 함수 내부에서 사용하는 모습을 볼 수 있다.
            /*
             그러면 if문과 guard문을 왜 구분을 해서 굳이 guard문을 써서 옵셔널 값을 처리하는 것인가?
             if 구문을 사용한 옵셔널 바인딩은 단순히 옵셔널 값의 처리 결과에 따라 서로 다른 피드백을 주고 싶을 때 사용한다.
             guard 구문을 사용하면 조건에 맞지 않으면 무조건 함수의 실행을 종료시키는 특성이 있기 때문에, 실행 흐름상 옵셔널 값이 해제되지 않으면
             더 이상 진행이 불가능할 정도로 큰일이 생길 때에만 사용하는것이 좋다.
             */
            guard let responseString = String(data: data!, encoding: .utf8) else {return} // guard 문을 써서 옵셔널 바인딩 구현한 부분.
            print("---------------responseString-----------------")
            print(responseString)
            

//            print("------------dump(request)--------------")
//            dump(request)
            
        }
        task.resume()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        request()
        
    }
    


}

