# dabbler_design_system

Shared design system package for the Dabbler sports app. The package exposes
Lite and Pro modes via the `AppMode` enum and provides themed components that
adapt visuals and density accordingly.

## Usage

Add the package as a git dependency in your app's `pubspec.yaml`:

```yaml
dependencies:
  dabbler_design_system:
    git:
      url: git@github.com:dabblersport/dabbler-design-system.git
      ref: main
```

Then consume the theme and components:

```dart
import 'package:dabbler_design_system/dabbler_design_system.dart';

MaterialApp(
  theme: DabblerTheme.theme(
    mode: AppMode.lite,
    brightness: Brightness.light,
  ),
  home: Scaffold(
    body: Center(
      child: DabblerButton.lite(
        label: 'Continue',
        onPressed: () {},
      ),
    ),
  ),
);
```

The same components can render in Pro mode by passing `AppMode.pro` to the
constructors or theme builder.
