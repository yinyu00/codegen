
import request from '@/router/axios';

export const qry${table.NameFU}Page = (current, size, params) => {
  return request({
    url: '/api/${param.schema}/${table.NameFL}/page',
    method: 'get',
    params: {
      ...params,
      current,
      size,
    }
  })
}

export const qry${table.NameFU}List = (current, size, params) => {
  return request({
    url: '/api/${param.schema}/${table.NameFL}/list',
    method: 'get',
    params: {
      ...params,
      current,
      size,
    }
  })
}

export const get${table.NameFU}Detail = (id) => {
  return request({
    url: '/api/${param.schema}/${table.NameFL}/detail',
    method: 'get',
    params: {
      id
    }
  })
}

export const remove${table.NameFU} = (ids) => {
  return request({
    url: '/api/${param.schema}/${table.NameFL}/remove',
    method: 'post',
    params: {
      ids,
    }
  })
}

export const add${table.NameFU} = (row) => {
  return request({
    url: '/api/${param.schema}/${table.NameFL}/submit',
    method: 'post',
    data: row
  })
}

export const update${table.NameFU} = (row) => {
  return request({
    url: '/api/${param.schema}/${table.NameFL}/submit',
    method: 'post',
    data: row
  })
}
