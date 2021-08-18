import Foundation
import SwiftUI

struct SearchApi:Codable{
    var results : [Results]//頻道細節
    
    init (from decoder:Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do{ results = try container.decode([Results].self,forKey: .results)
        }catch{
            let newValue = try container.decode(Results.self, forKey: .results)
            results = [newValue]
        }
        
    }
    
}

struct Results : Codable{
    var audio : String?// 節目音頻
    var publisherid : String? // 節目Id
    var titleOriginal : String? //節目標題
    var titleHighlighted : String? //文章標題
    var descriptionOriginal :String? //節目敘述
    var podcastTwo:PodcastTwo//podcast
    
    enum CodingKeys:String,CodingKey {
        case audio
        case publisherid = "id"
        case titleOriginal = "title_original"
        case titleHighlighted = "title_highlighted"
        case descriptionOriginal = "description_original"
        case podcastTwo = "podcast"
    }
    
    
    init (from decoder:Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        audio = try container.decode(String.self, forKey: .audio)
        publisherid = try container.decode(String.self, forKey: .publisherid)
        titleOriginal = try container.decode(String.self, forKey: .titleOriginal)
        titleHighlighted = try container.decode(String.self, forKey: .titleHighlighted)
        descriptionOriginal = try container.decode(String.self, forKey: .descriptionOriginal)
        podcastTwo = try container.decode(PodcastTwo.self, forKey: .podcastTwo)
        
        
    }

}

struct PodcastTwo : Codable {
    var podcastId : String //頻道id
    var podcastTwoTitle : String //頻道 Title
    
   
    enum CodingKeys:String,CodingKey {
        case podcastId = "id"
        case podcastTwoTitle = "title_original"
    }
    init (from decoder:Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        podcastId = try container.decode(String.self, forKey: .podcastId)
        podcastTwoTitle = try container.decode(String.self, forKey: .podcastTwoTitle)
        
        
    }
}

class APIServiceSrarch{
    
    func getData (completion: @escaping (Results) -> ()){
        guard let url = URL(string: "https://listen-api.listennotes.com/api/v2/search?q=star%20wars&sort_by_date=0&type=episode&offset=0&len_min=10&len_max=30&genre_ids=68%2C82&published_before=1580172454000&published_after=0&only_in=title%2Cdescription&language=English&safe_mode=0")
        else {return}
        
        var request = URLRequest(url: url)//for -H
        request.httpMethod = "GET"//-x
        request.setValue("cb235a75ce96432ca50c4062411dc825", forHTTPHeaderField: "X-ListenAPI-Key")//-H
        
        URLSession.shared.dataTask(with: request){(data,response,error) in
            
            guard let apiData = data else {return}
            
            
            do {
                let api = try JSONDecoder().decode(Results.self, from: apiData)
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

var sis = 10

