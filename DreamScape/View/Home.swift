//
//  Home.swift
//  DreamScape
//
//  Created by Gerard Gomez on 1/28/24.
//

import Charts
import Lottie
import SwiftUI

struct Home: View {
    @Environment(\.horizontalSizeClass) private var hSizeClass
    var body: some View {
        NavigationStack {
            ZStack {
                Color.primaryBackground.ignoresSafeArea()
                ScrollView(.vertical) {
                    VStack(alignment: .leading) {
                        Text("Welcome to DreamScape, Gerard")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundStyle(.primaryText)
                            .padding([.leading, .bottom])
                        Text("Feature Dream")
                            .font(.headline.bold())
                            .foregroundStyle(.primaryText)
                            .padding(.leading)
                        
                        HStack(alignment: .top) {
                            LottieView(animation: .named("dreamAnimation"))
                                    .looping()
                                    .scaledToFit()
                                    .containerRelativeFrame([.vertical, .horizontal], alignment: .leading) { length, _ in
                                        length / 4
                                }
                            VStack {
                                Text("Fired from my job")
                                    .font(.headline)
                                    .foregroundStyle(.primaryText)
                                Text("I dreamt that I was in a office where suddenly I was call. Then the director told me that I was fired from my job. I did not understand why I would be fire from my job, but it happened. I just hope that it does not happen to anyone else.")
                                    .foregroundStyle(.primaryText)
                            }
                            .padding(.trailing)
                        }
                        .background(.cardBackground)
                        .clipShape(.rect(cornerRadius: 12))
                        .shadow(radius: 2)
                        .padding(.horizontal)
                        Text("Recent Dreams")
                            .font(.headline.bold())
                            .foregroundStyle(.primaryText)
                            .padding(.leading)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0..<5, id: \.self) { _ in
                                    VStack(alignment: .leading) {
                                        Text("Dream Title")
                                            .font(.headline)
                                            .foregroundStyle(.primaryText)
                                        Text("A brief summary")
                                            .foregroundStyle(.primaryText)
                                            .lineLimit(2)
                                    }
                                    .frame(height: 200)
                                    .aspectRatio(2.5, contentMode: .fit)
                                    .containerRelativeFrame(.horizontal,
                                                            count: hSizeClass == .regular ? 2 : 1,
                                                            spacing: 10)
                                    .background(.cardBackground)
                                    .clipShape(.rect(cornerRadius: 12))
                                    .shadow(radius: 2)
                                }
                                .scrollTransition { content, phase in
                                    content
                                        .scaleEffect(phase == .topLeading ? 0.8 : 1)
                                        .blur(radius: phase == .identity ? 0 : 2)
                                }
                            }
                            .scrollTargetLayout()
                        }
                        .contentMargins([.vertical, .horizontal], 15)
                        .scrollTargetBehavior(.viewAligned)
                        Text("Last 7 Days")
                            .foregroundStyle(.primaryText)
                            .font(.headline.bold())
                            .padding(.leading)
                        Chart {
                            BarMark(x: .value("Category", "Happy"), y: .value("Count", 3))
                            BarMark(x: .value("Category", "Afraid"), y: .value("Count", 5))
                            BarMark(x: .value("Category", "Sad"), y: .value("Count", 2))
                            BarMark(x: .value("Category", "Indifferent"), y: .value("Count", 10))
                        }
                        .padding([.leading, .trailing])
                        .containerRelativeFrame(.vertical) { length, _ in
                            length / 4
                        }
                        
                    }
                }
                .scrollIndicators(.hidden)
                .scrollBounceBehavior(.basedOnSize)
                .navigationTitle("Home")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    Home()
}
