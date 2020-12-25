local botgui = {}
local uis = game:GetService("UserInputService")
local mouse = game.Players.LocalPlayer:GetMouse()

botgui.toggle_key = Enum.KeyCode.F7
botgui.toggle_win = nil
botgui.is_visible = false

uis.InputBegan:Connect(function(_)
	
	if _.KeyCode == botgui.toggle_key and botgui.toggle_win ~= nil then
		
		botgui.toggle_win.Visible = not botgui.toggle_win.Visible
			
		if botgui.toggle_win.Visible then
				
			uis.ModalEnabled = true
			uis.MouseIconEnabled = true
			botgui.is_visible = true
				
		else
				
			uis.ModalEnabled = false
			uis.MouseIconEnabled = false
			botgui.is_visible = false
				
		end
		
		
	end
	
end)

function botgui:create_gui_object(parent)
	
	if parent:IsA("Instance") then
		
		local gui = {}
		gui.o = Instance.new("ScreenGui", parent)
		gui.o.DisplayOrder = 999
		gui.o.IgnoreGuiInset = true

		return gui
		
	else
		
		error("Function create_gui_object(parent) did not receive a valid Instance.")
		
	end
	
end

function botgui:create_window(parent, title)
	
	if parent:IsA("Instance") and type(title) == "string" then
		
		local gui = {}
		
		gui.title_bar = Instance.new("Frame", parent)
		gui.title_bar.Active = true
		gui.title_bar.Draggable = true
		gui.title_bar.BackgroundColor3 = Color3.fromRGB(148, 52, 189)
		gui.title_bar.BorderSizePixel = 0
		gui.title_bar.Size = UDim2.new(0.400, 0, 0.570, 0)
		gui.title_bar.AnchorPoint = Vector2.new(0.5, 0.5)
		gui.title_bar.Position = UDim2.new(0.5, 0, 0.5, 0)
		gui.title_bar.Visible = false
		
		gui.title_text = Instance.new("TextLabel", gui.title_bar)
		gui.title_text.Size = UDim2.new(0.1, 0, 0, 16)
		gui.title_text.TextXAlignment = Enum.TextXAlignment.Left
		gui.title_text.Position = UDim2.new(0.05, 0, 0.02, 0)
		gui.title_text.BackgroundTransparency = 1
		gui.title_text.TextColor3 = Color3.new(1, 1, 1)
		gui.title_text.TextStrokeTransparency = 0
		gui.title_text.Text = title
		
		gui.category_bar = Instance.new("Frame", gui.title_bar)
		gui.category_bar.Size = UDim2.new(0.97, 0, 0.12, 0)
		gui.category_bar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		gui.category_bar.Position = UDim2.new(0.015, 0, 0.07)
		gui.category_bar.BorderColor3 = Color3.fromRGB(58, 58, 58)
		
		gui.category_uilayout = Instance.new("UIListLayout", gui.category_bar)
		gui.category_uilayout.SortOrder = Enum.SortOrder.LayoutOrder
		gui.category_uilayout.FillDirection = Enum.FillDirection.Horizontal
		
		gui.content = Instance.new("Frame", gui.title_bar)
		gui.content.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		gui.content.Size = UDim2.new(0.97, 0, 0.78, 0)
		gui.content.Position = UDim2.new(0.015, 0, 0.19, 0)
		gui.content.BorderColor3 = Color3.fromRGB(58, 58, 58)
		
		return gui
		
	else
		
		error("Function create_window(parent, title) did not receive a valid type.")
		
	end
	
end

