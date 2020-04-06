//
//  SomaHandler.swift
//  AulaSiriKit
//
//  Created by Rayane Xavier on 06/04/20.
//  Copyright © 2020 Rayane Xavier. All rights reserved.
//

import Foundation
import Intents

public class SomaHandler: NSObject, SomaIntentHandling {
    //O usuário já usou o intent e o aplicativo tem que resolver o que fazer
    
    public func handle(intent: SomaIntent, completion: @escaping (SomaIntentResponse) -> Void) {
        guard let x = intent.x, let y = intent.y else {
            let error = SomaIntentResponse(code: .dadosinsuficientes, userActivity: .none)
            completion(error)
            return
        }
        let xDouble = Double(truncating: x)
        let yDouble = Double(truncating: y)
        let soma = NSNumber(floatLiteral: xDouble + yDouble)
        let sucesso = SomaIntentResponse.success(response: soma)
        completion(sucesso)
    }
    
    // Validar os imputes do usuario
    public func resolveX(for intent: SomaIntent, with completion: @escaping (SomaXResolutionResult) -> Void) {
        if let x = intent.x {
            let xDouble = Double(truncating: x)
            completion(SomaXResolutionResult.success(with: xDouble))
        } else {
            completion(SomaXResolutionResult.needsValue())
        }
    }
    
    public func resolveY(for intent: SomaIntent, with completion: @escaping (SomaYResolutionResult) -> Void) {
        if let y = intent.y {
            let yDouble = Double(truncating: y)
            completion(SomaYResolutionResult.success(with: yDouble))
        } else {
            completion(SomaYResolutionResult.needsValue())
        }
    }
    
    
}
