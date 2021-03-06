
local kMinCommanderLightIntensityScalar = 0.3

local kPowerDownTime = 1
local kOffTime = 10
local kLowPowerCycleTime = 1
local kDamagedCycleTime = 0.2
local kDamagedMinIntensity = 0.5
local kAuxPowerMinIntensity = 0
local kAuxPowerMinCommanderIntensity = 3
local kNoPowerIntensity = 0.05 -- 0.02
local kNoPowerMinIntensity = 0.45
local kSmallLightRadius = 1.5

local whiteColor = Color(1,1,1,1)
local function _col_reduce(color)
    return LerpColor(color, whiteColor, 0.2)
end

-- set the intensity and color for a light. If the renderlight is ambient, we set the color
-- the same in all directions
local function SetLight(renderLight, intensity, color)
    
    
    if intensity then
        --boost intensity if it is below 40ish
        --intensity = 2 * 15 * (math.pow(intensity, 0.3) / 15.0) + intensity * 0.85
        renderLight:SetIntensity(intensity)
    end
    
    if color then
    
        renderLight:SetColor((color))
        
        if renderLight:GetType() == RenderLight.Type_AmbientVolume then
        
            renderLight:SetDirectionalColor(RenderLight.Direction_Right,    (color))
            renderLight:SetDirectionalColor(RenderLight.Direction_Left,     (color))
            renderLight:SetDirectionalColor(RenderLight.Direction_Up,       (color))
            renderLight:SetDirectionalColor(RenderLight.Direction_Down,     (color))
            renderLight:SetDirectionalColor(RenderLight.Direction_Forward,  (color))
            renderLight:SetDirectionalColor(RenderLight.Direction_Backward, (color))
            
        end
        
    end
end

function NormalLightWorker:RestoreColor(renderLight)
    
    renderLight:SetColor((renderLight.originalColor))
    
    if renderLight:GetType() == RenderLight.Type_Spot then
        local atmoModifier = Client.GetOptionFloat("graphics/atmospheric-density", 1.0)
        renderLight:SetAtmosphericDensity( renderLight.originalAtmosphericDensity * atmoModifier )
    end
    
    if renderLight:GetType() == RenderLight.Type_AmbientVolume then

        renderLight:SetDirectionalColor(RenderLight.Direction_Right,   (renderLight.originalRight   ) )
        renderLight:SetDirectionalColor(RenderLight.Direction_Left,    (renderLight.originalLeft    ) )
        renderLight:SetDirectionalColor(RenderLight.Direction_Up,      (renderLight.originalUp      ) )
        renderLight:SetDirectionalColor(RenderLight.Direction_Down,    (renderLight.originalDown    ) )
        renderLight:SetDirectionalColor(RenderLight.Direction_Forward, (renderLight.originalForward ) )
        renderLight:SetDirectionalColor(RenderLight.Direction_Backward,(renderLight.originalBackward) )
        
    end

end


-- Turning on full power.
-- When turn on full power, the lights are never decreased in intensity.
--
function NormalLightWorker:Run()

    PROFILE("NormalLightWorker:Run")

    local timeOfChange = self.handler.powerPoint:GetTimeOfLightModeChange()
    local time = Shared.GetTime()
    local timePassed = time - timeOfChange    

    if self.activeProbes then
    
        local startFullLightTime = PowerPoint.kMinFullLightDelay
        local fullFullLightTime = startFullLightTime + PowerPoint.kFullPowerOnTime      
        
        local probeTint = nil
        
        if timePassed < startFullLightTime then
            -- we don't change lights or color during this period
            probeTint = nil
        else
            probeTint = Color(1, 1, 1, 1)
            self.activeProbes = false
        end

        if probeTint ~= nil then
            for _,probe in ipairs(self.handler.probeTable) do
                probe:SetTint( Color(1, 1, 1, 1) )
            end
         end
        
    end

    local removeLights = {}
    for _,renderLight in ipairs(self.activeLights) do

        local intensity = nil
        local randomValue = renderLight.randomValue
    
        local startFullLightTime = PowerPoint.kMinFullLightDelay + PowerPoint.kMaxFullLightDelay * randomValue
        -- time when full lightning is achieved
        local fullFullLightTime = startFullLightTime + PowerPoint.kFullPowerOnTime  
 
        if timePassed < startFullLightTime then

            -- we don't change lights or color during this period
            intensity = nil
          
        elseif timePassed < fullFullLightTime then
            
            -- the period when lights start to come on, possibly with a little flickering
            local t = timePassed - startFullLightTime
            local scalar = math.sin(( t / PowerPoint.kFullPowerOnTime  ) * math.pi / 2)
            intensity = renderLight.originalIntensity * scalar
            
            if renderLight.flickering == nil and intensity < renderLight:GetIntensity() then
                -- don't change anything until we exceed the origin light intensity.
                intensity = nil
            else
            
                if renderLight.flickering == nil then
                    self:RestoreColor(renderLight)
                end
                intensity = intensity * self:CheckFlicker(renderLight,PowerPoint.kFullFlickerChance, scalar)
                
            end
            
        else
            
            intensity = renderLight.originalIntensity
            
            self:RestoreColor(renderLight)
            
            -- remove this light from processing
            table.insert(removeLights, renderLight)
            
        end
        
        -- color are only changed once during the full-power-on
        SetLight(renderLight, intensity, nil)

        if renderLight.originalSpecular then
            renderLight:SetSpecular(renderLight.originalSpecular)
        end
        
    end
    
    for i = 1, #removeLights do
        table.removevalue(self.activeLights, removeLights[i])
    end
    
    local startFullTime = PowerPoint.kMinFullLightDelay
    local fullFullTime = startFullTime + PowerPoint.kFullPowerOnTime
    if timePassed > startFullTime then
        local timeRatio = 1
        if timePassed < fullFullTime then
            timeRatio = Clamp((timePassed - startFullTime) / PowerPoint.kFullPowerOnTime, 0, 1)
        end
        for _, prop in ipairs(self.handler.propLightTable) do
            prop:SetMaterialParameter("emissiveMod", 2.0 * timeRatio)
        end
    end

