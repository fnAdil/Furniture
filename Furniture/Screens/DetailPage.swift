//
//  DetailView.swift
//  Furniture
//
//  Created by Adil Özdemir on 9.05.2022.
//

import SwiftUI

struct DetailPage: View {
    @Environment(\.presentationMode) var presentionMode : Binding<PresentationMode>
    var body: some View {
     
            ZStack{
                HStack{
                    BackButton {
                        presentionMode.wrappedValue.dismiss()
                    }
                }
                Color("Bg")
                ScrollView {
                    VStack{
                        HStack{
                            
                        }
                        Image("chair_1").resizable().aspectRatio(contentMode: .fit).edgesIgnoringSafeArea(.top)
               
                        DetailView()
                        
                    }
                    HStack {
                        Text("$1299")
                            .font(.title)
                            .foregroundColor(.white)
                        Spacer()
                        
                        Text("Add to Cart")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("Primary"))
                            .padding()
                            .padding(.horizontal, 8)
                            .background(Color.white)
                            .cornerRadius(10.0)
                        
                    }
                    .padding()
                    .padding(.horizontal)
                    .background(Color("Primary"))
                    .cornerRadius(60.0, corners: .topLeft)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .edgesIgnoringSafeArea(.bottom)
                }.edgesIgnoringSafeArea(.top)
                
            }.edgesIgnoringSafeArea(.all)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButton {
                presentionMode.wrappedValue.dismiss()
            }, trailing: Image("threeDot"))
        
    }
}
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPage()
    }
}

struct DetailView: View {
    @State var quantity:Int64 = 0
    var body: some View {
        VStack(alignment: .leading){
            Text("Luxury Swedia \nChair").font(.title).fontWeight(.bold)
            HStack(spacing:4){
                ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                    Image("star")
                }
                Text("(4.9)").opacity(0.5).padding(.leading)
                Spacer()
            }
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            Text("Luxury Swedian Chair is a contemporary chair based on the virtues of modern craft. it carries on the simplicity and honestly of the archetypical chair.")
                .lineSpacing(8.0)
                .opacity(0.6)
            
            
            HStack (alignment: .top) {
                VStack (alignment: .leading) {
                    Text("Size")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    Text("Height: 120 cm")
                        .opacity(0.6)
                    Text("Wide: 80 cm")
                        .opacity(0.6)
                    Text("Diameter: 72 cm")
                        .opacity(0.6)
                }
                
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack (alignment: .leading) {
                    Text("Treatment")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    Text("Jati Wood, Canvas, \nAmazing Love")
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical)
            
            HStack (alignment:.bottom){
                VStack(alignment: .leading){
                    Text("Colors").fontWeight(.semibold)
                    HStack{
                        Color(.white).frame(width: 24, height: 24).clipShape(Circle())
                        Color(.black).frame(width: 24, height: 24).clipShape(Circle())
                        Color("Primary").frame(width: 24, height: 24).clipShape(Circle())
                    }
                }
                Spacer()
                VStack(alignment:.leading){
                    Text("Quantity").fontWeight(.semibold)
                    HStack{
                        Button {
                            if(quantity>0){
                                quantity -= 1
                            }
                            
                        } label: {
                            
                            Image(systemName: "minus").padding(.all,8)
                        }.frame(width: 32, height: 32).overlay(RoundedRectangle(cornerRadius: 50).stroke()).foregroundColor(.black)
                        
                        Text("\(quantity)").font(.title2).fontWeight(.semibold).padding(.horizontal,6)
                        Button {
                            quantity+=1
                        } label: {
                            
                            Image(systemName: "plus").padding(.all,8)
                        }.frame(width: 32, height: 32).background(Color("Primary")).clipShape(Circle()).foregroundColor(.black)

                    }
                }
                
            }

        }.padding(.top).padding().background(Color("Bg")).cornerRadius(40).offset(x: 0, y: -40.0)
    }
}

struct BackButton: View {
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.backward")
                .foregroundColor(.black)
                .padding(.all, 10)
                .background(Color.white)
                .cornerRadius(8.0)
        }
    }
}
