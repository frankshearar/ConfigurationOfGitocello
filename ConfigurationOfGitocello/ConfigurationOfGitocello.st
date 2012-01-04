Object subclass: #ConfigurationOfGitocello
	instanceVariableNames: 'project'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ConfigurationOfGitocello'!

!ConfigurationOfGitocello methodsFor: 'baselines' stamp: 'fbs 1/3/2012 20:27'!
baseline10: spec 
	<version: '1.0-baseline'>
	
	spec for: #common do: [
		spec blessing: #baseline.
		spec description: 'Gitocello: providing Monticello-Git interop thanks to Tim Felgentreff!!'.
		spec repository: 'http://www.hpi.uni-potsdam.de/hirschfeld/squeaksource/Gitocello/'.
		spec package: 'Gitocello' with: [ spec requires: 'FFI'].
		spec project: 'FFI' with: [
			spec className: 'ConfigurationOfFFI';
			file: 'ConfigurationOfFFI';
			version: '1.5';
			repository: 'http://www.squeaksource.com/MetacelloRepository']
		]! !

!ConfigurationOfGitocello methodsFor: 'baselines' stamp: 'fbs 1/3/2012 20:12'!
default: spec 
	<version: 'default'>
	
	spec for: #common do: [
		spec blessing: #baseline.
		spec author: 'Frank Shearar'.
		spec description: 'Gitocello: providing Monticello-Git interop thanks to Tim Felgentreff!!'.
		spec repository: 'http://www.hpi.uni-potsdam.de/hirschfeld/squeaksource/Gitocello/'.
		spec package: 'Gitocello' with: [ spec requires: 'FFI'].
		spec project: 'FFI' with: [
			spec className: 'ConfigurationOfFFI';
			file: 'ConfigurationOfFFI';
			repository: 'http://www.squeaksource.com/MetacelloRepository']
		]! !


!ConfigurationOfGitocello methodsFor: 'symbolic versions' stamp: 'fbs 1/3/2012 20:04'!
development: spec
	<symbolicVersion: #'development'>

	spec for: #'common' version: '1.1'.
! !

!ConfigurationOfGitocello methodsFor: 'symbolic versions' stamp: 'fbs 1/3/2012 20:04'!
stable: spec
	<symbolicVersion: #'stable'>

	spec for: #'common' version: '1.0'.
! !


!ConfigurationOfGitocello methodsFor: 'accessing' stamp: 'fbs 1/3/2012 20:01'!
project

	^ project ifNil: [ | constructor |
		"Bootstrap Metacello if it is not already loaded"
		self class ensureMetacello.
		"Construct Metacello project"
		constructor := (Smalltalk at: #MetacelloVersionConstructor) on: self.
		project := constructor project.
		project]! !


!ConfigurationOfGitocello methodsFor: 'versions' stamp: 'fbs 1/3/2012 20:40'!
version10: spec
	<version: '1.0' imports: #('1.0-baseline')>
	
	spec for: #'common' do: [
		spec blessing: #release.
		spec author: 'Frank Shearar'.
		spec timestamp: '2012/01/03 20:28'.
		spec
			package: 'ConfigurationOfFFI' with: 'ConfigurationOfFFI-cwp.21';
			package: 'Gitocello' with: 'Gitocello-tfel.89'.
	]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

ConfigurationOfGitocello class
	instanceVariableNames: ''!

!ConfigurationOfGitocello class methodsFor: 'private' stamp: 'fbs 1/3/2012 20:58'!
ensureMetacello
	Smalltalk at: #MetacelloProject ifAbsent: [
		"While Metacello installs Gofer, at this point Squeak doesn't have Gofer installed (and Pharo does)."
		(Smalltalk at: #Installer ifAbsent: [nil])
			ifNil:
				["This will work for Pharo... but not for a non-Squeak, non-Pharo Smalltalk."
				(Smalltalk at: #Gofer) new
					url: 'http://seaside.gemstone.com/ss/metacello';
					package: 'ConfigurationOfMetacello';
					load]
			ifNotNil:
				[(Smalltalk at: #Installer) gemsource
					project: 'metacello';
					install: 'ConfigurationOfMetacello'].
		(Smalltalk at: #ConfigurationOfMetacello) loadLatestVersion ]! !


!ConfigurationOfGitocello class methodsFor: 'metacello tool support' stamp: 'fbs 1/3/2012 20:02'!
isMetacelloConfig
	"Answer true and the Metacello tools will operate on you"
	
	^true! !


!ConfigurationOfGitocello class methodsFor: 'loading' stamp: 'fbs 1/3/2012 20:15'!
load
	^ self project latestVersion load! !

!ConfigurationOfGitocello class methodsFor: 'loading' stamp: 'fbs 1/3/2012 20:02'!
loadDefault
	(self project version: 'default') load! !

!ConfigurationOfGitocello class methodsFor: 'loading' stamp: 'fbs 1/3/2012 20:02'!
project

	^self new project! !
