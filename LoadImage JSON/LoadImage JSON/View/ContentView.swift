//
//  ContentView.swift
//  LoadImage JSON
//
//  Created by Edi Sunardi on 08/02/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{

            Home()
                .navigationBarTitle("News")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Home: View {
    
    @ObservedObject var Books = NewsModel()
    @State var show = false
    @State var url = ""
    
    var body: some View {
        
            List(Books.data) { i in
                NavigationLink(destination: DetailNews(news: i)) {
            HStack{
                if i.image != ""{
                    
                    WebImage(url: URL(string: i.image)!)
                        . resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 170)
                        .background(Image("loader")
                                        .resizable()
                                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                        .frame(width: 60, height: 30))
                        .cornerRadius(10)
                        
                } else {
                    Image("loader")
                        .resizable()
                        .frame(width: 120, height: 170)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text(i.title)
                        .fontWeight(.bold)
                    
                    Text(i.description)
                        //font des
                }
            }
                }
        }
    }
}
