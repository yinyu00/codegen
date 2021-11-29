/*
*      Copyright (c) 2018-2028, Chill Zhuang All rights reserved.
*
*  Redistribution and use in source and binary forms, with or without
*  modification, are permitted provided that the following conditions are met:
*
*  Redistributions of source code must retain the above copyright notice,
*  this list of conditions and the following disclaimer.
*  Redistributions in binary form must reproduce the above copyright
*  notice, this list of conditions and the following disclaimer in the
*  documentation and/or other materials provided with the distribution.
*  Neither the name of the dreamlu.net developer nor the names of its
*  contributors may be used to endorse or promote products derived from
*  this software without specific prior written permission.
*  Author: Chill 庄骞 (smallchill@163.com)
*/

package ${param.basePackage}.wrapper;

import cn.runzogroup.biz.web.wrapper.BizWrapper;
import org.springblade.core.tool.utils.BeanUtil;
import ${param.basePackage}.entity.${table.NameFU};
import ${param.basePackage}.vo.${table.NameFU}VO;
import java.util.Objects;

/**
 * ${table.comments}包装类,返回视图层所需的字段
 *
 * @author BladeX
 * @since 2021-10-08
 */
public class ${table.NameFU}Wrapper extends BizWrapper<${table.NameFU}, ${table.NameFU}> {

    public static  ${table.NameFU}Wrapper build() {
        return new ${table.NameFU}Wrapper();
    }

    @Override
    public ${table.NameFU} entityVO(${table.NameFU} ${table.NameFL}) {
        ${table.NameFU}VO ${table.NameFL}VO = Objects.requireNonNull(BeanUtil.copy(${table.NameFL}, ${table.NameFU}VO.class));

        //User createUser = UserCache.getUser(${table.NameFL}.getCreateUser());
        //User updateUser = UserCache.getUser(${table.NameFL}.getUpdateUser());
        //${table.NameFL}VO.setCreateUserName(createUser.getName());
        //${table.NameFL}VO.setUpdateUserName(updateUser.getName());

        return ${table.NameFL}VO;
    }

}
