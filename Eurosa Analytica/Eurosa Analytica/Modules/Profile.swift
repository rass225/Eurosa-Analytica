import SwiftUI
import Foundation


struct Profile: View {
    
    var body: some View {
        NavigationView{
            VStack(spacing: 0){
                HStack{
                    Image("Messi")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 55, height: 55, alignment: .center)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(.gray, lineWidth: 2))
                    Text("Rasmus Tauts")
                        .font(Eurosa.Fonts.title)
                }
                .toolBarModifier()
                ScrollView{
                    ForEach(1..<15) { item in
                        Text("Mariah Loya")
                            .foregroundColor(.black)
                    }
                    .maxWidth(align: .leading)
                }.background(Color.white)
            }
            .navigationBarModifier()
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Eurosa.Icons.burger
                        .toolBarIconModifier()
                }
            }
        }
    }
}
