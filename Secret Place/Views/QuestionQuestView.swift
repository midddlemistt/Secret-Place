//
//  QuestionQuestView.swift
//  Secret Place
//
//  Created by 123 on 26.03.24.
//

import SwiftUI

struct QuestionQuestView: View {
    @ObservedObject var viewModel: QuestionQuestViewModel

    var body: some View {
        VStack {
            Text(viewModel.quest.title)
                .font(.title)
                .fontWeight(.bold)
                .padding()
                .fixedSize(horizontal: false, vertical: true) // Prevent text clipping

            Text(viewModel.quest.description)
                .font(.body)
                .padding()
                .fixedSize(horizontal: false, vertical: true) // Prevent text clipping

            ForEach(viewModel.quest.answers.indices, id: \.self) { index in
                Button(action: {
                    viewModel.selectAnswer(at: index)
                }) {
                    Text(viewModel.quest.answers[index])
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(viewModel.colorForAnswer(at: index))
                        .cornerRadius(10)
                        .fixedSize(horizontal: false, vertical: true) // Ensure button text is fully visible
                }
                .disabled(viewModel.answerSelected)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
        // Removed fixed size for the overlay card to allow dynamic content sizing
        .opacity(viewModel.showQuest ? 1 : 0)
        .animation(.easeInOut, value: viewModel.showQuest)
        .onChange(of: viewModel.questCompleted) { completed in
            if completed {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // Delay before disappearing
                    viewModel.hideQuest()
                }
            }
        }
    }
}



//#Preview {
//    QuestionQuestView()
//}

