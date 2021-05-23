//
//  ContentView.swift
//  Project2
//
//  Created by MAC on 15/5/2021.
//

import SwiftUI

struct ContentView: View {
   @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
  @State private  var correctAnswer = Int.random(in:0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var trueAnswer = ""
    @State private var isNight = false

    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                

        VStack(spacing:30){
        VStack {
               Text("Tap the flag of")
                .foregroundColor(.white)
               Text(countries[correctAnswer])
                .foregroundColor(.white)
                .font(.largeTitle)
                .fontWeight(.heavy)
        }
            
            ForEach(0 ..< 3) { number in
                Button(action: {
                   self.flagTapped(number)
                }) {
                    Image(self.countries[number])
                        .renderingMode(.original)
                        .clipShape(Capsule())
                        .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                        .shadow(color: .black, radius: 5)

                }
                .alert(isPresented: $showingScore) {
                    Alert(title:  Text(scoreTitle)
, message: Text("""
score\(score)
\(trueAnswer)
""") .font(.title)
     .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                           
                            
                    
                    ,dismissButton: .default(Text("Continue")) {
                        self.askQuestion()
                    })
                }
                
                
            }
            VStack{
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
           }
        }
        
        
        
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
                self.score += 1
            trueAnswer = " "
           
            
            
        } else {
            scoreTitle = "Wrong"
           
            self.score -= 1
            
            if (scoreTitle == "Wrong"){
                trueAnswer = "That’s the flag of \(countries[correctAnswer])"
            }
            
            
        }

        showingScore = true
    }
    
    func TrueAnser() {
        if (scoreTitle == "Correct"){
            trueAnswer = countries[correctAnswer]
        }
    }
    
    
    
     func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
