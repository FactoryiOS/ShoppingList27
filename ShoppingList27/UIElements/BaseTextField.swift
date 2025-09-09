import SwiftUI

struct BaseTextField: View {
    
    @Binding var text: String
    let placeholder: String
    let hasError: Bool
    let errorText: String?
    let keyboardType: UIKeyboardType = .default

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                TextField(placeholder, text: $text)
                    .tint(.uniTurquoise)
                    .font(.system(size: 17))
                    .foregroundColor(.grey80)
                    .keyboardType(keyboardType)
                
                Button(action: {
                    text = ""
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.hint)
                })
                .opacity(text.isEmpty ? 0 : 1)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color.bgcolor)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(hasError ? Color.uniRed : Color.clear, lineWidth: 0.5)
            )
            
            if hasError, let errorText = errorText {
                Text(errorText)
                    .font(.system(size: 13))
                    .padding(.horizontal, 8)
                    .foregroundColor(.uniRed)
            }
        }
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State private var text1 = ""
        @State private var hasError1 = false
        @State private var errorText1: String? = ""
        
        @State private var text2 = "sdf"
        @State private var hasError2 = true
        @State private var errorText2: String? = "Этот товар уже есть в списке"

        var body: some View {
            VStack {
                BaseTextField(
                    text: $text1,
                    placeholder: "Название списка",
                    hasError: hasError1,
                    errorText: errorText1
                )
                BaseTextField(
                    text: $text2,
                    placeholder: "Название списка",
                    hasError: hasError2,
                    errorText: errorText2
                )
                Button("Переключить") {
                    withAnimation {
                        hasError1.toggle()
                        hasError2.toggle()
                        errorText1 = hasError1 ? "Поле не может быть пустым" : nil
                        errorText2 = hasError2 ? "Этот товар уже есть в списке" : nil
                    }
                }
                .padding()
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.backgroundScreen)
        }
    }
    return PreviewWrapper()
}
