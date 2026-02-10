BountifulDelvesHelper = BountifulDelvesHelper or {}

if not BountifulDelvesHelperDB then
    BountifulDelvesHelperDB = {
        highestDelveTier = nil,
        waypointSystem = "default"
    }
end

if not BountifulDelvesHelperIconDB then
    BountifulDelvesHelperIconDB = {
        minimapPos = 140,
        hide = false,
    }
end

SLASH_DELVES1 = "/delves"

VOID_THEME = {
    bg_darkest        = {0.04, 0.02, 0.10, 0.97},
    bg_dark           = {0.08, 0.05, 0.18, 0.95},
    bg_medium         = {0.12, 0.08, 0.25, 0.90},
    bg_light          = {0.18, 0.12, 0.35, 0.85},

    border_void       = {0.55, 0.15, 0.85, 0.80},
    border_glow       = {0.70, 0.40, 1.00, 0.70},
    border_dim        = {0.35, 0.10, 0.55, 0.60},

    text_primary      = {0.92, 0.88, 1.00, 1.00},
    text_secondary    = {0.75, 0.70, 0.90, 1.00},
    text_dim          = {0.60, 0.55, 0.75, 1.00},
    text_highlight    = {0.95, 0.85, 1.00, 1.00},

    button_bg_normal  = {0.20, 0.14, 0.38, 0.95},
    button_bg_active  = {0.40, 0.25, 0.65, 1.00},
    button_border     = {0.65, 0.30, 1.00, 0.75},

    shards_amount     = {0.85, 0.70, 1.00, 1.00},
    time_left         = {0.60, 0.85, 1.00, 1.00},
}

areaIDs = {
    [2248] = "Isle Of Dorn",
    [2215] = "Hallowfall",
    [2214] = "Ringing Deeps",
    [2255] = "Azj-Kahet",
    [2346] = "Undermine",
    [2371] = "K'aresh",
    [2395] = "Eversong Woods",
    [2413] = "Harandar",
    [2405] = "Voidstorm",
    [2437] = "Zul'Aman",
    [2393] = "Silvermoon",
	[2424] = "Isle of Quel'Danas"
}

waypoints = {
    --Eversong Woods
    -- "The Shadow Enclave"
    [8438] = { ["zone"] = 2395, ["x"] = 45.0, ["y"] = 87.0 },
    --Zul'Aman
	-- "Atal'Aman"
    [8444] = { ["zone"] = 2437, ["x"] = 63.5, ["y"] = 80.3 },
    -- "Twilight Crypt"
    [8442] = { ["zone"] = 2437, ["x"] = 25.2, ["y"] = 85.4 },
    --Voidstorm
    -- "Shadowguard Point"
    [8432] = { ["zone"] = 2405, ["x"] = 36.9, ["y"] = 49.7 },
    -- "Sunkiller Sanctum"
    [8430] = { ["zone"] = 2405, ["x"] = 54.62, ["y"] = 48.43 },
    --Harandar
    -- "The Gulf of Memory"
    [8436] = { ["zone"] = 2413, ["x"] = 36.0, ["y"] = 50.4 },
    -- "The Grudge Pit"
    [8434] = { ["zone"] = 2413, ["x"] = 70.1, ["y"] = 65.92 },
    --Silvermoon
    -- "Collegiate Calamity"
    [8426] = { ["zone"] = 2393, ["x"] = 40.6, ["y"] = 54.6 },
    -- "The Darkway"
    [8439] = { ["zone"] = 2393, ["x"] = 31.9, ["y"] = 54.6 },
	 --Isle of Dorn
    -- "Earthcrawl Mines"
    [7787] = { ["zone"] = 2248, ["x"] = 38.6, ["y"] = 74.0 },
    -- "Fungal Folly"
    [7779] = { ["zone"] = 2248, ["x"] = 52.03, ["y"] = 65.77 },
    -- "Kriegval's Rest"
    [7781] = { ["zone"] = 2248, ["x"] = 62.19, ["y"] = 42.70 },
    --The Ringing Deeps
    -- "The Waterworks"
    [7782] = { ["zone"] = 2214, ["x"] = 42.15, ["y"] = 48.71 },
    -- "The Dread Pit"
    [7788] = { ["zone"] = 2214, ["x"] = 70.20, ["y"] = 37.3 },
    -- "Excavation Site 9"
    [8181] = { ["zone"] = 2214, ["x"] = 76.0, ["y"] = 96.50 },
    --Hallowfall
    -- "Mycomancer Cavern"
    [7780] = { ["zone"] = 2215, ["x"] = 71.3, ["y"] = 31.2 },
    -- "Nightfall Sanctum"
    [7785] = { ["zone"] = 2215, ["x"] = 34.32, ["y"] = 47.43 },
    -- "The Sinkhole"
    [7783] = { ["zone"] = 2215, ["x"] = 50.6, ["y"] = 53.3 },
    -- "Skittering Breach"
    [7789] = { ["zone"] = 2215, ["x"] = 65.48, ["y"] = 61.74 },
    --Azj-Kahet
    -- "The Spiral Weave"
    [7790] = { ["zone"] = 2255, ["x"] = 45.0, ["y"] = 19.0 },
    -- "Tak-Rethan Abyss"
    [7784] = { ["zone"] = 2255, ["x"] = 55.0, ["y"] = 73.92 },
    -- "The Underkeep"
    [7786] = { ["zone"] = 2255, ["x"] = 51.85, ["y"] = 88.30 },
    --Undermine
    -- "Sidestreet Sluice"
    [8246] = { ["zone"] = 2346, ["x"] = 35.20, ["y"] = 52.80 },
    -- "Demolition Dome"
    [8246] = { ["zone"] = 2346, ["x"] = 50.30, ["y"] = 9.60 },
    --K'aresh
    -- "Archival Assault"
    [8273] = { ["zone"] = 2371, ["x"] = 55.00, ["y"] = 48.00 }
}

