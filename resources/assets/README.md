# Генерация ICO

Этот каталог содержит исходный PNG-логотип и инструкции по созданию
Windows-иконки `.ico` с прозрачным фоном.
[Руководство](https://learn.microsoft.com/en-us/windows/apps/design/style/iconography/app-icon-construction) по созданию иконок от Microsoft

## Требования

- macOS
- Homebrew
- ImageMagick

### Установка ImageMagick

```bash
brew install imagemagick
```

### Проверка установки

```bash
magick --version
```

### Выполнить в этой директории

```bash
magick Icon16.png Icon20.png Icon24.png Icon30.png Icon32.png Icon36.png Icon40.png Icon48.png Icon60.png Icon64.png Icon72.png Icon80.png Icon96.png Icon256.png Icon.ico
```

В результате будет создан файл: `Icon.ico`
