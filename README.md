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
# Pointing to the official CocoaPods master repository
source 'https://cdn.cocoapods.org/'
# Pointing to the FalconMetrics private repository
source 'https://github.com/falconmetrics/falconmetrics-ios-pods.git'

....
 s.dependency 'FalconMetrics', '0.4.1'
```

### Swift Package Manager

Add the following to your App's `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/falconmetrics/falconmetrics-ios-spm.git", from: "0.4.1")
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
