//
//  Numerology.swift
//  Numerology Calculator
//
//  Created by Ace on 26/7/2025.
//

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
