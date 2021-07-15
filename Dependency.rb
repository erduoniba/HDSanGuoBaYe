require 'xcodeproj'

def sortDependecies()
  #打开项目工程A.xcodeproj
  base_path = File.dirname(__FILE__)
  project_path = base_path + '/Pods/Pods.xcodeproj'
  pod_project = Xcodeproj::Project.open(project_path)

  puts "#{project_path}"
  puts "pod_project.class :#{pod_project.class}"

  #遍历target，找到需要操作的target
  targetIndex = 0
  pod_project.targets.each_with_index do |target, index|
    if target.name  == "Pods-HDSanGuoBaYe"
      targetIndex = index
    end
  end
  
  target = pod_project.targets[targetIndex]

  # 获取对象的所有方法名
  tmethods = target.methods

  puts "target.class: #{target.class}"
  puts "#{target.product_name}"
  puts "========="

  # 打印对象的全部属性
# puts "#{target.attributes}"
  puts "target.dependencies: #{target.dependencies}"
  dependency = target.dependencies.pop
  target.dependencies.insert 0, dependency

  puts "target.dependencies1: #{target.dependencies}"
  puts "========="

  pod_project.save
  # pod_project.save()
end


sortDependecies()