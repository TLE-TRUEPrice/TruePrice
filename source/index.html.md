---
title: API Reference

language_tabs: # must be one of https://github.com/rouge-ruby/rouge/wiki/List-of-supported-languages-and-lexers

  - shell
  - ruby
  - python
  - javascript

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/slatedocs/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true

code_clipboard: true

meta:
  - name: description
    content: Documentation for the TruePrice API
---

# Introduction

Welcome to the TRUEPrice™ API! This document describes how to interact with TRUEPrice™ API services to retrieve TLE product.

Contact **`techsupport@truelightenergy.com`** for more information.

- Visit [Our Website!](https://www.truelightenergy.com/contact)


### Prerequisites:
- Ensure you have **Python 3** installed.
- Install the requests library if it’s not already installed:
    **`pip install requests`**      
- You will need API credentials (email and password) to authenticate and obtain an access token for secure requests. 


# Authentication

> To authorize, use this code:


```ruby
require 'net/http'
require 'uri'

uri = URI("https://truepriceenergy.com/login")
params = { email: 'your_email@example.com', password: 'your_password' }
uri.query = URI.encode_www_form(params)

http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE  # Equivalent to verify=False

response = http.get(uri.request_uri)
puts response.body
```

```python
import requests
def login(email = "email@truelightenergy.com", password = "password"):
  url = "https://truepriceenergy.com/login"
  querystring = {"email":email,"password":password}
  response = requests.request("GET", url, params=querystring, verify=False)
  return response.text
          
#Example Usage
response = login("your_email@example.com", "your_password")

```

```shell
curl -k -G "https://truepriceenergy.com/login" \
  --data-urlencode "email=your_email@example.com" \
  --data-urlencode "password=your_password"

```

```javascript
const url = new URL("https://truepriceenergy.com/login");
url.searchParams.append("email", "your_email@example.com");
url.searchParams.append("password", "your_password");

fetch(url, {
  method: "GET",
})
  .then(response => response.text())
  .then(data => console.log(data))
  .catch(error => console.error("Error:", error));
```



> Make sure to replace `email & password` with your own credentials.

- Ensure you have imported the necessary Python modules at the start of your script:
                      `import requests`
- The login function authenticates the user using their email and password, returning a login response that includes an access token. This token is necessary for subsequent API calls.
- Default Credentials: You may pass the default credentials "dummy@truelightenergy.com" or your own credentials.


`Output: The function returns the access token (or error response)`

<aside class="notice">
You must replace <code>email & password </code> with your own credentials.
</aside>

# Functions

## Download Data


`The Access Token recieved after login is used in this function to download data.`

```ruby
require 'net/http'
require 'uri'
require 'openssl'

uri = URI("https://truepriceenergy.com/get_data")
params = {
  start: "YYYY-MM-DD",
  end: "YYYY-MM-DD",
  operating_day: "YYYY-MM-DD",
  curve_type: "CurveName",
  iso: "ISOName",
  strip: "StripType",
  history: "IDC_OB_Value",
  type: "TypeName"
}
uri.query = URI.encode_www_form(params)

http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(uri)
request["Authorization"] = "Bearer YOUR_ACCESS_TOKEN"

response = http.request(request)

file_name = "#{params[:curve_type]}_#{params[:iso]}.csv"
File.open(file_name, "wb") { |file| file.write(response.body) }

puts "Data saved to #{file_name}"
```

```python
def get_data(access_token, start_date, end_date, operating_day,curve, iso, strip, history, type): 
  url = "https://truepriceenergy.com/get_data"
  querystring = {
        "start": start_date,
        "end": end_date,
        "operating_day": operating_day,
        "curve_type": curve,
        "iso": iso,
        "strip": strip,
        "history": history,
        "type": type
  }
  headers = {"Authorization": f"Bearer {access_token}"}
    
  # Make the API request
  response = requests.request("GET", url, params=querystring, headers=headers, verify=False)
    
  # Save the response content as a CSV file
  file_name = f'TruePrice_API/{response.headers.get("Content-Disposition", "").split("filename=")[-1]}'
  with open(file_name, "wb") as file:
      file.write(response.content)
    
  print(f"Data saved to {file_name}")
  return response


# Example:
access_token = eval(login("your_email@example.com", "your_password"))["access_token"]

#Response
data_response = get_data(your_access_token, your_start_date, your_end_date, your_operating_day, your_curve, your_iso, your_strip, your_idcob, your_type)

```

```shell
curl -k -G "https://truepriceenergy.com/get_data" \
  -H "Authorization: Bearer YOUR_ACCESS_TOKEN" \
  --data-urlencode "start=YYYY-MM-DD" \
  --data-urlencode "end=YYYY-MM-DD" \
  --data-urlencode "operating_day=YYYY-MM-DD" \
  --data-urlencode "curve_type=CurveName" \
  --data-urlencode "iso=ISOName" \
  --data-urlencode "strip=StripType" \
  --data-urlencode "history=IDC_OB_Value" \
  --data-urlencode "type=TypeName" \
  --output CurveName_ISOName.csv
```

```javascript
const params = new URLSearchParams({
  start: "YYYY-MM-DD",
  end: "YYYY-MM-DD",
  operating_day: "YYYY-MM-DD",
  curve_type: "CurveName",
  iso: "ISOName",
  strip: "StripType",
  history: "IDC_OB_Value",
  type: "TypeName"
});

fetch(`https://truepriceenergy.com/get_data?${params}`, {
  method: "GET",
  headers: {
    "Authorization": "Bearer YOUR_ACCESS_TOKEN"
  }
})
  .then(response => {
    if (!response.ok) throw new Error("Network response was not ok");
    return response.blob();  // If the content is a file
  })
  .then(blob => {
    const fileName = "CurveName_ISOName.csv";
    const link = document.createElement("a");
    link.href = window.URL.createObjectURL(blob);
    link.download = fileName;
    link.click();
    console.log(`Data saved to ${fileName}`);
  })
  .catch(error => console.error("Fetch error:", error));
