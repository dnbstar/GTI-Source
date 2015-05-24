----------------------------------------->>
-- Grand Theft International (GTi)
-- Author: Jack Johnson (Jack)
-- Date: 8 October 2014
-- Resource: GTIrefinery/class/barrel_class.lua
-- Version: 1.0
----------------------------------------->>

Barrel = {}
Barrel.__index = Barrel

--Barrel.New: Creates a new barrel instance and handles everything by itself. This can be controlled within the script.
--RETURN: TABLE if instance is created, FALSE otherwise.
function Barrel:new(x,y,z,_type,amount,owner)
	if not (x) or not (y) or not (z) then return false end
	if not (owner) then return false end
	
	local barrel = {}
	barrel.object = createObject(1225,x,y,z)
	barrel.type = _type or "oil"
	barrel.quantity = amount or 100
	barrel.owner = owner
	setmetatable(barrel,Barrel)
	return barrel
end

--Barrel:SetType: Change the type of the barrel (can be from a oil barrel to a fuel barrel.)
-- RETURN: TRUE if it has been updated, FALSE otherwise.
function Barrel:setType(_type)
	if (self) and (isElement(self.object)) then
		self.type = _type
		return true
	end
	return false
end

--Barrel:GetType: Get the type of the barrel
--RETURN: STRING "oil" OR "fuel"
function Barrel:getType()
	if (self) and (isElement(self.object)) then
		return self.type
	end
	return false
end

--Barrel:UpdateQuantity: Updates the quantity within the barrel.
--RETURN: TRUE if it has been updated, FALSE otherwise.
function Barrel:setQuantity(amount)
	if (self) and (isElement(self.object)) then
		self.quantity = amount
		return true
	end
	return false
end

--Barrel:GetQuantity: Get the quantity within the barrel
--RETURN: STRING if quantity is available, FALSE otherwise.
function Barrel:getQuantity()
	if (self) and (isElement(self.object)) then
		return self.quantity or false
	end
	return false
end

--Barrel:Destroy: Destroys the barrel and it's instance.
--RETURNS: TRUE if it has been destroyed, FALSE otherwise.
function Barrel:destroy()
	if (isElement(self.object)) then
		destroyElement(self.object)
		self = nil
		return true
	end
	return false
end