function botgui:create_category(content_frame, category_bar, category_name)
	
	if content_frame:IsA("Frame") and category_bar:IsA("Frame") and type(category_name) == "string" then
		
		local gui = {}
		
		gui.frame = Instance.new("Frame", content_frame)
		gui.frame.Size = UDim2.fromScale(1, 1)
		gui.frame.BackgroundTransparency = 1
		gui.frame.Visible = false
		
		gui.ui_layout = Instance.new("UIListLayout", gui.frame)
		gui.ui_layout.Padding = UDim.new(0.03, 0)
		gui.ui_layout.SortOrder = Enum.SortOrder.LayoutOrder
		gui.ui_layout.FillDirection = Enum.FillDirection.Horizontal
		
		gui.ui_padding = Instance.new("UIPadding", gui.frame)
		gui.ui_padding.PaddingLeft = UDim.new(0.02, 0)
		gui.ui_padding.PaddingTop = UDim.new(0.05, 0)
		
		gui.button = Instance.new("TextButton", category_bar)
		gui.button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		gui.button.BorderColor3 = Color3.fromRGB(58, 58, 58)
		gui.button.Size = UDim2.fromScale(0.2, 1)
		gui.button.TextStrokeTransparency = 0
		gui.button.Text = category_name
		gui.button.TextColor3 = Color3.new(1, 1, 1)
		gui.button.Activated:Connect(function()
			
			for i, c in ipairs(content_frame:GetChildren()) do
				
				c.Visible = false
				
			end
			
			gui.frame.Visible = true
			
		end)
		
		return gui
		
	else
		
		error("Function create_category(content_frame, category_bar, category_name) did not receive a valid type.")
		
	end
	
end

function botgui:create_section(category, section_name)
	
	if category:IsA("Instance") and type(section_name) == "string" then
		
		local gui = {}
		
		gui.content = Instance.new("Frame", category)
		gui.content.Size = UDim2.new(0.307, 0, 0.95, 0)
		gui.content.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		gui.content.BorderColor3 = Color3.fromRGB(58, 58, 58)
		
		gui.title = Instance.new("TextLabel", gui.content)
		gui.title.BackgroundTransparency = 1
		gui.title.Text = section_name
		gui.title.TextColor3 = Color3.new(1, 1, 1)
		gui.title.TextSize = 8
		gui.title.Position = UDim2.new(0.02, 0, 0, -3)
		gui.title.TextXAlignment = Enum.TextXAlignment.Left
		gui.title.TextStrokeTransparency = 0
		
		gui.ui_layout = Instance.new("UIListLayout", gui.content)
		gui.ui_layout.Padding = UDim.new(0.02, 0)
		gui.ui_layout.SortOrder = Enum.SortOrder.LayoutOrder
		gui.ui_layout.FillDirection = Enum.FillDirection.Vertical
		
		gui.padding = Instance.new("UIPadding", gui.content)
		gui.padding.PaddingLeft = UDim.new(0.1, 0)
		
		gui.padding_obj = Instance.new("Frame", gui.content)
		gui.padding_obj.BackgroundTransparency = 1
		gui.padding_obj.Size = UDim2.new(1, 0, 0.01, 0)
		
		return gui
		
	else
		
		error("Function create_category(content_frame, category_bar, category_name) did not receive a valid type.")
		
	end
	
end

function botgui:create_checkbox(parent, name, state)
	
	if parent:IsA("Instance") and type(name) == "string" and type(state) == "boolean" then
 		
		local gui = {}
		
		gui.state = state
		
		gui.bg = Instance.new("Frame", parent)
		gui.bg.Size = UDim2.new(0.6, 0, 0.06, 0)
		gui.bg.BackgroundTransparency = 1
	
		gui.box = Instance.new("Frame", gui.bg)
		gui.box.Size = UDim2.new(0, 16, 0, 16)
		gui.box.AnchorPoint = Vector2.new(0.5, 0.5)
		gui.box.Position = UDim2.new(0.05, 0, 0.5, 0)
		gui.box.BorderSizePixel = 0
		
		if state then
			
			gui.box.BackgroundColor3 = Color3.fromRGB(148, 52, 189)
			
		else
			
			gui.box.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
			
		end
		
		gui.text = Instance.new("TextLabel", gui.bg)
		gui.text.Size = UDim2.new(0.8, 0, 1, 0)
		gui.text.Position = UDim2.new(0.2, 0, 0.5, 0)
		gui.text.AnchorPoint = Vector2.new(0, 0.5)
		gui.text.BackgroundTransparency = 1
		gui.text.TextColor3 = Color3.new(1, 1, 1)
		gui.text.TextStrokeTransparency = 0
		gui.text.TextXAlignment = Enum.TextXAlignment.Left
		gui.text.Text = name
		
		gui.btn = Instance.new("TextButton", gui.bg)
		gui.btn.Size = UDim2.new(1, 0, 1, 0)
		gui.btn.BackgroundTransparency = 1
		gui.btn.Text = ""
		gui.btn.Activated:Connect(function()
			
			gui.state = not gui.state
			
			if gui.state then
				
				gui.box.BackgroundColor3 = Color3.fromRGB(148, 52, 189)
				
			else

				gui.box.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
				
			end
			
			
		end)
		
		return gui
		
	else
		
		error("Function create_checkbox(parent, name) did not receive a valid type.")
		
	end
	
