SELECT
    date(ts.date) Date
    ,instrument.name Name
    ,geographical_zone.name Geographical_zone
    ,country.name Country
    ,sector.name Sector
    ,industry.name Industry
    ,ts.value Value
FROM instrument
JOIN profile ON instrument.id = profile.instrumentid
JOIN country on profile.countryid = country.id
JOIN geographical_zone on country.zoneid = geographical_zone.id
JOIN industry on profile.industryid = industry.id
JOIN sector ON sector.id = industry.sectorid
JOIN time_series ts on instrument.id = ts.instrumentid
WHERE ts.date BETWEEN datetime('2014-03-12') AND datetime('2019-03-12')
AND instrument.typeid = 0;