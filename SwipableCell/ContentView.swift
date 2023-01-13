//
//  ContentView.swift
//  SwipableCell
//
//  Created by Петр Тартынских  on 12.01.2023.
//

import SwiftUI
import SwipeActions

// MARK: - ContentView

struct ContentView: View {
    
    @State
    var state: SwipeState = .untouched
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(1...10, id: \.self) { count in
                        ContentCell(data: "Cell \(count)")
                            .addSwipeAction(edge: .trailing, state: $state) {
                                Button {
                                    print("remove cell \(count)")
                                    state = .swiped(UUID())
                                } label: {
                                    Image(systemName: "trash")
                                        .foregroundColor(.white)
                                }
                                .frame(width: 60, height: 50, alignment: .center)
                                .contentShape(Rectangle())
                                .background(Color.red)
                            }
                    }
                }
            }
            .navigationTitle("Demo")
        }
        .onAppear {
            UIView.appearance().isMultipleTouchEnabled = false
            UIView.appearance().isExclusiveTouch = true
        }
    }
}

// MARK: - ContentCell

struct ContentCell: View {
    let data: String
    
    var body: some View {
        VStack {
            HStack {
                Text(data)
                Spacer()
            }.padding()
            Divider()
                .padding(.leading)
        }
    }
}

// MARK: - PreviewProvider

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
