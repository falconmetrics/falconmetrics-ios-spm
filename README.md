# FalconMetrics iOS SDK

The FalconMetrics iOS SDK enables seamless tracking of user conversion events in iOS applications. This SDK helps developers integrate powerful analytics and attribution capabilities to measure campaign performance, track user engagement, and analyze purchasing behaviors.

## Requirements

- iOS 13.0+
- Swift 5.5+
- Xcode 13.0+

## Installation

### CocoaPods
Add the following to your App's `Podfile`:

```ruby
pod 'FalconMetrics', '1.0.0'
```

### Swift Package Manager

Add the following to your App's `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/falconmetrics/falconmetrics-ios-spm.git", from: "1.0.0")
]
```

## Quick Start

### Initialize the SDK

Initialize the FalconMetrics SDK as early as possible in your app's lifecycle:

```swift
import FalconMetrics
import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Initialize FalconMetrics and store the task reference
    let initTask = Task {
        await FalconMetricsSdk.shared.initialize(apiKey: "YOUR_API_KEY")
    }
    // Optionally wait for initialization to complete
    // Task { await initTask.value }
    
    return true
}
```

### Track Events

The SDK supports tracking various events with a simple, flexible, and type-safe API using specialized builders for each event type:

```swift
// Track a signup event
Task {
    await FalconMetricsSdk.shared.createCompleteRegistrationBuilder().track()
}

// Track an add to cart event
Task {
    await FalconMetricsSdk.shared.createAddToCartBuilder()
        .withItemIds(["product-123","product-456"])
        .withQuantity(1)
        .withProductPrice(1999)
        .withCurrency("USD")
        .withProductCategory("Electronics")
        .withCartId("cart-456")
        .track()
}

// Track a purchase event
Task {
    await FalconMetricsSdk.shared.createPurchaseBuilder()
        .withItemIds(["product-123","product-456"])
        .withQuantity(1)
        .withTransactionId("tx-789")
        .withProductPrice(1999)
        .withCurrency("USD")
        .withProductCategory("Electronics")
        .withCartId("cart-456")
        .withPaymentMethod("credit_card")
        .withTax(150)
        .withShipping(499)
        .withDiscount(200)
        .track()
}

// Track a subscription event
Task {
    await FalconMetricsSdk.shared.createSubscribeBuilder()
        .withCurrency("USD")
        .withpredictedLtvValueInCents(10000)
        .track()
}

// Track a custom event
//
// You can add optionally revenue and a currency to the event to write revenue to the ad network.
Task {
    await FalconMetricsSdk.shared.createCustomEventBuilder()
        .withEventName("custom_event")
        .withEventAttributes(["key1": "value1", "key2": 100])
        .withCurrency("USD")
        .withRevenueInCents(10000)
        .track()
}
```

## IDFA and App Tracking Transparency

The SDK provides methods to handle IDFA (Identifier for Advertisers) and App Tracking Transparency compliance:

### Prerequisites
Add NSUserTrackingUsageDescription to your Info.plist with a clear purpose string.

```xml
<key>NSUserTrackingUsageDescription</key>
<string>We use IDFA to track user behavior and improve our services.</string>
```

- Ensure your privacy manifest (PrivacyInfo.xcprivacy) accurately declares tracking if applicable.
- Only show the ATT prompt when status is `.notDetermined` and after context-setting UI.

### Request IDFA Permission

Request permission to track users across apps and websites:

```swift
Task {
    let current = FalconMetricsSdk.shared.getTrackingAuthorizationStatus()
    if current == .notDetermined {
        let status = await FalconMetricsSdk.shared.requestIDFAPermission()
        print("Tracking authorization status: \(status)")
    } else {
        print("Tracking authorization status (no prompt): \(current)")
    }
}
```

### Check Current Authorization Status

Get the current App Tracking Transparency authorization status:

```swift
let status = FalconMetricsSdk.shared.getTrackingAuthorizationStatus()
switch status {
case .authorized:
    print("Tracking is authorized")
case .denied:
    print("Tracking is denied")
case .notDetermined:
    print("Tracking authorization not determined")
case .restricted:
    print("Tracking is restricted")
@unknown default:
    print("Unknown tracking status")
}
```

### Get IDFA

Retrieve the IDFA if tracking is authorized:

```swift
if let idfa = FalconMetricsSdk.shared.getIDFA() {
    print("IDFA: \(idfa)")
} else {
    print("IDFA not available - tracking not authorized")
}
```

## Tracking Control

The SDK provides methods to enable or disable tracking for privacy compliance:

### Enable/Disable Tracking

Control whether the SDK tracks events:

```swift
// Disable tracking (for privacy compliance)
Task {
    await FalconMetricsSdk.shared.setTracking(enabled: false)
}

// Re-enable tracking
Task {
    await FalconMetricsSdk.shared.setTracking(enabled: true)
}
```

### Check Tracking Status

Check if tracking is currently enabled:

```swift
Task {
    let isEnabled = await FalconMetricsSdk.shared.isTrackingEnabled()
    if isEnabled {
        print("Tracking is enabled")
    } else {
        print("Tracking is disabled")
    }
}
```

**Important Notes:**
- Tracking is **enabled by default** when the SDK is first initialized
- When tracking is disabled, all event tracking calls are ignored
- SKAdNetwork postback initialization is skipped when tracking is disabled
- The tracking preference is persisted across app launches
- This setting is independent of IDFA/ATT authorization status

## Best Practices

1. **Initialize Early**: Initialize the SDK as early as possible in your app's lifecycle to ensure all events are captured.

2. **Event Consistency**: Send consistent event parameters across sessions to ensure accurate analytics.

3. **Price Formatting**: With the new API, you can use decimal values (e.g., 19.99) for prices and amounts. The SDK automatically converts these to cents internally.

4. **Error Handling**: The SDK handles errors internally and won't throw exceptions, but it's good practice to wrap tracking calls in a Task.

5. **Unique Identifiers**: Use consistent and unique identifiers for products, carts, and transactions.

6. **Builder Pattern**: Use the builder pattern to add optional parameters to events. Only the required parameters are needed in the initial method call.

7. **Type Safety**: Take advantage of the type-safe `TrackingEvent` protocol when creating custom events to ensure compile-time validation.

8. **Event Type Enum**: Always use the `EventType` enum for event types rather than string literals to benefit from compiler checks and code completion.

9. **Type Erasure**: Use `AnyTrackingEvent` when you need to store or pass events of different types through a common interface.

## License

© 2025 FalconMetrics LLC. All rights reserved.

This SDK is licensed under the FalconMetrics SDK License Addendum and is subject to the FalconMetrics Terms of Use, available at: https://www.falconmetrics.io/terms
