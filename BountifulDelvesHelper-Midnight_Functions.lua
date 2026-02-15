function getColorText(color, text)
    return "\124cff" .. color .. text .. "\124r"
end


function setWaypoint(type, mapPoiID, name)
    local waypoint = waypoints[mapPoiID]
    if type == "default" then
        local point = UiMapPoint.CreateFromCoordinates(waypoint["zone"], waypoint["x"] / 100, waypoint["y"] / 100)
        C_Map.SetUserWaypoint(point)
        C_SuperTrack.SetSuperTrackedUserWaypoint(true)
    elseif type == "tomtom" then
        local tomtomCommand = "/way #" .. waypoint["zone"] .. " " .. waypoint["x"] .. " " .. waypoint["y"] .. " " .. name;
        DEFAULT_CHAT_FRAME.editBox:SetText(tomtomCommand)
        ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
    end
end

function setWaypointFromXY(type, zoneID, x, y, name)
    if type == "default" then
        local point = UiMapPoint.CreateFromCoordinates(zoneID, x / 100, y / 100)
        C_Map.SetUserWaypoint(point)
        C_SuperTrack.SetSuperTrackedUserWaypoint(true)
    elseif type == "tomtom" then
        local tomtomCommand = "/way #" .. zoneID .. " " .. x .. " " .. y .. " " .. name;
        DEFAULT_CHAT_FRAME.editBox:SetText(tomtomCommand)
        ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
    end
end

function openStartGroupFrame(type)
    if not PVEFrame:IsShown() then
        PVEFrame_ToggleFrame()
    end

    GroupFinderFrameGroupButton3:Click()

    if type == "delves" or type == nil then
        LFGListCategorySelection_SelectCategory(LFGListFrame.CategorySelection, 121, 0)
        LFGListFrame.CategorySelection.StartGroupButton:Click()
        LFGListFrame.EntryCreation.GroupDropdown:OpenMenu()
    elseif type == "memories" then
        LFGListCategorySelection_SelectCategory(LFGListFrame.CategorySelection, 6, 0)
        LFGListFrame.CategorySelection.StartGroupButton:Click()
    end
end

function openFindGroupFrame(type)
    if not PVEFrame:IsShown() then
        PVEFrame_ToggleFrame()
    end

    GroupFinderFrameGroupButton3:Click()

    if type == "delves" or type == nil then
        LFGListCategorySelection_SelectCategory(LFGListFrame.CategorySelection, 121, 0)
        LFGListFrame.CategorySelection.FindGroupButton:Click()
    elseif type == "memories" then
        LFGListCategorySelection_SelectCategory(LFGListFrame.CategorySelection, 6, 0)
        LFGListFrame.CategorySelection.FindGroupButton:Click()
    end
end

function getGearColorText(ilvl, text)
    local color = "1eff00"

    if ilvl >= 220 and ilvl < 231 then
        color = "0070dd"
    elseif ilvl >= 230 then
        color = "a335ee"
    end

    return "\124cff" .. color .. text .. "\124r"
end

function guiCreateNewline(container, count)
    local count = count or 1
    for index = 1, count do
        local newline = AceGUI:Create("Label")
        newline:SetFullWidth(true)
        container:AddChild(newline)
    end
end

function guiCreateLabel(container, fontSize, text, width)
    local label = AceGUI:Create("Label")
    label:SetText(text)
    label:SetFont(fontSize)
    label:SetWidth(width)
    container:AddChild(label)
end

function guiCreateSpacing(container, width)
    local spacing = AceGUI:Create("Label")
    spacing:SetWidth(width)
    container:AddChild(spacing)
end

function split(pString, pPattern)
    local Table = {}  -- NOTE: use {n = 0} in Lua-5.0
    local fpat = "(.-)" .. pPattern
    local last_end = 1
    local s, e, cap = pString:find(fpat, 1)
    while s do
        if s ~= 1 or cap ~= "" then
            table.insert(Table, cap)
        end
        last_end = e + 1
        s, e, cap = pString:find(fpat, last_end)
    end
    if last_end <= #pString then
        cap = pString:sub(last_end)
        table.insert(Table, cap)
    end
    return Table
end

function GetStory(areaPOIContent)
        if areaPOIContent and areaPOIContent.tooltipWidgetSet then
            local tTipWidgets = C_UIWidgetManager.GetAllWidgetsBySetID(areaPOIContent.tooltipWidgetSet)

            if tTipWidgets then
                for _, info in ipairs(tTipWidgets) do
                    if info.widgetType == Enum.UIWidgetVisualizationType.TextWithState then
                        local widgetViz = C_UIWidgetManager.GetTextWithStateWidgetVisualizationInfo(info.widgetID)
                        if widgetViz and widgetViz.orderIndex == 0 then
							return (widgetViz.text)
						end
					end	
				end	
			end
		end
end

function Count_FinishedQuests (allQ)

	local count = 0
	local a = 0
	for _,quest in ipairs(allQ) do
		if (C_QuestLog.IsQuestFlaggedCompleted(quest)) then
			count = count+1
		end
	end
	return count
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

function setBackdropColor(frame, color)
    if frame and frame.SetBackdropColor and color then
       frame:SetBackdropColor(color[1], color[2], color[3], color[4])
    end
end

function setBackdropBorderColor(frame, color)
    if frame and frame.SetBackdropBorderColor and color then
       frame:SetBackdropBorderColor(color[1], color[2], color[3], color[4])
    end
end

function GetCofferShardsWorldQuests(callback)
      local result = {
        worldQuests = {},
        specialAssignments = {}
    }
    -- Zone IDs Midnight
    local zonesToCheck = {2395, 2413, 2405, 2437, 2393,2424} 
    local scanned = 0
    finished = 0
		for questId in pairs(worldQuestsIDs) do
			if C_QuestLog.IsQuestFlaggedCompleted(questId)  then 
				finished = finished+1
			end
		end	
	
    for _, zoneID in ipairs(zonesToCheck) do
        local quests = C_TaskQuest.GetQuestsOnMap(zoneID)
        local special_a = C_AreaPoiInfo.GetAreaPOIForMap(zoneID)
		local mapInfo = C_Map.GetMapInfo(zoneID)
        local zoneName = mapInfo and mapInfo.name or ("Zone " .. zoneID)
		
		if special_a and #special_a > 0 then		
			for _, specialData in ipairs(special_a) do
               for questId, data in pairs(worldQuestsIDs) do					
					 if specialData == data.saSreaPoid then
						    table.insert(result.specialAssignments, {
							questID = tonumber(questId),
							zone = zoneName,
							title   = data.saTitle,
							zoneID  = zoneID,
							poiID   = poiID
							})
					 end	
			   end
			end
		end	

        if quests and #quests > 0 then             
            for _, questData in ipairs(quests) do
                local questID = questData.questID
			
                if questID and questID > 0 then
                    if C_QuestLog.IsWorldQuest(questID) and zoneID == questData.mapID and not C_QuestLog.IsQuestFlaggedCompleted(questID) then					   
                        scanned = scanned + 1
                        local currencies = C_QuestLog.GetQuestRewardCurrencies(questID)

						if currencies then
                            for _, currencyInfo in ipairs(currencies) do
                                if currencyInfo.currencyID == 3310 or currencyInfo.name == "Coffer Key Shards" then
                                    local title = C_TaskQuest.GetQuestInfoByQuestID(questID) or "Unbekannte Quest"
                                    local amount = currencyInfo.totalRewardAmount
                                    table.insert(result.worldQuests, {
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

    if callback and type(callback) == "function" then
        callback(result)
    end
    
    return result
end
