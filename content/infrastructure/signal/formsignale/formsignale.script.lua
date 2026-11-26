function data()

	return {
		updateFn = function(captureParams, params)
debugPrint(params)
		local isLeft = params.mw_form_trackpos == 1
        local sideSuffix = isLeft and "left" or "right"
        local offset_x = params.mw_form_offset_x and params.mw_form_offset_x or 0
        local offset_y = isLeft and 2.15 or -2.15
        local poleHeight
        local year
        local type
        local signage
        local signalType = params.mw_form_waypoint == 1 and "WAYPOINT" or "PATH_SIGNAL"
       
        -- year
        if params.mw_form_year == 1 then
            year = "1915"
        elseif params.mw_form_year == 2 then
            year = "1930"
        elseif params.mw_form_year == 3 then
            year = "1948"
        end 

        -- type
        if params.mw_form_type == 1 then
            type = "hsig"
        elseif params.mw_form_type == 2 then
            mw_form_type = "vsig"
        end

        -- height
        if params.mw_form_height == 1 then
            poleHeight = "_4m"
        elseif params.mw_form_height == 2 then
            poleHeight = "_6m"
        elseif params.mw_form_height == 3 then
            poleHeight = "_8m"
        elseif params.mw_form_height == 4 then
            poleHeight = "_10m"
        else
            poleHeight = "_12m"    
        end

        -- signage
        if params.mw_form_optik == 1 then
            signage = "hp0"
        elseif params.mw_form_optik == 2 then
            signage = "hp1"
        elseif params.mw_form_optik == 3 then
            signage = "hp2"
        end

        -- concatenate model
        local resultingMesh = year .. poleHeight .. "_hp0_" .. signage

        -- BOC only fallback
        local modelPath = resultingMesh .. ".mdl"
        local resolvedId = resolve(modelPath)

        -- Prüfen, ob das Modell im Repository existiert (je nach Setup über api.res.modelRep.find oder gültige ID)
        local modelExists = false
        if api and api.res and api.res.modelRep then
            -- find() gibt den Index zurück, oder -1 wenn nicht vorhanden
            modelExists = (api.res.modelRep.find(resolvedId) ~= -1)
        else
            modelExists = (resolvedId ~= nil and resolvedId ~= "" and resolvedId ~= -1)
        end

        if not modelExists then
            print("WARNUNG: Modell nicht gefunden: " .. tostring(resolvedId))
            -- Optional: Auf ein garantiert vorhandenes Platzhalter-/Fallback-Modell ausweichen
            resolvedId = resolve("::/placeholders/missing_signal.mdl")
        end
        -- EOC only fallback

		-- build it
		local edgeModels = {}
        table.insert(edgeModels, {
            edgeOffset = -offset_x,
            model = {
               id = resolvedId,
            	transf = { 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, offset_y, 0, 1 }
            }
        })
        

        -- result
        local result = {}
        result.signal = {
		    soundevent = "",
			type = signalType,
	    }
        result.edgeModels = edgeModels
		result.cost = 20000
		result.maintenanceCost = 5000
debugPrint(result)
		return result

	end
	}

end
