//
//  ZTUserDefault.swift
//  UserDefaultDemo
//
//  Created by zt on 2024/8/27.
//

import Foundation
import Combine

public protocol ZTCoding : Codable {}


@propertyWrapper
public class UserDefault<T: Codable> {
    private let key: String
    private let userDefaults: UserDefaults

    @Published private var value: T
    private var cancellables = Set<AnyCancellable>()

    public init(key: String, defaultValue: T, userDefaults: UserDefaults = .standard) {
        self.key = key
        self.userDefaults = userDefaults
        self.value = Self.getValue(forKey: key, userDefaults: userDefaults) ?? defaultValue

        $value
            .sink { newValue in
                if T.self is ZTCoding.Type {
                    let encodedValue = try? JSONEncoder().encode(newValue)
                    userDefaults.set(encodedValue, forKey: key)
                } else {
                    userDefaults.set(newValue, forKey: key)
                }
            }
            .store(in: &cancellables)
    }

    public var wrappedValue: T {
        get { value }
        set { value = newValue }
    }

    public var projectedValue: Published<T>.Publisher {
        $value
    }

    private static func getValue(forKey key: String, userDefaults: UserDefaults) -> T? {
        if T.self is ZTCoding.Type {
            guard let data = userDefaults.data(forKey: key),
                  let decodedValue = try? JSONDecoder().decode(T.self, from: data) else {
                return nil
            }
            return decodedValue
        }
        return userDefaults.value(forKey: key) as? T
    }
}


@propertyWrapper
public class UserDefaultOptional<T: Codable> {
    private let key: String
    private let userDefaults: UserDefaults

    @Published private var value: T?
    private var cancellables = Set<AnyCancellable>()

    public init(key: String, defaultValue: T? = nil, userDefaults: UserDefaults = .standard) {
        self.key = key
        self.userDefaults = userDefaults
        self.value = Self.getValue(forKey: key, userDefaults: userDefaults) ?? defaultValue

        $value
            .sink { [weak self] newValue in
                if let value = newValue {
                    if T.self is ZTCoding.Type {
                        let encodedValue = try? JSONEncoder().encode(value)
                        self?.userDefaults.set(encodedValue, forKey: key)
                    } else {
                        self?.userDefaults.set(value, forKey: key)
                    }
                } else {
                    self?.userDefaults.removeObject(forKey: key)
                }
            }
            .store(in: &cancellables)
    }

    public var wrappedValue: T? {
        get { value }
        set { value = newValue }
    }

    public var projectedValue: Published<T?>.Publisher {
        $value
    }

    private static func getValue(forKey key: String, userDefaults: UserDefaults) -> T? {
        if T.self is ZTCoding.Type {
            guard let data = userDefaults.data(forKey: key),
                  let decodedValue = try? JSONDecoder().decode(T.self, from: data) else {
                return nil
            }
            return decodedValue
        }
        return userDefaults.value(forKey: key) as? T
    }
}
