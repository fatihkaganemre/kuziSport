// Generated using Sourcery 0.16.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif

import Foundation

@testable import Karate













class InfoRouterTypeMock: InfoRouterType {
    var controller: UIViewController!

    //MARK: - call

    var callNumberCallsCount = 0
    var callNumberCalled: Bool {
        return callNumberCallsCount > 0
    }
    var callNumberReceivedNumber: String?
    var callNumberClosure: ((String) -> Void)?

    func call(number: String) {
        callNumberCallsCount += 1
        callNumberReceivedNumber = number
        callNumberClosure?(number)
    }

    //MARK: - open

    var openUrlCallsCount = 0
    var openUrlCalled: Bool {
        return openUrlCallsCount > 0
    }
    var openUrlReceivedUrl: URL?
    var openUrlClosure: ((URL) -> Void)?

    func open(url: URL) {
        openUrlCallsCount += 1
        openUrlReceivedUrl = url
        openUrlClosure?(url)
    }

}
class UIApplicationServiceMock: UIApplicationService {

    //MARK: - open

    var openPhoneNumberCallsCount = 0
    var openPhoneNumberCalled: Bool {
        return openPhoneNumberCallsCount > 0
    }
    var openPhoneNumberReceivedPhoneNumber: String?
    var openPhoneNumberClosure: ((String) -> Void)?

    func open(phoneNumber: String) {
        openPhoneNumberCallsCount += 1
        openPhoneNumberReceivedPhoneNumber = phoneNumber
        openPhoneNumberClosure?(phoneNumber)
    }

    //MARK: - openDeviceSettings

    var openDeviceSettingsCallsCount = 0
    var openDeviceSettingsCalled: Bool {
        return openDeviceSettingsCallsCount > 0
    }
    var openDeviceSettingsClosure: (() -> Void)?

    func openDeviceSettings() {
        openDeviceSettingsCallsCount += 1
        openDeviceSettingsClosure?()
    }

    //MARK: - open

    var openUrlCallsCount = 0
    var openUrlCalled: Bool {
        return openUrlCallsCount > 0
    }
    var openUrlReceivedUrl: URL?
    var openUrlClosure: ((URL) -> Void)?

    func open(url: URL) {
        openUrlCallsCount += 1
        openUrlReceivedUrl = url
        openUrlClosure?(url)
    }

}
