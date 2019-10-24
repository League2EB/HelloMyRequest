//
//  ViewModel.swift
//  HelloMyRequest
//
//  Created by Lazy on 2019/10/25.
//  Copyright © 2019 Lazy. All rights reserved.
//

import Foundation

//綽號的意思 https://tinyurl.com/y3pyhtmk
public typealias CompletionHandler = ((_ title: String) -> Void)

class ViewModel {

    /// 背景執行序
    private let queue = DispatchQueue.global(qos: .background)

    /// 請求
    /// - Parameter completionHandler: 我認為他就是OC裡面的Block....
    func featchData(completionHandler: @escaping (CompletionHandler)) {
        queue.async {
            print("執行序在：\(self.queue.label)")
            //宣告網路請求物件
            let session = URLSession(configuration: .default)
            //請求HOST
            let url = "https://raw.githubusercontent.com/wakeuparts/api/master/location.json"
            //宣告網路請求對象，就是塞你要送的資料
            let UrlRequest = URLRequest(url: URL(string: url)!)
            //請求
            let task = session.dataTask(with: UrlRequest) { (data, response, error) in
                DispatchQueue.main.sync {
                    do {
                        //解析字典
                        _ = try JSONSerialization.jsonObject(with: data!, options: []) as! NSDictionary
                        //查看當前執行序
                        if let currentDispatch = OperationQueue.current?.underlyingQueue {
                            print("執行序在：\(currentDispatch)")
                        }
                        completionHandler("成功？")
                    } catch {
                        completionHandler("失敗？")
                        print("Error")
                        return
                    }
                }
            }
            //開始任務
            task.resume()
        }
    }
}

