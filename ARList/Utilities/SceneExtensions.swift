/*
//  kwikboost AR demo
Abstract:
Configures the scene.
*/

import Foundation
import ARKit

// AR scene view extensions

extension ARSCNView {
	
	func setup() {
		antialiasingMode = .multisampling4X
		automaticallyUpdatesLighting = false
		
		preferredFramesPerSecond = 60
		contentScaleFactor = 1.3
		
		if let camera = pointOfView?.camera {
			camera.wantsHDR = true
			camera.wantsExposureAdaptation = true
			camera.exposureOffset = -1
			camera.minimumExposure = -1
			camera.maximumExposure = 3
		}
	}
}

// Scene extensions

extension SCNScene {
	func enableEnvironmentMapWithIntensity(_ intensity: CGFloat, queue: DispatchQueue) {
		queue.async {
			if self.lightingEnvironment.contents == nil {
				if let environmentMap = UIImage(named: "Models.scnassets/sharedImages/environment_blur.exr") {
					self.lightingEnvironment.contents = environmentMap
				}
			}
			self.lightingEnvironment.intensity = intensity
		}
	}
}
