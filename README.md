# WidgetMatch-Number

WidgetMatch-Number is a mobile app developed in Flutter that challenges users to tap a specific widget within a time frame. The app features various widgets with distinct functionalities, providing an engaging and time-bound experience.

## Requirements

Refer to Image 1.0 for a detailed description of the app requirements and domain logic.

## Features

- **Widget 1:** Displays seconds from the current time.
- **Widget 2:** Shows a random number between 0 - 59.
- **Widget 3:** Shows success or failure messages with scores and attempts.
- **Widget 4:** Circular timer resetting automatically after 5 seconds.
- **Widget 5:** Tappable button triggering various actions.

## Domain Logic

- A splash page appears for 3 seconds upon opening the app.
- Tapping Widget 5 updates Widget 2 and Widget 1.
- Success or failure messages are displayed based on conditions.
- Widget 4 resets to 5 and counts down on each tap of Widget 5.
- Values are retained even after closing and reopening the app.

## Implementation Details

- The app uses clear state management for enhanced performance.
- Repository patterns are employed for storing and retrieving data.
- Code structure follows best practices for readability and maintainability.
- Logical commits are made throughout the development process.

## Usage

1. Clone the repository.
   ```bash
   git clone https://github.com/amartya895/Match-Number
