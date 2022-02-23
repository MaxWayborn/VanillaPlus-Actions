CreateFrame('Frame', 'VP_FrameMain')
VP_FrameMain:SetPoint("CENTER", UIParent)
VP_FrameMain:SetWidth(400)
VP_FrameMain:SetHeight(200)

VP_FrameMain:SetBackdrop({
	bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", 
	edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
	tileSize = 32, edgeSize = 32, 
	insets = {left=11, right=12, top=12, bottom=11}
})
VP_FrameMain:Hide()

VP_FrameMain:SetScript("OnShow", function()
	VP_MenuButton1:Click()
end)

CreateFrame("Button", "VP_MenuButton1", VP_FrameMain, "UIDropDownMenuButtonTemplate")
VP_MenuButton1:SetPoint("TOPLEFT", VP_FrameMain, "TOPLEFT", 10, -12)
VP_MenuButton1:SetWidth(100)
VP_MenuButton1:SetText("Server Info")
VP_MenuButton1:SetScript("OnClick", function()
	getglobal('VP_FrameMain' .. 1):Hide()
	getglobal('VP_FrameMain' .. 2):Hide()
	getglobal('VP_FrameMain' .. 3):Hide()
	getglobal('VP_FrameMain' .. 1):Show()
end)
VP_MenuButton1Check:Hide()

CreateFrame("Button", "VP_MenuButton2", VP_FrameMain, "UIDropDownMenuButtonTemplate")
VP_MenuButton2:SetPoint("TOP", VP_MenuButton1, "BOTTOM", 0, -2)
VP_MenuButton2:SetWidth(100)
VP_MenuButton2:SetText("PvP")
VP_MenuButton2:SetScript("OnClick", function()
	getglobal('VP_FrameMain' .. 1):Hide()
	getglobal('VP_FrameMain' .. 2):Hide()
	getglobal('VP_FrameMain' .. 3):Hide()
	getglobal('VP_FrameMain' .. 2):Show()
end)
VP_MenuButton2Check:Hide()

CreateFrame("Button", "VP_MenuButton3", VP_FrameMain, "UIDropDownMenuButtonTemplate")
VP_MenuButton3:SetPoint("TOP", VP_MenuButton2, "BOTTOM", 0, -2)
VP_MenuButton3:SetWidth(100)
VP_MenuButton3:SetText("PvE")
VP_MenuButton3:SetScript("OnClick", function()
	getglobal('VP_FrameMain' .. 1):Hide()
	getglobal('VP_FrameMain' .. 2):Hide()
	getglobal('VP_FrameMain' .. 3):Hide()
	getglobal('VP_FrameMain' .. 3):Show()
end)
VP_MenuButton3Check:Hide()

CreateFrame("Button", "VP_MenuButton4", VP_FrameMain, "UIDropDownMenuButtonTemplate")
VP_MenuButton4:SetPoint("TOP", VP_MenuButton3, "BOTTOM", 0, -2)
VP_MenuButton4:SetWidth(100)
VP_MenuButton4:SetText(HELP_BUTTON)
VP_MenuButton4:SetScript("OnClick", function()
	ShowUIPanel(HelpFrame)
    StaticPopup_Hide("HELP_TICKET_ABANDON_CONFIRM")
    StaticPopup_Hide("HELP_TICKET")
	VP_FrameMain:Hide()
end)
VP_MenuButton4Check:Hide()

CreateFrame("Button", "VP_MenuButton5", VP_FrameMain, "UIDropDownMenuButtonTemplate")
VP_MenuButton5:SetPoint("TOP", VP_MenuButton4, "BOTTOM", 0, -2)
VP_MenuButton5:SetWidth(100)
VP_MenuButton5:SetText("Close")
VP_MenuButton5:SetScript("OnClick", function()
	VP_FrameMain:Hide()
end)
VP_MenuButton5Check:Hide() -- спрятать галочку

-- ------------------------------------------------------------------------------------------------

CreateFrame('Frame', 'VP_FrameMain1', VP_FrameMain)
VP_FrameMain1:SetPoint('TOPRIGHT', VP_FrameMain, 'TOPRIGHT', 0, 0)
VP_FrameMain1:SetHeight(200)
VP_FrameMain1:SetWidth(300)
VP_FrameMain1:SetBackdrop({
	--bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", 
	edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
	tileSize = 32, edgeSize = 32, 
	insets = {left=11, right=12, top=12, bottom=11}
})
VP_FrameMain1:Hide()

VP_FrameMain1:SetScript("OnShow", function()
	local p1, p2 = GetGameTime()
	VP_FrameMain1_2:SetText('Server time: ' .. p1 .. ':' .. p2)
	SendChatMessage('.server info')
end)

VP_FrameMain1:CreateFontString("VP_FrameMain1_1", "OVERLAY", "GameFontNormalLarge")
VP_FrameMain1_1:SetPoint("TOP", VP_FrameMain1, "TOP", 0, -20)
VP_FrameMain1_1:SetText("Server Info")

VP_FrameMain1:CreateFontString("VP_FrameMain1_2", "OVERLAY", "GameFontHighlight")
VP_FrameMain1_2:SetPoint("TOPLEFT", VP_FrameMain1, "TOPLEFT", 20, -50)
VP_FrameMain1_2:SetText("")

VP_FrameMain1:CreateFontString("VP_FrameMain1_3", "OVERLAY", "GameFontHighlight")
VP_FrameMain1_3:SetPoint("TOPLEFT", VP_FrameMain1_2, "BOTTOMLEFT", 0, -10)
VP_FrameMain1_3:SetText("")

VP_FrameMain1:CreateFontString("VP_FrameMain1_4", "OVERLAY", "GameFontHighlight")
VP_FrameMain1_4:SetPoint("TOPLEFT", VP_FrameMain1_3, "BOTTOMLEFT", 0, -10)
VP_FrameMain1_4:SetText("")

