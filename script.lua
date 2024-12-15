
local Players = game:GetService("Players")
local ts = game:GetService("TweenService")
local lp = Players.LocalPlayer
local uis = game:GetService("UserInputService")

local GhostLib = {
	Functions = {},
	States = {},
	Pages = {},
	Notifications = {},
	Started = false,
	Version = 3,
    PlayerM = loadstring(game:HttpGet("https://raw.githubusercontent.com/el-ghxst/PlayerM/refs/heads/main/script.lua"))();
    Name = "",
	
}

local HttpService = game:GetService("HttpService")
local prefix = "."
local colors = {}
colors.Green = Color3.fromRGB(85, 255, 127)
colors.Blue = Color3.fromRGB(85, 85, 255)
colors.Yellow = Color3.fromRGB(255, 255, 127)
colors.Red = Color3.fromRGB(255, 0, 0)
colors.DarkRed = Color3.fromRGB(170, 0, 0)
colors.Purple = Color3.fromRGB(255,0,255)
colors.LightBlue = Color3.fromRGB(51,249,255)
function GhostLib:Start()
	GhostLib.Started = true
end
local ScreenGui = Instance.new("ScreenGui")
local CommandBar = Instance.new("Frame")
local CommandBox = Instance.new("TextBox")
local CommandFind = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local Command = Instance.new("TextLabel")
local Menu = Instance.new("Frame")
local PageChange = Instance.new("ScrollingFrame")
local PageButton = Instance.new("TextButton")
local UIListLayout_2 = Instance.new("UIListLayout")
local ImageLabel = Instance.new("ImageLabel")
local TextLabel = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local UIListLayout_3 = Instance.new("UIListLayout")
local Page = Instance.new("ScrollingFrame")
local UIListLayout_4 = Instance.new("UIListLayout")
local Title = Instance.new("TextLabel")
local Section = Instance.new("TextLabel")
local Label = Instance.new("TextLabel")
local TextBox = Instance.new("Frame")
local UIListLayout_5 = Instance.new("UIListLayout")
local Name = Instance.new("TextLabel")
local Box = Instance.new("TextBox")
local UICorner_2 = Instance.new("UICorner")
local UICorner_3 = Instance.new("UICorner")
local Button = Instance.new("TextButton")
local KeyBind = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local UIGradient = Instance.new("UIGradient")
local Output = Instance.new("Frame")
local UIListLayout_6 = Instance.new("UIListLayout")
local NotificationFrame = Instance.new("Frame")
local pos0 = Instance.new("TextLabel")
local pos1 = Instance.new("TextLabel")
local ScriptTitle = Instance.new("TextLabel")
--Properties:
local function uiStroke(frame)
	local us = Instance.new("UIStroke")
	us.Parent = frame
	return us
end
ScreenGui.Parent = game.CoreGui

CommandBar.Name = "CommandBar"
CommandBar.Parent = ScreenGui
CommandBar.AnchorPoint = Vector2.new(0.5, 0.5)
CommandBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CommandBar.BackgroundTransparency = 1
CommandBar.BorderColor3 = Color3.fromRGB(255, 255, 255)
CommandBar.BorderSizePixel = 2
CommandBar.Position = UDim2.new(0.5, 0,0.493, 0)
CommandBar.Size = UDim2.new(1, 0, 0.0246913582, 0)
CommandBar.Visible = false

CommandBox.Name = "CommandBox"
CommandBox.Parent = CommandBar
CommandBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CommandBox.BackgroundTransparency = 1
CommandBox.BorderColor3 = Color3.fromRGB(255, 255, 255)
CommandBox.Position = UDim2.new(0.00324674416, 0, 0.200500488, 0)
CommandBox.Size = UDim2.new(0.992712617, 0, 0.583717346, 0)
CommandBox.Font = Enum.Font.DenkOne
CommandBox.Text = ""
CommandBox.TextColor3 = Color3.fromRGB(255, 255, 255)
CommandBox.TextScaled = true
CommandBox.TextTransparency = 1
CommandBox.TextSize = 14.000
CommandBox.TextWrapped = true

GhostLib.States.CommandBarDelay = 0.2

GhostLib.States.CommandBarVisible = false
GhostLib.States.CommandBarCooldown = false
function GhostLib.Functions:OpenCommandBar()
	if GhostLib.States.CommandBarVisible == false and GhostLib.States.CommandBarCooldown == false and GhostLib.Started == true then
		GhostLib.States.CommandBarCooldown = true
		GhostLib.States.CommandBarVisible = true
		CommandBar.Visible = true
		local defpos = UDim2.new(0.5, 0,0.493, 0)
		local leavepos = UDim2.new(0.5, 0,0.593, 0)
		CommandBar.Position = leavepos
		ts:Create(CommandBar, TweenInfo.new(GhostLib.States.CommandBarDelay, Enum.EasingStyle.Back), {BackgroundTransparency = 0.9}):Play()
		ts:Create(CommandBar, TweenInfo.new(GhostLib.States.CommandBarDelay, Enum.EasingStyle.Back), {Position = defpos}):Play()
		ts:Create(CommandBox, TweenInfo.new(GhostLib.States.CommandBarDelay, Enum.EasingStyle.Back), {BackgroundTransparency = 0.85}):Play()
		ts:Create(CommandBox, TweenInfo.new(GhostLib.States.CommandBarDelay, Enum.EasingStyle.Back), {TextTransparency = 0}):Play()
		CommandBox:CaptureFocus()
		wait(GhostLib.States.CommandBarDelay)
		GhostLib.States.CommandBarCooldown = false
		
	end
	
