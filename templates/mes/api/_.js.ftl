import request from '@/utils/request'
import Qs from 'qs'

export default {
    ${table.NameFL}: {
        /**
         * 查询用户数据列表（form提交）
         */
        list: (data) => {
            return request({
                url: '/${param.module}/${table.NameFL}/list',
                method: 'post',
                data: Qs.stringify(data),
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                }
            })
        },
        /**
         * 新增用户（form提交）
         */
        add: (data) => {
            return request({
                url: '/${param.module}/${table.NameFL}',
                method: 'post',
                data: Qs.stringify(data),
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                }
            })
        },
        /**
         * 修改用户（form提交）
         */
        update: (data) => {
            return request({
                url: '/${param.module}/${table.NameFL}',
                method: 'put',
                data: Qs.stringify(data),
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                }
            })
        },
        /**
         * 删除用户（form提交）
         */
        remove: (id) => {
            return request({
                url: '/${param.module}/${table.NameFL}/' + id,
                method: 'delete',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                }
            })
        },
        /**
         * 批量删除用户（json提交）
         */
        batchRemove: (ids) => {
            return request({
                url: '/${param.module}/${table.NameFL}/batchDel',
                method: 'delete',
                data: ids
            })
        }
    }
}
