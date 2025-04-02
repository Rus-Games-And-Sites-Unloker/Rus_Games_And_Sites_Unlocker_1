### Rus Games And Sites Unloсker

*"Plug & Play"* обход блокировок сайтов, Discord и YouTube для Windows

Вниимание: это первая версия проекта.

Основано на https://github.com/Flowseal/zapret-discord-youtube

### Отличия от оригинала:

Содержит в себе Cleaner for Zapret для очистки от альтернативных версий https://topersoft.com/programs/zapretcleaner

Все старые Bat файлы немного скорректированы, но это позволило добавить "НАСТРОИТЬ список доменов.exe", для быстрого редактирования списка сайтов. Его я взял отсюда: https://github.com/therealsdy/DiscordFix.

1 новый Bat файл.

### Антивирус

WinDivert может вызвать реакцию антивируса.

WinDivert - это инструмент для перехвата и фильтрации трафика, необходимый для работы zapret.

Замена iptables и NFQUEUE в Linux, которых нет под Windows.

Он может использоваться как хорошими, так и плохими программами, но сам по себе не является вирусом.

Драйвер WinDivert64.sys подписан для возможности загрузки в 64-битное ядро Windows.

Но антивирусы склонны относить подобное к классам повышенного риска или хакерским инструментам.

В случае проблем используйте исключения или выключайте антивирус совсем.

**Выдержка из [`readme.md`](https://github.com/bol-van/zapret-win-bundle/blob/master/readme.md#%D0%B0%D0%BD%D1%82%D0%B8%D0%B2%D0%B8%D1%80%D1%83%D1%81%D1%8B) репозитория [bol-van/zapret-win-bundle](https://github.com/bol-van/zapret-win-bundle)*

### Источник WinDivert

Все файлы в папке [`bin`](./bin) взяты из [zapret-win-bundle/zapret-winws](https://github.com/bol-van/zapret-win-bundle/tree/master/zapret-winws). Вы можете это проверить с помощью хэшей/контрольных сумм.

### Как скачать?

Вверху страницы есть зеленая кнопка со словом "Code" (код), затем выбрать "Download Zip".

### Как запустить?

1. Распаковываем архив в корень системного или любого диска. Лучше всего просто перетащить папку из архива в корень диска. Путь не должен содержать кириллицу/спец. символы.

2. Запустите файл Cleaner for Zapret.exe из папки "Cleaner for Zapret v1.3".

![Изображение](https://i.ibb.co/8nhkBWxv/photo-2025-03-25-01-19-04.jpg)

3. Нажать на кнопку "Выполнить очистку".

4. Когда программа попросит перезагрузку ПК ОБЯЗАТЕЛЬНО его перезапустить.

5. Затем запустить нужный вам файл.

### Краткие описания файлов.

- [**`discord.bat`**](./discord.bat) - запуск со стратегией для обхода блокировки Discord.

- [**`general.bat`**](./general.bat) - запуск со стратегией для обхода блокировок YouTube.

- [**Ultimate.bat`**](./Ultimate.bat) - новый  файл запуск со стратегией для обхода блокировок YouTube, Discord, 3 торрент трекера. Также должен исправлять проблемы с запуском игровых клиентов. Проверял Ubisoft & EA.

- [**`service_install.bat`**](./service_install.bat) - установка на автозапуск (как службы Windows: `zapret`, `WinDivert`), можно выбрать любую стратегию (название файла стратегии **НЕ** должно начинаться со слова `service`)

- [**`service_remove.bat`**](./service_remove.bat) - остановка и удаление служб `zapret` и `WinDivert`

- [**`service_status.bat`**](./service_status.bat) - проверка состояния служб `zapret` и `WinDivert`

## Распространенные проблемы

### Не работает <img src="https://cdn-icons-png.flaticon.com/128/5968/5968756.png" height=18 /> Discord

- См. [#252](https://github.com/Flowseal/zapret-discord-youtube/discussions/252)

### Не работает <img src="https://cdn-icons-png.flaticon.com/128/1384/1384060.png" height=18 /> YouTube

- См. [#251](https://github.com/Flowseal/zapret-discord-youtube/discussions/251)

### Обход не работает

> [!IMPORTANT]
> **Стратегии блокировок со временем изменяются.**
> Определенная стратегия обхода zapret может работать какое-то время, но если меняется способ блокировки или обнаружения обхода блокировки, то она перестанет работать.
> В репозитории представлены множество различных стратегий для обхода. Если ни одна из них вам не помогает, то вам необходимо создать новую, взяв за основу одну из представленных здесь и изменив её параметры.
> Информацию про параметры стратегий вы можете найти [тут](https://github.com/bol-van/zapret/blob/master/docs/readme.md#nfqws).

- Проверьте другие стратегии (**`ALT`**/**`МГТС`**)

- Обновите файлы в папке [`bin`](./bin), взяв новые из [zapret-win-bundle/zapret-winws](https://github.com/bol-van/zapret-win-bundle/tree/master/zapret-winws)

- См. [#765](https://github.com/Flowseal/zapret-discord-youtube/issues/765)

### Файлы не запускаются

- См. [#522](https://github.com/Flowseal/zapret-discord-youtube/issues/522)

### Требуется цифровая подпись драйвера WinDivert (Windows 7)

- Замените файлы `WinDivert.dll` и `WinDivert64.sys` в папке [`bin`](./bin) на одноименные из [zapret-win-bundle/win7](https://github.com/bol-van/zapret-win-bundle/tree/master/win7)

### Не работает вместе с VPN

- Отключите функцию **TUN** (Tunneling) в настройках вашего VPN

### Не нашли своей проблемы

* Создайте её [тут](https://github.com/Rus-Games-And-Sites-Unloker/Rus_Games_And_Sites_Unlocker_1/issues)

## 🗒️Добавление адресов прочих заблокированных ресурсов

Список блокирующихся адресов для обхода можно расширить, добавляя их в:
- [`list-general.txt`](./list-general.txt) для файлов `general *.bat`
- [`list-discord.txt`](./list-discord.txt) для файла [`discord.bat`](./discord.bat)

> [!IMPORTANT]  
> После обновления списка адресов zapret необходимо перезапустить.

## ⭐Поддержка проекта

Вы можете поддержать проект, поставив :star: этому репозиторию (сверху справа этой страницы)

Также, вы можете материально поддержать разработчика zapret [тут](https://github.com/bol-van/zapret/issues/590#issuecomment-2408866758)

<a href="https://star-history.com/#Flowseal/zapret-discord-youtube&Date">
 <picture>
   <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/svg?repos=Flowseal/zapret-discord-youtube&type=Date&theme=dark" />
   <source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/svg?repos=Flowseal/zapret-discord-youtube&type=Date" />
   <img alt="Star History Chart" src="https://api.star-history.com/svg?repos=Flowseal/zapret-discord-youtube&type=Date" />
 </picture>
</a>

## ⚖️Лицензирование

Проект распространяется на условиях лицензии [MIT](https://github.com/Flowseal/zapret-discord-youtube/blob/main/LICENSE.txt)

## 🩷Благодарность участникам проекта

💖 Отдельная благодарность разработчику [zapret](https://github.com/bol-van/zapret) - [bol-van](https://github.com/bol-van)
