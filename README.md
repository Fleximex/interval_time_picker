# Interval Time Picker

[![pub package](https://img.shields.io/pub/v/interval_time_picker.svg?label=interval_time_picker&color=blue)](https://pub.dartlang.org/packages/interval_time_picker)

This package modifies the default Flutter Time Picker widget by adding interval options when picking minutes. This means you can restrict the user from picking only certain intervals of minutes and you can choose to which interval of minutes the Time Picker will snap to in dial mode.


## Update notes
* Version 1.0.0 requires Dart SDK 2.12.0 (Flutter 2.0.0) or higher.
* Version 2.0.0 requires Dart SDK 2.18.0 (Flutter 3.1.0) or higher.
* Version 3.0.0 requires Dart SDK 3.0.0 (Flutter 3.10.0) or higher.
* Breaking change for 2.0.0: The VisibleStep enum values now start with lowercase

## Usage

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  ...
  interval_time_picker: ^3.0.1+7
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
    visibleStep: VisibleStep.fifths,
);
```

## Explanation

This package adds two parameters:
* `interval`
* `visibleStep`

In most cases it is recommended to set the Interval and VisibleStep as the same:
i.e. respectively `5` and `VisibleStep.fifths` or `12` and `VisibleStep.twelfths`.

##### Interval
The `interval` parameter is the steps the Interval Time Picker uses when validating the chosen time (minutes) as well as the steps it rounds off to.\
The default and minimum value is 1 minute. The maximum is 60 minutes.

It is actually possible to also use an interval that is not a factor of 60.\
So i.e., if you want to use 7 you can use that as well. In that case the highest pickable minute is 56 and going higher will pick 0.

This package also fixes the issue that individual minutes are only selectable by dragging the ring:\
[Flutter issue #62424](https://github.com/flutter/flutter/issues/62424)

##### VisibleStep
The `visibleStep` parameter is the minute labels that are visible on the ring. Choose the steps by using the `VisibleStep` enum.\
The options are a factor of 60 with 5 being the lowest and 60 (shown as 00) being the highest. The default value is `VisibleStep.fifths`.

## Disclaimers

* If the initial minute is not a multiplication of the interval it will still pick that minute.
  So handle this yourself when calling `showIntervalTimePicker`.

* For Flutter 2.0.0 until 2.10.5 use v1.1.x of this package:\
  this version modifies Flutter 2.8.0's Time Picker

* For Flutter 3.1.0 until 3.7.12 use v2.x.x of this package:\
  this version modifies Flutter 3.3.0's Time Picker

* For Flutter 3.10.0 or higher use v3.x.x of this package:\
  this version modifies Flutter 3.22.0's Time Picker

## Contributions
- https://github.com/markj
- https://github.com/MarkCLinovy
- https://github.com/nilsreichardt
- https://github.com/hromov
