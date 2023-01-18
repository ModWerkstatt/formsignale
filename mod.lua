function data()
return {
	info = {
		minorVersion = 1,
		severityAdd = "NONE",
		severityRemove = "WARNING",
		name = _("mod_name"),
		description = _("mod_desc"),
		params = {			
			{
				key = "endless_mode",
				name = _("Endlosmodus"),
				uiType = "CHECKBOX",
				values = { "No", "Yes", },				
				defaultIndex = 0,	
			},
            {
				key = "form_signal_sbr",
				name = _("Signalbrückenausleger"),
				uiType = "CHECKBOX",
				values = { "No", "Yes", },				
				defaultIndex = 1,
			},
            {
				key = "form_signal_side",
				name = _("Linkseitige Signale"),
				uiType = "CHECKBOX",
				values = { "No", "Yes", },				
				defaultIndex = 1,
			},
			{
				key = "form_signal_weg",
				name = _("Wegesignalisierung 1915 bis 1930"),
				uiType = "CHECKBOX",
				values = { "No", "Yes", },				
				defaultIndex = 1,
			},
			{
				key = "form_signal_schmal",
				name = _("Schmalmast"),
				uiType = "CHECKBOX",
				values = { "No", "Yes", },				
				defaultIndex = 1,
			},
			{
				key = "form_signal_bstg",
				name = _("Formsignale für DB Bahnsteig Mod"),
				uiType = "CHECKBOX",
				values = { "No", "Yes", },				
				defaultIndex = 1,
			},
			{
				key = "form_signal_sperr",
				name = _("Sperrsignale"),
				uiType = "CHECKBOX",
				values = { "No", "Yes", },				
				defaultIndex = 1,
			},
			{
				key = "form_signal_exot",
				name = _("Außergeöwnhliche Formsignale"),
				uiType = "CHECKBOX",
				values = { "No", "Yes", },				
				defaultIndex = 1,
			},
			{
				key = "form_signal_zs3Zs3v",
				name = _("Zs3/Zs3v"),
				uiType = "CHECKBOX",
				values = { "No", "Yes", },				
				defaultIndex = 1,
			},
			{
				key = "form_signal_zs6",
				name = _("Zs 6"),
				uiType = "CHECKBOX",
				values = { "No", "Yes", },				
				defaultIndex = 1,
			},
			{
				key = "form_signal_zp9",
				name = _("Zp 9"),
				uiType = "CHECKBOX",
				values = { "No", "Yes", },				
				defaultIndex = 1,
			},
			{
				key = "form_signal_shl",
				name = _("Sh 1"),
				uiType = "CHECKBOX",
				values = { "No", "Yes", },				
				defaultIndex = 1,
			},
			{
				key = "form_signal_zs1",
				name = _("Zs 1"),
				uiType = "CHECKBOX",
				values = { "No", "Yes", },				
				defaultIndex = 1,
			},
			{
				key = "form_signal_vkb",
				name = _("Verkürzter Bremswegabstand"),
				uiType = "CHECKBOX",
				values = { "No", "Yes", },				
				defaultIndex = 1,
			},
			{
				key = "form_signal_waypoint",
				name = _("Wegpunkte"),
				uiType = "CHECKBOX",
				values = { "No", "Yes", },				
				defaultIndex = 1,	
			},
		},
		modid = "modwerkstatt_formsignale_1",
		authors = {
			{
				name = "ModWerkstatt",
				role = "CREATOR",	
			}, 
		},
		url = "",		
		steamId = 0, 
		tags = { "Signal", "Formsignale", "Germany", "Bundesbahn", "DRG" },  		
		dependencies = {},
	},

	runFn = function (settings, modParams)
		
		local function sbrFilter(fileName, data)		
			if data.metadata.signal and data.metadata.formSignale and data.metadata.formSignale.signalPole == "sbr" then			
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2
				--return false
			end
			--return true
			return data
		end	 		
		local sideFilter = function(fileName, data)		
			if data.metadata.signal and data.metadata.formSignale and data.metadata.formSignale.side == "left" then	
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2				
			end				
			return data
		end	
		local function wegFilter(fileName, data)		
			if data.metadata.signal and data.metadata.formSignale and data.metadata.formSignale.weg == true then	
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2				
			end				
			return data
		end
		local function schmalFilter(fileName, data)		
			if data.metadata.signal and data.metadata.formSignale and data.metadata.formSignale.schmal == true then	
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2				
			end				
			return data
		end
		local function bstgFilter(fileName, data)		
			if data.metadata.signal and data.metadata.formSignale and data.metadata.formSignale.bstg == true then	
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2				
			end				
			return data
		end
		local function sperrFilter(fileName, data)		
			if data.metadata.signal and data.metadata.formSignale and data.metadata.formSignale.sperr == true then	
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2				
			end				
			return data
		end
		local function zs3Zs3vFilter(fileName, data)		
			if data.metadata.signal and data.metadata.formSignale and data.metadata.formSignale.zs3Zs3v == true then	
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2				
			end				
			return data
		end 
		local function zs6Filter(fileName, data)		
			if data.metadata.signal and data.metadata.formSignale and data.metadata.formSignale.zs6 == true then	
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2				
			end				
			return data
		end 
		local function zp9Filter(fileName, data)		
			if data.metadata.signal and data.metadata.formSignale and data.metadata.formSignale.zp9 == true then	
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2				
			end				
			return data
		end 
		local function exotFilter(fileName, data)		
			if data.metadata.signal and data.metadata.formSignale and data.metadata.formSignale.exot == true then	
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2				
			end				
			return data
		end 
		local function sh1Filter(fileName, data)		
			if data.metadata.signal and data.metadata.formSignale and data.metadata.formSignale.Sh1 == true then	
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2				
			end				
			return data
		end 
		local function ra11Filter(fileName, data)		
			if data.metadata.signal and data.metadata.formSignale and data.metadata.formSignale.ra11 == true then	
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2				
			end				
			return data
		end 
		local function zs1Filter(fileName, data)		
			if data.metadata.signal and data.metadata.formSignale and data.metadata.formSignale.zs1 == true then	
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2				
			end				
			return data
		end  
		local function vkbFilter(fileName, data)		
			if data.metadata.signal and data.metadata.formSignale and data.metadata.formSignale.vkb == true then	
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2				
			end				
			return data
		end
		local function waypointFilter(fileName, data)		
			if data.metadata.signal and data.metadata.formSignale and data.metadata.formSignale.waypoint == true then	
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2				
			end				
			return data	
		end 
		local function endlessFilter(fileName, data)	
			if data.metadata.signal and data.metadata.formSignale then
                data.metadata.availability.yearTo = 0					
            end
			return data	
		end 

		if modParams[getCurrentModId()] ~= nil then
			local params = modParams[getCurrentModId()]					
			if params["form_signal_sbr"] == 0 then				
				--addFileFilter("model/signal", sbrFilter)					
				addModifier("loadModel", sbrFilter)
			end
			if params["form_signal_side"] == 0 then				
				addModifier("loadModel", sideFilter)
			end
			if params["form_signal_weg"] == 0 then				
				addModifier("loadModel", wegFilter)
			end
			if params["form_signal_schmal"] == 0 then				
				addModifier("loadModel", schmalFilter)
			end
			if params["form_signal_bstg"] == 0 then				
				addModifier("loadModel", bstgFilter)
			end
			if params["form_signal_sperr"] == 0 then				
				addModifier("loadModel", sperrFilter)
			end
			if params["form_signal_exot"] == 0 then				
				addModifier("loadModel", exotFilter)
			end
			if params["form_signal_zs3Zs3v"] == 0 then				
				addModifier("loadModel", zs3Zs3vFilter)
			end
			if params["form_signal_zs6"] == 0 then				
				addModifier("loadModel", zs6Filter)
			end
			if params["form_signal_zp9"] == 0 then				
				addModifier("loadModel", zp9Filter)
			end
			if params["form_signal_shl"] == 0 then				
				addModifier("loadModel", sh1Filter)
			end
			if params["form_signal_ra11"] == 0 then				
				addModifier("loadModel", ra11Filter)
			end
			if params["form_signal_zs1"] == 0 then				
				addModifier("loadModel", zs1Filter)
			end
			if params["form_signal_vkb"] == 0 then				
				addModifier("loadModel", vkbFilter)
			end
			if params["form_signal_waypoint"] == 0 then				
				addModifier("loadModel", waypointFilter)
			end
            if params["endless_mode"] == 1 then
                addModifier("loadModel", endlessFilter)
            end
			
		else
			--addFileFilter("model/signal", sbrFilter)			
			addModifier("loadModel", sideFilter)		
			addModifier("loadModel", wegFilter)				
			addModifier("loadModel", schmalFilter)					
			addModifier("loadModel", bstgFilter)						
			addModifier("loadModel", sperrFilter)					
			addModifier("loadModel", exotFilter)		
			addModifier("loadModel", zs3Zs3vFilter)		
			addModifier("loadModel", zs6Filter)		
			addModifier("loadModel", zp9Filter)
			addModifier("loadModel", sh1Filter)
			addModifier("loadModel", ra11Filter)
			addModifier("loadModel", zs1Filter)			
			addModifier("loadModel", vkbFilter)
			addModifier("loadModel", waypointFilter)
			addModifier("loadModel", endlessFilter)
		end	
	end
}
end