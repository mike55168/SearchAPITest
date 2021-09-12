//
//  SearchApi.swift
//  APITest
//
//  Created by HookYang on 2021/7/28.
// https://www.youtube.com/watch?v=vaK0T9I7l4c&t=3097s //目前最像
// https://www.youtube.com/watch?v=ImK6qw3N_Ug
// https://www.youtube.com/watch?v=0VFg-rmi_cY
// https://www.youtube.com/watch?v=V5EDE5CNKvc
// https://www.youtube.com/watch?v=rfMex1iPR-o&list=PLSt2hGExVR_ovOXUXyHYuemAKrZV-tOIo&index=1 //urlimage
import Foundation
import SwiftUI

struct SearchApi:Codable{
    var results : [Results]// api內容
}

struct Results : Codable{
    var audio : String?// 單集音檔
    var publisherid : String? // 單集Id
    var titleOriginal : String? //單集標題
    var titleHighlighted : String? //文章標題
    var descriptionOriginal :String? //單集敘述
    var image : String? //節目圖片，節目內也有，兩個都是 1400x1400
    var podcastTwo:PodcastTwo//頻道資訊
    
    enum CodingKeys:String,CodingKey {
        case audio
        case publisherid = "id"
        case titleOriginal = "title_original"
        case titleHighlighted = "title_highlighted"
        case descriptionOriginal = "description_original"
        case image = "image"
        case podcastTwo = "podcast"
    }
    
}

struct PodcastTwo : Codable {
    var podcastId : String //頻道id
    var publisher : String //節目主持人
    var image : String? //節目圖片，節目內也有，兩個都是 1400x1400
    var thumbnail : String?
    var podcastTwoTitle : String //節目名稱
    
    enum CodingKeys:String,CodingKey {
        case podcastId = "id"
        case publisher  = "publisher_original"
        case image = "image"
        case podcastTwoTitle = "title_original"
        case thumbnail = "thumbnail"
    }
    
}
/*
class APIServiceSrarch{
   // completion: @escaping ([Results]) -> ()
    
    
   func getData (){
        guard let url = URL(string: "https://listen-api.listennotes.com/api/v2/search?q=star%20wars&sort_by_date=0&type=episode&offset=0&len_min=10&len_max=30&genre_ids=68%2C82&published_before=1580172454000&published_after=0&only_in=title%2Cdescription&language=English&safe_mode=0")
        else {return}
        
        var request = URLRequest(url: url)//for -H
        request.httpMethod = "GET"//-x
        request.setValue("cb235a75ce96432ca50c4062411dc825", forHTTPHeaderField: "X-ListenAPI-Key")//-H
        
        URLSession.shared.dataTask(with: request){(data,response,error) in
            
            guard let apiData = data else {return}
            print(String(data: data!, encoding: .utf8)!)
            
            do {
                let api = try JSONDecoder().decode(SearchApi.self, from: apiData)
                DispatchQueue.main.async {
                   // completion(api.results)
                    self.results = api.results
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
*/
