//
//  LearningPhase.swift
//  StateNavigationDemo
//
//  Created by mark on 9/28/23.
//

import Foundation
import SwiftUI

enum Phase: String, CaseIterable {
    case one
    case two
    case three
}

struct PhaseRecommendedList: View {
    var phase: Phase
    var recommendedContent: String
    var onDismiss: () -> Void

    var body: some View {
        VStack {
            Text("Recommended Content for \(phase.rawValue)")
            Text(recommendedContent)
            Button("Dismiss") {
                onDismiss()
            }
        }
    }
}

struct PhaseSelectionList: View {
    @Binding var selectedPhase: Phase?

    var body: some View {
        List(Phase.allCases, id: \.self) { phase in
            Button("\(phase.rawValue)") {
                selectedPhase = phase
            }
        }
    }
}

struct LearningPhaseTab: View {
    @State var selectedPhase: Phase?
    @State var recommendedContent = "Sample Content"

    var body: some View {
        NavigationView {
            if let selectedPhase = selectedPhase {
                PhaseRecommendedList(phase: selectedPhase, recommendedContent: recommendedContent) {
                    self.selectedPhase = nil
                }
            } else {
                PhaseSelectionList(selectedPhase: $selectedPhase)
            }
        }
    }
}
