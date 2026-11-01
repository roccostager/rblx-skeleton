local NumberUtils = {}


-- Formats a Number with commas every 3 digits
-- Returns number as a string
function NumberUtils.formatComma(num: number)

    local formatted = tostring(math.floor(num))
    local substitutions: number

    while true do
        formatted, substitutions = string.gsub(formatted, "^(-?%d+)(%d%d%d)", "%1,%2")
        if substitutions == 0 then break end
    end

    return formatted
end


return NumberUtils