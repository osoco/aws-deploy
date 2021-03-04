baselines
declareGroupsIn: spec
	spec
		group: 'core'
			with:
			#(#'AWSDeploy-Domain');
		group: 'tests'
			with:
			#(#'AWSDeploy-Domain-Tests');
		group: 'default' with: #('core' 'tests')