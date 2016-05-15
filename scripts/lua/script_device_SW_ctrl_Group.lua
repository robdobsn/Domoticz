function trim(s)
  return (s:gsub("^%s*(.-)%s*$", "%1"))
end

commandArray = {}
 
tc=next(devicechanged)
v=tostring(tc)
if (trim(v) == 'Cloakroom - SW2') then
	lastTime = tonumber(uservariables["CloakroomCeilingSWLastChg"])
	print("Hello from LUA: " .. v .. " status has changed - last time = " .. tostring(lastTime))
	-- for i, v in pairs(devicechanged) do print(i .. " === " .. v) end
	-- for i, v in pairs(otherdevices_lastupdate) do print ("Other " .. i .. " === " .. v) end
	difference = os.difftime(os.time(), lastTime)
	tempdiff = tostring(difference)
	tempmessage = v .. " was last changed " .. tempdiff .. " seconds ago"
	print(tempmessage)
	-- If more than a certain time then allow the change to toggle the lighting group
	if (difference > 5) then
		c="Cloakroom - Ceiling"
		curStatus = otherdevices[c]
		print ("device status currently " .. curStatus)
		if (curStatus == "Off") then
			commandArray[c] = 'On'
			print(c .. " turned on by script")
		else
			commandArray[c] = 'Off'
			print(c .. " turned off by script")
		end
		commandArray['Variable:CloakroomCeilingSWLastChg'] = tostring(os.time())

		-- 
		-- tempmessage = c.." ==> Light Off - after at least " .. (timeon+1) .. "secs up - actually - " .. tempdiff .. "seconds"
		-- print(tempmessage)
	end

end

return commandArray
