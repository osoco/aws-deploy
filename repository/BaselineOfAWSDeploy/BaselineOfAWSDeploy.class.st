Class {
	#name : #BaselineOfAWSDeploy,
	#superclass : #BaselineOf,
	#category : #BaselineOfAWSDeploy
}

{ #category : #baselines }
BaselineOfAWSDeploy >> baseline: spec [
	<baseline>
	spec
		for: #common 
		do: [  spec blessing: #baseline.
			self declareBabyMock2In: spec.
			self declarePackagesIn: spec.
			self declareGroupsIn: spec ]
]

{ #category : #baselines }
BaselineOfAWSDeploy >> declareBabyMock2In: spec [
	spec
		project: 'BabyMock2'
		with: [ spec
				className: #ConfigurationOfBabyMock2;
				versionString: #stable;
				repository: 'http://smalltalkhub.com/mc/zeroflag/BabyMock2/main/' ].
	^ spec

]

{ #category : #baselines }
BaselineOfAWSDeploy >> declareGroupsIn: spec [
	spec
		group: 'core'
			with:
			#(#'AWSDeploy-Domain');
		group: 'tests'
			with:
			#(#'AWSDeploy-Domain-Tests');
		group: 'default' with: #('core' 'tests')
]

{ #category : #baselines }
BaselineOfAWSDeploy >> declarePackagesIn: spec [
	spec
		package: #'AWSDeploy-Domain';
    package: #'AWSDeploy-Tests' with: [ spec requires: #('AWSDeploy') ]
]