end
-- {Text = Text, Frame = Message, DestroyTime = 300, MaxDestroyTime = 300, Times = 1}
function GhostLib.Functions:MakeNotification(Text, Color)
	if GhostLib.Started == true then
		task.spawn(function()
			Color = Color or Color3.fromRGB(255, 255, 255)
			local CloneNotification = true
			local LastNotification = GhostLib.Notifications[#GhostLib.Notifications]
			if LastNotification then
				if LastNotification.Text == Text and LastNotification.DestroyTime > 0 then
					CloneNotification = false
					LastNotification.Times = LastNotification.Times + 1
					LastNotification.DestroyTime = LastNotification.MaxDestroyTime + 1
					LastNotification.Frame.pos0.Text = LastNotification.Text.." x"..LastNotification.Times
				end
			end
			if CloneNotification == true then
				local newNotification = NotificationFrame:Clone()
				newNotification.pos0.Text = Text
                newNotification.pos1.Text = Text
				newNotification.pos0.TextColor3 = Color
				local MSG = {Text = Text, Frame = newNotification, DestroyTime = 300, MaxDestroyTime = 300, Times = 1}
				table.insert(GhostLib.Notifications, MSG)
				newNotification.Parent = Output
				local pos2 = newNotification.pos0.Position
				local pos1 = newNotification.pos1.Position
				ts:Create(newNotification.pos0, TweenInfo.new(1, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {Position = pos1}):Play()
				wait(1)
				repeat wait()
					MSG.DestroyTime = MSG.DestroyTime-1
				until MSG.DestroyTime <= 0
				ts:Create(newNotification.pos0, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {Position = pos2}):Play()
				wait(0.6)
				newNotification:Destroy()
			end
		end)
	end
	
end
function GhostLib.Functions:CloseCommandBar()
	if GhostLib.States.CommandBarVisible == true and GhostLib.States.CommandBarCooldown == false and GhostLib.Started == true then
		GhostLib.States.CommandBarCooldown = true
		GhostLib.States.CommandBarVisible = false
		local defpos = UDim2.new(0.5, 0,0.493, 0)
		local leavepos = UDim2.new(0.5, 0,0.593, 0)
		CommandBar.Position = defpos
		ts:Create(CommandBar, TweenInfo.new(GhostLib.States.CommandBarDelay, Enum.EasingStyle.Back), {BackgroundTransparency = 1}):Play()
		ts:Create(CommandBar, TweenInfo.new(GhostLib.States.CommandBarDelay, Enum.EasingStyle.Back), {Position = leavepos}):Play()
		ts:Create(CommandBox, TweenInfo.new(GhostLib.States.CommandBarDelay, Enum.EasingStyle.Back), {BackgroundTransparency = 1}):Play()
		ts:Create(CommandBox, TweenInfo.new(GhostLib.States.CommandBarDelay, Enum.EasingStyle.Back), {TextTransparency = 1}):Play()
		wait(GhostLib.States.CommandBarDelay)
		CommandBar.Visible = false
		GhostLib.States.CommandBarCooldown = false
	end
	
end



CommandFind.Name = "CommandFind"
CommandFind.Parent = CommandBar
CommandFind.AnchorPoint = Vector2.new(0.5, 0.5)
CommandFind.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CommandFind.BackgroundTransparency = 0.900
CommandFind.BorderColor3 = Color3.fromRGB(255, 255, 255)
CommandFind.Position = UDim2.new(0.49956423, 0, 1.48387098, 0)
CommandFind.Size = UDim2.new(0.359514177, 0, 0.45161289, 0)
CommandFind.Visible = false

UIListLayout.Parent = CommandFind
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

Command.Name = "Command"
Command.Parent = CommandFind
Command.AnchorPoint = Vector2.new(0.5, 0.5)
Command.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Command.BackgroundTransparency = 1.000
Command.Position = UDim2.new(0.328828812, 0, 4.27272749, 0)
Command.Size = UDim2.new(0.932432413, 0, 1, 0)
Command.Font = Enum.Font.DenkOne
Command.Text = ".re/.refresh <times>"
Command.TextColor3 = Color3.fromRGB(255, 255, 255)
Command.TextSize = 14.000
Command.TextStrokeTransparency = 0.730
Command.TextXAlignment = Enum.TextXAlignment.Left

Menu.Name = "Menu"
Menu.Parent = ScreenGui
Menu.AnchorPoint = Vector2.new(0.5, 0.5)
Menu.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Menu.BackgroundTransparency = 0.1
Menu.BorderColor3 = Color3.fromRGB(255, 255, 255)
Menu.Position = UDim2.new(0.510201097, 0, 0.752660453, 0)
Menu.Size = UDim2.new(0, 309, 0, 200)
Menu.ClipsDescendants = true
Menu.Visible = false

PageChange.Name = "PageChange"
PageChange.Parent = Menu
PageChange.Active = true
PageChange.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
PageChange.BackgroundTransparency = 1.000
PageChange.BorderColor3 = Color3.fromRGB(255, 255, 255)
PageChange.BorderSizePixel = 0
PageChange.Position = UDim2.new(0.0115780625, 0, 0.0925000012, 0)
PageChange.Size = UDim2.new(0, 131, 0, 181)
PageChange.ScrollBarThickness = 2
PageChange.AutomaticCanvasSize = Enum.AutomaticSize.Y
PageChange.CanvasSize = UDim2.new(0, 0, 0.5, 0)

local UICorner_5 = Instance.new("UICorner")
UICorner_5.Parent = Menu

PageButton.Name = "PageButton"
PageButton.Parent = nil
PageButton.BackgroundColor3 = Color3.fromRGB(147, 147, 147)
PageButton.BackgroundTransparency = 0.700
PageButton.Size = UDim2.new(0, 121, 0, 32)
PageButton.Font = Enum.Font.SourceSans
PageButton.Text = ""
PageButton.TextColor3 = Color3.fromRGB(0, 0, 0)
PageButton.TextSize = 14.000

UIListLayout_2.Parent = PageButton
UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Center
UIListLayout_2.Padding = UDim.new(0.0599999987, 0)

ImageLabel.Parent = PageButton
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.Position = UDim2.new(0, 0, 0.0727270842, 0)
ImageLabel.Size = UDim2.new(0, 27, 0, 27)
ImageLabel.Image = "http://www.roblox.com/asset/?id=12338394619"

TextLabel.Parent = PageButton
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.344049633, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 75, 0, 32)
TextLabel.Font = Enum.Font.DenkOne
TextLabel.Text = "ABUSE-SCRIPTS"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 13.000
TextLabel.TextWrapped = true
TextLabel.TextXAlignment = Enum.TextXAlignment.Left

UICorner.Parent = PageButton

local Separator1 = Instance.new("Frame")
Separator1.Parent = PageChange
Separator1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Separator1.BackgroundTransparency = 1.000
Separator1.Position = UDim2.new(0.118320614, 0, 0, 0)
Separator1.Size = UDim2.new(0, 100, 0, 5)

UIListLayout_3.Parent = PageChange
UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_3.Padding = UDim.new(0.03, 0)

GhostLib.States.DefaultPagePos = UDim2.new(0.443, 0,0.093, 0)
Page.Name = "Page"
Page.Parent = nil
Page.Active = true
Page.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Page.BackgroundTransparency = 1.000
Page.BorderColor3 = Color3.fromRGB(255, 255, 255)
Page.BorderSizePixel = 0
Page.LayoutOrder = 1
Page.Position = GhostLib.States.DefaultPagePos
Page.Size = UDim2.new(0, 172,0, 181)
Page.ScrollBarThickness = 2
Page.AutomaticCanvasSize = Enum.AutomaticSize.Y
Page.CanvasSize = UDim2.new(0, 0, 0.5, 0)

UIListLayout_4.Parent = Page
UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_4.Padding = UDim.new(0.01, 0)
UIListLayout_4.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout_4.VerticalAlignment = Enum.VerticalAlignment.Top

Title.Name = "Title"
Title.Parent = nil
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Size = UDim2.new(0, 149, 0, 20)
Title.Font = Enum.Font.Oswald
Title.Text = "COMMANDS"
Title.TextColor3 = Color3.fromRGB(241, 241, 241)
Title.TextSize = 20.000
Title.TextStrokeTransparency = 0.730
Title.TextWrapped = true
Title.AutomaticSize = Enum.AutomaticSize.Y

Section.Name = "Section"
Section.Parent = nil
Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Section.BackgroundTransparency = 1.000
Section.Position = UDim2.new(0, 0, 0.119298808, 0)
Section.Size = UDim2.new(0, 149, 0, 18)
Section.Font = Enum.Font.Oswald
Section.Text = "AUTORESPAWN"
Section.TextColor3 = Color3.fromRGB(191, 191, 191)
Section.TextSize = 17.000
Section.TextStrokeTransparency = 0.730
Section.TextWrapped = true
Section.TextXAlignment = Enum.TextXAlignment.Left
Section.AutomaticSize = Enum.AutomaticSize.Y

Label.Name = "Label"
Label.Parent = nil
Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label.BackgroundTransparency = 1.000
Label.Position = UDim2.new(0, 0, 0.223629296, 0)
Label.Size = UDim2.new(0, 149, 0, 18)
Label.Font = Enum.Font.DenkOne
Label.Text = ".autorespawn/.auto <on/off>"
Label.TextColor3 = Color3.fromRGB(255, 255, 255)
Label.TextSize = 14.000
Label.TextStrokeTransparency = 0.730
Label.TextWrapped = true
Label.TextXAlignment = Enum.TextXAlignment.Left
Label.AutomaticSize = Enum.AutomaticSize.Y

TextBox.Name = "TextBox"
TextBox.Parent = nil
TextBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BackgroundTransparency = 0.67
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0, 0, 0.339392215, 0)
TextBox.Size = UDim2.new(0, 158, 0, 26)
TextBox.AutomaticSize = Enum.AutomaticSize.Y

