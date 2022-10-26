# greengrocer

Projeto voltado para o aprendizado do uso do GetX como gerenciador de estato.

<table>
    <tr>
        <th>Login</th>
        <th>Cadastro</th>
        <th>Lista de produtos</th>
        <th>Carrinho</th>
        <th>Pedido</th>
        <th>Pix</th>
        <th>Detalhes</th>
    </tr>
    <td><img src="https://user-images.githubusercontent.com/3439261/196536601-ccdeeeda-23fa-44eb-83a5-db6d7b64fcd3.jpg" width="128"/></td>
    <td><img src="https://user-images.githubusercontent.com/3439261/196535345-7e5523b1-76c8-4b84-ab0f-340d00de7c80.jpg" width="128"/></td>
    <td><img src="https://user-images.githubusercontent.com/3439261/196535384-8b007725-e149-4969-ba19-ad8f5fb50aa1.jpg" width="128"/></td>
    <td><img src="https://user-images.githubusercontent.com/3439261/196535415-d50a0f5e-79ff-488f-8183-10bb50ed42ac.jpg" width="128"/></td>
    <td><img src="https://user-images.githubusercontent.com/3439261/196535462-754c4aea-31d4-4acc-bf10-08194700c10e.jpg" width="128"/></td>
    <td><img src="https://user-images.githubusercontent.com/3439261/196535527-fe246416-6f11-4122-ae0b-fc99977fe880.jpg" width="128"/></td>
    <td><img src="https://user-images.githubusercontent.com/3439261/196535698-c6eed2ec-599d-478c-85ea-d356a8350f7d.jpg" width="128"/></td>
</table>

## Dependencies

- json_serializable ^6.5.1
- animated_text_kit: ^4.2.2
- mask_text_input_formatter: ^2.4.0
- badges: ^2.0.3
- intl: ^0.17.0
- qr_flutter: ^4.0.0
- fluttertoast: ^8.0.9
- shimmer: ^2.0.0
- get: ^4.6.5
- dio: ^4.0.6
- json_annotation: ^4.7.0

## Dev_dependencies
- flutter_lints: ^2.0.0
- flutter_launcher_icons: ^0.10.0
- json_serializable: ^6.5.1
- build_runner: ^2.3.0

## Command to generate icons
```batch
    flutter pub run flutter_launcher_icons:main
```

## Command to Auto-generate toJson, fromJson
``` batch
    flutter pub run build_runner build OR
    flutter pub run build_runner watch
```

## Command to clean Auto-generate .g
``` batch
    flutter pub run build_runner build --delete-conflicting-outputs OR
    flutter pub run build_runner watch --delete-conflicting-outputs
```

## Run adb wi-fi
``` batch
    adb connect 192.168.1.4:5555
```
