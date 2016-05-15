function timedifference(s)
   year = string.sub(s, 1, 4)
   month = string.sub(s, 6, 7)
   day = string.sub(s, 9, 10)
   hour = string.sub(s, 12, 13)
   minutes = string.sub(s, 15, 16)
   seconds = string.sub(s, 18, 19)
   t1 = os.time()
   t2 = os.time{year=year, month=month, day=day, hour=hour, min=minutes, sec=seconds}
   difference = os.difftime (t1, t2)
   return difference
end
 
commandArray = {}
 
for i, v in pairs(otherdevices) do
   timeon = 3600
   tc = tostring(i)
   if (string.find(tc, " Mirror") ~= nil) or (string.find(tc, " Fan") ~= nil) then
      difference = timedifference(otherdevices_lastupdate[tc])
      tempdiff = tostring(difference)
      tempmessage = tc.." Light has been on for " .. tempdiff .. " seconds - currently " .. otherdevices[tc]
      -- print(tempmessage)      
      if (difference > timeon and difference < (timeon + 60))then
         tempmessage = tc.." Light Off - after at least " .. (timeon+1) .. " secs up - actually - " .. tempdiff .. " seconds"
         print(tempmessage)
         commandArray[tc] = 'Off'
      end
   end
end
 
return commandArray