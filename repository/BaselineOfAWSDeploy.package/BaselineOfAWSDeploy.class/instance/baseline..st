baselines
baseline: spec
	<baseline>
	spec
		for: #common 
		do: [  spec blessing: #baseline.
			self declareBabyMock2In: spec.
			self declarePackagesIn: spec.
			self declareGroupsIn: spec ]