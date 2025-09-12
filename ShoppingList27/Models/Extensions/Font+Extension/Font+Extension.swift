//
//  Font+Extension.swift
//  ShoppingList27
//
//  Created by Kira on 10.09.2025.
//

import SwiftUI

extension Font {
    enum IOS {
        ///
        enum Headline {
            static var medium: Font {
                Font.system(size: 17, weight: .medium)
            }
        }
        ///
        enum Body {
            static var regular: Font {
                Font.system(size: 17, weight: .regular)
            }
        }
        
        enum LargeTitle {
            ///
            static var regular: Font {
                Font.system(size: 34, weight: .regular)
            }
            static var semiBold: Font {
                Font.system(size: 34, weight: .semibold)
            }
        }
        
        enum Title1 {
            static var regular: Font {
                Font.system(size: 28, weight: .regular)
            }
            ///
            static var semiBold: Font {
                Font.system(size: 28, weight: .semibold)
            }
        }
        
        enum Title2 {
            static var regular: Font {
                Font.system(size: 22, weight: .regular)
            }
            ///
            static var semiBold: Font {
                Font.system(size: 22, weight: .semibold)
            }
        }
        
        enum Title3 {
            static var regular: Font {
                Font.system(size: 20, weight: .regular)
            }
            ///
            static var medium: Font {
                Font.system(size: 20, weight: .medium)
            }
        }
        
        enum Callout {
            ///
            static var regular: Font {
                Font.system(size: 16, weight: .regular)
            }
            static var medium: Font {
                Font.system(size: 16, weight: .medium)
            }
        }
        
        enum Subheading {
            static var regular: Font {
                Font.system(size: 15, weight: .regular)
            }
            static var medium: Font {
                Font.system(size: 15, weight: .medium)
            }
        }
        
        enum Footnote {
            ///
            static var regular: Font {
                Font.system(size: 13, weight: .regular)
            }
            static var medium: Font {
                Font.system(size: 13, weight: .medium)
            }
        }
        
        enum Caption1 {
            static var light: Font {
                Font.system(size: 12, weight: .light)
            }
            static var regular: Font {
                Font.system(size: 12, weight: .regular)
            }
        }
        
        enum Caption2 {
            static var light: Font {
                Font.system(size: 11, weight: .light)
            }
            static var regular: Font {
                Font.system(size: 11, weight: .regular)
            }
        }
    }
    
    enum M3 {
        
        enum Body {
            static var large: Font {
                Font.system(size: 16, weight: .regular)
            }
        }
    }
}
