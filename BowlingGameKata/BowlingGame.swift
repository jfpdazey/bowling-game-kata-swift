//
//  BowlingGame.swift
//  BowlingGameKata
//
//  Created by John Dazey on 5/10/17.
//  Copyright © 2017 Pillar Technology. All rights reserved.
//

import Foundation

class BowlingGame {

    let COMPLETE_FRAME = 10

    func scoreGame (_ rolls: [Int]) -> Int {
        var score = 0

        var index = 0
        while (index < rolls.count) {
            let rollScore = rolls[index]
            score += rollScore

            if (isStrike(rolls: rolls, index: index)) {
                let next2 = rolls[index + 1] + rolls[index + 2]
                score += next2
            }
            else if (priorFrameWasSpare(rolls: rolls, index: index)) {
                score += rollScore
            }
            index += 1
        }

        return score
    }

    private func isStrike(rolls: [Int], index: Int) -> Bool {
        return rolls[index] == COMPLETE_FRAME &&
            (index == 0 || rolls[index - 1] != 0)
    }

    private func priorFrameWasSpare(rolls: [Int], index: Int) -> Bool {
        return index > 0 &&
            index % 2 == 0 &&
            (rolls[index - 1] + rolls[index - 2] == COMPLETE_FRAME)
    }
}
