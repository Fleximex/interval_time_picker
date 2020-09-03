# Interval Time Picker

This package modifies the 1.20.2 release of the default Flutter Time Picker widget by adding interval options.

This package was made in response to [Flutter issue #60573](https://github.com/flutter/flutter/issues/60573)

## Usage

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  ...
  interval_time_picker: "^0.1.0"
```

In your library add the following import:

```dart
import 'package:interval_time_picker/interval_time_picker.dart';
```

In your project you can then call:

```dart
showIntervalTimePicker(
    context: context,
    initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    interval: 5,
    visibleStep: VisibleStep.Fifths,
);
```

## Explanation

This package adds two parameters:
* `interval`
* `visibleStep`

`interval` is the steps the Interval Time Picker uses when validating the chosen time (minutes) as well as the steps it rounds off to.\
The default and minimum value is 1 minute. The maximum is 30 minute.

It is actually possible to also use an interval that is not a factor of 60.\
So i.e., if you are weird and want to use 7 you can use that. In that case the highest pickable number is 56 and going higher will pick 0.

This package also fixes the issue that individual minutes are only selectable by dragging the ring:\
[Flutter issue #62424](https://github.com/flutter/flutter/issues/62424)

`visibleStep` are the steps (minutes) that are visible on the ring. Choose the steps by using the `VisibleStep` enum.\
The options are a factor of 60 with 5 being the lowest and 30 being the highest. The default value is `VisibleStep.Fifths`.

## Disclaimer

If the initial minute is not a multiplication of the interval it will show that minute.
So handle this yourself when calling `showIntervalTimePicker`.

This package is only tested on Android with Flutter version 1.20.2
