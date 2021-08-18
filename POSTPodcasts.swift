//
//  POSTPodcasts.swift
//  APITest
//
//  Created by HookYang on 2021/6/20.
//https://reurl.cc/R0N0ng//彼得潘處理URL上的參數
//
import SwiftUI


struct POSTPodcasts:View {
    
    @State var results = [Results]()
   // @Binding var srarchWords :String
    //@State var srarchWords :String
    var body: some View {
       

        NavigationView{
            
            VStack{
            SearchBar()
                .padding(.bottom,5)
           
            List(results,id: \.publisherid) {item in
              
                HStack{
                    
                    URLImage(url: item.image ?? "沒資料")
                    
                  Spacer()
                    .frame(width: 10)
                    
                    VStack(alignment: .leading, spacing: 2){
                        
                        Text(item.titleOriginal ?? "")
                            .fontWeight(.black)
                            .multilineTextAlignment(.leading)
                            .lineLimit(1)
                            .font(.system(size: 18))
                        
                        Text(item.descriptionOriginal ?? "")
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                            .foregroundColor(.gray)
                            .font(.system(size: 15))
                        
                        
                        Text(item.podcastTwo.podcastTwoTitle )
                            .fontWeight(.black)
                            .multilineTextAlignment(.leading)
                            .lineLimit(1)
                            .foregroundColor(.gray)
                            .font(.system(size: 12))
                        
                    }
                }
                
            }
            .onAppear(perform:getData)
            .navigationBarTitle("Podcast")
            }
            }.navigationViewStyle(StackNavigationViewStyle())
            
        }
        
    //star%20wars
    
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
struct POSTPodcasts_Previews:PreviewProvider {
   
    static var previews: some View {
        POSTPodcasts( )
    }
}


