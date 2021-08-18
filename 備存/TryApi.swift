//
//  TryApi.swift
//  APITest
//
//  Created by HookYang on 2021/6/20.
// 範例影片 https://www.youtube.com/watch?v=DTXjLtAg9j8
// 範例影片 https://www.youtube.com/watch?v=z_2iiq0MjmM&t=2s
// 找到的寫法 https://stackoverflow.com/questions/64438815/convert-curl-command-to-urlrequest
// 找到的寫法 https://stackoverflow.com/questions/52032108/how-to-perform-a-curl-request-in-swift
// 找到的寫法 https://stackoverflow.com/questions/24714566/how-to-send-post-parameters-in-swift
// curl各參數介紹 http://www.ruanyifeng.com/blog/2019/09/curl-reference.html
// api文檔：https://www.listennotes.com/api/docs/?lang=curl#post-api-v2-episodes
//Peter:https://reurl.cc/pg5DRl

/*  curl -X POST --include 'https://listen-api.listennotes.com/api/v2/episodes' \
 -H 'X-ListenAPI-Key: cb235a75ce96432ca50c4062411dc825' \
 -H 'Content-Type: application/x-www-form-urlencoded'\
 -d 'ids=c577d55b2b2b483c969fae3ceb58e362,0f34a9099579490993eec9e8c8cebb82'  */

//問題_何時會需要設定 Http headers?( 用 request.setValue: 還是用 request.setValue: ？)
//聞題_HTTPBody寫法大家都不一樣

import Foundation
import SwiftUI
/*
struct Apimodel : Codable{
    var episodes : [Episodes]?
}

struct Episodes : Codable {
   var audio : String? //單及音頻
    var image : String? //單及照片
    var title : String? //單集標題
    var podcast : [PodcastList]?//頻道細節
    var description : String? // 單集細節
    
    
}

struct PodcastList : Codable,Identifiable {
    var id = UUID() // id
    var publisherId : String? // 出版商Id
    var audio : String? // 頻道介紹音頻
    var podcastTitle : String? //頻標主標
    var publisher : String?//出版商
        
    enum CodingKeys:String,CodingKey {
        case publisherId = "id"
        case podcastTitle = "title"
    }
    
}


public class ApiService  {
  //  @Published var items = [ Apimodel]()
    public static var shared = ApiService()
    
    
    func loaData(/*completion:@escaping([Episodes]) -> Void*/){
        guard let url = URL(string: "https://listen-api.listennotes.com/api/v2/episodes")else{return}
        
        var request = URLRequest(url: url)//for -H
        request.httpMethod = "POST"//-x
        request.setValue("cb235a75ce96432ca50c4062411dc825", forHTTPHeaderField: "X-ListenAPI-Key")//-H
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")//-H //應該是setValue?
        let boodyData = "ids=c577d55b2b2b483c969fae3ceb58e362,0f34a9099579490993eec9e8c8cebb82"//for -D
        request.httpBody = boodyData.data(using: String.Encoding.utf8) //-D
        
        
        URLSession.shared.dataTask(with: request){(data,response,error) in
            if let data = data{
                
                do {
                    let decoder = JSONDecoder()
                    let apimodel = try decoder.decode(Apimodel.self, from: data)
                    DispatchQueue.main.async {
                        print(apimodel)
                    }
                   
                }
                catch  {
                    print(error)
                }
            }
            
            
            
        }.resume()
        
    }
    
}*/
