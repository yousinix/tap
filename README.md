# TAP: The Attendance Project

The Attendance Project (TAP) is a way to take attendance using QR codes, and viewing the results on Google Sheets.

## Setup

1. Create a copy of this [Google Sheet](https://docs.google.com/spreadsheets/d/1GB69r2sCvpLHh5PU9Fs6AGKduCqkG8Dplr6wEFO8OqE/copy).
1. Go to **Tools > Script Editor**.
1. Click **Deploy > New Deployment > Deploy**.
1. Click **Authorize Access** then choose your account.
1. You will prompted with a screen saying _"Google hasn’t verified this app"_, so click **Advanced > Go to API (unsafe) > Allow**. (Don't worry about this, nothing malicious, you can review the script code yourself to confirm).
1. Click **Copy** under **Web app** to copy the deployment URL and save it somewhere, you will need it later.
1. Download the mobile app [latest release](https://github.com/YoussefRaafatNasry/tap/releases) and install it on your phone.
1. Open the app and click **Go to Settings**, then paste the deployment URL you saved it earlier and click **Save**.
1. Go to the Google Sheet you have copied and clear the existing data in both **People** and **Log** sheets only. (**Important:** Other sheets are auto generated, so do not modify them unless you know what you are doing).
1. Start adding people to the **People** sheet, then share the **QR Code** sheet with them.
1. You can now use the mobile app to take the attendance by scanning anyone's QR code.

## Demo

- Add the following deployment URL in the mobile app.

    ```raw
    https://script.google.com/macros/s/AKfycbyREq407yHkaZIARRm98ZvbIQ-mcjrTsEwcNMcqSLWwhuv5dc-wkgvr__OTt2to_OVP/exec
    ```

- Checkout the [Google Sheet](https://docs.google.com/spreadsheets/d/1GB69r2sCvpLHh5PU9Fs6AGKduCqkG8Dplr6wEFO8OqE/edit?usp=sharing) for QR codes and attendance.