```




### HTTP Request

`GET https://truepriceenergy.com/get_data`

##### **Request Parameters**

| Parameter            | Type    | Required | Description                                                                 |
|----------------------|---------|----------|-----------------------------------------------------------------------------|
| `access_token`       | string  | Yes      | The access token for authentication.                                        |
| `start_date`         | string  | Yes      | The start date for the data retrieval in `YYYY-MM-DD` format.              |
| `end_date`           | string  | Yes      | The end date for the data retrieval in `YYYY-MM-DD` format.                |
| `operating_day`      | string  | No       | The starting operating day in `YYYY-MM-DD` format.                          |
| `operating_day_end`  | string  | No       | The ending operating day in `YYYY-MM-DD` format.                            |
| `offset`             | string  | No       | Offset value for pagination or filtering.                                   |
| `curve`              | string  | Yes      | The type of curve (e.g., `energy`, `nonenergy`, `rec`, or `all`).          |
| `iso`                | string  | Yes      | The ISO region (e.g., `isone`, `pjm`, `ercot`, `nyiso`, `miso`, or `all`). |
| `strip`              | string  | No       | The strip type (e.g., `standardized`, `unstandardized`).                   |
| `idcob`              | string  | No       | Identifier for intraday/cob filters or reporting granularity (e.g., `cobonly`, `latestonly`, `intradayonly`, `all`)|
| `type`               | string  | Yes      | The response format (e.g., `csv`, `xlsx`).                                  |
  



| Header           | Value                          |
|------------------|--------------------------------|
| `Authorization`  | `Bearer <access_token>`        |



## Working with Multiple Data Types & Handling Specific Scenarios

```ruby
require 'net/http'
require 'uri'
require 'openssl'

def fetch_energy_data(iso, strip, history, filename)
  uri = URI("https://truepriceenergy.com/get_data")
  params = {
    start: "2000-01-01",
    end: "9999-12-31",
    curve_type: "energy",
    iso: iso,
    strip: strip,
    history: history,
    type: "csv"
  }
  uri.query = URI.encode_www_form(params)

  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  request = Net::HTTP::Get.new(uri)
  request["Authorization"] = "Bearer YOUR_ACCESS_TOKEN"

  response = http.request(request)

  File.open(filename, "wb") { |file| file.write(response.body) }
  puts "Saved #{filename}"
end

# Example usage:
fetch_energy_data("pjm", "standardized", "False", "energy_pjm_standardized.csv")
fetch_energy_data("pjm", "unstandardized", "False", "energy_pjm_unstandardized.csv")
```


