CreateFrame('Frame', 'VPFrmMain')
VPFrmMain:SetPoint('CENTER', UIParent)
VPFrmMain:SetWidth(240)
VPFrmMain:EnableMouse(true)
VPFrmMain:SetMovable(true)
VPFrmMain:RegisterForDrag("LeftButton")
VPFrmMain:SetClampedToScreen(true)
VPFrmMain:SetScript("OnDragStart", function() this:StartMoving() end)
VPFrmMain:SetScript("OnDragStop", function() this:StopMovingOrSizing() end)
VPFrmMain.Visible = 1

CreateFrame('Frame', 'VPFrmTitle', VPFrmMain)
VPFrmTitle:SetBackdrop({
	bgFile = 'Interface\\DialogFrame\\UI-DialogBox-Background', 
    edgeFile = 'Interface\\AddOns\\V+Actions1\\MyBorder2',
    edgeSize = 16, insets = {left = 5, right = 5, top = 5, bottom = 5}
})
VPFrmTitle:SetPoint('TOP', VPFrmMain)
VPFrmTitle:SetWidth(VPFrmMain:GetWidth() - 128)
VPFrmTitle:SetHeight(32)

VPFrmTitle:CreateFontString("VPFrmTitleStr", "OVERLAY", "GameFontHighlight")
VPFrmTitleStr:SetPoint("CENTER", VPFrmTitle)
VPFrmTitleStr:SetText("")

CreateFrame('Button', 'VPBtnView', VPFrmMain)
VPBtnView:SetPoint('TOPRIGHT', VPFrmMain, 'TOPRIGHT')
VPBtnView:SetWidth(32)
VPBtnView:SetHeight(32)
VPBtnView:SetNormalTexture('Interface\\AddOns\\V+Actions1\\MenuBtn-Addon-Up')
VPBtnView:SetPushedTexture('Interface\\AddOns\\V+Actions1\\MenuBtn-Addon-Down')
VPBtnView:SetHighlightTexture('Interface\\AddOns\\V+Actions1\\MenuBtn-All-Highlight', 'add')
VPBtnView:SetScript("OnClick", function()
	if VPFrmMain.Visible == 1 then
		VPFrmMain.Visible = 0
		VPBtnPrev:Hide()
		VPBtnNext:Hide()
		VPFrmTitle:Hide()
		VPFrmAction:Hide()
		VPFrmStatus:Hide()
		VPFrmMain:EnableMouse(false)
		VPFrmMain:SetMovable(false)
		VPFrmMain:SetHeight(VPBtnView:GetHeight())
	else
		VPFrmMain.Visible = 1
		VPBtnPrev:Show()
		VPBtnNext:Show()
		VPFrmTitle:Show()
		VPFrmAction:Show()
		VPFrmStatus:Show()
		VPFrmMain:EnableMouse(true)
		VPFrmMain:SetMovable(true)
		VPFrmMain:SetHeight(VPBtnView:GetHeight() + VPFrmAction:GetHeight() + VPFrmStatus:GetHeight())
	end
end)

CreateFrame('Button', 'VPBtnTune', VPFrmMain)
VPBtnTune:SetPoint('RIGHT', VPBtnView, 'LEFT')
VPBtnTune:SetWidth(32)
VPBtnTune:SetHeight(32)
VPBtnTune:SetNormalTexture('Interface\\AddOns\\V+Actions1\\Img\\MenuBtn-Param-Up')
VPBtnTune:SetPushedTexture('Interface\\AddOns\\V+Actions1\\Img\\MenuBtn-Param-Down')
VPBtnTune:SetHighlightTexture('Interface\\AddOns\\V+Actions1\\Img\\MenuBtn-All-Highlight', 'add')

