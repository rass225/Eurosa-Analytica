import Foundation
import SwiftUI

extension View {
    
    func mediaCellModifier() -> some View {
        self.modifier(MediaCellModifer())
    }

    func navigationBarModifier() -> some View {
        self
            .modifier(NavigationBarModifier())
            .navigationBarTitleDisplayMode(.inline)
    }

    func toolBarModifier() -> some View {
        self.modifier(ToolBarModifier())
    }
    
    func titleModifier() -> some View {
        self.modifier(TitleModifier())
    }
    
    func toolBarIconModifier() -> some View {
        self.modifier(ToolBarIconModifier())
    }
    
    func tokenCellModifier() -> some View {
        self.modifier(TokenCellModifier())
    }
    
    func maxWidth(align: Alignment) -> some View {
        self.frame(maxWidth: .infinity, alignment: align)
    }
    
    
    func defaultShadow(color: Color, radius: CGFloat) -> some View {
        return self
            .shadow(color: color, radius: radius, x: 0.0, y: 0.0)
    }
    
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
    
    func miniShadow() -> some View {
        self
            .shadow(color: Color.black.opacity(0.09), radius: 1, x: 0, y: 2)
    }
    
    func defaultShadow() -> some View {
        self
            .shadow(color: .gray.opacity(0.2), radius: 2, x: 0, y: 0)
    }
}

extension Text {
    func active(
        _ active: Bool,
        _ modifier: (Text) -> () -> Text
    ) -> Text {
        guard active else { return self }
        return modifier(self)()
    }
}
