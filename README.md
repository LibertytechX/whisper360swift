# Whisper360 for iOS

Whisper360 in-app chat and voice/video calling for iOS, as a Swift package: a headless client for
the Whisper360 mobile endpoints plus drop-in SwiftUI screens styled from your Whisper360 console.

This repository distributes the SDK as a **prebuilt binary** (`Whisper360.xcframework`). It
requires a Whisper360 account and an installation key from the Whisper360 console.

- iOS 15+, Xcode 26+ (Swift 6.2 toolchain, needed by the LiveKit dependency)
- Depends on [LiveKit's Swift SDK](https://github.com/livekit/client-sdk-swift-xcframework) (resolved automatically)

## Install

Swift Package Manager, in Xcode (**File → Add Package Dependencies…**) or `Package.swift`:

```swift
.package(url: "https://github.com/LibertytechX/whisper360swift.git", from: "0.1.1")
```

## Use

```swift
import Whisper360
import SwiftUI

let client = Whisper360Client(
    baseURL: URL(string: "https://api.whisper360.io")!,
    installationKey: "mi_…"   // from the Whisper360 console; not a secret
)

struct ContentView: View {
    var body: some View { Whisper360ChatView(client: client) }
}
```

`Whisper360ChatView` renders Chat, Call and Video tabs, styled from your console settings. Use
`Whisper360FloatingButton(client:)` for a floating "chat with us" button that opens the same screen.

For calling, add `NSMicrophoneUsageDescription` (and `NSCameraUsageDescription` for video) to your
`Info.plist`. For calls while the app is in the background, enable the Push Notifications capability
and Background Modes → Voice over IP.

Optionally pass `visitorName`, `visitorEmail`, `visitorPhone` and `visitorKey` to the client when
your app knows who is calling.

## Licence

Proprietary — see [LICENSE](LICENSE). Third-party: LiveKit is Apache-2.0 ([LICENSE-LiveKit](LICENSE-LiveKit)).
