----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 13 Mar 2013
-- Resource: GTIdroid/calculator.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

-- Basic Functions
------------------->>

function add(num1, num2)
	return num1 + num2
end

function subtract(num1, num2)
	return num1 - num2
end

function multiply(num1, num2)
	return num1 * num2
end

function divide(num1, num2)
	return num1 / num2
end

-- Trig Functions
------------------>>

function sin(num, degrees)
	if (not degrees) then
		return math.sin(num)
	else
		return math.deg( math.sin(num) )
	end
end

function cos(num, degrees)
	if (not degrees) then
		return math.cos(num)
	else
		return math.deg( math.cos(num) )
	end
end

function tan(num, degrees)
	if (not degrees) then
		return math.tan(num)
	else
		return math.deg( math.tan(num) )
	end
end

-- Logarithms
-------------->>

function log(num, base)
	if (not base) then base = 10 end
	return math.log10(num, base)
end

function ln(num)
	return math.log(num)
end

-- Powers & Roots
------------------>>

function toPower(num, power)
	return num ^ power
end

function toRoot(num, root)
	if (not root) then root = 2 end
	return num ^ (1/root)
end

-- Factorials
-------------->>

function factorial(num)
	if (type(num) ~= "number") then return false end
	
	local answer = num
	local int = num
	while (int > 1) do
		answer = answer * (int - 1)
		int = int - 1
	end
	return answer
end