worldQuestsIDs = {
    ["93013"] = "Special Assignment: Push back the Light",
    ["92063"] = "Special Assignment: A Hunter's Regret",
    ["92145"] = "Special Assignment: The Grand Magister's Drink",
    ["91793"] = "Special Assignment: Into the Depths",
    ["91796"] = "Special Assignment: Ours Once More!"		    
}

delveTiers = {
    { ["bountifulLootIlvl"] = 220, ["recommendedIlvl"] = 170, ["vaultIlvl"] = 233 },
    { ["bountifulLootIlvl"] = 224, ["recommendedIlvl"] = 187, ["vaultIlvl"] = 237 },
    { ["bountifulLootIlvl"] = 227, ["recommendedIlvl"] = 200, ["vaultIlvl"] = 240 },
    { ["bountifulLootIlvl"] = 230, ["recommendedIlvl"] = 213, ["vaultIlvl"] = 243 },
    { ["bountifulLootIlvl"] = 233, ["recommendedIlvl"] = 222, ["vaultIlvl"] = 246 },
    { ["bountifulLootIlvl"] = 237, ["recommendedIlvl"] = 229, ["vaultIlvl"] = 253 },
    { ["bountifulLootIlvl"] = 246, ["recommendedIlvl"] = 235, ["vaultIlvl"] = 256 },
    { ["bountifulLootIlvl"] = 250, ["recommendedIlvl"] = 244, ["vaultIlvl"] = 259 },
    { ["bountifulLootIlvl"] = 250, ["recommendedIlvl"] = 250, ["vaultIlvl"] = 259 },
    { ["bountifulLootIlvl"] = 250, ["recommendedIlvl"] = 257, ["vaultIlvl"] = 259 },
    { ["bountifulLootIlvl"] = 250, ["recommendedIlvl"] = 265, ["vaultIlvl"] = 259 }
}

-- ============================================================================
--  World Quests with Coffer Key Shards (Currency 3310)
-- ============================================================================
local cofferShardCurrencyID = 3310
local sortBy = "zone"  -- "zone" oder "name"
local sortDescending = false  -- false = A-Z, true = Z-A

function GetCofferShardsWorldQuests(callback)
    local result = {}
    -- Zone IDs Midnight
    local zonesToCheck = {2395, 2413, 2405, 2437, 2393,2424} 
    local scanned = 0

    for _, zoneID in ipairs(zonesToCheck) do
        local quests = C_TaskQuest.GetQuestsOnMap(zoneID)
        
        if quests and #quests > 0 then
            local mapInfo = C_Map.GetMapInfo(zoneID)
            local zoneName = mapInfo and mapInfo.name or ("Zone " .. zoneID)
            
