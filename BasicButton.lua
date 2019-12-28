function BasicButton_OnLoad(self)
	self:RegisterEvent("ADDON_LOADED")
	self:RegisterEvent("PET_JOURNAL_LIST_UPDATE")	
end

local function MyClickFn()
	CallCompanion("CRITTER", 20)
end

local function AddButton()
	if PetJournal ~= nil then 
		local button = CreateFrame("Button", "MyNewButton", PetJournal, "UIPanelButtonTemplate")
		button:SetPoint("LEFT", PetJournalSummonRandomFavoritePetButton, "RIGHT")
		button:SetHeight(30)
		button:SetWidth(50)	
		button:SetText("Click")
		button:SetScript("OnClick", MyClickFn)
		button:Show()
	end
end

function BasicButton_OnEvent(self, event, arg1, arg2)
	if event == "ADDON_LOADED" and arg1 == "BasicButton" then
		self:UnregisterEvent("ADDON_LOADED")				
	elseif event == "PET_JOURNAL_LIST_UPDATE" then		
		if MyNewButton == nil then
			AddButton()		
		end
	end
end