end
--
-- handles lights when the powerpoint has no power. This involves a time with no lights,
-- and then a period when lights are coming on line into aux power setting. Once the aux light
-- has stabilized, the lights will stay mostly steady, but will sometimes cycle a bit.
--
-- Performance wise, we shift lights from the activeLights table over to lightgroups. Each group
-- of lights stay fixed for a while, then starts to cycle as one for another span of time. Done
-- this way so that we can avoid running the lights most of the time.
--
function NoPowerLightWorker:Run()

    PROFILE("NoPowerLightWorker:Run")

    local timeOfChange = self.handler.powerPoint:GetTimeOfLightModeChange()
    local time = Shared.GetTime()
    local timePassed = time - timeOfChange    
    
    local startAuxLightTime = kPowerDownTime + kOffTime
    local fullAuxLightTime = startAuxLightTime + PowerPoint.kAuxPowerCycleTime
    local startAuxLightFailTime = fullAuxLightTime + PowerPoint.kAuxLightSafeTime
    local totalAuxLightFailTime = startAuxLightFailTime + PowerPoint.kAuxLightDyingTime
    
    local probeTint
    local setProbe = self.activeProbes
    self.activeProbes = true
    
    if timePassed < kPowerDownTime then
        local intensity = math.sin(Clamp(timePassed / kPowerDownTime, 0, 1) * math.pi / 2)
        probeTint = Color(intensity, intensity, intensity, 1)
    else
        probeTint = Color(PowerPoint.kDisabledProbeColor.r,
                          PowerPoint.kDisabledProbeColor.g,
                          PowerPoint.kDisabledProbeColor.b,
                          1)
        self.activeProbes = false
    end

    if setProbe then    
        for _, probe in ipairs(self.handler.probeTable) do
            probe:SetTint( probeTint )
        end
    end

    local removeLights = {}
    
    for _, renderLight in ipairs(self.activeLights) do
        
        local randomValue = renderLight.randomValue
        -- aux light starting to come on
        local startAuxLightTime = kPowerDownTime + kOffTime + randomValue * PowerPoint.kMaxAuxLightDelay 
        -- ... fully on
        local fullAuxLightTime = startAuxLightTime + PowerPoint.kAuxPowerCycleTime
        -- aux lights starts to fade
        local startAuxLightFailTime = fullAuxLightTime + PowerPoint.kAuxLightSafeTime + randomValue * PowerPoint.kAuxLightFailTime
        -- ... and dies completly
        local totalAuxLightFailTime = startAuxLightFailTime + PowerPoint.kAuxLightDyingTime
        
        local intensity = nil
        local color = nil
        
        local showCommanderLight = false
        
        if timePassed < kPowerDownTime then
        
            local scalar = math.sin(Clamp(timePassed / kPowerDownTime, 0, 1) * math.pi / 2)
            scalar = (1 - scalar)
            if showCommanderLight then
                scalar = math.max(kMinCommanderLightIntensityScalar, scalar)
            end
            intensity = renderLight.originalIntensity * (1 - scalar)

        else
        
            local t = timePassed - startAuxLightTime
            -- angle goes from zero to 90 degres in one kAuxPowerCycleTime
            local angleRad = (t / PowerPoint.kAuxPowerCycleTime) * math.pi / 2
            -- and scalar goes 0->1
            local scalar = kNoPowerIntensity
            
            if showCommanderLight then
                scalar = math.max(kMinCommanderLightIntensityScalar, scalar)
            end
            
            intensity = math.max(scalar * renderLight.originalIntensity, kNoPowerMinIntensity)
            
            
            if showCommanderLight then
                color = PowerPoint.kDisabledCommanderColor
            else
                color = PowerPoint.kDisabledColor
            end
     
        end
        
        if timePassed > fullAuxLightTime then
        
            -- Deactivate from initial state
            table.insert(removeLights, renderLight)
            
        end
        
        -- disable really really small lights
        if renderLight.originalRadius < kSmallLightRadius then
            intensity = 0.001
        end
        
        SetLight(renderLight, intensity, color)
        renderLight:SetSpecular(false)
        renderLight:SetAtmosphericDensity(0)
        
    end
    
    for i = 1, #removeLights do
        table.removevalue(self.activeLights, removeLights[i])
    end

    -- handle the light-cycling groups.
    for _,lightGroup in ipairs(self.lightGroups) do
        lightGroup:Run(timePassed)
    end
    
    if timePassed > kPowerDownTime then
        for _, prop in ipairs(self.handler.propLightTable) do
            
            prop:SetMaterialParameter("emissiveMod", 100)
            
        end
    end

