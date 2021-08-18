//
//  URLImageModel.swift
//  APITest
//
//  Created by HookYang on 2021/8/14.
//https://www.jianshu.com/p/58067f55ddab 參考

import SwiftUI

class URLImageModel:ObservableObject {
    
    @Published var downloadedData :Data?
    
    func downloadImage(url:String){
        guard let imageURL = URL(string: url) else {
            return
        }
        URLSession.shared.dataTask(with: imageURL){data,_,error in
            
            guard let data = data,error == nil else{
                return
            }
            
            DispatchQueue.main.async {
                self.downloadedData = data
            }
            
            
        }.resume()
    }
    
}


struct URLImage : View {
    let url : String
    let placeholder : String
    @ObservedObject var imgaeLoader = URLImageModel()
    init(url:String,placeholder:String = "placeholder") {
        self.url = url
        self.placeholder = placeholder
        self.imgaeLoader.downloadImage(url: self.url)
    }
    
    var body: some View{
        
        if let data = self.imgaeLoader.downloadedData{
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
                .frame(width:80,height: 80)
        }else{
            return Image(systemName: "photo.fill")
                .resizable()
                .frame(width:80,height: 60)
                
        }
    }
}
