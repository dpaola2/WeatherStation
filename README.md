# WeatherStation

Rails app to monitor LaCrosse weather station data and upload to my Weather Underground device reports.

Thanks to @keithprickett for prior work on [python libraries](https://github.com/keithprickett/lacrosse_to_wunderground) that made this project much faster to implement.

## Environment Variables

```
WUNDERGROUND_STATION_ID=someething
WUNDERGROUND_STATION_KEY=something
WUNDERGROUND_API_KEY=something
LACROSSE_EMAIL=something
LACROSSE_PASSWORD=something
```

## How it works

Every 10 minutes a scheduled job runs `rake upload_and_retrieve`. This task runs the `Lacrosse::Retrieve` interactor and passes the output to the `Wunderground::Upload` interactor.

## Rate limiting

We use a Sidekiq background worker (`UploadDataPointJob`) to upload individual data points from the various sensors. Weather Underground's API has a rate limit in place, so we use [sidekiq-throttled](https://github.com/sensortower/sidekiq-throttled) to throttle our API requests and adhere to the rules.
