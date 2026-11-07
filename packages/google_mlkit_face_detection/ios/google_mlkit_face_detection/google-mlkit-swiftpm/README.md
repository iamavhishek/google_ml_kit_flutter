# google-mlkit-swiftpm (local fork)

Vendored copy of [d-date/google-mlkit-swiftpm](https://github.com/d-date/google-mlkit-swiftpm)
at tag `9.0.2`.

Only one change is applied:

```diff
- .package(url: "https://github.com/google/gtm-session-fetcher.git", from: "3.5.0"),
+ .package(
+   url: "https://github.com/google/gtm-session-fetcher.git",
+   "3.5.0"..<"5.0.0"
+ ),
```

Upstream pins `GTMSessionFetcher` to 3.x. Firebase iOS SDK 13.x requires
`GTMSessionFetcher` 4.x, so the SPM graph cannot resolve otherwise. ML Kit's
binary frameworks do not use APIs removed in GTMSessionFetcher 4.0, and the
upper bound stays below 5.0 to select the closest compatible 4.x release.

Remove this copy and switch back to the remote package once
`google-mlkit-swiftpm` widens its own dependency range.
