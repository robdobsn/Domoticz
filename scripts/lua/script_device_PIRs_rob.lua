function trim(s)
  return (s:gsub("^%s*(.-)%s*$", "%1"))
end

commandArray = {}
 
tc=next(devicechanged)
v=tostring(tc)
if (v:sub(1,3) == 'PIR') then
	c="Group:"..trim(v:sub(4))
    commandArray[c] = 'On'
    tmess = c..' ==> On at time 0'
    print(tmess)
end
 
return commandArray