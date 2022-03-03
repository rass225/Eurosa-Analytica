import SwiftUI

struct Portfolio: View {
    
    let colors = [Eurosa.Colors.Chart.blue, Eurosa.Colors.Chart.green, Eurosa.Colors.Chart.red, Eurosa.Colors.Chart.fourth, Eurosa.Colors.Chart.fifth, Eurosa.Colors.Chart.sixth, Eurosa.Colors.Chart.seventh, Eurosa.Colors.Chart.eight, Eurosa.Colors.Chart.nineth, Eurosa.Colors.Chart.fourth, Eurosa.Colors.Chart.fifth, Eurosa.Colors.Chart.sixth]
    let maxWidth = UIScreen.main.bounds.width - 12
    
    
    var body: some View {
        NavigationView{
            ZStack{
                Eurosa.Colors.blue1.ignoresSafeArea()
                VStack{
                    VStack(spacing: 0){
                        VStack(alignment: .leading, spacing: 0){
                            HStack(alignment: .lastTextBaseline){
                                VStack(alignment: .leading, spacing: 0){
                                    Text("Balance")
                                        .font(Eurosa.Fonts.callout)
                                    Text("$1,600,000")
                                        .font(Eurosa.Fonts.largeTitle)
                                }
                                Spacer()
                                HStack(alignment: .center, spacing: 0){
                                    Image(systemName: "arrow.up")
                //                    Image(systemName: "line.diagonal.arrow")
                                        .foregroundColor(.green)
                                        .font(Eurosa.Fonts.title)
                                    Text("17%")
                                        .font(Eurosa.Fonts.largeTitle)
                                        .foregroundColor(.green)
                                }
                            }
                            .padding(.horizontal, 4)
                            .padding(.bottom, 16)
                            .maxWidth(align: .leading)
                            .foregroundColor(.white)
                            
                            
                            HStack(spacing: 0){
                                ForEach(tokens.indices, id: \.self) { index in
                                    if index == 0 {
                                        Rectangle()
                                            .frame(width: maxWidth / 100 * CGFloat((tokens[index].value * 100 / totalBalance())))
                                            .frame(height: 12)
                                            .foregroundColor(colors[index])
                                            .cornerRadius(10, corners: tokens.count == 1 ? .allCorners : [.topLeft, .bottomLeft])
                                    }
                                    else if index == tokens.count - 1 {
                                        Rectangle()
                                            .frame(width: maxWidth / 100 * CGFloat((tokens[index].value * 100 / totalBalance())))
                                            .frame(height: 12)
                                            .foregroundColor(colors[index])
                                            .cornerRadius(10, corners: [.topRight, .bottomRight])
                                    }
                                    else {
                                        Rectangle()
                                            .frame(width: maxWidth / 100 * CGFloat((tokens[index].value * 100 / totalBalance())))
                                            .frame(height: 12)
                                            .foregroundColor(colors[index])
                                        
                                    }
                                }
                            }
                            
                            
                            HStack(spacing: 32){
                                VStack(alignment: .leading, spacing: 16){
                                    QuickViewCell(color: colors[0], token: tokens[0].name)
                                    QuickViewCell(color: colors[1], token: tokens[1].name)
                                    QuickViewCell(color: colors[2], token: tokens[2].name)
                                }
                                
                                VStack(alignment: .leading, spacing: 16){
                                    QuickViewCell(color: colors[3], token: tokens[3].name)
                                    QuickViewCell(color: colors[4], token: tokens[4].name)
                                    QuickViewCell(color: colors[5], token: tokens[5].name)
                                }
                               
                                VStack(alignment: .leading, spacing: 16){
                                    QuickViewCell(color: colors[6], token: tokens[6].name)
                                    QuickViewCell(color: colors[7], token: tokens[7].name)
                                    QuickViewCell(color: colors[8], token: tokens[8].name)
                                }
                                Spacer()
                            }
                            .padding(.horizontal, 4)
                            .padding(.top, 16)
                        }
                        .padding(.horizontal)
                        .padding(.bottom)
                        .maxWidth(align: .leading)
                        .background(Eurosa.Colors.blue1)
        //
                        ScrollView{
                            ForEach(tokens){ item in
                                HStack{
                                    Image(item.image)
                                        .resizable()
                                        .frame(width: 25, height: 25, alignment: .leading)
                                    Text(item.name)
                                        .font(Eurosa.Fonts.callout)
                                    Spacer()
                                    VStack(alignment: .trailing, spacing: 1){
                                        Text("\(item.amount, specifier: "%.2f")")
                                            .font(Eurosa.Fonts.body)
                                        Text("$\(item.value)")
                                            .font(Eurosa.Fonts.caption2)
                                    }
                                    
                                }.foregroundColor(.black)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(2)
                                .defaultShadow()
                            }
                            .padding(.horizontal)
                            .padding(.vertical)
                        }
                        .background(Color.white)
                        .cornerRadius(24, corners: [.topLeft, .topRight])
                        .shadow(color: .black.opacity(0.1), radius: 3, x: 0, y: -3)
                    }
                }
            }
            
            .navigationBarModifier()
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Eurosa.Icons.add
                        .toolBarIconModifier()
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Eurosa.Icons.burger
                        .toolBarIconModifier()
                }
                ToolbarItem(placement: .principal) {
                    Eurosa.Titles.portfolio
                        .titleModifier()
                }
            }
        }
        
    }
    
    func totalBalance() -> Int {
        var result: Int = 0
        for item in tokens {
            result += item.value
        }
        return result
        
    }
    
    struct QuickViewCell: View {
        
        let color: Color
        let token: String
        
        var body: some View {
            HStack{
                Circle()
                    .fill(color)
                    .frame(width: 12, height: 12, alignment: .center)
                Text(token)
                    .font(Eurosa.Fonts.caption)
                    .foregroundColor(.white)
            }
        }
    }
}

struct Portfolio_Previews: PreviewProvider {
    static var previews: some View {
        Portfolio()
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
