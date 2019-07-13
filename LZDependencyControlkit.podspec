
Pod::Spec.new do |s|
  s.name             = 'LZDependencyControlkit'
  s.version          = '0.1.1'
  s.summary          = 'A short description of LZDependencyControlkit.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC
  s.homepage         = 'https://github.com/liLeiBest/LZDependencyControlkit.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'lilei' => 'lilei_hapy@163.com' }
  s.source           = { :git => 'https://github.com/liLeiBest/LZDependencyControlkit.git', :tag => s.version.to_s }

  s.ios.deployment_target 	= '8.0'
  s.frameworks 				= 'UIKit', 'Foundation'
  s.source_files 			= 'LZDependencyControlkit/Classes/**/*.{h,m}'
  s.public_header_files 	= 'LZDependencyControlkit/Classes/**/*.h'
  s.dependency 'LZDependencyToolkit'
  
end
