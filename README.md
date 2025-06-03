# Book Spine Reader

A simple SwiftUI-based app and library to recognize book titles from images of book spines and search them using the Google Books API.

## Overview

This repository contains:

- `BookSpineReader` library with OCR and Google Books API integration.
- `BookSpineReaderApp` (SwiftUI iOS app) demonstrating usage.
- Unit tests for the core logic.

The first version focuses on processing a static image. Future versions may add live camera support.

## Getting Started

1. Open `IOSApp/BookSpineReaderApp.xcodeproj` in Xcode (requires Xcode 15 or later).
2. Build and run on an iOS device or simulator running iOS 15+.
3. Provide your own image to test text recognition. The previous sample image was removed to avoid storing binary files in the repository.

## Tests

Run the tests with `swift test`. The OCR tests require macOS/iOS SDKs and will be skipped on other platforms.

## License

MIT
