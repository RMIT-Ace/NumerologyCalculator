//
//  ContentView.swift
//  Numerology Calculator
//
//  Created by Ace on 25/7/2025.
//

import SwiftUI

struct ContentView: View {
    @State var digits: [Int] = [ 0, 0, 0, 0, 0, 0, 0, 0 ]
    @State var numeroNumber: Int = 0
    @State var isMasterNumberReduced: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Spacer()
                Text("\(numeroNumber)")
                    .font(.system(size: 48, weight: .bold, design: .default))
                    .frame(width: 48 * 2)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .cornerRadius(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(style: StrokeStyle(lineWidth: 2))
                    }
                Toggle("Reduce\nmaster\nnumber", isOn: $isMasterNumberReduced)
                    .toggleStyle(ButtonToggleStyle())
            }
            .padding(.top, 20)
            
            HStack(spacing: 2) {
                ForEach(0..<8) { i in
                    DigitPickerView(digit: $digits[i])
                }
            }
            
            Spacer()
            VStack {
               ScrollView {
                    Text(numberMeanings[numeroNumber] ?? "")
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .italic()
                }
            }
            .frame(height: 300)
            .frame(maxWidth: .infinity)
            .padding()
            .cornerRadius(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(style: StrokeStyle(lineWidth: 2))
            }
            .padding()
            
            Spacer()
        }
        .padding(.horizontal, 6)
        .onChange(of: digits) { _, newDigits in
            numeroNumber = calculateNumeroNumber(newDigits, reduceMasterNumber: isMasterNumberReduced)
        }
        .onChange(of: isMasterNumberReduced) { _, _ in
            numeroNumber = calculateNumeroNumber(digits, reduceMasterNumber: isMasterNumberReduced)
        }
    }
}

#Preview {
    ContentView()
}

func calculateNumeroNumber(_ digits: [Int], reduceMasterNumber: Bool = false) -> Int {
    let result = digits.reduce(0, +)
    let shouldReduceResult: Bool = (
        ((result > 9) && !isMasterNumber(result)) ||
        ((result > 9) && isMasterNumber(result) && reduceMasterNumber)
    )
    if shouldReduceResult {
        return calculateNumeroNumber(numberToDigits(result), reduceMasterNumber: shouldReduceResult)
    } else {
        return result
    }
}

func numberToDigits(_ number: Int) -> [Int] {
    var digits: [Int] = []
    var num = number
    
    repeat {
        let digit = num % 10
        digits.append(digit)
        num /= 10
    } while num != 0
    return digits.reversed()
}

let masterNumbers: Set<Int> = [ 11, 22, 33 ]

func isMasterNumber(_ number: Int) -> Bool {
    return masterNumbers.contains(number)
}

/*

 Sources:
 
 1. https://www.instyle.com/lifestyle/astrology/numerology#:~:text=Perhaps%20you've%20found%20that,and%20meaning%20of%20each%20number.
 
 2. https://www.numerology.com/articles/about-numerology/single-digit-numbers-in-numerology/
 
 */

let numberMeanings: [Int: String] = [
    0: """
       Please input some numbers.
       """,
    1: """
       Originality. Leadership. Create own path. Confidence. Independent.
       Goal-oriented. Innovative. Proactive. Pioneering.  Motivated.
       Freedom-loving.
       
       Forceful. Risky. Doubtful. Self-centered. Reckless.
       """,
    2: """
       Balance. High intuitive. Establish relationship. Unifying. Influential.
       Tactful. Sensitive. Coorporative. Inclusive. Supportive. Empathetic.
       
       Should learn to say "No". Indecisive. Easily hurt. Unassertive.
       """,
    3: """
       Authenticity. Communication. Creative expression. Charming personality.
       Artistic. Charming. Curious. Jovial. Youthful.
       
       Naive. Unfocused. Shallow. Scattered. Optimistic. 
       """,
    4: """
       Stability. Pragmatic, sensible, organized. Analystical mind. Plan maker.
       Loyal. Service-oriented. Strong. Traditional. Hard Worker. Patient.
       Dependable.
       
       Important to not to overwork, and avoid stress. Dogmatic. Dull. Rigid.
       Strict.
       """,
    5: """
       Freedom. Adventurous, spontaneous risk-taker. Free spirit. Love to travel.
       Sales. Marketing. Curious. Adaptable. Social. Flexible. Energetic.
       Independent.
       
       Non-committal. Unreliable. Directionless. Unpredictable.
       Restless. Inconsistent.
       """,
    6: """
       Acceptance. Artist. Design, beauty, fine arts, aesthetics, music.
       Unconditional love. Supportive. Protective. Romantic. Caring. Healing.
       Compassionate. Nurturing. Warm. Harmonious.
       
       Must learn to love oneself. Passive. Self-sacrificing. Idealistic.
       """,
    7: """
       Truth. Knowledge. Curiosity. Field expert. Spiritual. Analytical.
       Teachers, trainers, advisors, consultants. Intellectual.
       Mysterious. 
       
       Nerdy. Skeptics. Reclusive. Secretive. Suspicious. Reserved.
       """,
    8: """
       Empowerment. Accomplishment in material realm. High position/incomes.
       Balanced. Dedicated. Prosperous. Strong. Professional. Goal-oriented.
       
       Must learn how to enjoy life. Ambition. Materialistic. Authoritative.
       Entitled.
       """,
    9: """
       Awakening. Completion. Wisdom, understanding, and compassion. Humanitarians.
       Tolerant. Supportive. Kind. Wise. Experienced. Spiritual. Aware.
       
       Learn to let go of attachments in life. Resentful. Sacrificing. Suffering.
       """,
    11: """
       Seer. Powerful intuition. Deep sense of awareness about the things we cannot see.
       Psychic abilities. Relationships. Teamwork. Can read people feelings.
       Spiritual inner voice. Same as number 2 and much more.
       
       Burden if not learn how to handle deep sense of awareness.
       """,
    22: """
       Master Builder. Intuition. Reality maker. Actualizers. Rational thinker. 
       Great instinct. People skills. High energy. Anything is possible.
       Same traits as number 4 and much more.
       """,
    33: """
       Master Teacher. Pure love and light. Profound responsibility of guiding.
       Healing and enlightment. Trusted by universe. Compassion. A channel for 
       divine messages. It carries powers of the 11 and 22.
       """,
]
