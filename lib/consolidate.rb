def consolidated_data(latitude, longitude, year, day, month, hour, minute, timezone_offset)
    return {
        :sidereal => sidereal_chart_values(latitude, longitude, year, month, day, hour, minute, timezone_offset),
        :tropical => tropical_chart_values(latitude, longitude, year, month, day, hour, minute, timezone_offset),
    }
end