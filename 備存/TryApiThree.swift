//
//  TryApiThree.swift
//  APITest
//
//  Created by HookYang on 2021/6/27.
//
//
// @escaping https://reurl.cc/4aGp5K //Peter
// 試試 https://www.youtube.com/watch?v=PrMeiWhjqpc
// https://www.youtube.com/watch?v=lFE-TJJxxLU //參考

import Foundation
import SwiftUI

struct Apimodel : Codable,Identifiable{
   var id = UUID()
    var noUseId : String
    var image : String? //單及照片
    var title : String? //單集標題
    var country : String?//國家
    var publisher :String?//出版商
    var episodes : [Episodes]?//頻道細節
    var next_episode_pub_date : Int?//下一10集
    
    enum CodingKeys:String,CodingKey {
        case noUseId = "id"
        
    }
    
}

struct Episodes : Codable,Identifiable {
    var id = UUID()
    var audio : String?
    var publisherid : String? // 出版商Id
    var podcastTitle : String //頻道主標
    var description : String? //出版商
    
    
    enum CodingKeys:String,CodingKey {
       case publisherid = "id"
        case podcastTitle = "title"
        
    }
    
}

//073a66b496824a5d9e80d52621f372dc //4d3fe717742d4963a85562e9f84d8c79
class APIService{
    
    func getData (completion: @escaping (Apimodel) -> ()){
        guard let url = URL(string: "https://listen-api.listennotes.com/api/v2/podcasts/073a66b496824a5d9e80d52621f372dc?next_episode_pub_date=1478329201396&sort=recent_first")
        else {return}
        
        var request = URLRequest(url: url)//for -H
        request.httpMethod = "GET"//-x
        request.setValue("cb235a75ce96432ca50c4062411dc825", forHTTPHeaderField: "X-ListenAPI-Key")//-H
        
        URLSession.shared.dataTask(with: request){(data,response,error) in
            
            guard let apiData = data else {return}
            
            print(String(data: data!, encoding: .utf8)!)
            
            do {
                let api = try JSONDecoder().decode(Apimodel.self, from: apiData)
                DispatchQueue.main.async {
                    completion(api)
                }
            }
            catch DecodingError.keyNotFound(let key, let context) {
                print("keyNotFound", key, context)
            } catch DecodingError.typeMismatch(let type, let context) {
                print("typeMismatch", type, context)
            } catch DecodingError.valueNotFound(let value, let context) {
                print("valueNotFound", value, context)
            } catch DecodingError.dataCorrupted(let context) {
                print("dataCorrupted", context)
            } catch  {
                print(error)
            }
            
            
            
        }.resume()
        
    }
    
}





//
/*class APIService{
 
 func getJSON (completion: @escaping ([Episodes]) -> ()){
 guard let url = URL(string: "https://listen-api.listennotes.com/api/v2/podcasts/4d3fe717742d4963a85562e9f84d8c79?next_episode_pub_date=1479154463000&sort=recent_first")else{
 return
 }
 
 var request = URLRequest(url: url)//for -H
 request.httpMethod = "GET"//-x
 request.setValue("cb235a75ce96432ca50c4062411dc825", forHTTPHeaderField: "X-ListenAPI-Key")//-H
 
 
 URLSession.shared.dataTask(with: request){(data,response,error) in
 
 guard let apiData = data else {return}
 
 do {
 let apimodel = try JSONDecoder().decode(Apimodel.self, from: apiData)
 DispatchQueue.main.async {
 completion(apimodel.episodes!)
 }
 }
 catch  {
 print(error)
 
 }
 
 
 
 }.resume()
 
 }
 
 }
 */
