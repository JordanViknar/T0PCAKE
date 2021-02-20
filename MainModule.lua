return function(player,themesyncing,wowamp,CAKEPlayerAutoLoad,ScrollbarAlwaysOn,T0PK3KFixPatches)
	local RunService = game:GetService("RunService")
	
	
	
	
	
	
	
	--[[Note : DUE TO A MISTAKE, SECONDARY AND TERTIARY COLORS ARE ACCIDENTALLY INVERSED.
	TO PREVENT REDOING THE WHOLE THEME ON ALL TABS, ILL KEEP THE MISTAKE, BUT PLEASE BE CAREFUL.]]
	
	
	
	
	
	
	
	--DO NOT FORGET'
	script.Version.Value = "v1.3.1"
	
	
	
	
	
	
	
	
	
	--------------------------------------CHECKS-------------------------------
	if game.Players:FindFirstChild(player) ~= nil then
		--print("User found !")
		player = game.Players:FindFirstChild(player)
		GuiFolder = player.PlayerGui
		if GuiFolder:FindFirstChild("5.0") ~= nil and GuiFolder:FindFirstChild("Client") ~= nil then
			--print("T0PK3K 5.0 has been found !")
			if GuiFolder["5.0"]:FindFirstChild("TOPCAKEisPresent") ~= nil then
				--warn("T0PCAKE is already enabled ! Aborting...")
				return nil
			else
				--print("T0PCAKE not found !")
			end
		else
			--warn("T0PK3K 5.0 not found, aborting...")
			return nil
		end
	else
		--warn("User not found, aborting...")
		return nil
	end
	
	
	
	
	
	
	
	
	
	
	
	
	print("The checks succeeded. Enjoy T0PCAKE !")
	
	
	
	
	
	
	
	
	
	
	
	
	
	-----------------------------------T0PCAKE Main UI----------------------------
	
	--T0PK3K Hooks
	local T0PK3K_UI = GuiFolder["5.0"].Final
	local T0PCAKE_Workplace = T0PK3K_UI.Main.Holder.Destruction.Container
	local T0PCAKE_Button = T0PK3K_UI.Main.Navigation.Destruction
	
	--User interface modifications
	local T0PCAKE_User = script.MainUI:Clone()
	T0PCAKE_User.Version.Text = script.Version.Value
	T0PCAKE_User.Version.TextScaled = true
	
	--RANDOM QUOTE SYSTEM
	local quotes = {"Ironically, this was NOT a piece of cake to code.", 
		"This cake is not a lie !",
		"''Excellent ! Go !'' - Wario, 2020",
		"Powering cake and server-sides !",
		"What are your orders, chief ?", 
		"It's actually T0PCAKE, not TOPCAKE. Oops ?", 
		"Never gonna give you up ! Never gonna let you down !", 
		"So, we have Tom Nook's Neck Breaker, when are we getting Resetti's Nut Destroyer ?",
		"Has Matrix released yet ?",
		"WHO'S THE BOSS NOW ?!",
		"SHOW THEM WHO'S THE BOSS !!",
		"What is an insane anime girl doing in my scripts ?",
		"FREE RUBOX",
		"By Woweeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeees",
		"What is this sadistic smile on your face ?",
		"Even this has Discord integration, can you believe it ?",
		"Did Liam get scammed again ?",
		"Try our sister extension, CUPK3K !",
		"This thing can do remote execution now ? EPIIIIC !",
		"Can you do the thing where people go AAAAAAAAAAAAA, it's hilarious !";
		"Cake can now be delivered from Discord, instead of getting it yourself, how nice.",
		"Congratulations liam for breaking T0PK3K a bit.",
		"Feels good being the President of T0PK3K.",
		"Congrats on buying T0PK3K ! 25$ well spent !"}
	T0PCAKE_User.Quote.Text = quotes[math.random(1, #quotes)]
	
	--Announcement Override
	local announcement = ""
	if announcement ~= nil and announcement ~= "" then
		T0PCAKE_User.Quote.Text = announcement
	end
	
	--Prevent script from running more than necessary
	local lock = Instance.new("BoolValue")
	lock.Name = "TOPCAKEisPresent"
	lock.Value = true
	lock.Parent = T0PK3K_UI.Parent
	
	--LocalPlayer Hooker
	local playerValue = Instance.new("ObjectValue")
	playerValue.Name = "LocalPlayer"
	playerValue.Value = T0PK3K_UI.Parent.Parent.Parent
	playerValue.Parent = T0PCAKE_User
	
	
	
	
	
	
	
	
	------------FUNCTION USED FOR EASY T0PK3K GUI HOOKING, NOT USABLE ON THE MAINUI
	local function InsertT0PCAKEGui(GUItoInsertName,GUItoHook,ButtonName)
		local Button = T0PK3K_UI.Main.Navigation[GUItoInsertName]

		--Replaces the button
		Button.TextLabel.Text = ButtonName
		Button.TextLabel.TextColor3 = Color3.new(1, 1, 0)

		--Converts the GUI to be compatible with the T0PCAKE UI format
		T0PK3K_UI.Main.Holder[GUItoInsertName].Container:Destroy()
		local Button_ClientContainer = T0PCAKE_User.Parent:Clone()
		Button_ClientContainer:ClearAllChildren()
		--Sends it to the right place.
		Button_ClientContainer.Parent = T0PK3K_UI.Main.Holder[GUItoInsertName]

		--Sends the GUI to T0PK3K
		local GUI_User = GUItoHook:Clone()
		GUI_User.Parent = Button_ClientContainer
		
		--Returns the GUI
		return GUI_User
	end
	
	
	
	
	
	
	
	
	
	
	------------------MODIFICATIONS-------------------------------
	--Replaces the button
	T0PCAKE_Button.TextLabel.Text = "T0PCAKE"
	T0PCAKE_Button.TextLabel.TextColor3 = Color3.new(1, 1 ,0)
	
	
	--Modifies the text on top of TOPK3K
	local Label = T0PCAKE_User.T0PCAKELabel
	Label.Parent = T0PK3K_UI.Label.TKLabel
	Label.Parent.ClipsDescendants = false
	Label.Visible = true
	Label:TweenPosition(UDim2.new(Label.Position.X.Scale, Label.Position.X.Offset, 0, Label.Position.Y.Offset), Enum.EasingDirection.Out, Enum.EasingStyle.Quad)
	
	
	--Adds a new sweet credits in the Home
	local T0PCAKE_HomeText = script.T0PCAKE_Renaming:Clone()
	T0PCAKE_HomeText.Text = "T0PCAKE ("..script.Version.Value..") by Woweeeeeees"
	T0PCAKE_HomeText.Parent = T0PK3K_UI.Main.Holder.Home.Container
	
	--Adds a good new interface
	T0PCAKE_Workplace.Frame:Destroy()
	T0PCAKE_User.Parent = T0PCAKE_Workplace
	
	--Code to sync themes from T0PK3K with T0PCAKE
	local PrimaryColor = T0PK3K_UI.Main.Holder.Executor.Container.TextButton.BackgroundColor3
	local SecondaryColor = T0PK3K_UI.Main.BackgroundColor3
	local TertiaryColor = T0PK3K_UI.Main.Navigation.BackgroundColor3
	local TextColor = T0PK3K_UI.Main.Navigation.Home.TextColor3
	
	T0PCAKE_HomeText.BackgroundColor3 = TertiaryColor
	--Shadow effects behind buttons
	function ShadowEffect(UIElement)
		local Shadowness = 0.4
		local ShadowFrame = Instance.new("Frame")
		ShadowFrame.BorderSizePixel = 0
		ShadowFrame.Name = "Shadow"
		ShadowFrame.Parent = UIElement
		ShadowFrame.ZIndex = UIElement.ZIndex - 1
		ShadowFrame.BackgroundColor3 = Color3.new(ShadowFrame.Parent.BackgroundColor3.R*Shadowness,ShadowFrame.Parent.BackgroundColor3.G*Shadowness,ShadowFrame.Parent.BackgroundColor3.B*Shadowness)
		ShadowFrame.Position = UDim2.new(0,1,0,1)
		ShadowFrame.Size = UDim2.new(1,0,1,0)
	end
	
	if themesyncing == true or themesyncing == nil then
		--warn("Theme syncing has been activated. T0PCAKE now has your personal favorite flavor !")	
		T0PCAKE_User.BackgroundColor3 = TertiaryColor
		T0PCAKE_User.ScriptList.BackgroundColor3 = SecondaryColor
		T0PCAKE_User.ScriptList.BackgroundTransparency = 0
		T0PCAKE_User.BackgroundTransparency = 0
		T0PCAKE_User.CakeBackground.ZIndex = 16
		Label.TextColor3 = TextColor
		
		ButtonWhitener = 1.6
		
		function ButtonThemeSyncing(a)
			local b = a:GetChildren()
			if a.Parent.Parent.Parent.Name == "ScriptList" and a:IsA("TextButton") then
				a.TextColor3 = TextColor
				a.BorderSizePixel = 0
				if a:FindFirstChild("DestructiveLock") == nil then
					a.BackgroundColor3 = PrimaryColor
					if a:FindFirstChild("GoldenButton") ~= nil then
						a.BackgroundColor3 = Color3.new(PrimaryColor.R*ButtonWhitener,PrimaryColor.G*ButtonWhitener,PrimaryColor.B*ButtonWhitener)
					end
					ShadowEffect(a)
				end
			end
			for i=1,#b do
				ButtonThemeSyncing(b[i])
			end
		end
		ButtonThemeSyncing(T0PCAKE_User.ScriptList)
	end
	
	
	
	--Destructive Scripts Disabler
	local function DestructiveScriptsDisabler(a)
		if a.Parent.Parent.Parent.Name == "ScriptList" and a:IsA("TextButton") then
			if a:FindFirstChild("DestructiveLock") ~= nil then
				a.Visible = false
				a.Selectable = false
				a.BackgroundColor3 = Color3.fromRGB(255, 33, 33)
			end
		end
		local b = a:GetChildren()
		for i=1,#b do
			DestructiveScriptsDisabler(b[i])
		end
	end
	DestructiveScriptsDisabler(T0PCAKE_User.ScriptList)
	
	--Enabler for Destructive Scripts
	T0PCAKE_User.ScriptList.UnlockHarmfulScripts.MouseButton1Down:Connect(function()
		--Looks in the script list for script buttons to reenable
		function DestructiveScriptsEnabler(a)
			if a.Parent.Parent.Parent.Name == "ScriptList" and a:IsA("TextButton") then
				if a:FindFirstChild("DestructiveLock") ~= nil then
					--Reenables those scripts
					a.Visible = true
					a.Selectable = true
					
					if themesyncing == true or themesyncing == nil then
						ShadowEffect(a)
					end
				end
			end
			local b = a:GetChildren()
			for i=1,#b do
				DestructiveScriptsEnabler(b[i])
			end
		end
		DestructiveScriptsEnabler(T0PCAKE_User.ScriptList)
		
		--Disables the now useless button
		T0PCAKE_User.ScriptList.UnlockHarmfulScripts.Text = "Dangerous Scripts Enabled"
		T0PCAKE_User.ScriptList.UnlockHarmfulScripts.Selectable = false
		T0PCAKE_User.ScriptList.UnlockHarmfulScripts.Active = false
		--if themesyncing == true or themesyncing == nil then
			--T0PCAKE_User.ScriptList.UnlockHarmfulScripts.BackgroundColor3 = PrimaryColor
		--else
		T0PCAKE_User.ScriptList.UnlockHarmfulScripts.BackgroundColor3 = Color3.fromRGB(255, 141, 1)
		--end
	end)
	
	
	
	
	
	
	
	
	
	
	
	
	------------------------------------R6 Button---------------------------------------------
	local R6Button = T0PCAKE_User.R6Button
	R6Button.Parent = T0PK3K_UI.Topbar
	R6Button:TweenPosition(UDim2.new(R6Button.Position.X.Scale, R6Button.Position.X.Offset, 0.1, R6Button.Position.Y.Offset), Enum.EasingDirection.Out, Enum.EasingStyle.Quad)
	R6Button.MouseButton1Down:Connect(function()
		require(4470488335).load(player.Name)
		
		--Checks for the Ghost NoName Script, as this breaks it, so I need to fix a bit
		if game.StarterPlayer.StarterPlayerScripts:FindFirstChild(player.Name.."OnlyNameHider") ~= nil then
			--The Ghost NoName script has been found. Fixes it.
			wait(2)
			player.Character.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
		end
	end)
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	----------------------------------CAKEPlayer (Previously Wowamp)------------------------------
	MarketPlaceService = game:GetService("MarketplaceService")
	
	
	local Wowamp_User
	local MusicContainer
	
	if wowamp == true or wowamp == nil then --Change that once Wowamp is done
		print("Loading CAKEPlayer...")
		
		-------------------------T0PK3K GUI INSERTER------------------------
		
		--[[This is the old method of connecting CAKEPlayer
		--Hooking
		local T0PCAKE_Button = T0PK3K_UI.Main.Navigation.Music

		--Replaces the button
		T0PCAKE_Button.TextLabel.Text = "CAKEPlayer"
		T0PCAKE_Button.TextLabel.TextColor3 = Color3.new(1, 1, 0)

		--Converts the Music GUI to be compatible with the T0PCAKE UI format
		T0PK3K_UI.Main.Holder.Music.Container:Destroy()
		local WowampContainer = T0PCAKE_User.Parent:Clone()
		WowampContainer:ClearAllChildren()
		--Sends it to the right place.
		WowampContainer.Parent = T0PK3K_UI.Main.Holder.Music

		--Sends the GUI to T0PK3K
		Wowamp_User = script.Wowamp:Clone()
		Wowamp_User.Parent = WowampContainer
		--]]
		
		Wowamp_User = InsertT0PCAKEGui("Music",script.Wowamp,"CAKEPlayer")
		
		--Simply enables a feature in the soundservice to make sound better.
		game.SoundService.AmbientReverb = Enum.ReverbType.Room
		
		--Enables the local script
		Wowamp_User.LocalMusicManager.Disabled = false
		
		
		local LoadOverlay = Wowamp_User.LoadOverlay
		local IDCustomContainer = LoadOverlay.CustomLoaderHolder
		local WowampUI = Wowamp_User.WowampUI
		local MusicInfoContainer = WowampUI.MusicInfoContainer
		local IsServerMode = Wowamp_User.IsServerMode
		
		if MusicContainer == nil then
			MusicContainer = Wowamp_User.MusicContainer
			
			--Prepares the MusicContainer
			MusicContainer.Name = player.UserId.."CAKEPlayerMusic"
			
			--Prepares its folder
			local Folder = Instance.new("Model",workspace)
			Folder.Name = "ScriptStorage"
			
			MusicContainer.Parent = Folder
		end
		
		local FeatureBar = MusicInfoContainer.FeatureBar
		
		local LocalMusicManager = Wowamp_User.LocalMusicManager
		local ClientMusicEvent = LocalMusicManager.ClientMusicEvent
		
		local LeftBarGradient = WowampUI.Topbar.LeftLine.UIGradient
		local RightBarGradient = WowampUI.Topbar.RightLine.UIGradient
		
		
		local SoundIndicator = Wowamp_User.WowampIndicator
		SoundIndicator.Parent = T0PK3K_UI.Topbar
		SoundIndicator.ImageColor3 = MusicInfoContainer.LocalSideButton.LowerLedEffect.BackgroundColor3
		
		--Prepares the LocalScript
		LocalMusicManager.MusicToHandle.Value = MusicContainer
		LocalMusicManager.Disabled = false
		
		local NumberOfSongs = 0
		
		DefaultCover = 93339729
		
		--Time Position (Bar)
		local TimePosition = MusicInfoContainer.TimePosition
		local TimeBar = TimePosition.TimeBar
		local TimeCompletion = TimeBar.TimeCompletion
		
		--Function to add songs
		local function AddSong(MusicID,Name,CoverID,PlaybackSpeed)
			local TitleSize = 17
			
			local SongInfoContainer = Instance.new("TextButton")
			SongInfoContainer.Size = UDim2.new(1,0,0,TitleSize)
			SongInfoContainer.Position = UDim2.new(0,0,0,NumberOfSongs*TitleSize)
			SongInfoContainer.Text = ""
			SongInfoContainer.BorderSizePixel = 1
			SongInfoContainer.BorderMode = Enum.BorderMode.Inset
			
			local SongTitle = Instance.new("TextLabel")
			SongTitle.Name = "MusicLabel"
			SongTitle.Active = true
			SongTitle.Size = UDim2.new(0.85,0,1,0)
			SongTitle.Text = Name
			SongTitle.TextColor3 = Color3.new(1,1,1)
			SongTitle.Font = Enum.Font.Ubuntu
			SongTitle.TextSize = 10
			SongTitle.TextWrapped = true
			SongTitle.BackgroundTransparency = 1
			
			--Stores the music
			local MusicStorage = Instance.new("Sound")
			MusicStorage.Name = "Music"
			MusicStorage.SoundId = "rbxassetid://"..MusicID
			MusicStorage.PlaybackSpeed = PlaybackSpeed
			MusicStorage.Parent = SongInfoContainer
			
			--Stores the cover
			local CoverStorage = Instance.new("Decal")
			CoverStorage.Name = "Cover"
			CoverStorage.Texture = "http://www.roblox.com/asset/?id="..CoverID
			CoverStorage.Parent = SongInfoContainer
			
			--Song TimeLength Detection
			local SongLength = Instance.new("TextLabel")
			SongLength.Name = "LengthLabel"
			SongLength.Text = ""
			SongLength.Active = true
			SongLength.Size = UDim2.new(0.15,0,1,0)
			SongLength.Position = UDim2.new(0.85,0,0,0)
			SongLength.TextSize = 10
			SongLength.TextColor3 = Color3.new(1,1,1)
			SongLength.Font = Enum.Font.Ubuntu
			SongInfoContainer.BorderSizePixel = 1
			SongInfoContainer.BorderMode = Enum.BorderMode.Inset
			
			--Theme syncing
			if themesyncing == true or themesyncing == nil then
				SongInfoContainer.BackgroundColor3 = PrimaryColor
				SongLength.BackgroundColor3 = PrimaryColor
				SongLength.TextColor3 = TextColor
				SongTitle.TextColor3 = TextColor
			end
			
			--Shows the length of the song once it has loaded
			local SongLengthLoader = coroutine.create(function(LengthContainer,MusicFile)
				MusicFile.Loaded:Wait()
				LengthContainer.Text = TimePositionToMinutes(MusicFile.TimeLength)
			end)
			coroutine.resume(SongLengthLoader,SongLength,MusicStorage)
			
			--Shows the buttons
			SongInfoContainer.ZIndex = 17
			SongTitle.ZIndex = 18
			SongLength.ZIndex = 19
			SongTitle.Parent = SongInfoContainer
			SongLength.Parent = SongInfoContainer
			SongInfoContainer.Parent = WowampUI.MusicList
			
			--Attaches a function to modify the player according to the song the user clicked on.
			SongInfoContainer.MouseButton1Down:Connect(function()
				MusicContainer:Stop()
				MusicContainer.SoundId = MusicStorage.SoundId
				MusicContainer.PlaybackSpeed = MusicStorage.PlaybackSpeed
				MusicInfoContainer.SongTitle.Text = SongTitle.Text
				MusicInfoContainer.SongAuthor.Text = "Uploaded by "..MarketPlaceService:GetProductInfo(MusicID).Creator.Name
				MusicInfoContainer.CoverShower.Image = CoverStorage.Texture
				MusicContainer:Play()
			end)
			
			--Sets properly the NumberOfSongs in the Song list
			NumberOfSongs = NumberOfSongs + 1
			
			--Extends the canvas
			WowampUI.MusicList.CanvasSize = UDim2.new(0,0,0,NumberOfSongs*TitleSize)
		end
		
		--Load settings from a require
		local function LoadWowampSettings(ID)
			local WowampSettings = require(ID)
			local MusicList = WowampSettings.MusicListCaller()
			
			--Sets every value required, then calls the song adder
			for index, value in ipairs(MusicList) do
				local NameToAdd = nil
				local CoverToAdd = nil
				local SpeedToAdd = nil
				
				--Gathers MusicID
				local MusicToAdd = (value[1])
				
				--Gathers Custom Name
				if value[2] == nil then
					NameToAdd = MarketPlaceService:GetProductInfo(MusicToAdd).Name
				else
					NameToAdd = (value[2])
				end
				
				--Gathers CoverID
				if value[3] == nil then
					CoverToAdd = DefaultCover --Default Wowamp Logo
				else
					CoverToAdd = (value[3])
				end
				
				--Gathers PlayBackSpeed
				if value[4] == nil then
					SpeedToAdd = 1
				else
					SpeedToAdd = (value[4])
				end
				
				--print("Adding ",NameToAdd," with ID ",MusicToAdd," with Cover ",CoverToAdd," with PlaybackSpeed ",SpeedToAdd)
				AddSong(MusicToAdd,NameToAdd,CoverToAdd,SpeedToAdd)
			end
			
			LoadOverlay.Visible = false
		end
		
		--Converts the TimePosition values to Minutes and Seconds
		function TimePositionToMinutes(TimePos)
			local Minutes = 0
			local Seconds = 0
			local MinutesWriting = 0
			
			if TimePos > 59 then
				Minutes = math.floor(TimePos/60)
				Seconds = math.floor(TimePos - (Minutes*60))
			else
				Minutes = 0
				Seconds = math.floor(TimePos)
			end
			
			if Seconds < 10 then
				MinutesWriting = Minutes..":0"..Seconds
			else
				MinutesWriting = Minutes..":"..Seconds
			end
			
			return MinutesWriting
		end
		
		--Syncs the GUI with the Music
		local function MusicGUISync()
			wait(0.1)
			SoundIndicator.Visible = true
			TimePosition.MusicEndTime.Text = TimePositionToMinutes(MusicContainer.TimeLength)
			
			TimeCompletion.Size = UDim2.new(MusicContainer.TimePosition/MusicContainer.TimeLength,0,1,0)
			TimePosition.MusicTime.Text = TimePositionToMinutes(MusicContainer.TimePosition)
			
			while MusicContainer.Playing == true do
				wait(0.1)
				TimeCompletion.Size = UDim2.new(MusicContainer.TimePosition/MusicContainer.TimeLength,0,1,0)
				TimePosition.MusicTime.Text = TimePositionToMinutes(MusicContainer.TimePosition)
				
				LeftBarGradient.Rotation = LeftBarGradient.Rotation + 3
				RightBarGradient.Rotation = RightBarGradient.Rotation - 3
				
				if LeftBarGradient.Rotation >= 360 and RightBarGradient.Rotation <= -360 then
					LeftBarGradient.Rotation = 0
					RightBarGradient.Rotation = 0
				end
			end
			
			LeftBarGradient.Rotation = 0
			RightBarGradient.Rotation = 0
			
			SoundIndicator.Visible = false
		end
		
		
		
		------------Settings Loader-------------
		--If a custom require is launched with T0PCAKE
		if CAKEPlayerAutoLoad ~= nil then
			LoadOverlay.CustomLoaderHolder.RequireLoad:FireClient(player,CAKEPlayerAutoLoad)
		end
		
		--Custom require is choosen
		LoadOverlay.CustomButtonLoader.MouseButton1Down:Connect(function()
			LoadWowampSettings(tonumber(LoadOverlay.CustomLoaderHolder.Text))
		end)
		
		--If no custom requires are choosen
		LoadOverlay.DefaultLoaderButton.MouseButton1Down:Connect(function()
			LoadWowampSettings(Wowamp_User.CakePlayerDefaultSettings)
		end)
		
		--If the T0PK3K require is choosen are choosen
		LoadOverlay.T0PK3KLoaderButton.MouseButton1Down:Connect(function()
			LoadWowampSettings(Wowamp_User.T0PK3KDefaultSettings)
		end)
		
		--For those who want to load more than one playlist
		WowampUI.LoaderMenu.MouseButton1Down:Connect(function()
			LoadOverlay.Visible = true
		end)
		
		--For those who DONT want to load a playlist
		LoadOverlay.NoPlaylistButton.MouseButton1Down:Connect(function()
			LoadOverlay.Visible = false
		end)
		
		
		--Music Adder
		WowampUI.AddButton.MouseButton1Down:Connect(function()
			local MusicID = WowampUI.MusicIDBox.Text
			AddSong(MusicID,MarketPlaceService:GetProductInfo(MusicID).Name,DefaultCover,1)
			WowampUI.MusicIDBox.Text = ""
			wait(1)
			WowampUI.MusicIDBox.Text = "Insert Music ID Here"
		end)
		
		
		
		
		
		
		
		-------------------VOLUME----------------------------
		if VolumeKeeper == nil then
			VolumeKeeper = 1
		end
		local VolumeScroll = 0.25
		
		local VolumeEvent = LocalMusicManager.VolumeChanger
		
		local VolumePlusButton = MusicInfoContainer.VolumePlusButton
		local VolumeMinusButton = MusicInfoContainer.VolumeMinusButton
		
		
		VolumePlusButton.MouseButton1Down:Connect(function()
			if IsServerMode.Value == true then
				MusicContainer.Volume = MusicContainer.Volume + VolumeScroll
				VolumeKeeper = VolumeKeeper + VolumeScroll
			else
				VolumeKeeper = VolumeKeeper + VolumeScroll
				VolumeEvent:FireClient(player,VolumeKeeper)
			end
		end)
		VolumeMinusButton.MouseButton1Down:Connect(function()
			if IsServerMode.Value == true then
				MusicContainer.Volume = MusicContainer.Volume - VolumeScroll
				VolumeKeeper = VolumeKeeper - VolumeScroll
			else
				VolumeKeeper = VolumeKeeper - VolumeScroll
				VolumeEvent:FireClient(player,VolumeKeeper)
			end
		end)
		
		
		
		
		
		
		
		----------Server/Client Buttons----------
		MusicInfoContainer.LocalSideButton.MouseButton1Down:Connect(function()
			if IsServerMode.Value == true then
				IsServerMode.Value = false
				MusicInfoContainer.ServerSideButton.LowerLedEffect.Visible = false
				MusicInfoContainer.LocalSideButton.LowerLedEffect.Visible = true
				SoundIndicator.ImageColor3 = MusicInfoContainer.LocalSideButton.LowerLedEffect.BackgroundColor3
				
				MusicContainer.Volume = 0
				ClientMusicEvent:FireClient(player,VolumeKeeper)
			end
		end)
		--CAKEPlayer starts on Client mode, so it's logical an event fires it upon startup
		if IsServerMode.Value == false then
			ClientMusicEvent:FireClient(player,VolumeKeeper)
		end
		
		MusicInfoContainer.ServerSideButton.MouseButton1Down:Connect(function()
			if IsServerMode.Value == false then
				IsServerMode.Value = true
				MusicInfoContainer.LocalSideButton.LowerLedEffect.Visible = false
				MusicInfoContainer.ServerSideButton.LowerLedEffect.Visible = true
				SoundIndicator.ImageColor3 = MusicInfoContainer.ServerSideButton.LowerLedEffect.BackgroundColor3
				
				MusicContainer.Volume = VolumeKeeper
			end
		end)
		
		
		
		
		
		----------Play/Pause/Stop/FastF/FastB Buttons--------
		MusicInfoContainer.MusicControl.PlayButton.MouseButton1Down:Connect(function()
			if MusicContainer.Playing == true and MusicContainer.TimePosition ~= 0 then
				MusicContainer:Play()
			else
				MusicContainer:Resume()
			end
		end)
		MusicInfoContainer.MusicControl.StopButton.MouseButton1Down:Connect(function()
			MusicContainer:Stop()
		end)
		MusicInfoContainer.MusicControl.PauseButton.MouseButton1Down:Connect(function()
			MusicContainer:Pause()
		end)
		MusicInfoContainer.MusicControl.FastForward.MouseButton1Down:Connect(function()
			if MusicContainer.TimePosition + 10 > MusicContainer.TimeLength then
				MusicContainer.TimePosition = MusicContainer.TimeLength
			else
				MusicContainer.TimePosition = MusicContainer.TimePosition + 10
			end
			MusicGUISync()
		end)
		MusicInfoContainer.MusicControl.FastBackwards.MouseButton1Down:Connect(function()
			if MusicContainer.TimePosition - 10 < 0 then
				MusicContainer.TimePosition = 0
			else
				MusicContainer.TimePosition = MusicContainer.TimePosition - 10
			end
			MusicGUISync()
		end)
		
		
		
		
		
		
		
		
		
		----------------Loop Button-------------------
		FeatureBar.LoopButton.MouseButton1Down:Connect(function()
			if MusicContainer.Looped == true then
				--Disable looping
				MusicContainer.Looped = false
				FeatureBar.LoopButton.ImageColor3 = Color3.new(0.32549, 0.32549, 0.32549)
			else
				--Enable Looping
				MusicContainer.Looped = true
				if themesyncing == true or themesyncing == nil then
					FeatureBar.LoopButton.ImageColor3 = PrimaryColor
				else
					FeatureBar.LoopButton.ImageColor3 = Color3.new(0.807843, 0.537255, 0)
				end
			end
		end)	
		
		
		--------------------------------Music Effects
		--Distortion
		FeatureBar.DistortionButton.BackgroundColor3 = Color3.new(0.32549, 0.32549, 0.32549)
		FeatureBar.DistortionButton.MouseButton1Down:Connect(function()
			if MusicContainer.Distorter.Enabled == true then
				--Disable looping
				MusicContainer.Distorter.Enabled = false
				FeatureBar.DistortionButton.BackgroundColor3 = Color3.new(0.32549, 0.32549, 0.32549)
			else
				--Enable Looping
				MusicContainer.Distorter.Enabled = true
				if themesyncing == true or themesyncing == nil then
					FeatureBar.DistortionButton.BackgroundColor3 = PrimaryColor
				else
					FeatureBar.DistortionButton.BackgroundColor3 = Color3.new(0.807843, 0.537255, 0)
				end
			end
		end)
		
		--Weird
		FeatureBar.WeirdButton.BackgroundColor3 = Color3.new(0.32549, 0.32549, 0.32549)
		FeatureBar.WeirdButton.MouseButton1Down:Connect(function()
			if MusicContainer.Weird.Enabled == true then
				--Disable looping
				MusicContainer.Weird.Enabled = false
				FeatureBar.WeirdButton.BackgroundColor3 = Color3.new(0.32549, 0.32549, 0.32549)
			else
				--Enable Looping
				MusicContainer.Weird.Enabled = true
				if themesyncing == true or themesyncing == nil then
					FeatureBar.WeirdButton.BackgroundColor3 = PrimaryColor
				else
					FeatureBar.WeirdButton.BackgroundColor3 = Color3.new(0.807843, 0.537255, 0)
				end
			end
		end)
		
		
		
		
		
		
		--Sync elements of the Wowamp GUI with the Music
		MusicContainer.Played:Connect(function()
			MusicGUISync()
		end)
		MusicContainer.Resumed:Connect(function()
			MusicGUISync()
		end)
		
		
		
		
		
		--If the player leaves, it'll destroy the music
		game.Players.PlayerRemoving:Connect(function(playerwholeaves)
			if playerwholeaves.Name == player.Name then
				MusicContainer:Destroy()
			end
		end)
		
		
		
		--THEME SYNCING
		if themesyncing == true or themesyncing == nil then
			Wowamp_User.BackgroundColor3 = TertiaryColor
			WowampUI.Topbar.BackgroundColor3 = TertiaryColor
			TimeCompletion.BackgroundColor3 = PrimaryColor
			MusicInfoContainer.LoudnessVisual.Visual.BackgroundColor3 = PrimaryColor
			FeatureBar.LoopButton.ImageColor3 = PrimaryColor
			
			local ColorRetain = 0.7
			MusicInfoContainer.BackgroundColor3 = Color3.new(TertiaryColor.R*ColorRetain,TertiaryColor.G*ColorRetain,TertiaryColor.B*ColorRetain)
			
			local ColorLight = 1.5
			WowampUI.Topbar.CakePlayerLogo.TextColor3 = Color3.new(PrimaryColor.R*ColorLight,PrimaryColor.G*ColorLight,PrimaryColor.B*ColorLight)
		end
	end
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	---------------------------------HTTP Features---------------------------------------
	print("Loading Discord client...")
	HTTP = game:GetService("HttpService")
	
	--local CakeAwayUI
	
	local function isHttpEnabled()
		local _, err = pcall(HTTP.GetAsync, HTTP, 'a')
		return (err:lower():find("trust check failed") ~= nil)
	end
	
	if isHttpEnabled() == true then
		--Discord Sender
		require(script.DiscordModule)(player,themesyncing,T0PK3K_UI,T0PCAKE_User,PrimaryColor,SecondaryColor,TertiaryColor,TextColor,ShadowEffect)
		
		
		--CakeAway
		require(script.CakeAwayModule)(InsertT0PCAKEGui,themesyncing,TertiaryColor,TextColor,player)
		
	else
		warn("Http disabled. Discord client could not be loaded.")
	end
	
	
	
	
	
	
	
	
	---------------------------------T0PK3K Necessary Fixes---------------------
	if T0PK3KFixPatches == true or T0PK3KFixPatches == nil then
		--Moves the buttons back how they were
		local function MoveButtonToProperArea(ButtonName,YOffsetInGui)
			T0PK3K_UI.Main.Navigation[ButtonName]:TweenPosition(UDim2.new(0, 6, 0, YOffsetInGui), Enum.EasingDirection.Out, Enum.EasingStyle.Quad)
		end
		MoveButtonToProperArea("LocalPlayer",66)
		MoveButtonToProperArea("Server",96)
		MoveButtonToProperArea("Players",126)
		MoveButtonToProperArea("Destruction",156)
		MoveButtonToProperArea("Scripts",186)
		MoveButtonToProperArea("Music",216)
		MoveButtonToProperArea("Gear",246)
		
		MoveButtonToProperArea("Settings",306)
		MoveButtonToProperArea("Commands",336)
		
		--Fixes the first letter of the T0PK3K topbar
		T0PK3K_UI.Label.RealLabel.TextColor3 = T0PK3K_UI.Label.TKLabel.Label.TextColor3
	end
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	---------------------------TOUCHSCREEN ADAPTATOR MODULE-------------------
	local TouchScreenEvent = T0PCAKE_User.TouchScreenModifications.TouchScreenEvent

	if Wowamp_User ~= nil then
		TouchScreenEvent:FireClient(player,T0PCAKE_User,Wowamp_User,ScrollbarAlwaysOn)
	else
		TouchScreenEvent:FireClient(player,T0PCAKE_User,nil,ScrollbarAlwaysOn)
	end
	
	
	
	
	
	
	
	
	
	
	--------------------------------MODULE ABORT-------------------------
	T0PK3K_UI.Topbar.Controllers.Exit.MouseButton1Down:Connect(function()
		warn("The UI has been closed. Stopping T0PCAKE...")
		
		if MusicContainer ~= nil then
			MusicContainer:Destroy()
		end
		
		return nil
	end)
	
	
end
