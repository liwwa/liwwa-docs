---
title: liwwa Partners API v0.0.1
language_tabs:
  - python: Python
  - javascript: Javascript
  - json: JSON
language_clients:
  - python: ""
  - javascript: ""
  - json: ""
toc_footers: []
includes: []
search: false
highlight_theme: darkula
headingLevel: 2

---

<!-- Generator: Widdershins v4.0.1 -->

<h1 id="liwwa-partnership-api">liwwa Partners API v0.0.1</h1>

The liwwa Partners API allows for partners to integrate embedded finance solutions into their platforms. With the click of a button, the clients of a partner can submit a loan request via API, and liwwa will automatically assess the client’s transaction-level financial data to respond instantly with the client’s eligible loan amount and loan tenor. Basic data and documents for the client are also collected to facilitate the loan signing process. Further planned integrations will increasingly automate the loan lifecycle by covering loan disbursal, collections & monitoring via this API.

All requests should use the appropriate liwwa Partners root API URL `https://api.liwwa.com/`

All API requests must be made over HTTPS; calls made over plain HTTP will fail. API requests without authentication will also fail - see the Authentication section for information on correctly authenticating calls to the liwwa Partners API.

You can use any standard HTTPS client to access the web service. For simplicity and brevity we have provided code samples in this document in Javascript and Python. `axios` library is used for JavaScript samples and `requests` library is used for Python samples, but any http client library can be used.

