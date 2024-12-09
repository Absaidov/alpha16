# Dhikr

Приложение для мусульман Dhikr, которое считает количество зикров и записивает количество зикров и их описание. 
Это приложение разработано в рамках учебного курса по Flutter. Приложение демонстрирует использование таких технологий, как State Management (Provider), Firebase(Remote Config),  и работа с NoSQL-базой данных Hive.

## Описание

Dhikr – это мобильное приложение, которое помогает мусульманам вести учет своих зикров (молитвенных обращений). Приложение решает задачу отслеживания количества произнесённых зикров, предоставляя возможность сохранять результаты в базе данных для последующего анализа. Таким образом, пользователи могут следить за своим прогрессом и лучше организовывать свои духовные практики.


## Функционал

- **Удобный счетчик зикров**: Простая система учета молитвенных обращений с возможностью увеличения/уменьшения счета.
- **История зикров**: Сохранение всех совершенных зикров в базе данных с возможностью просмотра статистики.
- **Подробная информация о зикрах**: Описание каждого зикра, его значение и важность в духовной практике.
- **Оффлайн режим**: Возможность работы без подключения к интернету.
- **Поддержка нескольких языков**: Локализация приложения на разные языки для международной аудитории. (Русский, Английский, Испанский).

## Использованные технологии

Укажи все важные библиотеки и инструменты, которые использовались при разработке:
- **Dart**: язык программирования   
- **Flutter** фреймворк
- **Firebase** для авторизации пользователей.
- **Provider** библиотка для управления состоянием.
- **Hive** библотека для работы с NoSQL-базой данных (локальное хранение данных).
- **Google Mobile Ads** интеграция рекламы от Google.
- **Cupertino Icons** для использования стандартных иконок iOS.

## Скриншоты на iPhone
<table>
  <tr>
    <!-- Первая секция -->
    <td style="text-align: center; vertical-align: top; width: 50%;">
      <h2>Главный экран</h2>
      <img src="https://github.com/Absaidov/screen_shots/blob/main/Приложение%20Dhikr/iPhone/Главная%20страница.png" alt="Alt Text 1" width="200">
      <img src="https://github.com/Absaidov/screen_shots/blob/main/Приложение%20Dhikr/iPhone/Сохраненные%20зикры.png" alt="Alt Text 2" width="200">
      <p>Пользователь сохраняет, редактирует или удаляет зикры</p>
    </td>
    <!-- Вторая секция -->
    <td style="text-align: center; vertical-align: top; width: 50%;">
      <h2>Экран настроек</h2>
      <img src="https://github.com/Absaidov/screen_shots/blob/main/Приложение%20Dhikr/iPhone/Экран%20настроек.png" alt="Alt Text 1" width="200">
      <img src="https://github.com/Absaidov/screen_shots/blob/main/Приложение%20Dhikr/iPhone/Выбор%20языка.png" alt="Alt Text 2" width="200">
      <p>Пользователь может изменить параметры приложения</p>
    </td>

  </tr>
</table>


## Скриншоты на Android
<table>
  <tr>
    <!-- Первая секция -->
    <td style="text-align: center; vertical-align: top; width: 50%;">
      <h2>Главный экран</h2>
      <img src="https://github.com/Absaidov/screen_shots/blob/main/Приложение%20Dhikr/Android/Главная%20страница.png" alt="Alt Text 1" width="200">
      <img src="https://github.com/Absaidov/screen_shots/blob/main/Приложение%20Dhikr/Android/Редактирование%20или%20удаление.png" alt="Alt Text 2" width="200">
      <p>Пользователь сохраняет, редактирует или удаляет зикры</p>
    </td>
    <!-- Вторая секция -->
    <td style="text-align: center; vertical-align: top; width: 50%;">
      <h2>Экран настроек</h2>
      <img src="https://github.com/Absaidov/screen_shots/blob/main/Приложение%20Dhikr/Android/Межстраничная%20реклама.png" alt="Alt Text 1" width="200">
      <img src="https://github.com/Absaidov/screen_shots/blob/main/Приложение%20Dhikr/Android/Страница%20настроек.png" width="200">
      <p>Пользователь может изменить параметры приложения</p>
    </td>

  </tr>
</table>

## Чему я научился

- Использовать Flutter для создания кроссплатформенных приложений.
- Управлять состоянием с помощью Provider.
- Работать с HIVE, чтобы локально хранить данные вводимые пользователем.
- Интегрировать в приложение Google Mobile Ads, чтобы пользователь видел рекламу (реклама баннер и межстраничная реклама).
- Также настроил интеграцию с FireBase (в части Remote Config), удаленная смена настроек приложения.
- Создавать адаптивный интерфейс для разных размеров экранов.





