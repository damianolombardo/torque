This repo contains everything needed to setup an interface for uploading ODB2 data logged from your car in real-time using the [Torque Pro](https://play.google.com/store/apps/details?id=org.prowl.torque) app for Android.

The interface allows the user to:

  * View a Google Map showing your trips logged via Torque
  * Create time series plots of OBD2 data
  * Easily export data to CSV or JSON


# Requirements #

These instructions assume you already have a LAMP-like server (on a Linux/UNIX based host) or have access to one. Specifically, you'll need the following:

  * MySQL database
  * Apache webserver
  * PHP server-side scripting

If in doubt, I'd recommend using Ubuntu LTS.

You also need a Bluetooth ODBII adapter, I recommend this one which I've used since 2014:

[BAFX Products 34t5 Bluetooth OBDII Scan Tool for Android Devices](http://www.amazon.com/gp/product/B005NLQAHS)

I also use this to position the adapter in a better location:

[Oem OBD-II OBD2 16Pin Male to Female Extension Cable Diagnostic Extender 100cm](http://www.amazon.com/OBD-II-Female-Extension-Diagnostic-Extender/dp/B007PAHHWM)

# Server Setup #

First clone the repo:

```bash
git clone https://github.com/Rbjett/torque
cd torque
```

### Configure MySQL ###

To get started, create a database named `torque` and a user with permission to insert and read data from the database. In this tutorial, we'll create a user `steve` with password `zissou` that has access to all tables in the database `torque` from `localhost`:

```sql
CREATE DATABASE torque;
CREATE USER 'steve'@'localhost' IDENTIFIED BY 'zissou';
GRANT USAGE, FILE TO 'steve'@'localhost';
GRANT ALL PRIVILEGES ON torque.* TO 'steve'@'localhost';
FLUSH PRIVILEGES;
```

Then create a table in the database to store the logged data using the `create_torque_log_table.sql`, the `create_torque_sessions_table.sql`, and the `create_torque_keys_table.sql` files provided in the `scripts` folder of this repo: 

```bash
mysql -u yoursqlusername -p < scripts/create_torque_log_table.sql
mysql -u yoursqlusername -p < scripts/create_torque_sessions_table.sql
mysql -u yoursqlusername -p < scripts/create_torque_keys_table.sql
```

### OPTIONAL: Create Google Maps Javascript API Key ###

It's optional, but to be above board, you should create an API key for the google maps javascript API.  If you go here [Google Maps JavaScript API](https://developers.google.com/maps/documentation/javascript/) Click the "Get A Key" button, and follow the procedure to create a new project, then go to "Credentials" and make a new API Key, choosing "Server".  You'll be using it below.

More guidance is available [here](https://developers.google.com/maps/documentation/javascript/get-api-key).

You don't NEED to do this, but it's the proper way and will actually squash some javascript warnings if you like to keep your debug logs clean.

### Configure Webserver ###

Move the contents of the `web` folder to your webserver and set the appropriate permissions. For example, using an Apache server located at `/var/www`:

```bash
mv web /var/www/torque
cd /var/www/torque
find . -type d -exec chmod 755 {} +
find . -type f -exec chmod 644 {} +
```

Rename the `creds-sample.php` file to `creds.php`:

```bash
mv creds-sample.php creds.php
```

Then edit/enter your MySQL username and password in the empty **$db_user** and **$db_pass** fields:

```php
...
$db_host = 'localhost';
$db_user = '**steve**';
$db_pass = '**zissou**';
$db_name = 'torque';
$db_table = 'raw_logs';
$db_keys_table = 'torque_keys';
$db_sessions_table = 'sessions';
$gmapsApiKey = ''; // OPTIONAL Create a key at https://developers.google.com/maps/documentation/javascript/
$mapboxApiKey = '';  // OPTIONAL: Create a key at https://account.mapbox.com/auth/signup/
$tomtomApiKey = '';  // OPTIONAL: Create a key at https://developer.tomtom.com/user/register
$thunderforestApiKey = ''; // OPTIONAL: Create a key at https://www.thunderforest.com/pricing/
$hereApiKey = '';  // OPTIONAL: Create a key at https://account.here.com/sign-up
$maptilerApiKey = ''; // OPTIONAL: Create a key at https://cloud.maptiler.com/auth/widget
...
```

If you created map provider API key above, place that in the variable here.

# Map Providers #
Upgraded installs will need add new variables from creds-sample.php to your creds.php additional provider API keys if required and the map options below. Will display message at top of sessions.php and default to ESRI Streets.

Support added for most of the Open Street Map poviders and contributors with the abliltiy to select from avilable map styles.
```php
...
//Map options
$mapProvider = 'esri'; // google,esri,stamen,openstreetmap,mapbox,tomtom,thunderforest,here,maptiler
$mapStyleSelect = 'Streets'; //provider specific see README e.g. roadmap for google, Streets for esri, not used for openstreetmap
...
```
| No API Key Requierd |
| :---: |

| esri        | stamen   | openstreetmap |
| :---:       | :---:    | :---:         |
|Streets      |terrain   |
|Topographic  |toner     |
|USATopo      |watercolor|  
|Gray    |  
|DarkGray|  
|Imagery |
|NationalGeographic|

| API Key Requierd |
| :---: |

| google  | tomtom | here          | mapbox              | maptiler| thunderforest |
| :---:   | :---:  | :---:         | :---:               | :---:   |    :---:      |
|roadmap  |main    |normal.day     |streets-v11          |streets  |transport      |
|satellite|night   |normal.day.grey|outdoors-v11         |basic    |transport-dark |
|hybrid   |        |reduced.day    |light-v10            |bright   |spinal-map     |
|terrain  |        |satellite.day  |dark-v10             |pastel   |landscape      |
|         |        |hybrid.day     |satellite-v9         |positron |outdoors       |
|         |        |normal.night   |satellite-streets-v11|toner    |pioneer        |
|         |        |reduced.night  |navigation-day-v1    |topo     |mobile-atlas   |
|         |        |               |navigation-night-v1  |voyager  |neighbourhood  |

# Settings in Torque App - REQUIRED BEFORE UI WILL LOAD #



To use your database/server with Torque, open the app on your phone and navigate to:

```
Settings -> Data Logging & Upload
```
Below are the options which seem to work best for optimal logging, the suggested "File Logging" interval is 1s:

<div align="center" style="padding:15px; display:block;"><img src="http://www.surfrock66.com/images/torque_screenshot_1.png" width="45%" float="left" /><img src="http://www.surfrock66.com/images/torque_screenshot_2.png" width="45%" float="right" /></div>

Additionally, I recommend changing the web logging interval to 1s, though this produces a LOT of data.  Some users may want to set this to >=5s.  

<div align="center" style="padding-bottom:15px; display:block;"><img src="http://www.surfrock66.com/images/torque_screenshot_3.png" width="45%" float="left" /><img src="http://www.surfrock66.com/images/torque_screenshot_4.png" width="45%" float="right" /></div>

Enter the URL to your **upload_data.php** script under "Webserver URL" and press `OK`. Test that it works by clicking `Test settings` and you should see a success message like the image on the right:

<div align="center" style="padding-bottom:15px; display:block;"><img src="http://www.surfrock66.com/images/torque_screenshot_5.png" width="45%" float="left" /><img src="http://www.surfrock66.com/images/torque_screenshot_6.png" width="45%" float="right" /></div>


At this point, you should be all setup. The next time you connect to Torque in your car, data will begin syncing into your MySQL database in real-time!

### Optional: Home Assistant Integration ###

Per [arduiacob's](https://github.com/arduiacob) suggestion and code submission, this app can now forward sensor data to Home Assistant.  This requires 2 variables, one is the URL to your home assistant instance (which is set in the creds.php file and is clearly labeled), and the other is a Bearer Token for the Home Assistant account which will be intaking the data.  The bearer token can be pasted directly into creds.php as a variable (which must be uncommented), or if you chose to put the bearer token into the Torque Pro config, this webapp will extract it from the upload request and utilize it.  Documentation of the [Home Assistant Torque Integration is available here.](https://www.home-assistant.io/integrations/torque/) Uploaded data will appear as a sensor, most often prefixed with "sensor.vehicle".

### Gotchas ###

If you log a ton of PID's (as I do for debugging) you may encounter an apache bug; Torque uploads data through a huge $_GET request.  Apache, by default, allows $_GET requests up to 8190 characters.  My sample data upload was 13,619 characters long...this led to some data uploads returning 414 errors instead of 200 responses, which resulted in the app trying over-and-over to re-upload the datapoint, essentially DDoS'ing myself.  For this; you can edit your apache configuration to allow any value you like; this is, in general, not recommended and should be set to limit a value as close as possible to what your longest query would be.  On my configuration, I edited /etc/apache2/sites-available/000-default.conf and added the following line:

```
LimitRequestLine 15000
```

### Roadmap ###

* Sanity Checks and Warnings for merges and deletes
* Allow for csv imports...captures un-uploaded but recorded data when emailed from torque
  * Email-receiver for this?  LONG SHOT, but have the server read an email address so you can email tracks from the app
* Ian Hawkins has a google map pin show up when hovering over his graphs on his reference viewer...different system, but it'd be cool to implement.
* Idea: speed heatmap for the map track. (Google Maps iOS API has gradient polylines, javascript API does not...may not be possible for now).

### Credits and Thanks ###

* [Ian Hawkins](http://ian-hawkins.com/) - Creator of the Torque app, none of this happens without that
* [Matt Nicklay/econpy](https://github.com/econpy) - This is the project I forked from, so all credit where credit is due
* [Takashi Saito/takashisite](https://github.com/takashisite) - Spawn for the patch to change the GPS from float to double; I didn't take his pull request because it came with a greater structural update, but he deserves credit for pointing it out
* [marvinwankersteen](https://github.com/marvinwankersteen) - Gave me the idea to implement the "favorite variables" system.
