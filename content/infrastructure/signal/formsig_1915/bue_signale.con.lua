function data()
return {
		availability = {
			yearFrom = 1972,
			yearTo = 2000,
		},
		description = {
			attributes = {
				cost = { 20000, -1, },
				maintenanceCost = { 5000, -1, },
				noise = { 0, -1, },
				pollution = { 0, -1, },
			},
			description = _("Bue_signale_desc"),
			icon = "icons/bue_signale_icon_small.tga",
			name = _("Bue_signale_menu"),
			previewIcon = "icons/bue_signale_preview.tga",
		},
		menuCategory = {
			categories = {
				{
					category = "rail_tools",
					filterCategories = { },
					order = 601,
				},
			},
		},
		soundConfig = {
			builderAudioRes = "::/gui/construction/sound/buildoze_construction_small.builder_audio",
			soundSet = {
				name = "",
			},
		},
		updateScript = {
			fileName = "bue_signale.script@updateFn",
			params = {
			}
		},
		configureHudIconsScript = {
			fileName = "::/gui/construction/construction_desc_hud_icons.script@configureDepotHudIconsFn",
			params = {
				depotType = "RAIL",
			}
		},
		isEdgeObject = true,
		params = {
            {
				key = "type",
				name = _("Type"),
				values = { _("Bauform 1955-1965"), _("Bauform 1960-1980"), _("Bauform ab 1975"), _("Bauform ab 2000 (ESTW)"), },
				defaultIndex = 2,
				yearFrom = 0,
				yearTo = 0,
                postConstructionModifiable = true,
			},
            {
				key = "offset",
				name = _("Offset"),
				uiType = "Slider",
                values = { _("0m"), _("1m"), _("2m"), _("3m"), _("4m"), _("5m"), _("6m"), _("7m"), _("8m"), _("9m"), _("10m"), _("11m"), _("12m"), _("13m"), _("14m"), _("15m"), _("16m"), _("17m"), _("18m"), _("19m"), _("20m"), },
				defaultIndex = 1,
				yearFrom = 0,
				yearTo = 0,
                postConstructionModifiable = true,
			},
		},
	}
end
