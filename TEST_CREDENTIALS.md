# Test Credentials for Mock Authentication

The app is currently using **mock authentication** for testing without a backend server.

## Pre-registered Test Users

### User 1: Motaz
- **Email**: `motaz@example.com`
- **Password**: `12345678`

### User 2: Sonic
- **Email**: `Sonic@gmail.com` (or `sonic@gmail.com`)
- **Password**: `123456789`

## How to Test

### Login Flow
1. Open the app
2. Wait for splash screen (2 seconds)
3. You'll see the Login page
4. Enter one of the test user credentials above
5. Click "Login"
6. You'll be redirected to the Home page

### Signup Flow
1. From the Login page, click "Sign Up"
2. Enter any new details:
   - Full Name: Any name
   - Email: Any email (not the test ones above)
   - Phone: At least 10 digits
   - Address: At least 5 characters
   - Password: At least 6 characters
3. Click "Sign Up"
4. You'll be redirected to the Home page

## Important Notes

- Mock authentication stores credentials in memory (not persistent between app restarts)
- Once you sign up with a new email, it will be "registered" for this session
- Trying to signup with an existing email will show an error
- Wrong password on login will show an error
- All test data is from the Postman collection

## Switching to Real Backend

When ready to connect to the real backend:
1. Uncomment `@Injectable` in `auth_remote_datasource.dart`
2. Comment out `@Injectable` in `auth_mock_datasource.dart`
3. Run `flutter pub run build_runner build --delete-conflicting-outputs`
4. Configure the API base URL
5. Test with real API endpoints
