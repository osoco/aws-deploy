baselines
declarePackagesIn: spec
	spec
		package: #'AWSDeploy-Domain';
    package: #'AWSDeploy-Tests' with: [ spec requires: #('AWSDeploy') ]