end

function botgui:create_button(parent, name, func)
	
	if parent:IsA("Instance") and type(name) == "string" and type(func) == "function" then
		
		local gui = {}
		
		gui.o = Instance.new("TextButton", parent)
		gui.o.BackgroundColor3 = Color3.fromRGB(148, 52, 189)
		gui.o.BorderSizePixel = 0
		gui.o.Size = UDim2.new(0.9, 0, 0.06)
		gui.o.Text = name
		gui.o.TextColor3 = Color3.new(1, 1, 1)
		gui.o.TextStrokeTransparency = 0
		gui.o.Activated:Connect(func)
		
		return gui
		
	else
		
		error("Function create_button(parent, nane) did not receive a valid type.")
		
	end
	
end

function botgui:create_slider(parent, name, amount, lower_limit, upper_limit)
	
	if parent:IsA("Instance") and type(name) == "string" and type(amount) == "number" and type(lower_limit) == "number" and type(upper_limit) == "number" then
		
		local gui = {}
		
		gui.being_dragged = false
		gui.amount = amount
		
		gui.bg = Instance.new("Frame", parent)
		gui.bg.Size = UDim2.new(0.6, 0, 0, 15)
		gui.bg.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
		gui.bg.BorderColor3 = Color3.fromRGB(58, 58, 58)
		
		gui.fg = Instance.new("Frame", gui.bg)
		gui.fg.Size = UDim2.new(amount/upper_limit, 0, 1, 0)
		gui.fg.BorderSizePixel = 0
		gui.fg.BackgroundColor3 = Color3.fromRGB(148, 52, 189)
		
		gui.title = Instance.new("TextLabel", gui.bg)
		gui.title.Position = UDim2.new(1.05, 0, 0.5, 0)
		gui.title.AnchorPoint = Vector2.new(0, 0.5)
		gui.title.TextXAlignment = Enum.TextXAlignment.Left
		gui.title.Text = name
		gui.title.TextStrokeTransparency = 0
		gui.title.TextColor3 = Color3.new(1, 1, 1)
		
		gui.btn = Instance.new("TextButton", gui.bg)
		gui.btn.Size = UDim2.new(1, 0, 1, 0)
		gui.btn.BackgroundTransparency = 1
		gui.btn.Text = tostring(amount)
		gui.btn.TextStrokeTransparency = 0
		gui.btn.TextColor3 = Color3.new(1, 1, 1)
		
		gui.btn.MouseButton1Down:Connect(function()
			
			gui.being_dragged = true
			
		end)
		
		uis.InputEnded:Connect(function(_)
			
			if _.UserInputType == Enum.UserInputType.MouseButton1 then
				
				gui.being_dragged = false
				
			end
			
		end)
		
		uis.InputChanged:Connect(function()
			
			if gui.being_dragged then
				
				local mpos = uis:GetMouseLocation()
				local relpos = mpos-gui.btn.AbsolutePosition
				
				if relpos.X <= 100 and relpos.X >= 0 then
					
					gui.amount = math.floor((relpos.x/100 * upper_limit)+0.5)
					gui.fg.Size = UDim2.new(relpos.x/100, 0, 1, 0)
					gui.btn.Text = tostring(gui.amount)	
					
				end
				
				if relpos.X > 100 then
					
					gui.amount = upper_limit
					gui.fg.Size = UDim2.new(1, 0, 1, 0)
					gui.btn.Text = tostring(gui.amount)	
					
				end
				
				if relpos.X < 0 then
					
					gui.amount = lower_limit
					gui.fg.Size = UDim2.new(0, 0, 1, 0)
					gui.btn.Text = tostring(gui.amount)	
					
				end
				
			end
			
		end)
		
		return gui 
		
	else
		
		error("Function create_slider(parent, name, amount) did not receive a valid type.")
		
	end
	 
end

return botgui
