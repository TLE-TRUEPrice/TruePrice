# Errors

The TruePrice™ API uses the following error codes:

Error Code | Meaning
---------- | -------
400 | Bad Request — Your request is invalid or missing required parameters.
401 | Unauthorized — Your API credentials (email/password or token) are incorrect or missing.
403 | Forbidden — You do not have permission to access this resource.
404 | Not Found — The requested data or endpoint could not be found.
405 | Method Not Allowed — You used an unsupported HTTP method (e.g., POST instead of GET).
406 | Not Acceptable — You requested a format that is not supported (e.g., XML instead of JSON/CSV/XLSX).
410 | Gone — The requested resource is no longer available.
418 | I'm a teapot — Fun Easter egg! This isn’t a real error, but it means something went playfully wrong.
429 | Too Many Requests — You’ve hit the rate limit. Please wait and try again.
500 | Internal Server Error — Something went wrong on our end. Please try again later.
503 | Service Unavailable — The server is temporarily down for maintenance. Please try again soon.
