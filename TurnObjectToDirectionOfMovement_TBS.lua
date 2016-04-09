--[[set speed treshold for changing direction when dragging, need to spawn new object to take effect]]--
local speedTreshold = 2

--[[local values]]--
local fixate
local pickedup = false
speedTreshold = math.pow(speedtreshold, 2)

function onPickedUp()
    pickedup = true
    
    fixate = {x = self.getRotation()["x"], y = self.getRotation()["y"], z = self.getRotation()["z"]}
end

function onDropped()
    pickedup = false
end

function update()
    if pickedup == true then
        local velocity = self.getVelocity()

         if math.pow(velocity["x"],2)
            + math.pow(velocity["z"],2) > speedTreshold then 
            local angle = math.atan2(velocity["x"], velocity["z"])

            fixate = {x = self.getRotation()["x"], y = math.deg(angle), z = self.getRotation()["z"]}

        
        else
            --[[BUG? the rotation is reset to original orintation unless setRotationSmooth is called]]--
            self.setRotationSmooth(fixate)
        end

        --[[BUG? setRotionSmooth can't rotate the object]]--
            self.setRotation(fixate)
    end
end