CreateFrame('Button', 'VPBtnPrev', VPFrmMain)
VPBtnPrev:SetPoint('TOPLEFT', VPFrmMain, 'TOPLEFT')
VPBtnPrev:SetWidth(32)
VPBtnPrev:SetHeight(32)
VPBtnPrev:SetNormalTexture('Interface\\AddOns\\V+Actions1\\MenuBtn-Prev-Up')
VPBtnPrev:SetPushedTexture('Interface\\AddOns\\V+Actions1\\MenuBtn-Prev-Down')
VPBtnPrev:SetHighlightTexture('Interface\\AddOns\\V+Actions1\\MenuBtn-All-Highlight', 'add')

CreateFrame('Button', 'VPBtnNext', VPFrmMain)
VPBtnNext:SetPoint('LEFT', VPBtnPrev, 'RIGHT')
VPBtnNext:SetWidth(32)
VPBtnNext:SetHeight(32)
VPBtnNext:SetNormalTexture('Interface\\AddOns\\V+Actions1\\MenuBtn-Next-Up')
VPBtnNext:SetPushedTexture('Interface\\AddOns\\V+Actions1\\MenuBtn-Next-Down')
VPBtnNext:SetHighlightTexture('Interface\\AddOns\\V+Actions1\\MenuBtn-All-Highlight', 'add')

CreateFrame('Frame', 'VPFrmAction', VPFrmMain)
VPFrmAction:SetBackdrop({
	bgFile = 'Interface\\DialogFrame\\UI-DialogBox-Background', 
    edgeFile = 'Interface\\Tooltips\\UI-Tooltip-Border',
    edgeSize = 16, insets = {left = 5, right = 5, top = 5, bottom = 5}
})
VPFrmAction:SetPoint('TOPLEFT', VPFrmMain, 'TOPLEFT', 0, -30)
VPFrmAction:SetWidth(VPFrmMain:GetWidth())
VPFrmAction:SetHeight(40)

CreateFrame('Frame', 'VPFrmStatus', VPFrmMain)
VPFrmStatus:SetBackdrop({
	bgFile = 'Interface\\DialogFrame\\UI-DialogBox-Background', 
    edgeFile = 'Interface\\Tooltips\\UI-Tooltip-Border',
    edgeSize = 16, insets = {left = 5, right = 5, top = 5, bottom = 5}
})
VPFrmStatus:SetPoint('TOPLEFT', VPFrmAction, 'BOTTOMLEFT')
VPFrmStatus:SetWidth(VPFrmMain:GetWidth())

VPFrmStatus:CreateFontString("VPFrmStatusStr1", "OVERLAY", "GameFontHighlight")
VPFrmStatusStr1:SetPoint("TOPLEFT", VPFrmStatus, "TOPLEFT", 10, -10)

VPFrmStatus:CreateFontString("VPFrmStatusStr2", "OVERLAY", "GameFontHighlight")
VPFrmStatusStr2:SetPoint("TOPLEFT", VPFrmStatusStr1, "BOTTOMLEFT", 0, -5)

VPFrmStatus:CreateFontString("VPFrmStatusStr3", "OVERLAY", "GameFontHighlight")
VPFrmStatusStr3:SetPoint("TOPLEFT", VPFrmStatusStr2, "BOTTOMLEFT", 0, -5)

VPFrmStatus:SetHeight(10 + VPFrmStatusStr1:GetHeight() + 5 + VPFrmStatusStr2:GetHeight() + 5 + VPFrmStatusStr3:GetHeight() + 10)

VPFrmMain:SetHeight(VPBtnView:GetHeight() + VPFrmAction:GetHeight() + VPFrmStatus:GetHeight())

 local i = 1;
-- The minimum number of seconds between each update
local ONUPDATE_INTERVAL = 10 -- 0.1

-- The number of seconds since the last update
local TimeSinceLastUpdate = 0
VPFrmStatus:SetScript("OnUpdate", function()
	TimeSinceLastUpdate = TimeSinceLastUpdate + arg1
	if TimeSinceLastUpdate >= ONUPDATE_INTERVAL then
		TimeSinceLastUpdate = 0
		local p1, p2 = GetGameTime()
		VPFrmStatusStr1:SetText(string.format("Server time: %02d:%02d", p1, p2))
	end
end)

