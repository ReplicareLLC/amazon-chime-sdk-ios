//
//  DefaultAudioVideoFacade.swift
//  SwiftTest
//
//  Created by Xu, Tianyu on 1/10/20.
//  Copyright © 2020 Amazon Chime. All rights reserved.
//

import Foundation

public class DefaultAudioVideoFacade: AudioVideoFacade {

    public let configuration: MeetingSessionConfiguration
    public let logger: Logger

    let audioVideoController: AudioVideoControllerFacade
    let realtimeController: RealtimeControllerFacade
    let deviceController: DeviceController

    init(
        audioVideoController: AudioVideoControllerFacade,
        realtimeController: RealtimeControllerFacade,
        deviceController: DeviceController) {
        self.audioVideoController = audioVideoController
        self.realtimeController = realtimeController
        self.deviceController = deviceController

        configuration = audioVideoController.configuration
        logger = ConsoleLogger(name: "DefaultAudioVideoFacade")
    }

    public func start() throws {
        try self.audioVideoController.start()
        trace(name: "start")
    }

    public func stop() {
        self.audioVideoController.stop()
        trace(name: "stop")
    }

    private func trace(name: String) {
        let message = "API/DefaultAudioVideoFacade/\(name)"
        self.audioVideoController.logger.info(msg: message)
    }

    // MARK: RealtimeControllerFacade
    public func realtimeLocalMute() -> Bool {
        return self.realtimeController.realtimeLocalMute()
    }

    public func realtimeLocalUnmute() -> Bool {
        return self.realtimeController.realtimeLocalUnmute()
    }

    public func realtimeAddObserver(observer: RealtimeObserver) {
        self.realtimeController.realtimeAddObserver(observer: observer)
    }

    public func realtimeRemoveObserver(observer: RealtimeObserver) {
        self.realtimeController.realtimeRemoveObserver(observer: observer)
    }

    public func addObserver(observer: AudioVideoObserver) {
        self.audioVideoController.addObserver(observer: observer)
    }

    public func removeObserver(observer: AudioVideoObserver) {
        self.audioVideoController.removeObserver(observer: observer)
    }

    // MARK: DeviceController
    public func listAudioInputDevices() -> [MediaDevice] {
        return self.deviceController.listAudioInputDevices()
    }

    public func listAudioOutputDevices() -> [MediaDevice] {
        return self.deviceController.listAudioOutputDevices()
    }

    public func chooseAudioInputDevice(device: MediaDevice) {
        self.deviceController.chooseAudioInputDevice(device: device)
    }

    public func chooseAudioOutputDevice(device: MediaDevice) {
        self.deviceController.chooseAudioOutputDevice(device: device)
    }
}
