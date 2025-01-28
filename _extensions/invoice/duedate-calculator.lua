function Meta(meta)
    
    local format = "^(%a+)%s+(%d+),%s+(%d+)$"

    local m,d,y = pandoc.utils.stringify(meta.date):match(format)

    local months = {
    January   = 1,
    February  = 2,
    March     = 3,
    April     = 4,
    May       = 5,
    June      = 6,
    July      = 7,
    August    = 8,
    September = 9,
    October   = 10,
    November  = 11,
    December  = 12
    }

    local date = os.time({
        year = y,
        month = months[m],
        day = d,
        }) + 30*24*60*60

    
    local d = tonumber(os.date("%d", date))  -- This gives a number, e.g. 4 not "04"
    local m = os.date("%B", date)           -- Full month name
    local y = os.date("%Y", date)           -- Year


    local formatted_date = m .. " " .. d .. ", " .. y

    meta.duedate = pandoc.Str(formatted_date)
    

    return meta
end