-- When the frame is shown, reset the update timer
VPFrmStatus:SetScript("OnShow", function()
	TimeSinceLastUpdate = 0
	local p1, p2 = GetGameTime()
	VPFrmStatusStr1:SetText(string.format("Server time: %02d:%02d", p1, p2))
end)	

VPFrmStatus:Hide() 
VPFrmStatus:Show()

VPActionList = {}

VPActionList[1] = {}

VPActionList[1].CreateFrame = function()
	CreateFrame('Frame', 'VPFrmAction1', VPFrmAction)
	VPFrmAction1:SetPoint('CENTER', VPFrmAction)
	VPFrmAction1:SetWidth(VPFrmAction:GetWidth())
	VPFrmAction1:SetHeight(VPFrmAction:GetHeight())
	VPFrmAction1:Hide()

	CreateFrame("Button", "VPFrmAction1BtnServer", VPFrmAction1, "UIPanelButtonTemplate")
	VPFrmAction1BtnServer:SetPoint("LEFT", VPFrmAction1, "LEFT", 15, 0)
	VPFrmAction1BtnServer:SetHeight(24)
	VPFrmAction1BtnServer:SetWidth(100)
	VPFrmAction1BtnServer:SetText("Players online")
	VPFrmAction1BtnServer:SetScript("OnClick", function()
		PlaySound("igMainMenuClose")
		DEFAULT_CHAT_FRAME.editBox:SetText(".server info")
		ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
	end)

	CreateFrame("Button", "VPFrmAction1BtnPlayer", VPFrmAction1, "UIPanelButtonTemplate")
	VPFrmAction1BtnPlayer:SetPoint("RIGHT", VPFrmAction1, "RIGHT", -15, 0)
	VPFrmAction1BtnPlayer:SetHeight(24)
	VPFrmAction1BtnPlayer:SetWidth(100)
	VPFrmAction1BtnPlayer:SetText("Played time")
	VPFrmAction1BtnPlayer:SetScript("OnClick", function()
		PlaySound("igMainMenuClose")
		DEFAULT_CHAT_FRAME.editBox:SetText("/played")
		ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
	end)
end

VPActionList[1].ShowFrame = function()
	VPFrmTitleStr:SetText("Information")
	VPFrmAction1:Show()
end

VPActionList[1].HideFrame = function()
	VPFrmTitleStr:SetText("")
	VPFrmAction1:Hide()
end

VPActionList[2] = {}

VPActionList[2].CreateFrame = function()
	CreateFrame('Frame', 'VPFrmAction2', VPFrmAction)
	VPFrmAction2:SetPoint('CENTER', VPFrmAction)
	VPFrmAction2:SetWidth(VPFrmAction:GetWidth())
	VPFrmAction2:SetHeight(VPFrmAction:GetHeight())
	VPFrmAction2:Hide()

	VPFrmAction2:CreateFontString("VPFrmAction2Str", "OVERLAY", "GameFontHighlight")
	VPFrmAction2Str:SetPoint("LEFT", VPFrmAction2, "LEFT", 10, 0)
	VPFrmAction2Str:SetText("Registration:")

	CreateFrame("Button", "VPFrmAction2BtnWg", VPFrmAction2, "UIPanelButtonTemplate")
	VPFrmAction2BtnWg:SetPoint("LEFT", VPFrmAction2Str, "RIGHT", 10, 0)
	VPFrmAction2BtnWg:SetHeight(24)
	VPFrmAction2BtnWg:SetWidth(40)
	VPFrmAction2BtnWg:SetText("WG")
	VPFrmAction2BtnWg:SetScript("OnClick", function()
		PlaySound("igMainMenuClose")
		SendChatMessage('.wsg')
	end)

	CreateFrame("Button", "VPFrmAction2BtnAB", VPFrmAction2, "UIPanelButtonTemplate")
	VPFrmAction2BtnAB:SetPoint("LEFT", VPFrmAction2BtnWg, "RIGHT", 10, 0)
	VPFrmAction2BtnAB:SetHeight(24)
	VPFrmAction2BtnAB:SetWidth(40)
	VPFrmAction2BtnAB:SetText("AB")
	VPFrmAction2BtnAB:SetScript("OnClick", function()
		PlaySound("igMainMenuClose")
		SendChatMessage('.ab')
	end)

	CreateFrame("Button", "VPFrmAction2BtnAC", VPFrmAction2, "UIPanelButtonTemplate")
	VPFrmAction2BtnAC:SetPoint("LEFT", VPFrmAction2BtnAB, "RIGHT", 10, 0)
	VPFrmAction2BtnAC:SetHeight(24)
	VPFrmAction2BtnAC:SetWidth(40)
	VPFrmAction2BtnAC:SetText("AC")
	VPFrmAction2BtnAC:SetScript("OnClick", function()
		PlaySound("igMainMenuClose")
		SendChatMessage('.ac')
	end)
