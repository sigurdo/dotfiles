See [this stackoverflow thread](https://stackoverflow.com/questions/21276763/google-api-keys-missing-warning-message-when-using-chromium-portable).

On Windows:

```
setx GOOGLE_API_KEY "no"
setx GOOGLE_DEFAULT_CLIENT_ID "no"
setx GOOGLE_DEFAULT_CLIENT_SECRET "no"
```

On Linux:

```
export GOOGLE_API_KEY="no"
export GOOGLE_DEFAULT_CLIENT_ID="no"
export GOOGLE_DEFAULT_CLIENT_SECRET="no"
```