UIListLayout_5.Parent = TextBox
UIListLayout_5.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_5.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_5.VerticalAlignment = Enum.VerticalAlignment.Center
UIListLayout_5.Padding = UDim.new(0.100000001, 0)

Name.Name = "Text"
Name.Parent = TextBox
Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Name.BackgroundTransparency = 1.000
Name.Position = UDim2.new(0.0250000209, 0, 0, 0)
Name.Size = UDim2.new(0, 47, 0, 28)
Name.Font = Enum.Font.DenkOne
Name.Text = "Text"
Name.TextColor3 = Color3.fromRGB(255, 255, 255)
Name.TextSize = 14.000
Name.TextWrapped = true
Name.AutomaticSize = Enum.AutomaticSize.Y

Box.Name = "Box"
Box.Parent = TextBox
Box.BackgroundColor3 = Color3.fromRGB(66, 66, 66)
Box.BackgroundTransparency = 0.850
Box.BorderColor3 = Color3.fromRGB(255, 255, 255)
Box.Position = UDim2.new(0.0970186591, 0, -1.87788463, 0)
Box.Size = UDim2.new(0, 93, 0, 21)
Box.Font = Enum.Font.DenkOne
Box.Text = ""
Box.TextColor3 = Color3.fromRGB(255, 255, 255)
Box.TextSize = 14.000
Box.TextWrapped = true
Box.AutomaticSize = Enum.AutomaticSize.Y

UICorner_2.Parent = Box

UICorner_3.Parent = TextBox

