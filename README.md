# DropShadow

[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)

Drop shadow effect for any widget in flutter

![Cover](https://github.com/rei-codes/drop_shadow/raw/main/cover.jpeg)

## Logic behind the package
![Logic](https://github.com/rei-codes/drop_shadow/raw/main/logic.jpeg)


For Further information check out [the article](https://itnext.io/drop-shadow-effect-on-any-widget-in-flutter-c6cec51329dd)


## Screenshot 
![screenshot](https://github.com/rei-codes/drop_shadow/blob/main/screenshot.jpg)

## Example Usage
```dart
DropShadow(
  child: Image.network(
    'https://images.pexels.com/photos/1191639/pexels-photo-1191639.jpeg',
    width: 250,
  ),
);

```

## Parameters
|  Type 	|  Name 	|   Value	|  
|---	|---	|---	|
| Widget | child  	|   required	| 
| double  	|   blurRadius	|   10.0	|  
| double  	|  borderRadius 	|  0.0 	|  
| Offset  	|   offset	|  Offset(0.0, 8.0) 	|  
| double  	|  opacity 	|   1.0 	|  
| double  	|  spread 	|    1.0	|  