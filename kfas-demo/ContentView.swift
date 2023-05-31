//
//  ContentView.swift
//  kfas-demo
//
//  Created by Manal H R Alajmi  on 30/05/2023.
//

import SwiftUI
struct Data: Identifiable{
    var id = UUID()
    let title: String
    let RecipeImage: String
    let RecipeDescription: String
    
}

struct ContentView: View {
    var items = [Data]()
    var body: some View {
        
        TabView{
            HomeView()
            
            NavigationView{ List(items) { data in
                HStack{
                    
                    NavigationLink(destination: DetailView(data: data)) {
                        Image(data.RecipeImage)
                            .resizable()
                            .frame(width: 100, height: 125 , alignment: .center)
                            .cornerRadius(10)
                            .foregroundColor(.accentColor)
                        Text(data.title)
                    }
                    
                    
                }
                .navigationBarTitle("Recipes")
            }
            }
                .tabItem{
                    Image(systemName: "fork.knife.circle")
                    Text("explore")
                }
        }
        .accentColor(Color.pink.opacity(0.7))

}
struct DetailView: View {
    var data: Data
    
    @State private var showDetails = false
    var body: some View {
           
        ZStack {
            Color(.systemGray4)
                .edgesIgnoringSafeArea(.all)
            VStack{
                ScrollView{
                    
                    
                    Image(data.RecipeImage)
                        .resizable().frame(width: 300 ,height: 350 , alignment: .leading)
                    
                    
                    Button((showDetails ? "Hide" : "Show") + " details") {
                        
                        withAnimation {
                            self.showDetails.toggle()
                        }
                        
                    }
                    if showDetails {
                        Text(data.title)
                            .padding()
                        Text(data.RecipeDescription)
                            .font(.system(size: 15))
                            .foregroundColor(Color.black)
                            .bold()
                            .padding()
                            .transition(.opacity)
                    }}
                Spacer()
                
                Button("bon appétit") {
                    
                }.buttonStyle(.bordered)
                    .foregroundColor(.pink)
                    
                
            }
                
                .padding()
            
            
            .navigationBarTitle(data.title)
        }
    }
}
        
    
      
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView(items:
                            [Data(title: "cake",
                                  RecipeImage: "cake",
                                  RecipeDescription: "Prepare the pan. Start by turning on your oven and setting it to preheat to 350°F. ..Cream the butter and sugar. ..Combine dry ingredients. ...Combine ingredients. ...Add batter to pan then Bake the cake. ...Cool and frost."),
                             Data(title: "burger",
                                   RecipeImage: "burger",
                                   RecipeDescription: "this is a burger"),
                             Data(title: "birthday cake",
                                   RecipeImage: "birthday cake",
                                   RecipeDescription: "this is a birthday cake"),
                             Data(title: "frise",
                                   RecipeImage: "frise",
                                   RecipeDescription: "this is a frise"),
                             Data(title: "pizza",
                                   RecipeImage: "pizza",
                                   RecipeDescription: "this is a pizza"),
                             Data(title: "soup",
                                   RecipeImage: "soup",
                                   RecipeDescription: "this is a soup"),
                             Data(title: "sushi",
                                   RecipeImage: "sushi",
                                   RecipeDescription: "this is a sushi"),
                             Data(title: "falafel",
                                   RecipeImage: "falafel",
                                   RecipeDescription: "this is a falafel"),
                             Data(title: "nodels",
                                   RecipeImage: "nodels",
                                   RecipeDescription: "this is a nodels"),
                            ]
            )
        }
    }
}

struct HomeView: View {
   
    let categories = ["Chinese" , "American" , "Salad", "sweet", "breakfast" , "Burger" , "Coffee"]
    let Trendys = ["Manal Al3lam" , "Chinese Dishes" , "Kuwaiti style" , "late night snacks"]
    var body: some View {
        
            ZStack {
                
                Color(.systemGray4)
                    .edgesIgnoringSafeArea(.all)
                ScrollView{
                    VStack{
                        SearchView()
                        ScrollView (.horizontal, showsIndicators: false){
                            HStack{
                                ForEach(categories, id: \.self) {categorie in
                                    
                                    Text(categorie)
                                        .font(.system(size: 13))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.secondary)
                                    
                                }
                                .padding(10)
                                
                            }
                            
                        }
                        
                        Text("Popular 🔥")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 24))
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        VStack{
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(Trendys, id: \.self) {Trendy in
                                        VStack{
                                            Image(Trendy)
                                                .resizable()
                                                .frame(width: 300 ,height: 220, alignment: .leading )
                                                .cornerRadius(24)
                                            Text(Trendy)
                                                .font(.title2)
                                                .fontWeight(.medium)
                                                .padding(.all,2)
                                            HStack (spacing: 2){
                                                ForEach(0..<5){item in
                                                    Text("⭐️")
                                                }
                                                Spacer()
                                                Image(systemName: "message")
                                            }
                                            
                                        }
                                        
                                        
                                    }
                                    .frame(width: 300 )
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(20)
                                    
                                }
                            }}
                        
                    }
                }
            }
                    .tabItem{
                        Image(systemName: "frying.pan")
                        Text("Home")
                }
        }
        
        
    }


struct SearchView: View {
    @State private var search: String = ""
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "person.crop.circle.fill")
                Spacer()
                Image(systemName: "heart.circle.fill")
            }
            .padding(.all)
            
            Text("The secret ingredient is always ")
                .font(.callout)
                .foregroundColor(Color.secondary)
            + Text("love.")
                .font(.headline)
                .foregroundColor(.pink)
                
                
            HStack{
                Image(systemName:"magnifyingglass")
                    .padding(.trailing, 10)
                TextField("Hungry?" , text: $search)
                    
                
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .padding()
            
        }
    }
}