|Language|Library For Examples|
|---|---|
|JavaScript|[axios](https://github.com/axios/axios)|
|Python|[requests](https://pypi.org/project/requests/)

Email: support.partners@liwwa.com 
Website: <a href="https://liwwa.com">liwwa</a>

<h1 id="liwwa-partnership-api-authentication"> Authentication </h1>

> Example

```python
import requests
headers = {
  'Authorization': 'Token YOUR_API_KEY'
}

r = requests.post('https://api.liwwa.com/v1/borrow/submit-loan',json = {}, headers = headers)

print(r.json())

```

```javascript
const axios = require('axios');

const headers = {
  'Authorization': 'Token YOUR_API_KEY'
};

const data = {};

axios.post('https://api.liwwa.com/v1/borrow/submit-loan', data, { headers })
  .then(response => {
    console.log(response.data);
  })
  .catch(error => {
    console.error('Error:', error);
  });
```

The liwwa Partners API uses API keys to authenticate requests. These API keys can be generated only by liwwa's tech team, so please contact liwwa at support.partners@liwwa.com to generate one for you.

Your API keys can be used to transfer sensitive client data and submit a loan request so please ensure you follow best practice for managing API keys.

We suggest that you:

- Keep the keys secure - do not share API keys or give them to parties outside your organization
- Never, ever store your API keys in publicly-accessible locations - public github repositories, client-side code, documentation files and so on

When making requests to the liwwa Partners API provide your API key in the Authorization header on the API request, e.g.

`Token YOUR_API_KEY`

The code examples illustrate this.

<h1 id="liwwa-partnership-api-errors">Errors</h1>

> Error Example

```python
{
    "error": {
        "code": "001",
        "description": "merchantId is required field"
    }
}
```

```javascript
{
    "error": {
        "code": "001",
        "description": "merchantId is required field"
    }
}
```

```json
{
    "error": {
        "code": "001",
        "description": "merchantId is required field"
    }
}
```
We use standard HTTP status codes to indicate the success or failure of a request to our API.

Successful requests to our API will have a 201 HTTP status code, and the response body.

Unsuccessful requests to our API will have a non-201 HTTP status code and will contain an errors object with a description of the unsuccessful request.

For successful requests you find an example of the response in each section below.

### Error Object

|Field name|Description|
|---|---|
|code| It is an internal code that represents the type of error as listed below|
|description|The description of the error|

### Definition of Errors

|Code|HTTP Status|Description|
|---|---|---|
|001|400|Required field|
|002|400|Field type did not match the required type|
|003|400|Invalid phone number|
|004|400|Invalid date format|
|005|400|Invalid date value|
|006|400|Invalid currency format|
|007|400|Field should not be empty|
|008|400|Invalid number of characters|
|009|400|Only digits are allowed|
|010|400|Invalid company type|
|011|400|Unsupported country code|
|100|401|Unauthorized API key|
|200|404|Endpoint not found|
|300|405|The method is not allowed for the requested URL|
|400|500|Internal server error|

<h1 id="liwwa-partnership-api-endpoints">API Endpoints</h1>

The current list of available API endpoints on the liwwa Partners API is shown below.

|ENDPOINT|Description|
|---|---|
|[`POST /v1/borrow/submit-loan`](#liwwa-partnership-api-loan-submit)|Submit Application Request

<h1 id="liwwa-partnership-api-loan-submit">Submit Application Request</h1>

<a id="opIdsubmitLoan"></a>

> Code samples

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Authorization': 'Token YOUR_API_KEY'
}
data = {
  "merchantInfo": {
    "merchantId": "3090597608",
    "firstName": "Gaynor",
    "secondName": "Justen",
    "thirdName": "Zelig",
    "lastName": "Frame",
    "country": "jo",
    "nationalIdNumber": "1721929525",
    "phoneNumber": "+812593625487",
    "email": "zframe0@domainmarket.com"
  },
  "transactions": [
    {
      "date": "2022-07-30",
      "amount": 900.0,
      "currency": "JOD",
      "transactionId": "1JSKA",
      "description": "",
    },
    {
      "date": "2022-08-30",
      "amount": 1200.0,
      "currency": "JOD",
      "transactionId": "5JDKZ",
      "description": "",
    }
  ],
  "businessInfo": {
    "businessId": "395350356",
    "establishmentDate": "2022-08-07",
    "merchantCategoryCode": "5600",
    "businessName": "Liwwa",
    "businessCommercialRegistrationNumber": "1234567890"
  }
}
r = requests.post('https://api.liwwa.com/v1/borrow/submit-loan',json = data, headers = headers)

print(r.json())
```

```javascript
const axios = require('axios');

const headers = {
  'Content-Type': 'application/json',
  'Authorization': 'Token YOUR_API_KEY'
};

const data = {
  "merchantInfo": {
    "merchantId": "3090597608",
    "firstName": "Gaynor",
    "secondName": "Justen",
    "thirdName": "Zelig",
    "lastName": "Frame",
    "country": "jo",
    "nationalIdNumber": "1721929525",
    "phoneNumber": "+812593625487",
    "email": "zframe0@domainmarket.com"
  },
  "transactions": [
    {
      "date": "2022-07-30",
      "amount": 900.0,
      "currency": "JOD",
      "transactionId": "1JSKA",
      "description": "",
    },
    {
      "date": "2022-08-30",
      "amount": 1200.0,
      "currency": "JOD",
      "transactionId": "5JDKZ",
      "description": "",
    }
  ],
  "businessInfo": {
    "businessId": "395350356",
    "establishmentDate": "2022-08-07",
    "merchantCategoryCode": "5600",
    "businessName": "Liwwa",
    "businessCommercialRegistrationNumber": "1234567890"
  }
};

axios.post('https://api.liwwa.com/v1/borrow/submit-loan', data, { headers })
  .then(response => {
    console.log(response.data);
  })
  .catch(error => {
    console.error('Error:', error);
  });
```

### POST /v1/borrow/submit-loan

This end point will create a user and an application in our internal system and will return the loan amount and loan tenor that the customer is eligible to take from liwwa with the application id and user id as references.

### JSON POST PARAMETERS

|Field Name|Type|Required|Description|
|---|---|---|---|
|merchantInfo|object|true|Object that represents the merchant information|
|transactions|list|true|List of transaction objects|
|businessInfo|object|true|Object that represents the business information|

### Merchant

> Merchant Info Example

```python
{
    "merchantId": "3090597608",
    "firstName": "Gaynor",
    "secondName": "Justen",
    "thirdName": "Zelig",
    "lastName": "Frame",
    "country": "jo",
    "nationalIdNumber": "1721929525",
    "phoneNumber": "+812593625487",
    "email": "zframe0@domainmarket.com"
}

```

```javascript
{
  "merchantId": "3090597608",
  "firstName": "Gaynor",
  "secondName": "Justen",
  "thirdName": "Zelig",
  "lastName": "Frame",
  "country": "jo",
  "nationalIdNumber": "1721929525",
  "phoneNumber": "+812593625487",
  "email": "zframe0@domainmarket.com"
}

```

```json
{
  "merchantId": "3090597608",
  "firstName": "Gaynor",
  "secondName": "Justen",
  "thirdName": "Zelig",
  "lastName": "Frame",
  "country": "jo",
  "nationalIdNumber": "1721929525",
  "phoneNumber": "+812593625487",
  "email": "zframe0@domainmarket.com"
}

```

|Field Name|Type|Required|Description|
|---|---|---|---|
|merchantId|string|true|Merchant ID in the vendor system|
|firstName|string|true|Merchant first name|
|secondName|string|false|Merchant second name|
|thirdName|string|false|Merchant third name|
|lastName|string|true|Merchant last name|
|country|string|true|Residency country (jo, eg)|
|nationalIdNumber|string|true|Merchant national id number|
|phoneNumber|string|true|Phone number based on the E.164|
|email|string|false|Merchant email|

### Transaction

> Transaction Example

```python
{
    "date": "2022-07-30",
    "amount": 900.0,
    "currency": "JOD",
    "transactionId": "1JSKA",
    "description": "",
}

```

```javascript
{
    "date": "2022-07-30",
    "amount": 900.0,
    "currency": "JOD",
    "transactionId": "1JSKA",
    "description": "",
}

```

```json
{
    "date": "2022-07-30",
    "amount": 900.0,
    "currency": "JOD",
    "transactionId": "1JSKA",
    "description": "",
}

```

|Field Name|Type|Required|Description|
|---|---|---|---|
|date|string|true|The date of the transaction using ISO 8601 format (YYYY-MM-DD)|
|amount|float|true|The transaction amount (use a "-" to indicate negative values, e.g. -100.00)|
|currency|string|true|The transaction currency using ISO 4217 alphabetical code ("EGP", "JOD")|
|transactionId|string|true|A unique id for each transaction|
|description|string|false|The transaction description|

### Business Information

> BusnissInfo Example

```python
{
  "businessId": "395350356",
  "establishmentDate": "2022-08-07",
  "merchantCategoryCode": "5600",
  "businessName": "Liwwa",
  "businessCommercialRegistrationNumber": "1234567890"
}
```

```javascript
{
  "businessId": "395350356",
  "establishmentDate": "2022-08-07",
  "merchantCategoryCode": "5600",
  "businessName": "Liwwa",
  "businessCommercialRegistrationNumber": "1234567890"
}
```

```json
{
  "businessId": "395350356",
  "establishmentDate": "2022-08-07",
  "merchantCategoryCode": "5600",
  "businessName": "Liwwa",
  "businessCommercialRegistrationNumber": "1234567890"
}
```

|Field Name|Type|Required|Description|
|---|---|---|---|
|businessId|string|true|The business national id (Jordan) or tax card number (Egypt)|
|establishmentDate|string|true|The establishment date of the business using ISO 8601 format (YYYY-MM-DD)|
|merchantCategoryCode|string|true|Merchant category code based on ISO 18245|
|businessName|string|false|The business name|
|businessCommercialRegistrationNumber|string|false| The business commercial registration number|

### Responses

<h6 id="loan-submit-response-object">Response object</h6>

> 201 Response Example

```python
{
    "decision": {
        "loanAmount": 5000,
        "loanCurrency": "JOD",
        "loanTenor": 6,
        "eligible": true
    },
    "merchantId": "583",
    "userId": 673560,
    "applicationId": 465260
}
```

```javascript
{
    "decision": {
        "loanAmount": 5000,
        "loanCurrency": "JOD",
        "loanTenor": 6,
        "eligible": true
    },
    "merchantId": "583",
    "userId": 673560,
    "applicationId": 465260
}
```

```json
{
    "decision": {
        "loanAmount": 5000,
        "loanCurrency": "JOD",
        "loanTenor": 6,
        "eligible": true
    },
    "merchantId": "583",
    "userId": 673560,
    "applicationId": 465260
}
```

|Field Name|Type|Description|
|---|---|---|
|merchantId|string|Merchant ID in the vendor's system|
|userId|int|The user ID in liwwa's system|
|applicationId|int|The application ID in liwwa's system|
|decision|object|Represents the loan application decision|
|loanAmount|float|The loan amount|
|loanCurrency|string| The loan currency|
|loanTenor|integer|The loan tenor|
|eligible|boolean|Represents if the merchant is eligible or not|

**Response Statuses**

|Status|Meaning|Description|Schema|
|---|---|---|---|
|201|Create|An object with the loan application decision|[Response Object](#loan-submit-response-object)
|400|Bad request|An object with an error message|[Error Object](#error-object)
|401|Unauthorized|An object with an error message|[Error Object](#error-object)
|405|Not allowed method|An object with an error message|[Error Object](#error-object)
|422|Unprocessable entity|An object with an error message|[Error Object](#error-object)
|500|Internal server error|An object with an error message|[Error Object](#error-object)
