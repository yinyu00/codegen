
source_root=/Users/jinwei/github/yinyu00/codegen/target/e8
service_root=/Users/jinwei/git/javablade/48810074/BladeX-Biz/blade-service/blade-qingmo/src/main/java
api_root=/Users/jinwei/git/javablade/48810074/BladeX-Biz/blade-service-api/blade-qingmo-api/src/main/java
vue_root=/Users/jinwei/git/javablade/48810074/Saber/src

cp $source_root/controller/*.* $service_root/ltd/qingmo/fangshuo/biz/rent/controller/
cp $source_root/service/*.* $service_root/ltd/qingmo/fangshuo/biz/rent/service/
cp $source_root/service/impl/*.* $service_root/ltd/qingmo/fangshuo/biz/rent/service/impl/
cp $source_root/mapper/*.* $service_root/ltd/qingmo/fangshuo/biz/rent/mapper/
cp $source_root/wrapper/*.* $service_root/ltd/qingmo/fangshuo/biz/rent/wrapper/
cp $source_root/entity/*.* $api_root/ltd/qingmo/fangshuo/biz/rent/entity/
cp $source_root/vo/*.* $api_root/ltd/qingmo/fangshuo/biz/rent/vo/

cp $source_root/vue/*.* $vue_root/views/fangshuo/general/rent/
cp $source_root/vuejs/*.* $vue_root/api/fangshuo/general/rent/