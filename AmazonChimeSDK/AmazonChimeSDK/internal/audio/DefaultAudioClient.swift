//
//  DefaultAudioClient.swift
//  AmazonChimeSDK
//
//  Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0
//

import AmazonChimeSDKMedia
import Foundation

public class DefaultAudioClient: AudioClient {
    private static var logger: Logger?
    private static var sharedInstance: DefaultAudioClient?

    public static func shared(logger: Logger) -> DefaultAudioClient {
        DefaultAudioClient.logger = logger
        if sharedInstance == nil {
            sharedInstance = DefaultAudioClient()
        }
        return sharedInstance!
    }

    public override func audioLogCallBack(_ logLevel: loglevel_t, msg: String?) {
        guard let msg = msg else { return }
        switch logLevel.rawValue {
        case Constants.errorLevel, Constants.fatalLevel:
            DefaultAudioClient.logger?.error(msg: msg)
        default:
            DefaultAudioClient.logger?.default(msg: msg)
        }
    }
}
