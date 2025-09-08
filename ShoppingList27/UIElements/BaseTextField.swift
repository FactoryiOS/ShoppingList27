import SwiftUI

struct BaseTextField: View {
    let placeholder: String
    
    @Binding var text: String
    @Binding var hasError: Bool
    @Binding var errorText: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                TextField(placeholder, text: $text)
                    .tint(.uniTurquoise)
                    .foregroundColor(.grey80)
                
                Button(action: {
                        text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.hint)
                }
                .opacity(text.isEmpty ? 0 : 1)
            }
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
                    .foregroundColor(.uniRed)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State private var text1 = ""
        @State private var hasError1 = false
        @State private var errorText1: String? = nil
        
        @State private var text2 = "sdf"
        @State private var hasError2 = true
        @State private var errorText2: String? = "Этот товар уже есть в списке"

        var body: some View {
            VStack {
                BaseTextField(
                    placeholder: "Название списка",
                    text: $text1,
                    hasError: $hasError1,
                    errorText: $errorText1
                )
                BaseTextField(
                    placeholder: "Название списка",
                    text: $text2,
                    hasError: $hasError2,
                    errorText: $errorText2
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
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.backgroundScreen)
        }
    }
    return PreviewWrapper()
}