--
KeyBind.Name = "KeyBind"
KeyBind.Parent = nil
KeyBind.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
KeyBind.BackgroundTransparency = 0.670
KeyBind.BorderSizePixel = 0
KeyBind.Position = UDim2.new(0.0306748468, 0, -0.00499999989, 0)
KeyBind.Size = UDim2.new(0, 158, 0, 26)
KeyBind.Font = Enum.Font.DenkOne
KeyBind.Text = ""
KeyBind.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBind.TextSize = 14.000
local UICorner_6 = Instance.new("UICorner")
UICorner_6.Parent = KeyBind
local UICorner_7 = Instance.new("UICorner")
UICorner_7.Parent = KeyBind
local UIListLayout_7 = Instance.new("UIListLayout")
UIListLayout_7.Parent = KeyBind
UIListLayout_7.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_7.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout_7.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_7.VerticalAlignment = Enum.VerticalAlignment.Center
UIListLayout_7.Padding = UDim.new(0.100000001, 0)
local Name_2 = Instance.new("TextLabel")
Name_2.Name = "Text2"
Name_2.Parent = KeyBind
Name_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Name_2.BackgroundTransparency = 1.000
Name_2.Position = UDim2.new(0.0291137695, 0, 0, 0)
Name_2.Size = UDim2.new(0, 47, 0, 28)
Name_2.Font = Enum.Font.DenkOne
Name_2.Text = "Message"
Name_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Name_2.TextSize = 14.000
Name_2.TextWrapped = true
local Box_2 = Instance.new("TextLabel")
Box_2.Name = "Box"
Box_2.Parent = KeyBind
Box_2.BackgroundColor3 = Color3.fromRGB(66, 66, 66)
Box_2.BackgroundTransparency = 0.850
Box_2.BorderColor3 = Color3.fromRGB(255, 255, 255)
Box_2.Position = UDim2.new(0.0970186591, 0, -1.87788463, 0)
Box_2.Size = UDim2.new(0, 93, 0, 21)
Box_2.Font = Enum.Font.DenkOne
Box_2.Text = ""
Box_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Box_2.TextSize = 14.000
Box_2.TextWrapped = true
--
Button.Name = "Button"
Button.Parent = nil
Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Button.BackgroundTransparency = 0.67
Button.BorderSizePixel = 0
Button.Position = UDim2.new(0.0306748468, 0, -0.00499999989, 0)
Button.Size = UDim2.new(0, 158, 0, 26)
Button.Font = Enum.Font.DenkOne
Button.Text = ""
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.TextSize = 14.000
Button.AutomaticSize = Enum.AutomaticSize.Y

UICorner_4.Parent = Button

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(30, 30, 30)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(18, 18, 18))}
UIGradient.Rotation = 90
UIGradient.Parent = Menu

Output.Name = "Output"
Output.Parent = ScreenGui
Output.AnchorPoint = Vector2.new(0,0)
Output.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Output.BackgroundTransparency = 1
Output.Position = UDim2.new(0.9, 0,0.572, 0)
Output.Size = UDim2.new(0, 190, 0, 227)

UIListLayout_6.Parent = Output
UIListLayout_6.SortOrder = Enum.SortOrder.LayoutOrder

NotificationFrame.Name = "NotificationFrame"
NotificationFrame.Parent = nil
NotificationFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NotificationFrame.BackgroundTransparency = 1
NotificationFrame.Size = UDim2.new(0, 190,0, 0)
NotificationFrame.AutomaticSize = Enum.AutomaticSize.Y

pos0.Name = "pos0"
pos0.Parent = NotificationFrame
pos0.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
pos0.BackgroundTransparency = 1
pos0.Position = UDim2.new(1.042, 0,0.142, 0)
pos0.Size = UDim2.new(0, 190, 0, 0)
pos0.Font = Enum.Font.DenkOne
pos0.Text = ""
pos0.TextColor3 = Color3.fromRGB(255, 255, 255)
pos0.TextSize = 15.000
pos0.TextStrokeTransparency = 0.5
pos0.TextWrapped = true
pos0.TextXAlignment = Enum.TextXAlignment.Left
pos0.AutomaticSize = Enum.AutomaticSize.Y

pos1.Name = "pos1"
pos1.Parent = NotificationFrame
pos1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
pos1.BackgroundTransparency = 1
pos1.Position = UDim2.new(-0.02, 0,0.142, 0)
pos1.Size = UDim2.new(0, 190, 0, 0)
pos1.Visible = false
pos1.Font = Enum.Font.DenkOne
pos1.Text = ""
pos1.TextColor3 = Color3.fromRGB(255, 255, 255)
pos1.TextSize = 15.000
pos1.TextStrokeTransparency = 0.730
pos1.TextWrapped = true
pos1.TextXAlignment = Enum.TextXAlignment.Left
pos1.AutomaticSize = Enum.AutomaticSize.Y

ScriptTitle.Name = "ScriptTitle"
ScriptTitle.Parent = Menu
ScriptTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptTitle.BackgroundTransparency = 1.000
ScriptTitle.Position = UDim2.new(0.0291262139, 0, 0.0149999997, 0)
ScriptTitle.Size = UDim2.new(0, 298, 0, 15)
ScriptTitle.Font = Enum.Font.Oswald
ScriptTitle.Text = "GHXST ADMIN"
ScriptTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptTitle.TextScaled = true
ScriptTitle.TextSize = 20.000
ScriptTitle.TextWrapped = true
ScriptTitle.TextXAlignment = Enum.TextXAlignment.Left

local savedColors = {}
local rgbColor = Color3.fromRGB(255, 255, 255)

local t = 5

coroutine.wrap(function()
	while wait() do
		local hue = tick()% t/t
		local color = Color3.fromHSV(hue,1,1)
		rgbColor = color
	end
end)()

