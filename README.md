# ZTUserDefault

## Introduction
`ZTUserDefault`is a lightweight Swift library that provides a powerful and convenient way to manage UserDefaults with support for reactive programming using Combine. The library simplifies the process of storing, retrieving, and observing changes to UserDefaults, while supporting custom Codable types.

### Key Features
- **Generic UserDefaults Management**: Easily store and retrieve any Codable type in UserDefaults.
- **Combine Support**: Observe changes in UserDefaults using Combine, enabling reactive programming patterns.
- **Custom Codable Support**: Automatically encode and decode custom types conforming to `ZTCoding`.
- **Optional Value Handling**: Safely handle optional values and remove UserDefaults keys when values are set to `nil`.

## Requirements
- iOS 13.0+
- macOS 10.15+
- Swift 5.2+

## Installation

### Swift Package Manager
Add ZTUserDefault as a dependency in your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/willonboy/ZTUserDefault.git", from: "1.0.0")
]
```

## Usage
Basic Example

```swift
import ZTUserDefault

class Settings: ObservableObject {
    @UserDefault(key: "username", defaultValue: "Guest")
    var username: String

    @UserDefaultOptional(key: "accessToken")
    var accessToken: String?
}

```
Custom Codable Types

```swift
struct User: ZTCoding {
    let id: Int
    let name: String
}

class Settings: ObservableObject {
    @UserDefault(key: "user", defaultValue: User(id: 0, name: "Guest"))
    var user: User
}

```

Observing Changes

```swift
settings.$username
    .sink { newValue in
        print("Username changed to \(newValue)")
    }
    .store(in: &cancellables)

```


## License
ZTUserDefault is available under the MPL-2.0 license. See the [LICENSE](LICENSE) file for more information.