end


function LightGroup:RunCycle( time)

    if time > self.cycleEndTime then
    
        -- end varying cycle and fix things for a while. Note that the intensity will
        -- stay a bit random, which is all to the good.
        self.stateFunction = LightGroup.RunFixed
        self.nextThinkTime = time + math.random(10)
        self.cycleUsedTime = self.cycleUsedTime + (time - self.cycleStartTime)
        
    else
    
        -- this is the time used to calc intensity. This is calculated so that when
        -- we restart after a pause, we continue where we left off.
        local t = time - self.cycleStartTime + self.cycleUsedTime 
        
        local showCommanderLight = false
        local player = Client.GetLocalPlayer()
        
        for _,renderLight in ipairs(self.lights) do
        
            -- Fade disabled color in and out to make it very clear that the power is out
            local scalar = kNoPowerIntensity
            
            color = PowerPoint.kDisabledColor
            
            if showCommanderLight then
            
                color = PowerPoint.kDisabledCommanderColor
                
            end
            
            intensity = math.max(renderLight.originalIntensity * scalar, kNoPowerMinIntensity)
            
            SetLight(renderLight, intensity, color)
            
        end
        
    end
    
end

function PowerPointLightHandler:Init(powerPoint)

    self.powerPoint = powerPoint
    self:Reset()
    return self

end

function PowerPointLightHandler:Reset()

    self.lightTable = { }
    self.propLightTable = { }
    self.probeTable = { }
    
    -- all lights for this powerPoint, and filter away those that
    -- shouldn't be affected by the power changes
    for _, light in ipairs(GetLightsForLocation(self.powerPoint:GetLocationName())) do
    
        if not light.ignorePowergrid then
            table.insert(self.lightTable, light)
        end
        
    end
    
    for _, prop in ipairs(GetPropLightsForLocation(self.powerPoint:GetLocationName())) do
    
        table.insert(self.propLightTable, prop)
        
    end
    
    self.probeTable = GetReflectionProbesForLocation(self.powerPoint:GetLocationName())
    self.workerTable = {}
    local normalWorker = NormalLightWorker():Init(self, "normal")
    self.workerTable = {
        [kLightMode.Normal] = normalWorker,
        [kLightMode.NoPower] = NoPowerLightWorker():Init(self, "nopower"),
        [kLightMode.LowPower] = normalWorker,
        [kLightMode.Damaged] = normalWorker,
    }
    
    self:Run(kLightMode.NoPower)

end

function PowerPointLightHandler:Run(mode)

    local worker = self.workerTable[mode]
    local timeOfChange = self.powerPoint:GetTimeOfLightModeChange()

    if self.lastMode ~= mode or self.lastWorker ~= worker or self.lastTimeOfChange ~= timeOfChange then

        worker:Activate()
        self.lastWorker = worker
        self.lastTimeOfChange = timeOfChange

    end
    
    self.lastMode = mode
    
    worker:Run()

end


local noPowerActivate = NoPowerLightWorker.Activate
function NoPowerLightWorker:Activate()
    noPowerActivate(self)
    
end

local normalActivate = NormalLightWorker.Activate
function NormalLightWorker:Activate()
    normalActivate(self)
    
end