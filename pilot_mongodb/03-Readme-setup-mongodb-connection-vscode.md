# MongoDB for VS Code Extension Guide

## 1. Install "MongoDB for VS Code" Extension

- Open Visual Studio Code.
- Go to the Extensions view by clicking on the Extensions icon in the Activity Bar on the side of the window or use the shortcut Ctrl+Shift+X.
- Search for "MongoDB for VS Code" in the Extensions view search box.
- Install the extension.

## 2. Open MongoDB Explorer

- Once the extension is installed, you should see a new icon in the Activity Bar on the side of the window. It looks like a MongoDB logo. Click on this icon to open the MongoDB Explorer.

## 3. Add a Connection

- In the MongoDB Explorer, click on the "Add Connection" button.
- Enter the necessary connection details:
  - Connection Name: Provide a name for your connection.
  - Connection String: Use the MongoDB connection string. For a localhost connection, it should look like `mongodb://localhost:27017`.
  - Authentication Database: Specify the authentication database (e.g., "admin" for the default admin database).
- Click "Connect" to save the connection.

## 4. Explore and Interact

- After connecting, you should see your MongoDB server listed in the MongoDB Explorer.
- Expand the connection to view databases, collections, and documents.
- You can interact with your MongoDB data directly within VS Code, run queries, and perform various operations.

## 5. Connect to Localhost (If Not Connected Automatically)

- If the extension doesn't automatically connect to your localhost, you can manually add a connection by clicking "Add Connection" and entering the localhost connection details:
  - Connection Name: Provide a name for your connection (e.g., "Localhost").
  - Connection String: `mongodb://localhost:27017`.
  - Authentication Database: Specify the authentication database if needed.
- Click "Connect" to save the localhost connection.

Now, you should be able to explore and interact with your local MongoDB instance using the "MongoDB for VS Code" extension in Visual Studio Code.
