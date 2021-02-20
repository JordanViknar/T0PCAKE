return function(InsertT0PCAKEGui,themesyncing,TertiaryColor,TextColor,Player)
	local CakeAwayUI = InsertT0PCAKEGui("Banlist",script.CakeAwayUI,"CakeAway")
	
	--Function for printing messages in the CakeAway output.
	local OutputQuantity = 0
	local OutputSize = 15
	local function CakeAwayPrint(Message,MessageType)
		local Output = Instance.new("TextLabel")
		
		Output.Name = "Output"..OutputQuantity
		
		Output.Active = true
		Output.Size = UDim2.new(0.975,0,0,OutputSize)
		Output.Position = UDim2.new(0.025,0,0,OutputQuantity*OutputSize)
		Output.Text = Message
		Output.Font = Enum.Font.Gotham
		Output.TextSize = 9
		Output.TextWrapped = true
		Output.BackgroundTransparency = 1
		Output.TextXAlignment = Enum.TextXAlignment.Left
		Output.ZIndex = 16
		
		if MessageType == "Print" then
			Output.TextColor3 = Color3.new(1,1,1)
		elseif MessageType == "Warn" then
			Output.TextColor3 = Color3.new(1,1,0)
		elseif MessageType == "Error" then
			Output.TextColor3 = Color3.new(1,0,0)
		elseif MessageType == "Success" then
			Output.TextColor3 = Color3.new(0,1,0)
		end
		
		
		Output.Parent = CakeAwayUI.Output.OutputContainer
		OutputQuantity = OutputQuantity + 1
		CakeAwayUI.Output.OutputContainer.CanvasSize = UDim2.new(0,0,0,OutputQuantity*OutputSize)
	end
	
	--Testing
	--CakeAwayPrint("This is some output for testing... outputs.","Print")
	--CakeAwayPrint("And this is some other testing.","Warn")
	--CakeAwayPrint("How nice, a test message.","Error")

	if themesyncing == nil or themesyncing == true then
		CakeAwayUI.BackgroundColor3 = TertiaryColor
		CakeAwayUI.Description.TextColor3 = TextColor
		CakeAwayUI.IDBar.Message.TextColor3 = TextColor
		CakeAwayUI.IDBar.ID.TextColor3 = TextColor
		CakeAwayUI.CakeAwayState.Label.TextColor3 = TextColor
		CakeAwayUI.PowerOnBar.Label.TextColor3 = TextColor
	end
	
	CakeAwayPrint("Detecting if CakeAway is already enabled...","Print")
	
	local OutputSource
	local CakeAwayScript
	local IDContainer
	local ID
	local StatusText = CakeAwayUI.CakeAwayState.StatusText
	local OutputContainer = CakeAwayUI.Output
	
	
	--This is for fixing a glitch
	local CakeAwayBell = Instance.new("BindableEvent")
	CakeAwayBell.Name = "CakeAwayBell"
	CakeAwayBell.Parent = Player
	
	local function ConnectToCakeAway()
		CakeAwayBell:Destroy()
		
		CakeAwayPrint("Connecting to existing CakeAwayLauncher script...","Print")

		CakeAwayScript = game.ServerScriptService.CakeAwayLauncher

		CakeAwayUI.PowerOnBar.Visible = false
		OutputContainer:TweenSize(UDim2.new(OutputContainer.Size.X.Scale, OutputContainer.Size.X.Offset, 0.46, OutputContainer.Size.Y.Offset), Enum.EasingDirection.Out, Enum.EasingStyle.Quad)

		--Connects the Output Source
		OutputSource = CakeAwayScript.CakeAwayExecutorModule.OutputSender
		OutputSource.Event:Connect(function(Message,MessageType)
			CakeAwayPrint(Message,MessageType)
		end)

		--Indicates the ID
		IDContainer = CakeAwayScript.CakeAwayExecutorModule.ServerID
		CakeAwayUI.IDBar.ID.Text = IDContainer.Value
		--Syncs said ID
		IDContainer.Changed:Connect(function()
			CakeAwayUI.IDBar.ID.Text = IDContainer.Value
		end)

		CakeAwayPrint("Successfully connected to existing CakeAway Service.","Success")
		StatusText.Text = "Enabled"
		StatusText.TextColor3 = Color3.new(0,1,0)
	end
	
	
	if game.ServerScriptService:FindFirstChild("CakeAwayLauncher") ~= nil then
		CakeAwayPrint("CakeAway is already enabled.","Warn")
		ConnectToCakeAway()
	else
		CakeAwayPrint("CakeAway isn't enabled.","Warn")
		StatusText.Text = "Disabled"
		StatusText.TextColor3 = Color3.new(1,0,0)
		
		
		--This part should run only if CakeAway's Power on button is pressed.
		local ButtonPressEvent
		
		local CallEvent = CakeAwayBell.Event:Connect(
			function()
				ButtonPressEvent:Disconnect()
				CakeAwayPrint("CakeAway enabled by other player.","Warn")
				ConnectToCakeAway()
			end
		)
		
		ButtonPressEvent = CakeAwayUI.PowerOnBar.PowerButton.MouseButton1Down:Connect(
			function()
				CallEvent:Disconnect()
				
				CakeAwayUI.PowerOnBar.Visible = false
				OutputContainer:TweenSize(UDim2.new(OutputContainer.Size.X.Scale, OutputContainer.Size.X.Offset, 0.46, OutputContainer.Size.Y.Offset), Enum.EasingDirection.Out, Enum.EasingStyle.Quad)

				CakeAwayPrint("Creating new CakeAwayLauncher script...","Print")

				CakeAwayScript = script.CakeAwayLauncher
				OutputSource = script.CakeAwayLauncher.CakeAwayExecutorModule.OutputSender

				OutputSource.Event:Connect(function(Message,MessageType)
					CakeAwayPrint(Message,MessageType)
				end)

				--Indicates the ID
				IDContainer = CakeAwayScript.CakeAwayExecutorModule.ServerID
				CakeAwayUI.IDBar.ID.Text = IDContainer.Value
				--Syncs said ID
				IDContainer.Changed:Connect(function()
					CakeAwayUI.IDBar.ID.Text = IDContainer.Value
				end)

				CakeAwayScript.Parent = game.ServerScriptService
				CakeAwayScript.Disabled = false

				StatusText.Text = "Enabled"
				StatusText.TextColor3 = Color3.new(0,1,0)
			end
		)
	end
	
	
end
