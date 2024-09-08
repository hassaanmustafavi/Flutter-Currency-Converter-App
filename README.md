# Currency Converter App

This Flutter-based **Currency Converter App** allows users to convert between different currencies using the **ExchangeRate-API**. The app supports live conversion rates and includes a clear, user-friendly interface. Users can select currencies from dropdowns, input amounts, and receive real-time conversion results.

## Features

- Real-time currency conversion using **ExchangeRate-API**
- Supports a wide variety of currencies
- Easy-to-use dropdowns for selecting base and target currencies
- Clear input and result display
- Swap feature to easily switch between currencies
- **Clear** button to reset inputs and results
- Error handling for failed API requests
- Responsive design for mobile

## Screenshots

![Currency Converter](https://github.com/hassaanmustafavi/currency_convertor/blob/main/lib/assets/ScreenShots/ScreenShot_1.jpg)
![Currency Converter](https://github.com/hassaanmustafavi/currency_convertor/blob/main/lib/assets/ScreenShots/ScreenShot_2.jpg)

## Getting Started

### Prerequisites

- Flutter SDK (>= 2.10.0)
- Android Studio / Xcode for running the app on an emulator or physical device
- A free API key from [ExchangeRate-API](https://www.exchangerate-api.com/)

### Installation

1. Clone the repository to your local machine:

    ```bash
    git clone https://github.com/yourusername/currency-converter-app.git
    ```

2. Navigate into the project directory:

    ```bash
    cd currency-converter-app
    ```

3. Install dependencies:

    ```bash
    flutter pub get
    ```

4. Add your **ExchangeRate-API** key in the `api_client.dart` file:

    ```dart
    final String apiKey = 'YOUR_API_KEY'; // Replace with your actual API key
    ```

5. Run the app on your emulator or physical device:

    ```bash
    flutter run
    ```

### Folder Structure
![Currency Converter](https://github.com/hassaanmustafavi/currency_convertor/blob/main/lib/assets/ScreenShots/Folder_Structure.jpg)


### How It Works

1. **API Client**:
   - `api_client.dart` handles the API requests using the `ExchangeRate-API` to fetch live exchange rates and a list of currencies.
   
2. **Dropdowns**:
   - `drop_down.dart` contains a custom dropdown widget allowing users to select currencies. It updates as soon as the list of currencies is fetched.

3. **Main App**:
   - `main.dart` contains the app's UI, including a text field for user input, buttons for conversion and clearing results, and live conversion display.

### Dependencies

This app uses the following dependencies:

- [http](https://pub.dev/packages/http) - To handle API requests
- [flutter](https://flutter.dev/) - For building the app UI

### API Integration

The app integrates with the **ExchangeRate-API** to fetch real-time conversion rates. You will need to replace the placeholder `YOUR_API_KEY` in the `api_client.dart` file with your actual API key.

### Error Handling

The app includes error handling for failed API requests. If the app is unable to connect to the API, an error message will be logged to the console.

## License

This project is licensed under the MIT License and free to use.

## Contributing

Contributions are welcome! Please follow these steps to contribute:

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/awesome-feature`)
3. Commit your changes (`git commit -m 'Add some awesome feature'`)
4. Push to the branch (`git push origin feature/awesome-feature`)
5. Open a pull request

