//
//  IntentHandler.swift
//  SiriExempleIntent
//
//  Created by Rayane Xavier on 06/04/20.
//  Copyright © 2020 Rayane Xavier. All rights reserved.
//

import Intents

class IntentHandler: INExtension {
    override func handler(for intent: INIntent) -> Any? {
        return SomaHandler()
    }
}
