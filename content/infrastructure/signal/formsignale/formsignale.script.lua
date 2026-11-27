function data()

	return {
		updateFn = function(captureParams, params)

		local isLeft = params.mw_form_trackpos == 1
        local sideSuffix = isLeft and "left" or "right"
        local offset_x = params.mw_form_offset_x and params.mw_form_offset_x or 0
        local offset_y = isLeft and 2.15 or -2.15
        local yearType = params.mw_form_year or 1
        local formType = params.mw_form_type or 1
        local heightType = params.mw_form_height or 1
        local optikType = params.mw_form_optik or 1
        local poleHeight
        local year
        local type
        local signage
        local signalType = params.mw_form_waypoint == 1 and "WAYPOINT" or "PATH_SIGNAL"
       
        -- year
        if yearType == 1 then
            year = "1915"
        elseif yearType == 2 then
            year = "1930"
        elseif yearType == 3 then
            year = "1948"
        end 

        -- type
        if formType == 1 then
            type = "_hsig"
        elseif formType == 2 then
            type = "_vsig"
        elseif formType == 2 then
            type = "_hsig_vsig"
        end

        -- height
        if formType == 1 then -- Hsig
            if heightType == 1 then
                poleHeight = "_4m"
            elseif heightType == 2 then
                poleHeight = "_6m"
            elseif heightType == 3 then
                poleHeight = "_8m"
            elseif heightType == 4 then
                poleHeight = "_10m"
            elseif heightType == 5 then
                poleHeight = "_12m"    
            end
        elseif formType == 2 then -- Vsig
            if heightType == 1 then
                poleHeight = "_3m"
            elseif heightType == 2 then
                poleHeight = "_5m"
            end
        end

        -- signage
        if formType == 1 then -- Hsig
            if optikType == 1 then
                signage = "_hp0"
            elseif optikType == 2 then
                signage = "_hp1"
            elseif optikType == 3 then
                signage = "_hp2"
            end
        elseif formType == 2 then -- Vsig
            if optikType == 1 then
                signage = "_vr0"
            elseif optikType == 2 then
                signage = "_vr1"
            elseif optikType == 3 then
                signage = "_vr2"
            end
        end

        -- concatenate model
        local resultingMesh = year .. type .. poleHeight .. signage
debugPrint(resultingMesh)
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

		return result

	end
	}

end
