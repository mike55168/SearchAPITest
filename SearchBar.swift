//
//  SearchBar.swift
//  APITest
//
//  Created by HookYang on 2021/8/15.
//

import SwiftUI

struct SearchBar: View {
 @State var srarchWords = ""

    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .padding(.leading,10)
                .foregroundColor(.gray)
            TextField("search...", text: $srarchWords)
                
            
            
        }.frame(maxWidth: .infinity,maxHeight: 40)
        .background(Color(.systemGray6))
        .cornerRadius(8)
        .padding(.horizontal)
       
        
        
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
 SearchBar()
    }
}


