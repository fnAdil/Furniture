//
//  HomePage.swift
//  Furniture
//
//  Created by Adil Özdemir on 9.05.2022.
//

import SwiftUI

struct HomePage: View {
    private let categories = ["All", "Chair", "Sofa", "Lamp", "Kitchen", "Table"]
    
    @State private var selectedIndex: Int = 1
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Bg")
                ScrollView {
                    VStack(alignment: .leading) {
                        AppBarView()
                        
                        TagLineView()
                        
                        SearchView()
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< categories.count) { i in
                                    Button(action: {selectedIndex = i}) {
                                        CategoryView(isActive: selectedIndex == i, text: categories[i])
                                    }
                                }
                            }
                            
                        }
                        
                        PopularView()
                        BestView()
                        Spacer()
                    }.padding(.vertical,40)
                        .padding(.horizontal,20)
                }
                
                VStack {
                    Spacer()
                    HStack{
                        BottomNavbarItem(image: "Home", action: {})
                        BottomNavbarItem(image: "Search", action: {})
                        BottomNavbarItem(image: "menu", action: {})
                        BottomNavbarItem(image: "User", action: {})
                    }.padding()
                        .background(.white)
                        .clipShape(Capsule())
                        .padding(.horizontal)
                        .padding(.vertical,30)
                    .shadow(color: Color.black.opacity(0.15), radius: 8, x: 2, y: 6)
                }
                
            }.edgesIgnoringSafeArea(.all)
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}


struct AppBarView: View {
    var body: some View {
        HStack{
            Button {
                
            } label: {
                Image("menu")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
            }
            Spacer()
            Button {
                
            } label: {
                Image(  "Profile").resizable().frame(width: 42, height: 42) .cornerRadius(10)
            }
            
        }
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Find the \nBest ")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(Color("Primary"))
            + Text("Furniture!")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .fontWeight(.bold)
            .foregroundColor(Color("Primary"))
    }
}

struct SearchView: View {
    @State var search :String = "";
    var body: some View {
        HStack {
            HStack{
                Image("Search")
                TextField("Search Furniture", text: $search)
                
            }
            .padding()
            .background(.white)
            .cornerRadius(10)
            .padding(.trailing)
            Button {
                
            } label: {
                Image("Search")
                    .padding()
                    .background(Color("Primary"))
                    .cornerRadius(10)
            }
            
            
        }
    }
}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("Primary") : Color.black.opacity(0.5))
            if (isActive) { Color("Primary")
                    .frame(width: 9 * CGFloat(text.count), height: 2)
                .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}



struct ProductCardView: View {
    let image: String
    var body: some View {
        VStack{
            Image(image).resizable().frame(width: 210, height: 200).cornerRadius(20)
            Text("Luxury Sweden Chair").font(.title3).fontWeight(.bold)
            HStack(spacing:2){
                ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                    Image("star")
                    
                }
                Spacer()
                Text("$1249").font(.title3).fontWeight(.bold)
            }
        }.frame(width: 210).padding().background(.white).cornerRadius(20)
    }
}

struct PopularView: View {
    var body: some View {
        VStack(alignment: .leading) {
  
            Text("Popular").font(.custom("PlayfairDisplay-Bold", size: 24))
            ScrollView (.horizontal, showsIndicators: false){
                HStack {
                    ForEach(0 ..< 4) { item in
                        NavigationLink( destination: {
                            DetailPage()
                        }, label: {
                            ProductCardView(image: "chair_\(item+1)")
                        }
                        ).navigationBarHidden(true)
                            .foregroundColor(.black)
                            
                        
                    }.padding(.trailing)
                }
            }
        }
    }
}

struct BestView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Best").font(.custom("PlayfairDisplay-Bold", size: 24))
            ScrollView (.horizontal, showsIndicators: false){
                HStack {
                    ForEach(0 ..< 4) { item in
                        ProductCardView(image: "chair_\(item+1)")
                    }.padding(.trailing)
                }
            }
        }
    }
}

struct BottomNavbarItem: View {
    let image : String
    let action: ()-> Void
    var body: some View {
        Button(action: action, label: {
            Image(image).frame(maxWidth: .infinity)
        })
    }
}


