# Домашнее задание к занятию «Инструменты Git» - Родионов Сергей

## Ответы на вопросы:

1. **Найдите полный хеш и комментарий коммита, хеш которого начинается на `aefea`.**  
   - Полный хеш: `aefead2207ef7e2aa5dc81a34aedf0cad4c32545`  
   - Комментарий: `Update CHANGELOG.md`  
   - **Как получено:**  
     Использовал команду `git show aefea --pretty=format:"%H %s" --no-patch`, чтобы получить полный хеш и сообщение коммита.

2. **Какому тегу соответствует коммит `85024d3`?**  
   - Тег: `v0.12.24`  
   - **Как получено:**  
     Выполнил `git tag --contains 85024d3` и получил `v0.12.24`.

3. **Сколько родителей у коммита `b8d720`? Напишите их хеши.**  
   - Количество родителей: **2** (это merge-коммит)  
   - Хеши родителей:  
     - `56cd7859e05c36c06b56d013b55a252d0bb7e158`  
     - `9ea88f22fc6269854151c571162c5bcf958bee2b`  
   - **Как получено:**  
     Использовал `git show --pretty=%P b8d720` и получил хеши родителей.

4. **Перечислите хеши и комментарии всех коммитов, которые были сделаны между тегами `v0.12.23` и `v0.12.24`.**  
   - Коммиты между `v0.12.23` и `v0.12.24`:  
     ```
      33ff1c03bb v0.12.24
      b14b74c493 [Website] vmc provider links
      3f235065b9 Update CHANGELOG.md
      6ae64e247b registry: Fix panic when server is unreachable
      5c619ca1ba website: Remove links to the getting started guide's old location
      06275647e2 Update CHANGELOG.md
      d5f9411f51 command: Fix bug when using terraform login on Windows
      4b6d06cc5d Update CHANGELOG.md
      dd01a35078 Update CHANGELOG.md
      225466bc3e Cleanup after v0.12.23 release
     ```  
   - **Как получено:**  
     Выполнил `git log --pretty=format:"%h %s" v0.12.23..v0.12.24` и отфильтровал коммиты.

5. **Найдите коммит, в котором была создана функция `func providerSource`, её определение в коде выглядит так: `func providerSource(...)`.**  
   - Коммит: `8c928e835`  
   - **Как получено:**  
     Использовал `git log -S 'func providerSource(' --oneline` и нашел первый коммит, где эта функция появилась.

6. **Найдите все коммиты, в которых была изменена функция `globalPluginDirs`.**  
   - Коммиты, где менялась `globalPluginDirs`:  
     ```
      7c4aeac5f3 stacks: load credentials from config file on startup (#35952)
      65c4ba7363 Remove terraform binary
      125eb51dc4 Remove accidentally-committed binary
      22c121df86 Bump compatibility version to 1.3.0 for terraform core release (#30988)
      7c7e5d8f0a Don't show data while input if sensitive
      35a058fb3d main: configure credentials from the CLI config file
      c0b1761096 prevent log output during init
      8364383c35 Push plugin discovery down into command package
     ```  
   - **Как получено:**  
     Использовал `git log -S 'globalPluginDirs' --oneline` для поиска изменений.

7. **Кто автор функции `synchronizedWriters`?**  
   - Автор: **Martin Atkins** (`mart@degeneration.co.uk`)  
   - **Как получено:**  
     Использовал `git log -S 'func synchronizedWriters' --pretty=format:"%an %ae"` и нашел первый коммит, где функция была добавлена.