//
//  TryApiTwo.swift
//  APITest
//
//  Created by HookYang on 2021/6/27.
//
/*
import Foundation
import SwiftUI

struct Apimodel : Codable {
    var episodes : [Episodes]
}


struct Episodes : Codable {
   var audio : String? //單及音頻
    var image : String? //單及照片
    var title : String? //單集標題
    var podcast : [PodcastList]?//頻道細節
    var description : String? // 單集細節
        
}

struct PodcastList : Codable ,Identifiable{
    var id = UUID()
    var publisherid : String? // 出版商Id
    var podcastTitle : String? //頻道主標
    var publisher : String?//出版商
    
    
    enum CodingKeys:String,CodingKey {
       case publisherid = "id"
        case podcastTitle = "title"
        case publisher
        
    }
    
}




class APIService{

     func getJSON (completion: @escaping ([PodcastList]) -> ()){
        guard let url = URL(string: "https://listen-api.listennotes.com/api/v2/episodes")else{
           return
        }
        
        var request = URLRequest(url: url)//for -H
        request.httpMethod = "POST"//-x
        request.setValue("cb235a75ce96432ca50c4062411dc825", forHTTPHeaderField: "X-ListenAPI-Key")//-H
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")//-H //應該是setValue?
        let boodyData = "ids=c577d55b2b2b483c969fae3ceb58e362,0f34a9099579490993eec9e8c8cebb82"//for -D
        request.httpBody = boodyData.data(using: String.Encoding.utf8) //-D
        
        URLSession.shared.dataTask(with: request){(data,response,error) in
        
            guard let apiData = data else {return}
            
                do {
                    let apimodel = try JSONDecoder().decode(Episodes.self, from: apiData)
                    DispatchQueue.main.async {
                        completion(apimodel.podcast!)
                    }
                }
                catch  {
                    print(error)
                
            }
            
            
            
        }.resume()
        
    }
    
}

*/
