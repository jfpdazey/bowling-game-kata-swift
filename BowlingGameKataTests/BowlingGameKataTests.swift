//
//  BowlingGameKataTests.swift
//  BowlingGameKataTests
//
//  Created by John Dazey on 5/10/17.
//  Copyright © 2017 Pillar Technology. All rights reserved.
//

import XCTest
@testable import BowlingGameKata

class BowlingGameKataTests: XCTestCase {
    var bowlingGame: BowlingGame!

    override func setUp() {
        super.setUp()

        bowlingGame = BowlingGame()
    }

    func testWhenASinglePinIsHitInTheEntireGameThenTheScoreIsOne() {
        let score = bowlingGame.scoreGame([1] + roll(19))

        XCTAssertEqual(score, 1)
    }

    func testWhenASecondRollHitsTwoPinsInTheEntireGameThenTheScoreIsThree() {
        let score = bowlingGame.scoreGame([1, 2] + roll(18))

        XCTAssertEqual(score, 3)
    }

    func testWhenTheFirstTwoRollsAreSparicalThenTheNextRollIsAddedToTheSumTwice() {
        let score = bowlingGame.scoreGame([1, 9, 1, 3] + roll(16))

        XCTAssertEqual(score, 15)
    }

    func testWhenRollIsStrikinatedThenNextTwoRollsAreAddedToTheSumTwice() {
        let score = bowlingGame.scoreGame([10, 1, 2] + roll(17))

        XCTAssertEqual(score, 16)
    }

    func testASpareWithFirstRollOfZeroIsNotMistakenForAStrike() {
        let score = bowlingGame.scoreGame([0, 10, 1, 2] + roll(16))

        XCTAssertEqual(score, 14)
    }

    func xtestAnOpenFrameAfterStrike() {
        let score = bowlingGame.scoreGame([10,0,1] + roll(16))

        XCTAssertEqual(score, 12)
    }

    private func roll(_ n: Int, pins: Int = 0) -> [Int] {
        return [Int](repeating: pins, count: n)
    }

}


