//
//  KanjiStruct.swift
//  Hajime
//
//  Created by Alex Vargas  on 17/04/21.
//

import Foundation

struct kanjiData: Codable {

    var kanji:String

    var grade:Int

    var stroke_count:Int

    var meanings:[String]

    var kun_readings:[String]

    var on_readings:[String]

    var name_readings:[String]

    var jlpt:Int

    var unicode:String

    var heisig_en:String

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
