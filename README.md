# Interval Time Picker

[![pub package](https://img.shields.io/pub/v/interval_time_picker.svg?label=interval_time_picker&color=blue)](https://pub.dartlang.org/packages/interval_time_picker)

This package modifies the 2.8.0 (dev version) of the default Flutter Time Picker widget by adding interval options.

##### Update note
Version 1.0.0 now uses sound Null Safety and requires Dart SDK 2.12 or higher.

## Usage

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  ...
  interval_time_picker: ^1.0.0+3
```

On top of your code add the following import:

```dart
import 'package:interval_time_picker/interval_time_picker.dart';
```

In your code you can then call:

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

In most cases it is recommended to set the Interval and VisibleStep as the same:
i.e. respectively `5` and `VisibleStep.Fifths` or `12` and `VisibleStep.Twelfths`.

##### Interval
`interval` is the steps the Interval Time Picker uses when validating the chosen time (minutes) as well as the steps it rounds off to.\
The default and minimum value is 1 minute. The maximum is 30 minute.

It is actually possible to also use an interval that is not a factor of 60.\
So i.e., if you are weird and want to use 7 you can use that. In that case the highest pickable minute is 56 and going higher will pick 0.

This package also fixes the issue that individual minutes are only selectable by dragging the ring:\
[Flutter issue #62424](https://github.com/flutter/flutter/issues/62424)

##### VisibleStep
`visibleStep` are the minute labels that are visible on the ring. Choose the steps by using the `VisibleStep` enum.\
The options are a factor of 60 with 5 being the lowest and 30 being the highest. The default value is `VisibleStep.Fifths`.

## Disclaimer

If the initial minute is not a multiplication of the interval it will show that minute.
So handle this yourself when calling `showIntervalTimePicker`.

The latest release has only been tested with Flutter version 2.5.3 (stable).