local function rgbp(frame, property)
	coroutine.wrap(function()
		frame:SetAttribute("RGB", true)
		repeat wait()
			frame[property] = rgbColor
		until frame:GetAttribute("RGB") == false
	end)()

end
local function unrgbp(frame, property)
	if frame:GetAttribute("RGB") then
		frame:SetAttribute("RGB", false)
	end
end
local tweenTimeButton = 0.3
function GhostLib.Functions:RemoveRgb(frame)
	coroutine.wrap(function()
		local child = frame:FindFirstChild("RGB")
		if child then
			child:Destroy()
		end
		for i,f in pairs(savedColors) do
			if f[1] == frame then
				frame.BackgroundColor3 = f[2]
			end
		end
	end)()
	
end

-- Not mine 
function GhostLib.Functions:Rgb(frame)
	coroutine.wrap(function()
		if not frame:FindFirstChild("RGB") then
			local found = false
			for _,c in pairs(savedColors) do
				if c[1] == frame then
					found = true
				end
			end
			if found == false then
				table.insert(savedColors, {frame, frame.BackgroundColor3})
			end
			

			local gradient = Instance.new("UIGradient")
			gradient.Transparency = NumberSequence.new(1)
			gradient.Enabled = true
			gradient.Parent = frame
			local nv = Instance.new("NumberValue")
			nv.Value = 1
			local conn
			conn = nv.Changed:Connect(function()
				gradient.Transparency = NumberSequence.new(nv.Value)
			end)

			local an1 = ts:Create(nv, TweenInfo.new(tweenTimeButton), {Value = 0}):Play()
			coroutine.wrap(function()
				wait(tweenTimeButton+0.1)
				nv:Destroy()
				conn:Disconnect()
			end)()

			local an2 = ts:Create(frame, TweenInfo.new(0), {BackgroundColor3 = Color3.fromRGB(255, 255, 255)})

			an2:Play()
			gradient.Name = "RGB"
		

			local ti = TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
			local offset = {Offset = Vector2.new(1, 0)}
			local create = ts:Create(gradient, ti, offset)
			local startingPos = Vector2.new(-1, 0)
			local list = {} 
			local s, kpt = ColorSequence.new, ColorSequenceKeypoint.new
			local counter = 0
			local status = "down" 
			gradient.Offset = startingPos
			local function rainbowColors()
				local sat, val = 255, 255 
				for i = 1, 15 do 
					local hue = i * 17 
					table.insert(list, Color3.fromHSV(hue / 255, sat / 255, val / 255))
				end
			end
			rainbowColors()
			gradient.Color = s({
				kpt(0, list[#list]),
				kpt(0.5, list[#list - 1]),
				kpt(1, list[#list - 2])
			})
			counter = #list

			repeat
				create:Play()
				create.Completed:Wait() 
				gradient.Offset = startingPos 
				gradient.Rotation = 180
				if counter == #list - 1 and status == "down" then
					gradient.Color = s({
						kpt(0, gradient.Color.Keypoints[1].Value),
						kpt(0.5, list[#list]), 
						kpt(1, list[1]) 
					})
					counter = 1
					status = "up" 
				elseif counter == #list and status == "down" then 
					gradient.Color = s({
						kpt(0, gradient.Color.Keypoints[1].Value),
						kpt(0.5, list[1]),
						kpt(1, list[2])
					})
					counter = 2
					status = "up"
				elseif counter <= #list - 2 and status == "down" then 
					gradient.Color = s({
						kpt(0, gradient.Color.Keypoints[1].Value),
						kpt(0.5, list[counter + 1]), 
						kpt(1, list[counter + 2])
					})
					counter = counter + 2
					status = "up"
				end
				create:Play()
				create.Completed:Wait()
				gradient.Offset = startingPos
				gradient.Rotation = 0 
				if counter == #list - 1 and status == "up" then
					gradient.Color = s({ 

						kpt(0, list[1]), 
						kpt(0.5, list[#list]), 
						kpt(1, gradient.Color.Keypoints[3].Value)
					})
					counter = 1
					status = "down"
				elseif counter == #list and status == "up" then
					gradient.Color = s({
						kpt(0, list[2]),
						kpt(0.5, list[1]), 
						kpt(1, gradient.Color.Keypoints[3].Value)
					})
					counter = 2
					status = "down"
				elseif counter <= #list - 2 and status == "up" then
					gradient.Color = s({
						kpt(0, list[counter + 2]), 
						kpt(0.5, list[counter + 1]), 
						kpt(1, gradient.Color.Keypoints[3].Value) 	
					})
					counter = counter + 2
					status = "down"
				end
			until gradient.Parent ~= frame
		end
	end)()
	

end

-- This function is not mine jejejejje
local function dragify(Frame)
	local dragToggle = nil
	local dragSpeed = .1
	local dragInput = nil
	local dragStart = nil
	local dragPos = nil
	local startPos

	local function updateInput(input)
		local Delta = input.Position - dragStart
		local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
		game:GetService("TweenService"):Create(Frame, TweenInfo.new(dragSpeed), {Position = Position}):Play()
	end

	Frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
			dragToggle = true
			dragStart = input.Position
			startPos = Frame.Position
			input.Changed:Connect(function()
				if (input.UserInputState == Enum.UserInputState.End) then
					dragToggle = false
				end
			end)
		end
	end)

	Frame.InputChanged:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			dragInput = input
		end
	end)

	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if (input == dragInput and dragToggle) then
			updateInput(input)
		end
	end)
end

GhostLib.States.PageChangeTime = 0.3
function GhostLib.Functions:DisplayPage(page)
	local Page = page.Frame
	if Page.Parent ~= Menu then
		GhostLib.Functions:Rgb(page.Button)
		for _,page1 in pairs(GhostLib.Pages) do
            coroutine.wrap(function()
                if page1.Frame ~= Page then
                    GhostLib.Functions:RemoveRgb(page1.Button)
                    ts:Create(page1.Frame, TweenInfo.new(GhostLib.States.PageChangeTime, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Position = UDim2.new(0.443, 0,-1, 0)}):Play()
                    wait(GhostLib.States.PageChangeTime+0.05)
                    page1.Frame.Parent = nil
                    page1.Position = GhostLib.States.DefaultPagePos
                end
            end)()
			
			
			
		end
        wait(GhostLib.States.PageChangeTime+0.05)
		Page.Position = UDim2.new(0.443, 0,1, 0)
		Page.Parent = Menu
		
		ts:Create(Page, TweenInfo.new(GhostLib.States.PageChangeTime, Enum.EasingStyle.Linear), {Position = GhostLib.States.DefaultPagePos}):Play()
		wait(0.15)
		
	end
end
dragify(Menu)

function GhostLib.Functions:AddTextBox(tab, page)
	local Text = tab.Text
	local Color = tab.Color or Color3.fromRGB(255, 255, 255)
	local box = TextBox:Clone()
	local ClearTextOnFocus = tab.ClearTextOnFocus
	local ClearTextOnEnter = tab.ClearTextOnEnter
	local callBack = tab.CallBack or nil
	box.Text.Text = Text
	box.Text.TextColor3 = Color
	box.Box.ClearTextOnFocus = ClearTextOnFocus
	box.Parent = page.Frame
	local stroke = uiStroke(box.Box)
	stroke.Thickness = 1.2
	stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	stroke.Transparency = 1
	stroke.Enabled = true
	rgbp(stroke, "Color")
	if callBack then
		box.Box.Focused:connect(function()
			ts:Create(stroke, TweenInfo.new(0.3), {Transparency = 0}):Play()
		end)
		box.Box.FocusLost:connect(function(enter)
			ts:Create(stroke, TweenInfo.new(0.3), {Transparency = 1}):Play()
			if enter then
				pcall(callBack, box.Box.Text)
				if ClearTextOnEnter == true then
					box.Box.Text = ""
				end
			end
		end)
	end
    
    return box.Box
end
function GhostLib.Functions:AddButton(tab, page)
	local Text = tab.Text
	local Color = tab.Color or Color3.fromRGB(255, 255, 255)
	local Button = Button:Clone()
	local callBack = tab.CallBack or nil
	Button.Text = Text
	Button.TextColor3 = Color
	Button.Parent = page.Frame
	local stroke = uiStroke(Button)
	stroke.Thickness = 1.2
	stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	stroke.Transparency = 1
	stroke.Enabled = true
	rgbp(stroke, "Color")
	if callBack then
		Button.MouseButton1Down:Connect(function()
			pcall(callBack)
		end)
	end
	
	Button.MouseEnter:Connect(function()
		ts:Create(stroke, TweenInfo.new(0.3), {Transparency = 0}):Play()
	end)
	Button.MouseLeave:Connect(function()
		ts:Create(stroke, TweenInfo.new(0.3), {Transparency = 1}):Play()
	end)
end

GhostLib.Settings = {}

local file

coroutine.wrap(function()
	repeat game:GetService("RunService").Heartbeat:Wait() until GhostLib.Started == true
	local file = GhostLib.Name..".txt"

	if file ~= nil and tostring(file) then
		local json
		if (readfile and isfile and isfile(file)) then
			GhostLib.Settings = HttpService:JSONDecode(readfile(file))
		end
		
	end  
end)()


function GhostLib.Functions:AddKeybind(tab, page)
	coroutine.wrap(function()
		repeat game:GetService("RunService").Heartbeat:Wait() until GhostLib.Started == true
		local Key = tab.Key or Enum.KeyCode.Unknown

		local CallBack = tab.CallBack
		local text = tab.Text or ""
	
		if GhostLib.Settings[text] then
			Key = GhostLib.Settings[text]
		end
		local Nk = KeyBind:Clone()
		Nk.Parent = page.Frame
		Nk.Box.Text = Key.Name
		Nk.Text2.Text = text
		local al = false
		Nk.MouseButton1Down:Connect(function()
			local conn1
			GhostLib.Functions:Rgb(Nk)
			conn1 = uis.InputBegan:Connect(function(i,p)
				if not p then
					if i.KeyCode ~= Enum.KeyCode.Unknown and al == false then
						al = true
						Key = i.KeyCode
						Nk.Box.Text = Key.Name
						GhostLib.Functions:RemoveRgb(Nk)
						conn1:Disconnect()
						local json
						GhostLib.Settings[text] = Key
						json = HttpService:JSONEncode(GhostLib.Settings)
						writefile(file, json)
						print("writefile")
						wait(0.5)
						al = false
					end
					
				end
			end)
			
		end)
		
		uis.InputBegan:Connect(function(i,p)
			if not p then
				if i.KeyCode == Key and al == false and GhostLib.Started == true then
					pcall(CallBack)
				end
			end
		end)
		local stroke = uiStroke(Nk)
		stroke.Thickness = 1.2
		stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		stroke.Transparency = 1
		stroke.Enabled = true
		rgbp(stroke, "Color")
		Nk.MouseEnter:Connect(function()
			ts:Create(stroke, TweenInfo.new(0.3), {Transparency = 0}):Play()
		end)
		Nk.MouseLeave:Connect(function()
			ts:Create(stroke, TweenInfo.new(0.3), {Transparency = 1}):Play()
		end)
	end)()

end
function GhostLib.Functions:AddPage(tab)
	
	local Name = tab.Name
	local Image = tab.Image
	
	local Button = PageButton:Clone()
	local Page = Page:Clone()
	
	local Separator1 = Instance.new("Frame")
	Separator1.Parent = Page
	Separator1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Separator1.BackgroundTransparency = 1.000
	Separator1.Position = UDim2.new(0.118320614, 0, 0, 0)
	Separator1.Size = UDim2.new(0, 100, 0, 5)
	
	local stroke = uiStroke(Button)
	stroke.Thickness = 1.5
	stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	stroke.Transparency = 1
	stroke.Enabled = true
	rgbp(stroke, "Color")
	
	local args = {
		Frame = Page,
		Button = Button
	}
	
	Button.Parent = PageChange
	Button:FindFirstChild("ImageLabel").Image = tab.Image
	Button:FindFirstChild("TextLabel").Text = tab.Name
	
	
	Page.Parent = nil
	
	Button.MouseButton1Down:Connect(function()
		GhostLib.Functions:DisplayPage(args)
		
	end)
	
	Button.MouseEnter:Connect(function()
		ts:Create(stroke, TweenInfo.new(0.3), {Transparency = 0}):Play()
	end)
	Button.MouseLeave:Connect(function()
		ts:Create(stroke, TweenInfo.new(0.3), {Transparency = 1}):Play()
	end)
	table.insert(GhostLib.Pages, args)
	
	
	return args
end





function GhostLib.Functions:AddLabel(tab, page)
	local Text = tab.Text
	local Color = tab.Color or Color3.fromRGB(255, 255, 255)
	local label = Label:Clone()
	label.Text = Text
	label.TextColor3 = Color
	label.Parent = page.Frame
end
function GhostLib.Functions:AddTitle(tab, page)
	local Text = tab.Text
	local Color = tab.Color or Color3.fromRGB(241, 241, 241)
	local label = Title:Clone()
	label.Text = Text
	label.TextColor3 = Color 
	label.Parent = page.Frame
end
function GhostLib.Functions:AddSection(tab, page)
	local Text = tab.Text
	local Color = tab.Color or Color3.fromRGB(191, 191, 191)
	local label = Section:Clone()
	label.Text = Text
	label.TextColor3 = Color 
	label.Parent = page.Frame
end

local cmdPage = GhostLib.Functions:AddPage({
	Name = "Commands",
	Image = "http://www.roblox.com/asset/?id=12338394619"
})

GhostLib.Functions:AddKeybind({
	Key = Enum.KeyCode.LeftControl,
	Text = "Open CMD",
	CallBack = function()
		if GhostLib.States.CommandBarVisible == true then
			GhostLib.Functions:CloseCommandBar()
		elseif GhostLib.States.CommandBarVisible == false then
			GhostLib.Functions:OpenCommandBar()
		end
	end,
},cmdPage)

GhostLib.Functions:AddKeybind({
	Key = Enum.KeyCode.P,
	Text = "Open/Close output",
	CallBack = function()
		Output.Visible = not Output.Visible
		if Output.Visible == true then
			GhostLib.Functions:MakeNotification("Output enabled", colors.Green)
		end
		
	end,
},cmdPage)
GhostLib.Functions:AddKeybind({
	Key = Enum.KeyCode.K,
	Text = "Open menu",
	CallBack = function()
		Menu.Visible = not Menu.Visible
	end,
},cmdPage)

local Commands = {}
function GhostLib.Functions:ChangePrefix(str)
	if tostring(str) then
		prefix = str
	end
end

GhostLib.Functions:AddTitle({
	Text = "Commands",
	Color = Color3.fromRGB(255, 255, 255)
}, cmdPage)
GhostLib.States.ASCP = nil
local Box2
local Box

local function msg(msg)
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack({
        [1] = msg,
        [2] = "All"
    }))
end


local function oneString(arguments1)
	local text1 = ""
	local num = 0
	for i = 1,#arguments1 do
		if i > 1 then
			text1 = text1.." "..arguments1[i]
		else
			text1 = text1..arguments1[i]
		end
	end

	return text1
end


local cmdNames = {}

local cmdNumber = 0
function GhostLib.Functions:AddCommand(tab)
	local Names = tab.Names
	local Funct = tab.Funct
	local Descr = tab.Description
	
	local function names(args)
		local r = ""
		for i = 1,#args do
			if i > 1 then
				r = r.."/"..tostring(args[i])
			elseif i == 1 then
				r = r..tostring(args[i])
			end
		end
		return r
	end
	
	local function descr(args)
		local r = ""
		if args[1] ~= "" then
			for i = 1,#args do
				if i > 1 then
					r = r.." ["..tostring(args[i]).."]"
				elseif i == 1 then
					r = r.."["..tostring(args[i]).."]"
				end
			end
			
		end
		return r
		
	end
	cmdNumber = cmdNumber+1
	GhostLib.Functions:AddLabel({
		Text = "["..cmdNumber.."]: "..names(Names).." "..descr(Descr),
	}, cmdPage)
	
	for _,name in pairs(Names) do
		table.insert(cmdNames, name)
	end
	
	table.insert(Commands, {Name = Names, Args = Descr, Function = Funct})
end
local function getcmdfunction(str)
	local found = nil
	for i,command in pairs(Commands) do
		for index,name in pairs(command.Name) do
			if name == str then
				found = command.Function
				return command.Function
			end
		end
	end
	return found
end

function GhostLib.Functions:Execute_command(tab)
	task.spawn(function()
        if GhostLib.Started == true then
            local str = tab.str
            local method = tab.method or "bar"
    
            local args = {}
            local pattern = "%S+"
    
            for word in string.gmatch(str:lower(), pattern) do
                table.insert(args, word)
            end
            for i,arg in pairs(args) do
                if arg == "/e" then
                    table.remove(args, i)
                elseif arg == "/w" then
                    table.remove(args, i)
                    table.remove(args, i)
                end
            end
            local foundPrefix = false
            local CommandsFound = {}
            local CommandsTab = {}
    
            for index,arg in pairs(args) do
                if string.sub(arg, 0,#prefix) == prefix then
                    arg = string.sub(arg,(#prefix+1),#arg)
                    args[index] = arg
                    foundPrefix = true
    
                    table.insert(CommandsFound, arg)
                elseif table.find(cmdNames, arg) and method == "bar" and index == 1 then
                    foundPrefix = true
    
                    table.insert(CommandsFound, arg)
                end
            end
    
            if method == "chatted" and foundPrefix == false then
                return nil
            end
            local Finished = 0
            for index,arg in pairs(args) do
                if table.find(CommandsFound,arg) then
                    Finished = Finished + 1
                    table.insert(CommandsTab, {arg})
                elseif CommandsTab[Finished] then
                    table.insert(CommandsTab[Finished], arg)
                end
            end
            local executed = 0
            for i,cmd in pairs(CommandsTab) do
                if typeof(cmd) == "table" then
                    local func = getcmdfunction(cmd[1])
                    if func then
                        executed = executed+1
                        local sucess, err = pcall(func, cmd)
                        --if err then print(err) end
                    end
                end
    
    
            end
            if executed == 0 then
                GhostLib.Functions:MakeNotification("No command found.", colors.Red)
            end
        end
    end)
end


local debounce = false

lp.Chatted:connect(function(msg)
    if debounce == false then
        debounce = true
        GhostLib.Functions:Execute_command({str = msg, method = "chatted"})
    else
        debounce = false
    end
	
end)

GhostLib.Functions:AddCommand({Names = {"changeprefix", "prefix", "pfx"}, Description = {"string"}, Funct = function(args)
	if args[2] and tostring(args[2]) then
		GhostLib.Functions:ChangePrefix(args[2])
	end
end})

GhostLib.Functions:AddCommand({Names = {"rj", "rejoin"}, Description = {"string"}, Funct = function(args)
	game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
end})

local PlayerLogs = GhostLib.Functions:AddPage({
	Name = "Player Logs",
	Image = "http://www.roblox.com/asset/?id=11176073563"
})
GhostLib.Functions:AddTitle({
	Text = "Players",
	Color = Color3.fromRGB(255, 255, 255)
}, PlayerLogs)

GhostLib.PlayerM.OnPlayerFirstJoin:Connect(function(player, stay)
    if stay == false then
        GhostLib.Functions:MakeNotification(GhostLib.PlayerM:GetName(player).." joined", colors.Green)
    end
    GhostLib.Functions:AddLabel({
		Text = GhostLib.PlayerM:GetName(player),
	}, PlayerLogs)
end)

GhostLib.Functions:DisplayPage(GhostLib.Pages[1])

CommandBox.FocusLost:Connect(function(enter)
	if enter then
		GhostLib.Functions:Execute_command({str = CommandBox.Text, method = "bar"})
		CommandBox.Text = ""
	end
	
	GhostLib.Functions:CloseCommandBar()
end)

function GhostLib.Functions:SetScriptName(Str)
	ScriptTitle.Text = Str or "GHXST ADMIN"
end
local function removeguion(string1)
	local str = string1
	local newStr, replaced = string.gsub(str, "_", " ")
	return newStr
end

local function mayusfirst(str)
	local string1 = string.lower(str)
	return removeguion((string1:gsub("^%l", string.upper)))
end
function GhostLib.States:SetState(state, arg)
	if not state then return end
	local stateusing = string.upper(state)

		if arg == "on" then
			if GhostLib.States[stateusing] == true then
				GhostLib.Functions:MakeNotification(mayusfirst(stateusing)..": already enabled", colors.Red, "error")
				return false
			else
				GhostLib.States[stateusing] = true
				GhostLib.Functions:MakeNotification(mayusfirst(stateusing)..": enabled", colors.Green)
				return true
			end
		else
			if arg == "off" then
				if GhostLib.States[stateusing] == false then
					GhostLib.Functions:MakeNotification(mayusfirst(stateusing)..": already disabled", colors.Red, "error")
					return false
				else
					GhostLib.Functions:MakeNotification(mayusfirst(stateusing)..": disabled", colors.Green)
					GhostLib.States[stateusing] = false
					return true
				end
			else
				if not arg then
					if GhostLib.States[stateusing] == false or GhostLib.States[stateusing] == nil or not GhostLib.States[stateusing] then
						GhostLib.States[stateusing] = true
						GhostLib.Functions:MakeNotification(mayusfirst(stateusing)..": enabled", colors.Green)
						return true
					else
						if GhostLib.States[stateusing] == true then
							GhostLib.Functions:MakeNotification(mayusfirst(stateusing)..": disabled", colors.Green)
							GhostLib.States[stateusing] = false
							return true
						end
					end
				end
			end
		end
end

GhostLib.PlayerM.OnPlayerRejoin:Connect(function(player)
    GhostLib.Functions:MakeNotification(GhostLib.PlayerM:GetName(player).." re-joined.", Color3.fromRGB(167, 252, 188))
end)

GhostLib.PlayerM.OnPlayerLeft:Connect(function(player)
    GhostLib.Functions:MakeNotification(GhostLib.PlayerM:GetName(player).." left.", colors.Red)
end)

coroutine.wrap(function()
	repeat wait()
		
	until GhostLib.Started == true
	Menu.Visible = true
end)()


GhostLib.PlayerM:Start()
return GhostLib
