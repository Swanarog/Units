local Addon = _G[...]local profiles = {}local blackList = {	point = 1,	x = 1,	y = 1,	anchor = 1,	Currency = 1,}local base = {	scale = 1,	showstates = "",	point = "TOPLEFT",	clickThrough = false,	frameLayer = 1,	magicWidth = false,	showInPetBattleUI = true,	showInOverrideUI = true,	frameStrata = 1,	width = 191,	y = -44,	x = 291,	height = 66,	overlay = {		basic = {			padding = {				top = 0,				right = 8,				left = 0,				bottom = 0,			},			position = {				frameLevel = 4,				frameStrata = 2,			},			texture = {				minus = "Minus",				enable = true,				rare = "Rare",				elite = "Elite",				player = "Target",				noMana = "No Mana",				worldboss = "Elite",				rareelite = "Rare Elite",				vehicle = "Vehicle",				isLeftToRight = true,				boss = "Boss",			},		},	},	debuffs = {		visibility = {			border = {				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},				file = "Blizzard",				thickness = 10,			},			background = {				enable = false,				file = "Raid",				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},				padding = 16,			},		},		basic = {			advanced = {				flipVertical = true,				padding = 0,				spacing = 0,				enable = true,				opacity = 30,				isLeftToRight = false,				auraTooltip = true,			},			icons = {				zoom = 11,				columns = 8,				scale = 73,				rows = 3,				sort = "Duration",			},			position = {				y = -120,				x = 1,				frameLevel = 4,				anchor = "TopLeft",				frameStrata = 2,			},		},	},	resource = {		display = {			circle = {				offset = 0,				rings = 4,				spin = 0,				spacing = 8,			},			bar = {				columns = 5,				rows = 4,			},			position = {				y = -55,				x = -70,				frameLevel = 4,				anchor = "TopRight",				frameStrata = 2,			},			advanced = {				offset = 0,				zoom = 5,				scale = 80,				opacity = 30,				spacing = 11,				enable = true,				fixed = true,				padding = 0,				auraTooltip = true,			},		},		visibility = {			border = {				color = {					a = 0.5,					r = 0,					g = 0,					b = 0,				},				file = "Blizzard",				thickness = 10,			},			background = {				enable = false,				file = "Raid",				color = {					a = 0.5,					r = 0,					g = 0,					b = 0,				},			},		},	},	mana = {		text = {			text = {				color = {					a = 1,					b = 0,					g = 1,					r = 1,				},				justifyV = 1,				justifyH = 2,				format = "percent",				enable = true,				file = "Friz Quadrata TT",				mouseover = "value",				size = 11,			},			position = {				anchor = "Center",				x = 0,				y = 0,			},		},		visibility = {			background = {				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},			},			border = {			},			texture = {				orientation = "HORIZONTAL",				file = "Raid",				opacity = 100,			},		},		basic = {			advanced = {				enable = true,				tooltip = false,			},			position = {				y = -52,				x = 13,				frameLevel = 4,				anchor = "TopLeft",				frameStrata = 2,			},			size = {				enable = true,				scale = 100,				height = 12,				width = 103,			},		},	},	cast = {		basic = {			advanced = {				enable = true,				tooltip = true,			},			position = {				y = -13,				x = 7,				frameLevel = 5,				anchor = "TopLeft",				frameStrata = 2,			},			size = {				enable = true,				scale = 100,				height = 16,				width = 116,			},		},		text = {			text = {				justifyH = 1,				enable = true,				file = "Friz Quadrata TT",				justifyV = 2,				color = {					a = 1,					b = 0,					g = 1,					r = 1,				},			},			size = {				height = 100,				size = 9,				width = 90,			},			position = {				anchor = "Left",				x = 0,				y = 0,			},		},		visibility = {			spark = {				y = 0,				offset = 0,			},			background = {				enable = true,				file = "Raid",				solid = true,				color = {					a = 0,					b = 0,					g = 0,					r = 0,				},			},			border = {				hpadding = 0,				vthickness = 30,				vpadding = 0,				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},				file = "Border",				hthickness = 50,			},			texture = {				orientation = "HORIZONTAL",				fillstyle = "STANDARD",				file = "Raid",				opacity = 100,			},		},		time = {			text = {				enable = true,				file = "Friz Quadrata TT",				color = {					a = 1,					b = 0,					g = 1,					r = 1,				},				size = 9,			},			position = {				anchor = "Right",				x = 0,				y = 0,			},		},	},	focus = {		visibility = {			border = {				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},				file = "Blizzard",				thickness = 10,			},			background = {				enable = false,				file = "Raid",				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},			},		},		basic = {			icon = {				enable = true,				zoom = 0,				scale = 61,			},			position = {				y = -3,				x = -5,				frameLevel = 4,				anchor = "TopRight",				frameStrata = 1,			},		},	},	level = {		visibility = {			border = {				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},				file = "Blizzard",				thickness = 10,			},			background = {				enable = false,				file = "Raid",				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},			},		},		fontcolor = {			a = 1,			r = 1,			g = 1,			b = 0,		},		basic = {			position = {				y = 9,				x = -9,				frameLevel = 4,				anchor = "BottomRight",				frameStrata = 2,			},			text = {				enable = true,				file = "Friz Quadrata TT",				color = {					a = 1,					b = 0,					g = 1,					r = 1,				},				size = 9,			},		},	},	threat = {		visibility = {			border = {				hpadding = -32,				vpadding = -7,				hthickness = 15,				y = 2,				x = 1,				vthickness = 17,				file = "Threat",				enable = true,				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},			},			background = {				hpadding = 4,				vpadding = 6,				enable = true,				file = "Armory",				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},			},		},		fontcolor = {			a = 1,			r = 1,			g = 1,			b = 0,		},		basic = {			position = {				y = 4,				x = -74,				frameLevel = 4,				anchor = "TopRight",				frameStrata = 2,			},			text = {				enable = true,				file = "Friz Quadrata TT",				color = {					a = 1,					b = 0,					g = 1,					r = 1,				},				size = 9,			},		},	},	icons = {		visibility = {			border = {				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},				file = "Blizzard",				thickness = 10,			},			background = {				enable = false,				file = "Raid",				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},			},		},		display = {			circle = {				offset = 0,				spin = -40,				spacing = 0,				enable = true,				rings = 1,			},			advanced = {				offset = 1,				zoom = 11,				scale = 136,				opacity = 30,				reverse = false,				spacing = -17,				enable = true,				fixed = false,				padding = 0,				auraTooltip = true,			},			position = {				y = 2,				x = -38,				frameLevel = 4,				anchor = "Right",				frameStrata = 4,			},			bar = {				columns = 8,				rows = 4,			},		},	},	power = {		text = {			text = {				color = {					a = 1,					b = 1,					g = 1,					r = 1,				},				justifyV = 1,				justifyH = 2,				format = "percent",				enable = true,				file = "Friz Quadrata TT",				mouseover = "value",				size = 10,			},			position = {				anchor = "Center",				x = 0,				y = 0,			},		},		visibility = {			background = {				enable = true,				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},			},			border = {			},			texture = {				orientation = "HORIZONTAL",				file = "Raid",				fillStyle = "STANDARD",				opacity = 100,			},		},		basic = {			advanced = {				enable = true,				tooltip = true,			},			position = {				y = -41,				x = 6,				frameLevel = 3,				anchor = "TopLeft",				frameStrata = 2,			},			size = {				enable = true,				scale = 100,				height = 10,				width = 115,			},		},	},	name = {		visibility = {			border = {				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},				file = "Blizzard",				thickness = 10,			},			background = {				enable = false,				file = "Raid",				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},			},		},		fontcolor = {			a = 1,			b = 0,			g = 1,			r = 1,		},		basic = {			position = {				y = -11,				x = 7,				frameLevel = 3,				anchor = "TopLeft",				frameStrata = 2,			},			text = {				width = 116,				color = {					a = 1,					b = 0,					g = 1,					r = 1,				},				justifyH = 2,				height = 2,				enable = true,				file = "Friz Quadrata TT",				justifyV = 2,				size = 10,			},		},	},	health = {		text = {			text = {				color = {					a = 1,					b = 1,					g = 1,					r = 1,				},				justifyV = 1,				justifyH = 2,				format = "percent",				enable = true,				file = "Friz Quadrata TT",				mouseover = "value",				size = 11,			},			position = {				anchor = "Center",				x = 0,				y = 0,			},		},		visibility = {			background = {				enable = true,				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},			},			texture = {				orientation = "HORIZONTAL",				file = "Druid",				fillStyle = "STANDARD",				opacity = 100,			},		},		basic = {			advanced = {				enable = true,				tooltip = true,			},			position = {				y = -29,				x = 6,				frameLevel = 2,				anchor = "TopLeft",				frameStrata = 2,			},			size = {				enable = true,				scale = 100,				height = 12,				width = 115,			},		},	},	model = {		visibility = {			border = {				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},				file = "Blizzard",				thickness = 10,			},			background = {				enable = false,				file = "Raid",				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},			},		},		basic = {			position = {				y = 61,				x = -194,				frameLevel = 4,				anchor = "TopRight",				frameStrata = 2,			},			model = {				rotation = 22,				zoom = 40,				enable = false,				height = 128,				width = 95,			},		},	},	buffs = {		visibility = {			border = {				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},				file = "Blizzard",				thickness = 10,			},			background = {				enable = false,				file = "Raid",				padding = 16,				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},			},		},		basic = {			advanced = {				padding = 0,				flipVertical = true,				spacing = 0,				enable = true,				opacity = 30,				isLeftToRight = true,				auraTooltip = true,			},			icons = {				zoom = 11,				columns = 8,				scale = 73,				rows = 2,				sort = "Duration",			},			position = {				y = -68,				x = 0,				frameLevel = 4,				anchor = "TopLeft",				frameStrata = 2,			},		},	},	background = {		visibility = {			border = {				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},				file = "Blizzard",				thickness = 10,			},			background = {				enable = true,				file = "Raid",				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},			},		},		basic = {			position = {				y = -14,				x = 4,				frameLevel = 3,				anchor = "TopLeft",				frameStrata = 2,			},			size = {				height = 15,				enable = true,				width = 116,			},		},	},}	Addon.baseDefaults = base				local def = {	player = {		point = "TopLeft",		x = 0, 		y = -50,		digsite = {			basic = {				position = {					x = 0,					y = -175,					anchor = 'Center',					frameLevel = 4,					frameStrata = 2,				},			},		},		resource = {			display = {				circle = {					offset = 0,					rings = 4,					spin = 0,					spacing = 8,				},				advanced = {					offset = 0,					zoom = 5,					enable = true,					opacity = 30,					spacing = 7,					scale = 80,					fixed = true,					padding = 0,					auraTooltip = true,				},				position = {					y = 70,					x = 0,					frameLevel = 4,					anchor = "Bottom",					frameStrata = 2,				},				bar = {					columns = 5,					rows = 4,				},			},			fadeAlpha = 100,			frameLevel = 2,			frameLayer = 1,			color = {				a = 1,				b = 1,				g = 1,				r = 1,			},			frameStrata = 2,			visibility = {				border = {					color = {						a = 0.5,						b = 0,						g = 0,						r = 0,					},					file = "Blizzard",					thickness = 10,				},				background = {					enable = false,					file = "Raid",					color = {						a = 0.5,						b = 0,						g = 0,						r = 0,					},				},			},			alpha = 100,		},	},	focus = {		point = "Center",		x = -200, 		y = 100,	},	focustarget = {		point = "Center",		x = 200, 		y = 100,	},	target = {		point = "TopLeft",		x = 232, 		y = -50,	},	targettarget = {		point = "TopLeft",		x = 479, 		y = -50,	},	playerpet = {		point = "TopLeft",		x = 0, 		y = -275,	},	playerpettarget = {		point = "TopLeft",		x = 232, 		y = -275,	},}local DEFAULTS = {}local function FlipVertical(layout, looped)	for key, value in pairs(layout) do		if (not looped) and (type(value) == 'table') then			layout[key] = FlipVertical(value, true) --don't modify top level settings, would alter frame position. 		elseif looped then			if type(value) == "table" then				layout[key] = FlipVertical(value, true)			else								if (key == 'anchor')then					if string.find(value, 'Left') then						layout[key] = string.gsub (value, 'Left', 'Right')					elseif string.find(value, 'Right') then						layout[key] = string.gsub (value, 'Right', 'Left')					end				end								if key == "isLeftToRight" then					layout[key] = not value				end								if (key == 'justifyH') then					if value == 1 then						layout[key] = 3					elseif  value == 3 then						layout[key] = 1					end				end				if key == 'x' then					layout[key] = -value									end				if key == 'spin' then					layout[key] = -value									end				if key == 'spin' then					layout[key] = -value									end			end		end	end	return layoutendlocal d = {	player = 1,	focus = 1,	playerpet = 1,}for unit, setts in pairs(def) do	local BASE = CopyTable(base)	DEFAULTS[unit] = {}	if d[unit] then				DEFAULTS[unit] = Addon.Blend(FlipVertical(BASE), DEFAULTS[unit])	else		DEFAULTS[unit] = Addon.Blend(BASE, DEFAULTS[unit])	end		Addon.Merge(setts, DEFAULTS[unit])endAddon.defaults = DEFAULTSlocal ADV = {	overlay = {		fadeAlpha = 100,		frameLevel = 2,		basic = {			padding = {				top = 0,				right = 0,				left = 0,				bottom = 0,			},			position = {				frameLevel = 4,				frameStrata = 2,			},			texture = {				minus = "Minus",				enable = false,				isLeftToRight = true,				rare = "Rare",				elite = "Elite",				player = "Target",				noMana = "No Mana",				boss = "Boss",				flipHorizontal = false,				vehicle = "Vehicle",				rareelite = "Rare Elite",				worldboss = "Elite",			},		},		frameLayer = 1,		frameStrata = 2,		alpha = 100,	},	debuffs = {		frameLayer = 1,		fadeAlpha = 100,		frameLevel = 2,		basic = {			advanced = {				flipVertical = true,				opacity = 30,				spacing = 0,				enable = true,				padding = 0,				isLeftToRight = false,				auraTooltip = true,			},			icons = {				zoom = 11,				columns = 5,				scale = 66,				rows = 3,				sort = "Duration",			},			position = {				y = -146,				x = -3,				frameLevel = 4,				anchor = "TopLeft",				frameStrata = 2,			},		},		color = {			a = 1,			r = 0,			g = 0,			b = 0,		},		visibility = {			border = {				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},				file = "Blizzard",				thickness = 10,			},			background = {				enable = false,				file = "Raid",				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},				padding = 16,			},		},		alpha = 100,		frameStrata = 2,	},	scale = 1,	mana = {		frameLevel = 2,		frameLayer = 1,		text = {			text = {				enable = true,				mouseover = "value",				justifyH = 2,				file = "Friz Quadrata TT",				color = {					a = 1,					b = 0,					g = 1,					r = 1,				},				format = "percent",				justifyV = 1,				size = 9,			},			position = {				anchor = "Center",				x = 0,				y = 0,			},		},		frameStrata = 2,		fadeAlpha = 100,		basic = {			advanced = {				enable = true,				tooltip = true,			},			position = {				y = 22,				x = 0,				frameLevel = 4,				anchor = "TopRight",				frameStrata = 2,			},			size = {				enable = true,				scale = 100,				height = 11,				width = 103,			},		},		fontColor = {			a = 1,			b = 1,			g = 1,			r = 1,		},		visibility = {			background = {				enable = true,				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},			},			border = {				enable = false,			},			texture = {				orientation = "HORIZONTAL",				file = "Raid",				opacity = 100,			},		},		alpha = 100,	},	cast = {		timefontColor = {			a = 1,			b = 1,			g = 1,			r = 1,		},		frameLayer = 1,		text = {			text = {				justifyH = 1,				enable = true,				file = "Friz Quadrata TT",				justifyV = 2,				color = {					a = 1,					b = 0,					g = 1,					r = 1,				},			},			size = {				height = 100,				width = 76,				size = 9,			},			position = {				anchor = "Left",				x = 1,				y = 0,			},		},		alpha = 100,		fadeAlpha = 100,		time = {			text = {				enable = true,				file = "Friz Quadrata TT",				color = {					a = 1,					b = 0,					g = 1,					r = 1,				},				size = 9,			},			position = {				anchor = "Right",				x = 0,				y = 0,			},		},		basic = {			advanced = {				enable = true,				tooltip = true,			},			position = {				y = 0,				x = 0,				frameLevel = 12,				anchor = "Center",				frameStrata = 3,			},			size = {				enable = true,				scale = 100,				height = 42,				width = 89,			},		},		fontColor = {			a = 1,			b = 1,			g = 1,			r = 1,		},		frameLevel = 2,		visibility = {			spark = {				y = 0,				offset = 0,			},			background = {				enable = true,				file = "Raid",				color = {					a = 0,					b = 0,					g = 0,					r = 0,				},				solid = true,			},			border = {				hpadding = -35,				vthickness = 13,				vpadding = -7,				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},				file = "WoodBoards",				hthickness = 14,				enable = true,			},			texture = {				orientation = "HORIZONTAL",				fillstyle = "STANDARD",				opacity = 100,				file = "Smooth v2",			},		},		frameStrata = 2,	},	showstates = "",	clickThrough = false,	background = {		frameLevel = 2,		frameLayer = 1,		color = {			a = 0.5,			r = 0.317647058823529,			g = 0.305882352941177,			b = 0.301960784313726,		},		frameStrata = 2,		fadeAlpha = 100,		basic = {			position = {				y = 0,				x = 0,				frameLevel = 4,				anchor = "Center",				frameStrata = 2,			},			size = {				height = 58,				enable = true,				width = 103,			},		},		edgecolor = {			a = 100,			r = 100,			g = 100,			b = 100,		},		visibility = {			border = {				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},				file = "Blizzard",				thickness = 10,			},			background = {				enable = true,				file = "Raid",				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},			},		},		alpha = 100,	},	level = {		frameLevel = 2,		frameLayer = 1,		color = {			a = 1,			b = 0,			g = 1,			r = 1,		},		frameStrata = 2,		fadeAlpha = 100,		basic = {			position = {				y = 2,				x = -8,				frameLevel = 4,				anchor = "BottomRight",				frameStrata = 2,			},			text = {				enable = true,				file = "Friz Quadrata TT",				color = {					a = 1,					b = 0,					g = 1,					r = 1,				},				size = 9,			},		},		fontcolor = {			a = 1,			b = 0,			g = 1,			r = 1,		},		visibility = {			border = {				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},				file = "Blizzard",				thickness = 10,			},			background = {				enable = false,				file = "Raid",				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},			},		},		alpha = 100,	},	focus = {		fadeAlpha = 100,		frameLevel = 2,		basic = {			icon = {				enable = true,				zoom = 12,				scale = 32,				fixed = false,			},			position = {				y = 0,				x = 0,				frameLevel = 4,				anchor = "Right",				frameStrata = 2,			},		},		frameLayer = 1,		visibility = {			border = {				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},				file = "Blizzard",				thickness = 10,			},			background = {				enable = false,				file = "Raid",				color = {					a = 0,					b = 0,					g = 0,					r = 0,				},			},		},		alpha = 100,		frameStrata = 2,	},	showInPetBattleUI = true,	threat = {		frameLevel = 2,		frameLayer = 1,		color = {			a = 1,			b = 0,			g = 1,			r = 1,		},		frameStrata = 2,		fadeAlpha = 100,		basic = {			position = {				y = -2,				x = -3,				frameLevel = 4,				anchor = "TopRight",				frameStrata = 2,			},			text = {				enable = true,				file = "Friz Quadrata TT",				color = {					a = 1,					b = 0,					g = 1,					r = 1,				},				size = 9,			},		},		fontcolor = {			a = 1,			b = 0,			g = 1,			r = 1,		},		visibility = {			border = {				hpadding = 0,				vpadding = 0,				hthickness = 50,				y = 0,				x = 0,				vthickness = 30,				file = "Border",				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},				enable = true,			},			background = {				hpadding = 0,				vpadding = 0,				enable = true,				file = "Raid",				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},			},		},		alpha = 100,	},	icons = {		fadeAlpha = 100,		frameLevel = 2,		frameLayer = 1,		display = {			circle = {				offset = 0,				spin = 0,				spacing = 8,				enable = false,				rings = 4,			},			advanced = {				offset = 1,				zoom = 11,				scale = 100,				opacity = 30,				flipVertical = true,				spacing = 1,				fixed = false,				reverse = true,				enable = true,				padding = 0,				flipHorizontal = false,				auraTooltip = true,			},			position = {				y = 4,				x = -31,				frameLevel = 4,				anchor = "Left",				frameStrata = 2,			},			bar = {				rows = 4,				columns = 2,				disable = true,			},		},		frameStrata = 2,		alpha = 100,		visibility = {			border = {				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},				file = "Blizzard",				thickness = 10,			},			background = {				enable = false,				file = "Raid",				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},			},		},	},	frameLayer = 1,	height = 58,	showInOverrideUI = true,	frameStrata = 1,	width = 103,	health = {		frameLevel = 2,		frameLayer = 1,		text = {			text = {				enable = true,				mouseover = "value",				justifyH = 2,				file = "Friz Quadrata TT",				color = {					a = 1,					b = 0,					g = 1,					r = 1,				},				format = "percent",				justifyV = 1,				size = 9,			},			position = {				anchor = "Center",				x = 0,				y = 0,			},		},		frameStrata = 2,		fadeAlpha = 100,		basic = {			advanced = {				enable = true,				tooltip = true,			},			position = {				y = -15,				x = 0,				frameLevel = 4,				anchor = "BottomRight",				frameStrata = 2,			},			size = {				enable = true,				scale = 100,				height = 15,				width = 103,			},		},		fontColor = {			a = 1,			r = 1,			g = 1,			b = 1,		},		visibility = {			background = {				enable = true,				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},			},			texture = {				orientation = "HORIZONTAL",				file = "Raid",				fillStyle = "STANDARD",				opacity = 100,			},		},		alpha = 100,	},	model = {		fadeAlpha = 100,		frameLevel = 2,		basic = {			position = {				y = 0,				x = 100,				frameLevel = 4,				anchor = "Right",				frameStrata = 2,			},			model = {				rotation = 0,				zoom = 0,				enable = false,				height = 100,				width = 100,			},		},		frameLayer = 1,		visibility = {			border = {				color = {					a = 0.941319286823273,					b = 1,					g = 1,					r = 1,				},				file = "Blizzard Achievement Wood",				enable = true,				thickness = 17,			},			background = {				enable = true,				file = "Raid",				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},			},		},		alpha = 100,		frameStrata = 2,	},	magicWidth = false,	buffs = {		frameLayer = 1,		fadeAlpha = 100,		frameLevel = 2,		basic = {			advanced = {				flipVertical = false,				opacity = 30,				spacing = 0,				enable = true,				padding = 0,				isLeftToRight = true,				auraTooltip = true,			},			icons = {				zoom = 11,				columns = 5,				scale = 66,				rows = 3,				sort = "Duration",			},			position = {				y = -74,				x = -3,				frameLevel = 4,				anchor = "TopLeft",				frameStrata = 2,			},		},		color = {			a = 1,			r = 0,			g = 0,			b = 0,		},		visibility = {			border = {				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},				file = "Blizzard",				thickness = 10,			},			background = {				enable = false,				file = "Raid",				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},				padding = 16,			},		},		alpha = 100,		frameStrata = 2,	},	power = {		frameLevel = 2,		frameLayer = 1,		text = {			text = {				enable = true,				mouseover = "value",				justifyH = 2,				file = "Friz Quadrata TT",				color = {					a = 1,					b = 0,					g = 1,					r = 1,				},				format = "percent",				justifyV = 1,				size = 9,			},			position = {				anchor = "Center",				x = 0,				y = 0,			},		},		frameStrata = 2,		fadeAlpha = 100,		basic = {			advanced = {				enable = true,				tooltip = true,			},			position = {				y = 11,				x = 0,				frameLevel = 4,				anchor = "TopRight",				frameStrata = 2,			},			size = {				enable = true,				scale = 100,				height = 11,				width = 103,			},		},		fontColor = {			a = 1,			r = 1,			g = 1,			b = 1,		},		visibility = {			background = {				enable = true,				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},			},			border = {			},			texture = {				orientation = "HORIZONTAL",				file = "Raid",				fillStyle = "STANDARD",				opacity = 100,			},		},		alpha = 100,	},	name = {		frameLevel = 2,		frameLayer = 1,		color = {			a = 1,			b = 0,			g = 1,			r = 1,		},		frameStrata = 2,		fadeAlpha = 100,		basic = {			position = {				y = 0,				x = 3,				frameLevel = 4,				anchor = "Left",				frameStrata = 2,			},			text = {				size = 10,				color = {					a = 1,					b = 0,					g = 1,					r = 1,				},				justifyH = 1,				height = 5,				enable = true,				file = "Friz Quadrata TT",				justifyV = 1,				width = 67,			},		},		fontcolor = {			a = 1,			r = 1,			g = 1,			b = 0,		},		visibility = {			border = {				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},				file = "Blizzard",				thickness = 10,			},			background = {				enable = false,				file = "Raid",				color = {					a = 0.5,					b = 0,					g = 0,					r = 0,				},			},		},		alpha = 100,	},}				local Advanced = {}for unit, setts in pairs(def) do	local ADV = CopyTable(ADV)	Advanced[unit] = {}	if d[unit] then				Advanced[unit] = Addon.Blend(FlipVertical(ADV), Advanced[unit])	else		Advanced[unit] = Addon.Blend(ADV, Advanced[unit])	end		Addon.Merge(setts, Advanced[unit])endAddon.Advanced = Advancedlocal defaults  = {	frames = {		player = true,		target = true,		targettarget = true,		focus = true,		focustarget = true,		playerpet = true,		playerpettarget = true,	},	hide = {		PlayerFrame = true,		TargetFrame = true,		FocusFrame = true,	}}local function getSets()	Addon.master.db.profile.units = Addon.master.db.profile.units or defaults	Addon.master.db.profile.units.hide = Addon.master.db.profile.units.hide or Addon.master.db.profile.units.disable or {		PlayerFrame = true,		TargetFrame = true,		FocusFrame = true,	}	return Addon.master.db.profile.unitsendAddon.getSets = getSetslocal basics = {	defaults = Addon.defaults,	advanced = Addon.Advanced,}local files = {}local info  = {}function profiles:GetActiveProfile()	for profile, settings in pairs(DominosDB.profiles) do		if profile == Dominos.db:GetCurrentProfile() then			return settings		end	endendfunction profiles:GetProfiles()	files = {}		for profile, settings in pairs(CopyTable(DominosDB.profiles or {})) do			for i, b in pairs(settings) do				for id, sets in pairs(settings.frames) do					if (type(id) == "string") and Addon:IsUnitValid(id) and (type(sets) == "table") then						info[id] = Addon.Copy(sets,nil, nil, blackList)					end				end			end			files[profile] = Addon.Copy(info)--,nil, nil, blackList)			info = {}                		end		for profile, settings in pairs(Addon.Copy(basics,nil, nil, blackList)) do			files[profile] = settings		end		Dominos_Units_SV = files	return filesendfunction profiles:GetCopyProfiles()	files = {}		for profile, settings in pairs(CopyTable(DominosDB.profiles or {})) do			for i, b in pairs(settings) do				for id, sets in pairs(settings.frames) do					if (type(id) == "string") and Addon:IsUnitValid(id) and (type(sets) == "table") then						info[id] = Addon.Copy(sets)					end				end			end			files[profile] = Addon.Copy(info)--,nil, nil, blackList)			info = {}                		end		for profile, settings in pairs(Addon.Copy(basics)) do			files[profile] = settings		end		Dominos_Units_SV = files	return filesendAddon.Profiles = profiles