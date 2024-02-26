# CoEdit Flutter

CoEdit Flutter is a collaborative document editing platform that allows you to work together in real-time on documents (Just like google docs). It's designed to work seamlessly on both mobile devices and web browsers. I utilized flutter for the client side (mobile and the web) while NodeJs was used for the server side. Here is a link to the [backend repository.](https://docs.flutter.dev/)

## Features

- **Authentication**: Users can Register/Sign In using their email or Google accounts, ensuring security and ease of access.
- **State Persistence**: The application maintains the state across sessions, allowing users to resume their work from where they left off.
- **Creating New Documents**: Users can create new documents directly within the application.
- **Viewing List of Documents**: All created documents are listed for easy access and management.
- **Updating Document Title**: Users can update the title of documents to better organize their work.
- **Link Sharing**: Documents can be shared with others via a shareable link, facilitating collaboration.
- **Auto Saving**: Changes made to documents are automatically saved, ensuring no data loss.
- **Collaborative Editing**: Users can collaborate in real-time on documents using a rich text editor.
- **Sign Out**: Users can securely sign out of their accounts when done with their work.

## Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/dejiayodejii/CoEdit-with-Flutter-and-NodeJS.git
    ```

2. Navigate to the project directory:

    ```bash
    cd CoEdit
    ```

3. Install dependencies:

    ```bash
    flutter pub get
    ```

4. Run the application:

    ```bash
    flutter run
    ```

## Usage

1. Launch the application on your mobile device or web browser.
2. Register or Sign in using your Google account.
3. Create a new document or select an existing one from the list.
4. Share the document link with collaborators to work together.
5. Make changes collaboratively in real-time.
6. Changes are automatically saved, ensuring seamless collaboration.
7. Sign out securely when done with your work.


##  Tech Used

Client: Flutter, Riverpod, Go Router

Server: Nodejs, Express, MongoDB, Mongoose, SocketIO



## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests for any enhancements or bug fixes.

## License

This project is licensed under the [MIT License](LICENSE).
