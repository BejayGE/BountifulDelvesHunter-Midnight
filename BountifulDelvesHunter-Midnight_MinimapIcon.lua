local addon = LibStub("AceAddon-3.0"):NewAddon("BountifulDelvesHunter-Midnight")
BountifulDelvesHunterMinimapButton = LibStub("LibDBIcon-1.0", true)

local BountifulDelvesHunterLDB = LibStub("LibDataBroker-1.1"):NewDataObject("BountifulDelvesHunter", {
	type = "launcher",
	text = "BountifulDelvesHunter",
	icon = "Interface\\AddOns\\BountifulDelvesHunter-Midnight\\minimap.tga",
	OnClick = function(self, btn)
        if btn == "LeftButton" or btn == "RightButton" then
		    BountifulDelvesHunter:ToggleMainFrame()
        end
	end,

	OnTooltipShow = function(tooltip)
		if not tooltip or not tooltip.AddLine then
			return
		end

		tooltip:AddLine("Bountiful Delves Hunter-Midnight", nil, nil, nil, nil)
	end,
})

local BountifulDelvesHunterIcon = LibStub("LibDBIcon-1.0")

function addon:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("BountifulDelvesHunterLDB", {
		profile = {
			minimap = {
				hide = BountifulDelvesHunterIconDB["hide"],
			},
		},
	})

	BountifulDelvesHunterIcon:Register("BountifulDelvesHunter", BountifulDelvesHunterLDB, BountifulDelvesHunterIconDB)
end

BountifulDelvesHunterMinimapButton:Show("BountifulDelvesHunter")
