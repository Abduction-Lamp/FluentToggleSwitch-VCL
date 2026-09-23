# Иконка приложения и палитры

Здесь лежит исходный логотип и всё, из чего собирается `Icon.ico`.

Источник — `toggle-left.svg`. Из него выведены PNG всех размеров, которые
просит [руководство Microsoft по иконкам](https://learn.microsoft.com/en-us/windows/apps/design/style/iconography/app-icon-construction):
от `toggle-left.png` в 16 пикселей до `toggle-left-18.png` в 256. Фон
прозрачный.

Имена не говорят о размере: суффикс — просто порядковый номер. Размеры такие.

| Файл | Размер | | Файл | Размер |
|------|--------|---|------|--------|
| `toggle-left.png` | 16 | | `toggle-left-10.png` | 52 |
| `toggle-left-2.png` | 20 | | `toggle-left-11.png` | 56 |
| `toggle-left-3.png` | 24 | | `toggle-left-12.png` | 64 |
| `toggle-left-4.png` | 28 | | `toggle-left-13.png` | 72 |
| `toggle-left-5.png` | 32 | | `toggle-left-14.png` | 80 |
| `toggle-left-6.png` | 36 | | `toggle-left-15.png` | 88 |
| `toggle-left-7.png` | 40 | | `toggle-left-16.png` | 96 |
| `toggle-left-8.png` | 44 | | `toggle-left-17.png` | 100 |
| `toggle-left-9.png` | 48 | | `toggle-left-18.png` | 256 |

## Сборка `Icon.ico`

Нужен ImageMagick: `brew install imagemagick`, проверить `magick --version`.

Выполнять в этом каталоге:

```bash
magick toggle-left.png toggle-left-2.png toggle-left-3.png toggle-left-5.png \
       toggle-left-7.png toggle-left-9.png toggle-left-12.png toggle-left-16.png \
       toggle-left-18.png Icon.ico
```

Взяты девять размеров, которые Windows действительно спрашивает: 16, 20, 24,
32, 40, 48, 64, 96 и 256. Остальные PNG остаются для случаев, когда нужен
отдельный размер без иконки.

## Иконка палитры

Значок компонента в палитре IDE лежит в `resources/FluentToggleSwitchIcons.dcr`
и собирается из `resources/FluentToggleSwitchIcons.rc`. Файлы, на которые
ссылается `.rc`, лежат рядом с ним:

- `TFluentToggleSwitch.png`, `TFluentToggleSwitch16.png`,
  `TFluentToggleSwitch32.png`, `TFluentToggleSwitch128.png` — то, что IDE
  показывает начиная с 10.2.2: PNG с прозрачностью в 24, 16, 32 и 128
  пикселей, ресурсы `RCDATA` с суффиксом `_PNG`. Первые три попиксельно
  совпадают с `toggle-left-3.png`, `toggle-left.png` и `toggle-left-5.png`;
  128 получен из `toggle-left-18.png`:
  `magick toggle-left-18.png -resize 128x128 ../TFluentToggleSwitch128.png`.
- `TFluentToggleSwitch.bmp`, `TFluentToggleSwitch16.bmp`,
  `TFluentToggleSwitch32.bmp` — растровые версии на белом фоне, запасной
  вариант для IDE без поддержки PNG; левый нижний пиксель считается
  прозрачным.

Пересборка `.dcr` — на Windows, из каталога `resources`:

```
"%BDS%\bin\brcc32.exe" FluentToggleSwitchIcons.rc
move /y FluentToggleSwitchIcons.RES FluentToggleSwitchIcons.dcr
```

`brcc32` называет результат по имени `.rc` до первой точки и навязывает
расширение `.RES`, отсюда переименование поверх прежнего `.dcr`. `.dcr` —
обычный файл `.RES`.
