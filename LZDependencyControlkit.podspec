
Pod::Spec.new do |s|
  s.name             = 'LZDependencyControlkit'
  s.version          = '1.0.0'
  s.summary          = 'A short description of LZDependencyControlkit.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC
  s.homepage         = 'https://github.com/liLeiBest/LZDependencyControlkit.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'lilei' => 'lilei0502@139.com' }
  s.source           = { :git => 'https://github.com/liLeiBest/LZDependencyControlkit.git', :tag => s.version.to_s }

  s.ios.deployment_target 	= '13.0'
  s.frameworks 				= 'UIKit', 'Foundation'
  s.source_files 			= 'LZDependencyControlkit/Classes/**/*.{h,m}', 'LZDependencyControlkit/Classes/Segment/**/*.{xib}'
  s.public_header_files 	= 'LZDependencyControlkit/Classes/**/*.h'
  s.dependency 'LZDependencyToolkit'
  
end
