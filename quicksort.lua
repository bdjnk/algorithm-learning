local socket = require"socket"

swap = function(a, one, two)
	local tmp = a[one]
	a[one] = a[two]
	a[two] = tmp
end

prep = function(a, p, r)
	-- TODO select a good pivot
	local q = math.random(p, r)
	swap(a, r, q)
end

part = function(a, p, r)
	prep(a, p, r)
	local q = p
	for j = p+1, r-1 do
		if a[j] <= a[r] then -- swap to the left
			if a[j] == a[r] then -- unless == then
				if j % 2 == 1 then -- half the times
					swap(a, j, q)
				end
			else
				swap(a, j, q)
			end
			q = q + 1
		end
	end
	swap(a, r, q)
	return q
end

sort = function(a, p, r)
	if p < r then
		local q = part(a, p, r)
		sort(a, p, q-1)
		sort(a, q+1, r)
	end
end

main = function()
	--local a = {14, 7, 3, 12, 9, 11, 6, 2}
	local a = {}
	for i = 1, 999999 do a[i] = math.random(-999, 999) end
	
	t1 = socket.gettime()
	sort(a, 1, #a)
	t2 = socket.gettime()
	print("Seconds: "..t2-t1)
	
	--for k,v in ipairs(a) do io.write(v.." ") end
end

main()