end

VPActionList[2].ShowFrame = function()
	VPFrmTitleStr:SetText("Battlegrounds")
	VPFrmAction2:Show()
end

VPActionList[2].HideFrame = function()
	VPFrmTitleStr:SetText("")
	VPFrmAction2:Hide()
end

VPActionList[3] = {}

VPActionList[3].CreateFrame = function()
	CreateFrame('Frame', 'VPFrmAction3', VPFrmAction)
	VPFrmAction3:SetPoint('CENTER', VPFrmAction)
	VPFrmAction3:SetWidth(VPFrmAction:GetWidth())
	VPFrmAction3:SetHeight(VPFrmAction:GetHeight())
	VPFrmAction3:Hide()

	CreateFrame("Button", "VPFrmAction3BtnServer", VPFrmAction3, "UIPanelButtonTemplate")
	VPFrmAction3BtnServer:SetPoint("LEFT", VPFrmAction3, "LEFT", 15, 0)
	VPFrmAction3BtnServer:SetHeight(24)
	VPFrmAction3BtnServer:SetWidth(100)
	VPFrmAction3BtnServer:SetText("Reset Instances")
	VPFrmAction3BtnServer:SetScript("OnClick", function()
		PlaySound("igMainMenuClose")
		ResetInstances()
	end)

	CreateFrame("Button", "VPFrmAction3BtnPlayer", VPFrmAction3, "UIPanelButtonTemplate")
	VPFrmAction3BtnPlayer:SetPoint("RIGHT", VPFrmAction3, "RIGHT", -15, 0)
	VPFrmAction3BtnPlayer:SetHeight(24)
	VPFrmAction3BtnPlayer:SetWidth(100)
	VPFrmAction3BtnPlayer:SetText("Reset UI")
	VPFrmAction3BtnPlayer:SetScript("OnClick", function()
		PlaySound("igMainMenuClose")
		ReloadUI()
	end)
end

VPActionList[3].ShowFrame = function()
	VPFrmTitleStr:SetText("Resetting")
	VPFrmAction3:Show()
end

VPActionList[3].HideFrame = function()
	VPFrmTitleStr:SetText("")
	VPFrmAction3:Hide()
end

VPActionList[1].CreateFrame()
VPActionList[2].CreateFrame()
VPActionList[3].CreateFrame()

local VPActionMax = 3
local VPActionNum = 1
VPActionList[VPActionNum].ShowFrame()

VPBtnPrev:SetScript("OnClick", function() 
	VPActionList[VPActionNum].HideFrame()
	VPActionNum = VPActionNum - 1
	if VPActionNum < 1 then
		VPActionNum = VPActionMax
	end
	VPActionList[VPActionNum].ShowFrame()
end)

VPBtnNext:SetScript("OnClick", function() 
	VPActionList[VPActionNum].HideFrame()
	VPActionNum = VPActionNum + 1
	if VPActionNum > VPActionMax then
		VPActionNum = 1
	end
	VPActionList[VPActionNum].ShowFrame()
end)