VP_FrameMain1:CreateFontString("VP_FrameMain1_5", "OVERLAY", "GameFontHighlight")
VP_FrameMain1_5:SetPoint("TOPLEFT", VP_FrameMain1_4, "BOTTOMLEFT", 0, -10)
VP_FrameMain1_5:SetText("")

-- ------------------------------------------------------------------------------------------------

CreateFrame('Frame', 'VP_FrameMain2', VP_FrameMain)
VP_FrameMain2:SetPoint('TOPRIGHT', VP_FrameMain, 'TOPRIGHT', 0, 0)
VP_FrameMain2:SetHeight(200)
VP_FrameMain2:SetWidth(300)
VP_FrameMain2:SetBackdrop({
	--bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", 
	edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
	tileSize = 32, edgeSize = 32, 
	insets = {left=11, right=12, top=12, bottom=11}
})
VP_FrameMain2:Hide()

VP_FrameMain2:CreateFontString("VP_FrameMain2_1", "OVERLAY", "GameFontNormalLarge")
VP_FrameMain2_1:SetPoint("TOP", VP_FrameMain2, "TOP", 0, -20)
VP_FrameMain2_1:SetText("Battlegrounds")

CreateFrame("Button", "VP_FrameMain2_2", VP_FrameMain2, "UIPanelButtonTemplate")
VP_FrameMain2_2:SetPoint("TOP", VP_FrameMain2, "TOP", 0, -50)
VP_FrameMain2_2:SetHeight(24)
VP_FrameMain2_2:SetWidth(120)
VP_FrameMain2_2:SetText("Warsong Gulch")
VP_FrameMain2_2:SetScript("OnClick", function(self)
	PlaySound("igMainMenuClose")
	SendChatMessage('.wsg')
end)

CreateFrame("Button", "VP_FrameMain2_3", VP_FrameMain2, "UIPanelButtonTemplate")
VP_FrameMain2_3:SetPoint("TOP", VP_FrameMain2_2, "BOTTOM", 0, -10)
VP_FrameMain2_3:SetHeight(24)
VP_FrameMain2_3:SetWidth(120)
VP_FrameMain2_3:SetText("Arathi Basin")
VP_FrameMain2_3:SetScript("OnClick", function(self)
	PlaySound("igMainMenuClose")
	SendChatMessage('.ab')
end)

CreateFrame("Button", "VP_FrameMain2_4", VP_FrameMain2, "UIPanelButtonTemplate")
VP_FrameMain2_4:SetPoint("TOP", VP_FrameMain2_3, "BOTTOM", 0, -10)
VP_FrameMain2_4:SetHeight(24)
VP_FrameMain2_4:SetWidth(120)
VP_FrameMain2_4:SetText("Azshara Crater")
VP_FrameMain2_4:SetScript("OnClick", function(self)
	PlaySound("igMainMenuClose")
	SendChatMessage('.ac')
end)

-- ------------------------------------------------------------------------------------------------

CreateFrame('Frame', 'VP_FrameMain3', VP_FrameMain)
VP_FrameMain3:SetPoint('TOPRIGHT', VP_FrameMain, 'TOPRIGHT', 0, 0)
VP_FrameMain3:SetHeight(200)
VP_FrameMain3:SetWidth(300)
VP_FrameMain3:SetBackdrop({
	--bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", 
	edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
	tileSize = 32, edgeSize = 32, 
	insets = {left=11, right=12, top=12, bottom=11}
})
VP_FrameMain3:Hide()

VP_FrameMain3:CreateFontString("VP_FrameMain3_1", "OVERLAY", "GameFontNormalLarge")
VP_FrameMain3_1:SetPoint("TOP", VP_FrameMain3, "TOP", 0, -20)
VP_FrameMain3_1:SetText("Instances")

CreateFrame("Button", "VP_FrameMain3_2", VP_FrameMain3, "UIPanelButtonTemplate")
VP_FrameMain3_2:SetPoint("TOP", VP_FrameMain2, "TOP", 0, -50)
VP_FrameMain3_2:SetHeight(24)
VP_FrameMain3_2:SetWidth(140)
VP_FrameMain3_2:SetText(RESET_INSTANCES)
VP_FrameMain3_2:SetScript("OnClick", function(self)
	PlaySound("igMainMenuClose")
	ResetInstances()
end)

-- ------------------------------------------------------------------------------------------------

VP_FrameMain:RegisterEvent('PLAYER_LOGIN')
VP_FrameMain:RegisterEvent('CHAT_MSG_SYSTEM')
VP_FrameMain:SetScript("OnEvent", function()
	if event == 'PLAYER_LOGIN' then
		HelpMicroButton:SetNormalTexture("Interface\\AddOns\\\V+Main\\UI-MicroButtonVP-Up.tga")
		ToggleHelpFrame = function()
			if VP_FrameMain:IsVisible() then
				VP_FrameMain:Hide()
			  else
				VP_FrameMain:Show()
			  end
		end
	elseif event == 'CHAT_MSG_SYSTEM' then
		local strOnline1 = '^Players online: (.+)%. Max online: (.+)%.$'
		local strOnline2 = '^Server uptime: (.+)%.$'

		local posBeg, posEnd, param1, param2 = string.find(arg1, strOnline1)
		if posBeg then
			VP_FrameMain1_3:SetText('Players online: ' .. param1)
			VP_FrameMain1_4:SetText('Max online: ' .. param2)
		else
			posBeg, posEnd, param1 = string.find(arg1, strOnline2)
			if posBeg then
				VP_FrameMain1_5:SetText('Server uptime: ' .. param1)
			end
		end
	end
end)