```python

`ERCOT`
#Formatted Standardized Data
energy_ercocot_data = get_data(access_token, "2000-01-01", "9999-12-31", "", "", "energy", "ercot","standardized", "all", "csv")

# Unformated Unstandardized Data
energy_ercocot_data = get_data(access_token, "2000-01-01", "9999-12-31", "", "", "energy", "ercot",'unstandardized', "intradayonly", "csv")

`ISO-NE`
#Formatted Standardized Data
energy_isone_data = get_data(access_token, "2000-01-01", "9999-12-31", "", "", "energy", "isone","standardized", "all", "csv")

# Unformated Unstandardized Data
energy_isone_data = get_data(access_token, "2000-01-01", "9999-12-31", "", "", "energy", "isone",'unstandardized', "intradayonly", "csv")

`NYISO`
#Formatted Standardized Data
energy_nyiso_data = get_data(access_token, "2000-01-01", "9999-12-31", "", "", "energy", "nyiso","standardized", "all", "csv")

# Unformated Unstandardized Data
energy_nyiso_data = get_data(access_token, "2000-01-01", "9999-12-31", "", "", "energy", "nyiso",'unstandardized', "intradayonly", "csv")

`MISO`
#Formatted Standardized Data
energy_miso_data = get_data(access_token, "2000-01-01", "9999-12-31", "", "", "energy", "miso","standardized", "all", "csv")

# Unformated Unstandardized Data
energy_miso_data = get_data(access_token, "2000-01-01", "9999-12-31", "", "", "energy", "miso",'unstandardized', "intradayonly", "csv")

`PJM`
#Formatted Standardized Data
energy_pjm_data = get_data(access_token, "2000-01-01", "9999-12-31", "", "", "energy", "pjm","standardized", "all", "csv")

# Unformated Unstandardized Data
energy_pjm_data = get_data(access_token, "2000-01-01", "9999-12-31", "", "", "energy", "pjm",'unstandardized', "all", "csv")

```

```shell
# Standardized Data
curl -k -G "https://truepriceenergy.com/get_data" \
  -H "Authorization: Bearer YOUR_ACCESS_TOKEN" \
  --data-urlencode "start=2000-01-01" \
  --data-urlencode "end=9999-12-31" \
  --data-urlencode "curve_type=energy" \
  --data-urlencode "iso=ISO_NAME" \
  --data-urlencode "strip=standardized" \
  --data-urlencode "history=False" \
  --data-urlencode "type=csv" \
  --output energy_ISO_NAME_standardized.csv

# Unstandardized Data
curl -k -G "https://truepriceenergy.com/get_data" \
  -H "Authorization: Bearer YOUR_ACCESS_TOKEN" \
  --data-urlencode "start=2000-01-01" \
  --data-urlencode "end=9999-12-31" \
  --data-urlencode "curve_type=energy" \
  --data-urlencode "iso=ISO_NAME" \
  --data-urlencode "strip=unstandardized" \
  --data-urlencode "history=intradayonly" \
  --data-urlencode "type=csv" \
  --output energy_ISO_NAME_unstandardized.csv
```

```javascript
async function fetchEnergyData(iso, strip, history, fileName) {
  const params = new URLSearchParams({
    start: "2000-01-01",
    end: "9999-12-31",
    curve_type: "energy",
    iso: iso,
    strip: strip,
    history: history,
    type: "csv"
  });

  const response = await fetch(`https://truepriceenergy.com/get_data?${params}`, {
    method: "GET",
    headers: {
      "Authorization": "Bearer YOUR_ACCESS_TOKEN"
    }
  });

  const blob = await response.blob();
  const link = document.createElement("a");
  link.href = window.URL.createObjectURL(blob);
  link.download = fileName;
  document.body.appendChild(link);
  link.click();
}

// Example Usage
fetchEnergyData("pjm", "standardized", "False", "energy_pjm_standardized.csv");
fetchEnergyData("pjm", "unstandardized", "False", "energy_pjm_unstandardized.csv");
```



This endpoint retrieves curves based on Data Types, ISO's.

Each data type can be formatted or unformatted, standardized or unstandardized and saved directly to a desired file format( csv,xlsx,json)

![Data Upload Schedule](images/dataupload.png)



### HTTP Request

`GET https://truepriceenergy.com/get_data`

# Example Notebook

To understand how to use the API in detail, check out this Jupyter notebook:

<a href="https://colab.research.google.com/github/TLE-TRUEPrice/TruePrice/blob/main/notebooks/APIGuide.ipynb" target="_blank" style="display:block; margin: 10px 0 0; font-weight:bold;">
  ↗ Open in Google Colab – API User Guide Notebook
</a>

# Pricing Desk

For detailed guidance on using the Pricing Desk interface and understanding available features, refer to the user manual below:

<a href="https://tle-trueprice.github.io/PricingDeskUserGuides/" target="_blank" style="display:block; margin: 10px 0 20px; font-weight:bold;">
  ↗ Pricing Desk User Guide
</a>










