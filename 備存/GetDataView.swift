//
//  GetDataView.swift
//  APITest
//
//  Created by HookYang on 2021/7/11.
// 參考 https://www.youtube.com/watch?v=1en4JyW3XSI 

import SwiftUI

struct GetDataView: View {
    
    @State var api : Apimodel?
    
    var body: some View {
        
       NavigationView{
        


        ZStack {
                
            VStack {
                Text(api?.id.uuidString ?? "沒資料")
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
             
                Text(api?.country ?? "沒資料")
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
            
                Text(api?.noUseId ?? "沒資料")
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                
                Text(api?.title ?? "沒資料")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                
                Text(api?.image ?? "沒資料")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                
                Text(api?.publisher ?? "沒資料")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                
                Text("(Int\(api?.next_episode_pub_date ?? 0 ))" )
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                
                
            }
                
            }

            .navigationTitle("節目")
        }.onAppear{
            APIService().getData{(api) in
                print("api", api)
                self.api = api
            }}
        

        
    }
}

struct GetDataView_Previews: PreviewProvider {
    static var previews: some View {
        GetDataView()
    }
}
