//
//  CwtEnumPort.swift
//
//
//  Created by Devin McKaskle on 9/25/23.
//


// You cannot mix and match Objective-C and Swift files in a package.
// I am porting these Objective-C types over to Swift language so that
// the package will compile.


import Foundation


// CwtInputModelConfig represents the input model configuration used to
// set up the CWT model. This is the same as TFLiteModel::InputModelConfig.
public struct CwtInputModelConfig {
    
    public init(in_height: Int32, in_width: Int32, in_channels: Int32, model_range_min: Int32, model_range_max: Int32) {
        self.in_height = in_height
        self.in_width = in_width
        self.in_channels = in_channels
        self.model_range_min = model_range_min
        self.model_range_max = model_range_max
    }

    public var in_height: Int32

    public var in_width: Int32

    public var in_channels: Int32

    
    public var model_range_min: Int32

    public var model_range_max: Int32
}

// CwtModelState represents the state of the model. This is the same as
// TFLiteModel::ModelState.
public enum CwtModelState : UInt, @unchecked Sendable {

    
    case EMPTY = 0

    case LOADING = 1

    case LOADED = 2

    
    case FAILED_TO_INIT_MODEL = 1000

    case FAILED_TO_INIT_INTERPRETER = 1001

    case FAILED_TO_ALLOC_MEMORY = 1002

    case FAILED_TO_DOWNLOAD_MODEL = 1003

    case FAILED_TO_PREDICT = 1004
}

// CwtPredictResult represents the result of predict invoking a model.
public enum CwtPredictResult : UInt, @unchecked Sendable {

    
    case SUCCESS = 0

    case ERROR = 1
}

