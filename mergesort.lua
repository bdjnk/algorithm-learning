local socket = require"socket"

merge = function(a, p, q, r)
	local lo = {}
	for i = p, q do
		lo[#lo+1] = a[i]
	end

	local hi = {}
	for i = q+1, r do
		hi[#hi+1] = a[i]
	end

	local lx, hx = 1, 1
	for i = p, r do
		if not hi[hx] or lo[lx] and lo[lx] < hi[hx] then
			a[i] = lo[lx]
			lx = lx + 1
		else
			a[i] = hi[hx]
			hx = hx + 1
		end
	end
end

sort = function(a, p, r)
	local q = math.floor((p+r)/2)
	if p < r then
		sort(a, p, q)
		sort(a, q+1, r)
		merge(a, p, q, r)
	end
end

main = function()
	--local a = {14, 7, 3, 12, 9, 11, 6, 2}
	local a = {}
	for i = 1, 999999 do a[i] = math.random(-999999, 999999) end
t1 = socket.gettime()
	sort(a, 1, #a)
t2 = socket.gettime()
print("Seconds: "..t2-t1)
	--for k,v in ipairs(a) do io.write(v.." ") end
end

main()
