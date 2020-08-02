#!/bin/bash

# 命令使用
# modulecreater FCKView


# 1.首先创建好工程Podfile， 
# 2.然后像文件夹中的Podfile一样，定义一个 xxx_pods（首字母必须小写）， 将所有第三方pod都放入 xxx_pods 里面。
# 3.pod install 安装第三方Pod库
# 4.将该文件夹放到工程的同级目录下，然后做如下修改：
# 将project_name改成自己工程名即可.


###################### 修改点：工程名 + Podfile中的 xxx_pods, 必须首字母小写 ###########################
project_name="DemoApp"
pods_name="demoApp_pods"
###########################################################################################


module_name=$1
addlib="pod '$module_name', :path => 'Pods/$module_name'"
python pod_target_add.py ../$project_name/Podfile $pods_name "$addlib"


#cd到App工程的Pods目录下，创建本地pod库目录
cd ../$project_name/Pods
mkdir -p $module_name
cd $module_name
pod spec create $module_name


# 替换默认 podsepc 文件
python ../../../PodModule/replace.py $module_name.podspec "MIT \(example\)" "MIT"
python ../../../PodModule/replace.py $module_name.podspec ":git => \"http://EXAMPLE/$module_name.git\"" ":git => \"\""
python ../../../PodModule/replace.py $module_name.podspec "<<-DESC" "\"$module_name\""
python ../../../PodModule/replace.py $module_name.podspec "DESC" ""
python ../../../PodModule/replace.py $module_name.podspec "# spec.public_header_files = \"Classes/\*\*/\*.h\"" "spec.public_header_files = \"Classes/PublicHeader/**/*.h\""
python ../../../PodModule/replace.py $module_name.podspec "# spec.requires_arc = true" "spec.requires_arc = true"
python ../../../PodModule/replace.py $module_name.podspec "# spec.resource  = \"icon.png\"" "spec.resource_bundles = {\n    '$module_name' => ['Resources/*.xcassets'],\n  }"
python ../../../PodModule/replace.py $module_name.podspec "# spec.platform     = :ios, \"5.0\"" "spec.platform     = :ios, \"9.0\""


#创建当前pod库的Classes目录和Resources目录，以及Classes目录下的PublicHeader目录
mkdir -p Classes
mkdir -p Resources

cd Classes
mkdir -p PublicHeader



# 创建公开头文件
echo -e "// " >> PublicHeader/${module_name}.h
echo -e "//  $module_name" >> PublicHeader/${module_name}.h
echo -e "//  ${module_name}.h" >> PublicHeader/${module_name}.h
echo -e "// \n" >> PublicHeader/${module_name}.h
echo -e "#import <Foundation/Foundation.h>" >> PublicHeader/${module_name}.h
echo -e "#import <UIKit/UIKit.h>\n" >> PublicHeader/${module_name}.h
echo -e "#ifndef ${module_name}_h" >> PublicHeader/${module_name}.h
echo -e "#define ${module_name}_h\n" >> PublicHeader/${module_name}.h
echo -e "static NSString * const ${module_name}_Version = @\"0.0.1\";\n" >> PublicHeader/${module_name}.h
echo -e "//#if __has_include(\"\")" >> PublicHeader/${module_name}.h
echo -e "//#import \"\"" >> PublicHeader/${module_name}.h
echo -e "//#endif\n" >> PublicHeader/${module_name}.h
echo -e "#endif /* ${module_name}_h */" >> PublicHeader/${module_name}.h

touch DeleteMe.m

# 创建资源文件
cd ../Resources
mkdir -p Assets.xcassets


# 回到工程根目录，安装当前创建的pod本地库
cd ../../../
pod install


# xed .