--            print("[BDH] Scanne " .. zoneName .. " (" .. #quests .. " Quests)...")

            for _, questData in ipairs(quests) do
                local questID = questData.questID
			
                if questID and questID > 0 then
                    if C_QuestLog.IsWorldQuest(questID) and not C_QuestLog.IsQuestFlaggedCompleted(questID) then
                        scanned = scanned + 1
                        local currencies = C_QuestLog.GetQuestRewardCurrencies(questID)

						if currencies then
                            for _, currencyInfo in ipairs(currencies) do
                                if currencyInfo.currencyID == 3310 or currencyInfo.name == "Coffer Key Shards" then
                                    local title = C_TaskQuest.GetQuestInfoByQuestID(questID) or "Unbekannte Quest"
                                    local amount = currencyInfo.totalRewardAmount
                                    table.insert(result, {
                                        questID = questID, 
                                        title = title, 
                                        zone = zoneName, 
                                        zoneID = zoneID,
										amount = amount
                                    })                                    
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    print("[BDH] Scan done. " .. scanned .. " WQs checked, " .. #result .. " found with Shards reward.")
    
    if callback and type(callback) == "function" then
        callback(result)
    end
    
    return result
end

local function setBackdropColor(frame, color)
    if frame and frame.SetBackdropColor and color then
       frame:SetBackdropColor(color[1], color[2], color[3], color[4])
    end
end

local function setBackdropBorderColor(frame, color)
    if frame and frame.SetBackdropBorderColor and color then
       frame:SetBackdropBorderColor(color[1], color[2], color[3], color[4])
    end
end
-- ============================================================================
-- DrawCofferShardsWQGroup 
-- ============================================================================

AceGUI = LibStub("AceGUI-3.0")
isFrameVisible = false
BountifulDelvesHelperMainFrame = {}

function showUI()
    Delves = {}
	LegacyDelves = {}
	TWW = false

    for delvePoiID, delveConfig in pairs(waypoints) do
        local delve = C_AreaPoiInfo.GetAreaPOIInfo(delveConfig["zone"], delvePoiID)

        if delve ~= nil and delve["atlasName"] == "delves-bountiful" then
            local areaName = areaIDs[delveConfig["zone"]]
            local icon = C_UIWidgetManager.GetAllWidgetsBySetID(delve.iconWidgetSet)
            local isOvercharged = false

            if #icon == 2 then
                isOvercharged = true
            end
			if delveConfig["zone"] > 2392 then
            Delves[delvePoiID] = { ["name"] = delve["name"], ["zone"] = areaName, ["overcharged"] = isOvercharged }
			else 
			LegacyDelves[delvePoiID] = { ["name"] = delve["name"], ["zone"] = areaName, ["overcharged"] = isOvercharged }
			end
        end
    end

    local function DrawDelvesGroup(container)
        local count = 0
        for _ in pairs(Delves) do
            count = count + 1
        end
        if count == 0 then
            guiCreateNewline(container, 3)

            if UnitLevel("player") < 68 then
                local label = AceGUI:Create("Label")
                label:SetText(getColorText("FF7E40", "  Delves unlock at Level 68"))
                label:SetFont(GameFontHighlightLarge:GetFont())
                label:SetFullWidth(true)
                container:AddChild(label)
            else
                local label = AceGUI:Create("Label")
                label:SetText(getColorText("FF7E40", "  There are currently no bountiful Delves available"))
                label:SetFont(GameFontHighlightLarge:GetFont())
                label:SetFullWidth(true)
                container:AddChild(label)
            end

        else
            guiCreateNewline(container, 2)

            cofferKeys = C_CurrencyInfo.GetCurrencyInfo(3028)
            cofferKeyIcon = GetItemIcon(224172)

            if cofferKeys.quantity == 0 then
                textColor = "\124cffE02E2E"
            else
                textColor = "\124cff2FE02F"
            end

            if cofferKeys.quantity == 1 then
                cofferKeyCountLabel = "key"
            else
                cofferKeyCountLabel = "keys"
            end

            local text = AceGUI:Create("InteractiveLabel")
            text:SetImage(cofferKeyIcon)
            text:SetImageSize(22, 22)
            text:SetText(textColor .. cofferKeys.quantity .. "\124cffFFFFFF " .. cofferKeyCountLabel .. " on this character\124r")
            text:SetWidth(420)
            text:SetFont(GameFontHighlightLarge:GetFont())
            container:AddChild(text)

            guiCreateSpacing(container, 5)

	    cofferShards = C_CurrencyInfo.GetCurrencyInfo(3310)
	    weeklyShardsMax = cofferShards.maxWeeklyQuantity
	    weeklyShardsObtained = cofferShards.quantityEarnedThisWeek
	    weeklyShardsBalance = weeklyShardsMax-weeklyShardsObtained

            WeeklyShardsIcon = GetItemIcon(236096) 

            if weeklyShardsBalance == 0 then
                textColor = "\124cffE02E2E"
            else
                textColor = "\124cff2FE02F"
            end

            if weeklyShardsBalance == 1 then
                cofferShardCountLabel = "shard"
            else
                cofferShardCountLabel = "shards"
            end

            local text = AceGUI:Create("InteractiveLabel")
            text:SetImage(WeeklyShardsIcon)
            text:SetImageSize(22, 22)
            text:SetText(textColor .. weeklyShardsBalance .. "\124cffFFFFFF " .. cofferShardCountLabel .. " of \124cff3088E0" .. weeklyShardsMax .."\124cffFFFFFF left to obtain from all sources")
            text:SetWidth(420)
            text:SetFont(GameFontHighlightLarge:GetFont())
            container:AddChild(text)

            guiCreateSpacing(container, 5)

            cofferKeyShardsCount = C_CurrencyInfo.GetCurrencyInfo(3310)

	  if cofferKeyShardsCount.quantity < 100 then
                keysToCreateCount = 0
            else
                keysToCreateCount = math.floor(cofferKeyShardsCount.quantity / 100)
            end
	CofferKeyShardIcon = GetItemIcon(236096)

            if cofferKeyShardsCount.quantity < 100 then
                textColor = "\124cffE02E2E"
            else
                textColor = "\124cff2FE02F"
            end

	if keysToCreateCount == 1 then
                cofferKeyCountLabel = "key"
            else
                cofferKeyCountLabel = "keys"
            end
	local text = AceGUI:Create("InteractiveLabel")
            text:SetImage(CofferKeyShardIcon)
            text:SetImageSize(22, 22)
	    text:SetText(textColor .. keysToCreateCount .. "\124cffFFFFFF " .. cofferKeyCountLabel .. " available from \124cff3088E0" .. cofferKeyShardsCount.quantity .. "\124cffFFFFFF shards\124r")
            text:SetWidth(420)
            text:SetFont(GameFontHighlightLarge:GetFont())
	    container:AddChild(text)

            guiCreateNewline(container, 3)

            local button = AceGUI:Create("Button")
            button:SetText("Great Vault")
            button:SetWidth(100)
            button:SetCallback("OnClick", function()
                C_AddOns.LoadAddOn("Blizzard_WeeklyRewards")
                BountifulDelvesHelperMainFrame:Hide()
                WeeklyRewardsFrame:Show()
            end)
            container:AddChild(button)

            local lfgbutton1 = AceGUI:Create("Button")
            lfgbutton1:SetText("Start LFG")
            lfgbutton1:SetWidth(100)
--			BDH_VoidStyleButton(lfgbutton1)
			lfgbutton1:SetCallback("OnClick", function()
			openStartGroupFrame("delves")
			BountifulDelvesHelperMainFrame:Hide()
			end)
            container:AddChild(lfgbutton1)

            if IsInRaid() then
                lfgbutton1:SetDisabled(true)
            elseif IsInGroup() and not UnitIsGroupLeader("player") then
                lfgbutton1:SetDisabled(true)
            else
                lfgbutton1:SetDisabled(false)
            end

            local lfgbutton2 = AceGUI:Create("Button")
            lfgbutton2:SetText("Search LFG")
			lfgbutton2:SetWidth(100)
            lfgbutton2:SetCallback("OnClick", function()
                openFindGroupFrame("delves")
                BountifulDelvesHelperMainFrame:Hide()
            end)
            container:AddChild(lfgbutton2)

            local label = AceGUI:Create("Label")
            label:SetFullWidth(true)
            container:AddChild(label)

            guiCreateNewline(container, 1)

            local label = AceGUI:Create("Label")
            label:SetFullWidth(true)
            container:AddChild(label)

            local label = AceGUI:Create("Label")
            label:SetText("Delve Name")
			BDH_VoidStyleLabel(label, "dim")
            label:SetFont(GameFontHighlightSmall:GetFont())
            label:SetWidth(220)
            container:AddChild(label)

            local label = AceGUI:Create("Label")
            label:SetText("Zone")
			BDH_VoidStyleLabel(label, "dim")
            label:SetFont(GameFontHighlightSmall:GetFont())
            label:SetWidth(120)
            container:AddChild(label)

            local label = AceGUI:Create("Label")
            label:SetFont(GameFontHighlightSmall:GetFont())
            label:SetWidth(150)
            container:AddChild(label)

            local label = AceGUI:Create("Label")
            label:SetFullWidth(true)
            container:AddChild(label)

            for mapPoiID, delve in pairs(Delves) do
                local label = AceGUI:Create("Label")
                label:SetImageSize(18, 18)
                local name = ""

                if delve["overcharged"] == true then
                    name = "(OC) " .. "\124cffFF9C00" .. delve["name"] .. "\124r"
                else
                    name = "\124cffA335EE" .. delve["name"] .. "\124r"
                end

                label:SetText(name)
                label:SetFont(GameFontHighlightMedium:GetFont())
                label:SetWidth(220)
                container:AddChild(label)

                local label = AceGUI:Create("Label")
                label:SetText(delve["zone"])
                label:SetFont(GameFontHighlightMedium:GetFont())
                label:SetWidth(120)
                container:AddChild(label)

                local button = AceGUI:Create("Button")
                button:SetText("Waypoint")
                button:SetWidth(120)
                button:SetCallback("OnClick", function()
                    setWaypoint("default", mapPoiID, delve["name"])
                end)
                container:AddChild(button)

                local button = AceGUI:Create("Button")
                button:SetText("TomTom")
                button:SetWidth(120)
                button:SetCallback("OnClick", function()
                    setWaypoint("tomtom", mapPoiID, delve["name"])
                end)
                container:AddChild(button)

                if C_AddOns.IsAddOnLoaded("TomTom") == false then
                    button:SetDisabled(true)
                end

                guiCreateNewline(container, 1)
            end
        end
		guiCreateNewline(container, 5)
		
		local TWWHeader = AceGUI:Create("Label")
        TWWHeader:SetText("The War Within Active Bountiful Delves ")
		BDH_VoidStyleLabel(TWWHeader, "dim")
		TWWHeader:SetFont(GameFontHighlightLarge:GetFont())
        TWWHeader:SetWidth(500)
        if TWW == true then 
			container:AddChild(TWWHeader)
		else
			AceGUI:Release(TWWHeader)     
			TWWHeader = nil
		end
		
	        local Linfo = AceGUI:Create("Label")
            Linfo:SetFullWidth(true)
			BDH_VoidStyleLabel(Linfo, "secondary")
			Linfo:SetText("Please remember that these do not grant loot on current level")
			Linfo:SetFont(GameFontHighlightMedium:GetFont())
            if TWW == true then 
			container:AddChild(Linfo)
			else
			AceGUI:Release(Linfo)     
			Linfo = nil
			end

            guiCreateNewline(container, 2)

            local label = AceGUI:Create("Label")
            label:SetFullWidth(true)
            container:AddChild(label)

            local DName = AceGUI:Create("Label")
            DName:SetText("Delve Name")
			BDH_VoidStyleLabel(DName, "dim")
            DName:SetFont(GameFontHighlightSmall:GetFont())
            DName:SetWidth(220)
			if TWW == true then 
			container:AddChild(DName)
			else
			AceGUI:Release(DName)     
			DName = nil
			end
           
            local DZone = AceGUI:Create("Label")
            DZone:SetText("Zone")
			BDH_VoidStyleLabel(DZone, "dim")
            DZone:SetFont(GameFontHighlightSmall:GetFont())
            DZone:SetWidth(120)
            if TWW == true then 
			container:AddChild(DZone)
			else
			AceGUI:Release(DZone)     
			DName = nil
			end

            local label = AceGUI:Create("Label")
            label:SetFont(GameFontHighlightSmall:GetFont())
            label:SetWidth(150)
            container:AddChild(label)

            local label = AceGUI:Create("Label")
            label:SetFullWidth(true)
            container:AddChild(label)

            for mapPoiID, delve in pairs(LegacyDelves) do
                local LDelves = AceGUI:Create("Label")
                LDelves:SetImageSize(18, 18)
                local name = ""

                if delve["overcharged"] == true then
                    name = "(OC) " .. "\124cffFF9C00" .. delve["name"] .. "\124r"
                else
                    name = "\124cffA335EE" .. delve["name"] .. "\124r"
                end

                LDelves:SetText(name)
                LDelves:SetFont(GameFontHighlightMedium:GetFont())
                LDelves:SetWidth(220)
               	if TWW == true then 
				container:AddChild(LDelves)
				else
				AceGUI:Release(LDelves)     
				LDelves = nil
				end

                local DelveZone = AceGUI:Create("Label")
                DelveZone:SetText(delve["zone"])
                DelveZone:SetFont(GameFontHighlightMedium:GetFont())
                DelveZone:SetWidth(120)
				if TWW == true then 
				container:AddChild(DelveZone)
				else
				AceGUI:Release(DelveZone)     
				DelveZone = nil
				end

                local WPbutton = AceGUI:Create("Button")
                WPbutton:SetText("Waypoint")
                WPbutton:SetWidth(120)
                WPbutton:SetCallback("OnClick", function()
                    setWaypoint("default", mapPoiID, delve["name"])
                end)
                if TWW == true then 
				container:AddChild(WPbutton)
				else
				AceGUI:Release(WPbutton)     
				WPbutton = nil
				end

                local TTbutton = AceGUI:Create("Button")
                TTbutton:SetText("TomTom")
                TTbutton:SetWidth(120)
                TTbutton:SetCallback("OnClick", function()
                    setWaypoint("tomtom", mapPoiID, delve["name"])
                end)
                if TWW == true then 
				container:AddChild(TTbutton)
				if C_AddOns.IsAddOnLoaded("TomTom") == false then
                    TTbutton:SetDisabled(true)
                end
				else
				AceGUI:Release(TTbutton)     
				TTbutton = nil
				end



                guiCreateNewline(container, 1)
            end	
		
		
    end

local function DrawCofferShardsWQGroup(container)
    container:ReleaseChildren()

    -- Title
    local title = AceGUI:Create("Label")
    title:SetText("\124cff3088E0World Quests rewarding Coffer Key Shards")
    title:SetFont(GameFontHighlightLarge:GetFont())
    title:SetFullWidth(true)
    container:AddChild(title)

    guiCreateNewline(container, 2)

    -- Info
    local info = AceGUI:Create("Label")
    info:SetText("WQs rewarding Coffer Key Shards. |cFF00DDFFRewards rotate – click Refresh.")
    info:SetFullWidth(true)
    container:AddChild(info)

    guiCreateNewline(container, 2)
    guiCreateSpacing(container, 10)

    -- Buttons: Refresh + Sort
    local refreshBtn = AceGUI:Create("Button")
    refreshBtn:SetText("Refresh List")
    refreshBtn:SetWidth(120)
    refreshBtn:SetCallback("OnClick", function()
        container:ReleaseChildren()
        DrawCofferShardsWQGroup(container)
        container:DoLayout()
    end)
    container:AddChild(refreshBtn)

    local sortZoneBtn = AceGUI:Create("Button")
    sortZoneBtn:SetText(sortBy == "zone" and (sortDescending and "Zone ↑" or "Zone ↓") or "Zone")
    sortZoneBtn:SetWidth(80)
    sortZoneBtn:SetCallback("OnClick", function()
        if sortBy == "zone" then
            sortDescending = not sortDescending
        else
            sortBy = "zone"
            sortDescending = false
        end
        container:ReleaseChildren()
        DrawCofferShardsWQGroup(container)
        container:DoLayout()
    end)
    container:AddChild(sortZoneBtn)

    local sortNameBtn = AceGUI:Create("Button")
    sortNameBtn:SetText(sortBy == "name" and (sortDescending and "Name ↑" or "Name ↓") or "Name")
    sortNameBtn:SetWidth(80)
	
    sortNameBtn:SetCallback("OnClick", function()
        if sortBy == "name" then
            sortDescending = not sortDescending
        else
            sortBy = "name"
            sortDescending = false
        end
        container:ReleaseChildren()
        DrawCofferShardsWQGroup(container)
        container:DoLayout()
    end)
    container:AddChild(sortNameBtn)

    guiCreateNewline(container, 2)

    -- Load WQs & Sort
    local wqs = GetCofferShardsWorldQuests()
    table.sort(wqs, function(a, b)
        local aVal, bVal
        if sortBy == "name" then
            aVal, bVal = a.title, b.title
        else
            aVal, bVal = a.zone, b.zone
        end
        if aVal == bVal then
            return a.title < b.title  -- Sekundär Name
        end
        if sortDescending then
            return aVal > bVal
        end
        return aVal < bVal
    end)

    if #wqs == 0 then
        local none = AceGUI:Create("Label")
        none:SetText("|cFFFF8040No active WQs with Coffer Key Shards as reward found.|r\nWait for daily refresh.")
        none:SetFullWidth(true)
        container:AddChild(none)
    else
        -- Header
        local headerZone = AceGUI:Create("Label")
        headerZone:SetText("Zone")
		BDH_VoidStyleLabel(headerZone, "dim")
		headerZone:SetFont(GameFontHighlightMedium:GetFont())
        headerZone:SetWidth(150)
        container:AddChild(headerZone)

        local headerName = AceGUI:Create("Label")
        headerName:SetText("Quest Name")
		BDH_VoidStyleLabel(headerName, "dim")
		headerName:SetFont(GameFontHighlightMedium:GetFont())
        headerName:SetWidth(200)
        container:AddChild(headerName)

        local headerAmount = AceGUI:Create("Label")
        headerAmount:SetText("Shards")
		BDH_VoidStyleLabel(headerAmount, "dim")
		headerAmount:SetFont(GameFontHighlightMedium:GetFont())
        headerAmount:SetWidth(80)
        container:AddChild(headerAmount)

        local headerWP = AceGUI:Create("Label")
        headerWP:SetText("Waypoints")
		BDH_VoidStyleLabel(headerWP, "dim")
		headerWP:SetFont(GameFontHighlightMedium:GetFont())
        headerWP:SetWidth(100)
        container:AddChild(headerWP)

        guiCreateNewline(container, 1)

        -- Rows
        for _, wq in ipairs(wqs) do
            local zoneLbl = AceGUI:Create("Label")
            zoneLbl:SetText(wq.zone)
			BDH_VoidStyleLabel(zoneLbl, "secondary")
			zoneLbl:SetFont(GameFontHighlightMedium:GetFont())
			
            zoneLbl:SetWidth(150)
            container:AddChild(zoneLbl)

            local nameLbl = AceGUI:Create("InteractiveLabel")
            nameLbl:SetText("\124cffA335EE" .. wq.title .. "|r")
			nameLbl:SetFont(GameFontHighlightMedium:GetFont())
            nameLbl:SetWidth(200)
			nameLbl:SetCallback("OnEnter", function(widget)
                GameTooltip:SetOwner(widget.frame, "ANCHOR_TOPRIGHT")
                GameTooltip:SetHyperlink("quest:" .. wq.questID)
                GameTooltip:Show()
            end)
            nameLbl:SetCallback("OnLeave", function() GameTooltip:Hide() end)
            nameLbl:SetCallback("OnClick", function()
                ToggleWorldMap()
                WorldMapFrame:SetMapID(wq.zoneID)
                C_QuestLog.AddWorldQuestWatch(wq.questID)
            end)
            container:AddChild(nameLbl)
			
            local amountLbl = AceGUI:Create("Label")
            amountLbl:SetText(wq.amount)
            amountLbl:SetWidth(80)
			BDH_VoidStyleLabel(amountLbl, "highlight")
			amountLbl:SetFont(GameFontHighlightMedium:GetFont())
            container:AddChild(amountLbl)

            local wpBtn = AceGUI:Create("Button")
            wpBtn:SetText("Waipoint")
            wpBtn:SetWidth(100)
            wpBtn:SetCallback("OnClick", function()
			local x, y = C_TaskQuest.GetQuestLocation(wq.questID, wq.zoneID)        
			if x and y then
            setWaypointFromXY("default", wq.zoneID, x * 100, y * 100, wq.title)
			end
			end)
            container:AddChild(wpBtn)
			
			local ttBtn = AceGUI:Create("Button")
            ttBtn:SetText("TomTom")
            ttBtn:SetWidth(100)
            ttBtn:SetCallback("OnClick", function()
			local x, y = C_TaskQuest.GetQuestLocation(wq.questID, wq.zoneID)        
			if x and y then
            setWaypointFromXY("tomtom", wq.zoneID, x * 100, y * 100, wq.title)
			end
			end)
            container:AddChild(ttBtn)
			if C_AddOns.IsAddOnLoaded("TomTom") == false then
                    ttBtn:SetDisabled(true)
            end
			
        end

            guiCreateNewline(container, 1)
    end

    container:DoLayout()
end


    function DrawTiersOverviewGroup(container)
        guiCreateNewline(container, 3)

        local label = AceGUI:Create("Label")
        label:SetText("Tiers")
        label:SetFont(GameFontHighlightMedium:GetFont())
        label:SetWidth(160)
		BDH_VoidStyleLabel(label, "dimmer")
        container:AddChild(label)

        for index = 1, 11 do
            local label = AceGUI:Create("Label")

            if index < 10 then
                label:SetText("  " .. index)
            else
                label:SetText(" " .. index)
            end
			BDH_VoidStyleLabel(label, "dimmer")
            label:SetFont(GameFontHighlightMedium:GetFont())
            label:SetWidth(40)
            container:AddChild(label)
        end

        guiCreateNewline(container)

        local label = AceGUI:Create("Label")
        label:SetText("Recommended Gear")
		BDH_VoidStyleLabel(label, "dim")
        label:SetFont(GameFontHighlightMedium:GetFont())
        label:SetWidth(160)
        container:AddChild(label)

        for _, tierDetails in pairs(delveTiers) do
            local label = AceGUI:Create("Label")
            label:SetText(tierDetails["recommendedIlvl"])
            label:SetFont(GameFontHighlightMedium:GetFont())
			BDH_VoidStyleLabel(label, "dim")
            label:SetWidth(40)
            container:AddChild(label)
        end

        guiCreateNewline(container)

        local label = AceGUI:Create("Label")
        label:SetText("Bountiful Loot")
		BDH_VoidStyleLabel(label, "secondary")
        label:SetFont(GameFontHighlightMedium:GetFont())
        label:SetWidth(160)
        container:AddChild(label)

        for _, tierDetails in pairs(delveTiers) do
            local label = AceGUI:Create("Label")
            local bountifulLoot = tierDetails["bountifulLootIlvl"]

            label:SetText(getGearColorText(bountifulLoot, bountifulLoot))

            label:SetFont(GameFontHighlightMedium:GetFont())
            label:SetWidth(40)
            container:AddChild(label)
        end

        guiCreateNewline(container)

        local label = AceGUI:Create("Label")
        label:SetText("Great Vault")
		BDH_VoidStyleLabel(label, "highlight")
        label:SetFont(GameFontHighlightMedium:GetFont())
        label:SetWidth(160)
        container:AddChild(label)

        for _, tierDetails in pairs(delveTiers) do
            local label = AceGUI:Create("Label")
            label:SetText(tierDetails["vaultIlvl"])
			BDH_VoidStyleLabel(label, "highlight")
            label:SetFont(GameFontHighlightMedium:GetFont())
            label:SetWidth(40)
            container:AddChild(label)
        end

        guiCreateNewline(container)
    end

    local function SelectGroup(container, event, group)
        container:ReleaseChildren()
        if group == "tab1" then
            DrawDelvesGroup(container)
        elseif group == "tab2" then
    --        DrawMemoryGroup(container)
            DrawTiersOverviewGroup(container)
        elseif group == "tab3" then
            DrawOptionsOverviewGroup(container)
        end
    end

    BountifulDelvesHelperMainFrame = AceGUI:Create("Frame")
	BountifulDelvesHelperMainFrame:EnableResize(false)
	BountifulDelvesHelperMainFrame:SetTitle("\124cff3088ffBountiful Delves Helper Midnight")
	BountifulDelvesHelperMainFrame:SetStatusText("\124cff3088ffBountiful Delves Helper Midnight - v1.3")
	BDH_VoidStyleFrame(BountifulDelvesHelperMainFrame, "darkest")
	BountifulDelvesHelperMainFrame:SetCallback("OnClose", function(widget)
    isFrameVisible = false
	end)
	BountifulDelvesHelperMainFrame:SetHeight(600)
	BountifulDelvesHelperMainFrame:SetLayout("Fill")

-- Void-Theme 
	local frame = BountifulDelvesHelperMainFrame.frame

	setBackdropColor(frame, VOID_THEME.bg_darkest)
	setBackdropBorderColor(frame, VOID_THEME.border_glow)


	frame:SetBackdropBorderColor(
    VOID_THEME.border_glow[1],
    VOID_THEME.border_glow[2],
    VOID_THEME.border_glow[3],
    VOID_THEME.border_glow[4]
)

    local tab = AceGUI:Create("TabGroup")
	setBackdropColor(tab.frame, VOID_THEME.bg_medium)
	setBackdropBorderColor(tab.frame, VOID_THEME.border_void)
    tab:SetLayout("Flow")
    tab:SetTabs({
        { text = "\124cff3088ffBountiful Delves", value = "tab1" },
        { text = "\124cff3088ffTiers Overview",   value = "tab2" },
        { text = "\124cff3088ffCoffer Shards WQs",value = "tab4" },   
        { text = "\124cff3088ffOptions",          value = "tab3" }
    })
    tab:SetCallback("OnGroupSelected", function(container, event, group)
        container:ReleaseChildren()
        if group == "tab1" then
            DrawDelvesGroup(container)
			tab:SetTabs({
        { text = "Bountiful Delves", value = "tab1" },
        { text = "\124cff3088ffTiers Overview",   value = "tab2" },
        { text = "\124cff3088ffCoffer Shards WQs",value = "tab4" },   
        { text = "\124cff3088ffOptions",          value = "tab3" }
    })	
        elseif group == "tab2" then
            DrawTiersOverviewGroup(container)
			tab:SetTabs({
        { text = "\124cff3088ffBountiful Delves", value = "tab1" },
        { text = "Tiers Overview",   value = "tab2" },
        { text = "\124cff3088ffCoffer Shards WQs",value = "tab4" },   
        { text = "\124cff3088ffOptions",          value = "tab3" }
		})
        elseif group == "tab4" then
            DrawCofferShardsWQGroup(container)
			tab:SetTabs({
        { text = "\124cff3088ffBountiful Delves", value = "tab1" },
        { text = "\124cff3088ffTiers Overview",   value = "tab2" },
        { text = "Coffer Shards WQs",value = "tab4" },   
        { text = "\124cff3088ffOptions",          value = "tab3" }
		})
        elseif group == "tab3" then
            DrawOptionsOverviewGroup(container)
			tab:SetTabs({
        { text = "\124cff3088ffBountiful Delves", value = "tab1" },
        { text = "\124cff3088ffTiers Overview",   value = "tab2" },
        { text = "\124cff3088ffCoffer Shards WQs",value = "tab4" },   
        { text = "Options",          value = "tab3" }
		})	
        end
    end)
    tab:SelectTab("tab1")

    BountifulDelvesHelperMainFrame:AddChild(tab)

    _G["BountifulDelvesHelperGlobalFrame"] = BountifulDelvesHelperMainFrame.frame
    tinsert(UISpecialFrames, "BountifulDelvesHelperGlobalFrame")
end

function DrawOptionsOverviewGroup(container)
    guiCreateNewline(container, 3)

    local button = AceGUI:Create("Button")
    button:SetText("Toggle Minimap Button")
    button:SetWidth(250)
    button:SetCallback("OnClick", function()
        if BountifulDelvesHelperIconDB.hide == true then
            BountifulDelvesHelperMinimapButton:Show("BountifulDelvesHelper")
            BountifulDelvesHelperIconDB.hide = false
        else
            BountifulDelvesHelperMinimapButton:Hide("BountifulDelvesHelper")
            BountifulDelvesHelperIconDB.hide = true
        end
    end)
    container:AddChild(button)
	
	guiCreateNewline(container, 3)
	
	    local button = AceGUI:Create("Button")
    button:SetText("Toggle TWW Delves")
    button:SetWidth(250)
    button:SetCallback("OnClick", function()
        if TWW == true then
           TWW = false
        else
            TWW = true
        end
    end)
    container:AddChild(button)
	
	guiCreateNewline(container, 3)
	
	 local label = AceGUI:Create("Label")
        label:SetText("This Addon is based on the original Bountiful Delves Helper by Menelitos. I loved that Addon and used it all the time, but at some point, it was no longer updated. I kept it current with line by line changes in TWW and Pre-Patch, but that was obviously not an option for Midnight. I kept some code, I changed some code, I created new code for this. \nKudos to Menelitos for the original idea. \n\nI tried to add a little Midnight flavor to this with the color theme, hope you like it.")
		BDH_VoidStyleLabel(label, "dimmer")
        label:SetFont(GameFontHighlightMedium:GetFont())
        label:SetWidth(600)
        container:AddChild(label)
	

end

local function BDH_ApplyVoidBackdrop(frame, bg, border)
    if not frame then return end

    if not frame.bdhVoidBackdrop then
        frame.bdhVoidBackdrop = CreateFrame("Frame", nil, frame, "BackdropTemplate")
        frame.bdhVoidBackdrop:SetAllPoints(frame)
        frame.bdhVoidBackdrop:SetFrameStrata(frame:GetFrameStrata())
		frame.bdhVoidBackdrop:SetFrameLevel(math.max(frame:GetFrameLevel() - 2, 0))
        frame.bdhVoidBackdrop:SetBackdrop({
            bgFile = "Interface\\Buttons\\WHITE8x8",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            edgeSize = 12,
            insets = { left = 2, right = 2, top = 2, bottom = 2 }
        })
    end

    frame.bdhVoidBackdrop:SetBackdropColor(unpack(bg))
    frame.bdhVoidBackdrop:SetBackdropBorderColor(unpack(border))
end

function BDH_VoidStyleButton(widget)
    if not widget or not widget.frame then return end
    local f = widget.frame

    BDH_ApplyVoidBackdrop(f,
        VOID_THEME.button_bg_normal,
        VOID_THEME.button_border
    )

    -- Force readable text
    local fs = f.text or f:GetFontString()
    if fs then
        fs:SetTextColor(1, 1, 1, 1)
        fs:SetAlpha(1)
    end

    -- Kill Blizzard darkening
    if f.GetNormalTexture then
        local t = f:GetNormalTexture()
        if t then t:SetVertexColor(1,1,1,1) end
    end
    if f.GetPushedTexture then
        local t = f:GetPushedTexture()
        if t then t:SetVertexColor(1,1,1,1) end
    end
    if f.GetHighlightTexture then
        local t = f:GetHighlightTexture()
        if t then t:SetVertexColor(1,1,1,0.2) end
    end

    -- Hover glow
    f:HookScript("OnEnter", function()
        f.bdhVoidBackdrop:SetBackdropColor(unpack(VOID_THEME.button_bg_active))
        f.bdhVoidBackdrop:SetBackdropBorderColor(unpack(VOID_THEME.border_glow))
    end)

    f:HookScript("OnLeave", function()
        f.bdhVoidBackdrop:SetBackdropColor(unpack(VOID_THEME.button_bg_normal))
        f.bdhVoidBackdrop:SetBackdropBorderColor(unpack(VOID_THEME.button_border))
    end)
end


function BDH_VoidStyleFrame(widget, level)
    if not widget or not widget.frame then return end
    local f = widget.frame

    local bg = VOID_THEME.bg_dark
    if level == "darkest" then bg = VOID_THEME.bg_darkest end
    if level == "medium"  then bg = VOID_THEME.bg_medium  end
    if level == "light"   then bg = VOID_THEME.bg_light   end

    BDH_ApplyVoidBackdrop(f, bg, VOID_THEME.border_void)
end

function BDH_VoidStyleLabel(widget, style)
    if not widget or not widget.label then return end
    local fs = widget.label

    local color = VOID_THEME.text_primary
    if style == "secondary" then color = VOID_THEME.text_secondary end
    if style == "dim"       then color = VOID_THEME.text_dim end
    if style == "highlight" then color = VOID_THEME.text_highlight end
	if style == "dimmer"    then color = VOID_THEME.button_border end
	
    fs:SetTextColor(unpack(color))
end


function triggerFrame()
    if not isFrameVisible then
        showUI()
        isFrameVisible = true
    else
        BountifulDelvesHelperMainFrame:Hide()
        isFrameVisible = false
    end
end

function BountifulDelvesHelper:ToggleMainFrame()
    triggerFrame()
end

SlashCmdList["DELVES"] = function(arg1)
    if arg1 == "hide" and BountifulDelvesHelperIconDB["hide"] == false or BountifulDelvesHelperIconDB["hide"] == nil then
        BountifulDelvesHelperIconDB["hide"] = true
        print("[Bountiful Delves Helper] Minimap icon hidden, use /reload for it to take effect.")
    elseif arg1 == "show" and BountifulDelvesHelperIconDB["hide"] == true then
        BountifulDelvesHelperIconDB["hide"] = false
        print("[Bountiful Delves Helper] Minimap icon shown, use /reload for it to take effect.")
    elseif arg1 == "" then
        if not isFrameVisible then
            showUI()
            isFrameVisible = true
        end
    end
end

local eventListenerFrame = CreateFrame("Frame", "BountifulDelvesHelperListenerFrame")
local function eventHandler(self, event, arg1)
    if event == "GOSSIP_SHOW" and arg1 == "delves-difficulty-picker" then
        local highestTier = 1
        for index, data in pairs(DelvesDifficultyPickerFrame:GetOptions()) do
            if data["status"] == 0 then
                highestTier = index
            end
        end
    end
end

eventListenerFrame:SetScript("OnEvent", eventHandler)
eventListenerFrame:RegisterEvent("GOSSIP_SHOW")

