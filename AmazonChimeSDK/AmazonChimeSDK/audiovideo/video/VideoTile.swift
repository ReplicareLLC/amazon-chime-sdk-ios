//
//  VideoTile.swift
//  AmazonChimeSDK
//
//  Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0
//

import Foundation
import VideoToolbox

/// `VideoTile` is a tile that binds video render view to diplay the frame into the view.
@objc public protocol VideoTile: VideoSink {
    /// State of VideoTile
    var state: VideoTileState { get }

    /// View which will be used to render the Video Frame
    var videoRenderViews: [VideoRenderView] { get set }

    /// Binds the view to the tile. The view needs to be create by the application.
    /// Once the binding is done, the view will start displaying the video frame automatically
    ///
    /// - Parameter videoRenderView: the view created by application to render the video frame
    func bind(videoRenderView: VideoRenderView)

    /// Unbinds the `videoRenderView` from tile.
    func unbind(videoRenderView: VideoRenderView)

    /// Update the pause state of the tile.
    func setPauseState(pauseState: VideoPauseState)
}
