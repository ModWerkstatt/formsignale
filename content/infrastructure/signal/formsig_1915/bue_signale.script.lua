function data()

return {
	updateFn = function(captureParams, params)

        local offset = params.offset * -1

        local models = {
            [1] = "buesig_1955.mdl",
            [2] = "buesig_alt.mdl",
            [3] = "buesig_modern.mdl",
            [4] = "buesig_estw.mdl"
        }
        local modelId = models[params.type] or models[2]

		local result = {}
		result.signal = {
			soundevent = "",
			type = "WAYPOINT",
		}
		result.edgeModels = {
			{
                edgeOffset = offset,
                model = {
                    id = resolve(modelId),
                    transf = { 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1 }
                }
            },
		}
		result.cost = 10000
		result.maintenanceCost = 1000

		return result
	end
}

end
