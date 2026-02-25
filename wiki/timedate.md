# `timedate`

| Function | Description |
|----------|-------------|
| [`timedate::calendar::day_of_year`](./timedate/calendar/day_of_year.md) | Get day of year for a date |
| [`timedate::calendar::days_in_year`](./timedate/calendar/days_in_year.md) | Get number of days in a year |
| [`timedate::calendar::easter`](./timedate/calendar/easter.md) | Calculate Easter date for a given year (Meeus/Jones/Butcher algorithm) |
| [`timedate::calendar::is_leap_year`](./timedate/calendar/is_leap_year.md) | ============================================================================== |
| [`timedate::calendar::iso_week`](./timedate/calendar/iso_week.md) | Get ISO week number for a date |
| [`timedate::calendar::is_weekday`](./timedate/calendar/is_weekday.md) | Check if a date falls on a weekday |
| [`timedate::calendar::is_weekend`](./timedate/calendar/is_weekend.md) | Check if a date falls on a weekend |
| [`timedate::calendar::month`](./timedate/calendar/month.md) | Get the calendar for a month (like cal command) |
| [`timedate::calendar::quarter`](./timedate/calendar/quarter.md) | Get quarter for a date |
| [`timedate::calendar::weekdays_between`](./timedate/calendar/weekdays_between.md) | Number of weekdays between two dates |
| [`timedate::date::add_days`](./timedate/date/add_days.md) | Add n days to a date |
| [`timedate::date::add_months`](./timedate/date/add_months.md) | Add n months to a date |
| [`timedate::date::add_years`](./timedate/date/add_years.md) | Add n years to a date |
| [`timedate::date::compare`](./timedate/date/compare.md) | Compare two dates — returns -1, 0, or 1 |
| [`timedate::date::day`](./timedate/date/day.md) | Get day of month (01-31) |
| [`timedate::date::day_name`](./timedate/date/day_name.md) | Get day of week name |
| [`timedate::date::day_name::short`](./timedate/date/day_name/short.md) | Get day of week short name |
| [`timedate::date::day_of_week`](./timedate/date/day_of_week.md) | Get day of week (1=Monday, 7=Sunday, ISO 8601) |
| [`timedate::date::day_of_year`](./timedate/date/day_of_year.md) | Get day of year (001-366) |
| [`timedate::date::days_between`](./timedate/date/days_between.md) | Number of days between two dates |
| [`timedate::date::days_in_month`](./timedate/date/days_in_month.md) | Get last day of a given month |
| [`timedate::date::format`](./timedate/date/format.md) | Current date in a custom format |
| [`timedate::date::is_after`](./timedate/date/is_after.md) | Check if a date is after another |
| [`timedate::date::is_before`](./timedate/date/is_before.md) | Check if a date is before another |
| [`timedate::date::is_between`](./timedate/date/is_between.md) | Check if a date is between two dates (inclusive) |
| [`timedate::date::month`](./timedate/date/month.md) | Get month (01-12) |
| [`timedate::date::month_end`](./timedate/date/month_end.md) | Get end of current month |
| [`timedate::date::month_start`](./timedate/date/month_start.md) | Get start of current month |
| [`timedate::date::next_weekday`](./timedate/date/next_weekday.md) | Next occurrence of a weekday from today |
| [`timedate::date::prev_weekday`](./timedate/date/prev_weekday.md) | Previous occurrence of a weekday |
| [`timedate::date::quarter`](./timedate/date/quarter.md) | Get quarter (1-4) |
| [`timedate::date::sub_days`](./timedate/date/sub_days.md) | Subtract n days from a date |
| [`timedate::date::today`](./timedate/date/today.md) | ============================================================================== |
| [`timedate::date::tomorrow`](./timedate/date/tomorrow.md) | Get tomorrow's date |
| [`timedate::date::week_end`](./timedate/date/week_end.md) | Get end of current week (Sunday) |
| [`timedate::date::week_of_year`](./timedate/date/week_of_year.md) | Get week of year (ISO 8601, 01-53) |
| [`timedate::date::week_start`](./timedate/date/week_start.md) | Get start of current week (Monday) |
| [`timedate::date::year`](./timedate/date/year.md) | Get year |
| [`timedate::date::year_end`](./timedate/date/year_end.md) | Get end of current year |
| [`timedate::date::year_start`](./timedate/date/year_start.md) | Get start of current year |
| [`timedate::date::yesterday`](./timedate/date/yesterday.md) | Get yesterday's date |
| [`timedate::duration::format`](./timedate/duration/format.md) | ============================================================================== |
| [`timedate::duration::format_ms`](./timedate/duration/format_ms.md) | Format milliseconds into human-readable duration |
| [`timedate::duration::parse`](./timedate/duration/parse.md) | Parse a duration string into seconds |
| [`timedate::duration::relative`](./timedate/duration/relative.md) | Human-readable relative time from a unix timestamp |
| [`timedate::time::format`](./timedate/time/format.md) | Current time in a custom format |
| [`timedate::time::hour`](./timedate/time/hour.md) | Get hour (00-23) |
| [`timedate::time::is_after`](./timedate/time/is_after.md) | Check if current time is after a given time |
| [`timedate::time::is_afternoon`](./timedate/time/is_afternoon.md) | Check if currently afternoon (12:00-17:59) |
| [`timedate::time::is_before`](./timedate/time/is_before.md) | Check if current time is before a given time |
| [`timedate::time::is_between`](./timedate/time/is_between.md) | Check if current time is between two times (HH:MM) |
| [`timedate::time::is_business_hours`](./timedate/time/is_business_hours.md) | Check if currently business hours (09:00-17:00 Mon-Fri) |
| [`timedate::time::is_evening`](./timedate/time/is_evening.md) | Check if currently evening (18:00-23:59) |
| [`timedate::time::is_morning`](./timedate/time/is_morning.md) | Check if currently morning (00:00-11:59) |
| [`timedate::time::minute`](./timedate/time/minute.md) | Get minute (00-59) |
| [`timedate::time::now`](./timedate/time/now.md) | ============================================================================== |
| [`timedate::time::second`](./timedate/time/second.md) | Get second (00-59) |
| [`timedate::time::sleep`](./timedate/time/sleep.md) | Sleep with a progress indicator |
| [`timedate::timestamp::from_human`](./timedate/timestamp/from_human.md) | Convert human-readable date to unix timestamp |
| [`timedate::timestamp::to_human`](./timedate/timestamp/to_human.md) | Convert unix timestamp to human-readable |
| [`timedate::timestamp::unix`](./timedate/timestamp/unix.md) | ============================================================================== |
| [`timedate::timestamp::unix_ms`](./timedate/timestamp/unix_ms.md) | Current unix timestamp in milliseconds |
| [`timedate::timestamp::unix_ns`](./timedate/timestamp/unix_ns.md) | Current unix timestamp in nanoseconds |
| [`timedate::time::stopwatch::start`](./timedate/time/stopwatch/start.md) | Stopwatch — start, returns a token |
| [`timedate::time::stopwatch::stop`](./timedate/time/stopwatch/stop.md) | Stopwatch — stop, returns elapsed ms |
| [`timedate::time::timezone`](./timedate/time/timezone.md) | Get timezone abbreviation |
| [`timedate::time::timezone_offset`](./timedate/time/timezone_offset.md) | Get timezone offset from UTC (e.g. +0800) |
| [`timedate::tz::convert`](./timedate/tz/convert.md) | ============================================================================== |
| [`timedate::tz::current`](./timedate/tz/current.md) | Get current timezone name |
| [`timedate::tz::is_dst`](./timedate/tz/is_dst.md) | Check if currently in daylight saving time |
| [`timedate::tz::list`](./timedate/tz/list.md) | List all available timezones |
| [`timedate::tz::list::region`](./timedate/tz/list/region.md) | List timezones filtered by region |
| [`timedate::tz::now`](./timedate/tz/now.md) | Get current time in a specific timezone |
| [`timedate::tz::offset_seconds`](./timedate/tz/offset_seconds.md) | Get UTC offset in seconds |
