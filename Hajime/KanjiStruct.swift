//
//  KanjiStruct.swift
//  Hajime
//
//  Created by Alex Vargas  on 17/04/21.
//

import Foundation

struct kanjiData: Codable {

    let kanji:String

    let grade:Int

    let stroke_count:Int

    let meanings:[String]

    let kun_readings:[String]

    let on_readings:[String]

    let name_readings:[String]

    let jlpt:Int

    let unicode:String

    let heisig_en:String

}

/*
 {
   "kanji": "日",
   "grade": 1,
   "stroke_count": 4,
   "meanings": [
     "day",
     "sun",
     "Japan",
     "counter for days"
   ],
   "kun_readings": [
     "ひ",
     "-び",
     "-か"
   ],
   "on_readings": [
     "ニチ",
     "ジツ"
   ],
   "name_readings": [
     "あ",
     "あき",
     "いる",
     "く",
     "くさ",
     "こう",
     "す",
     "たち",
     "に",
     "にっ",
     "につ",
     "へ"
   ],
   "jlpt": 4,
   "unicode": "65e5",
   "heisig_en": "day"
 }
 */
